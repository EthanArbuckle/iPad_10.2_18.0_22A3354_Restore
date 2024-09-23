uint64_t ___ZL14ICE_FILER_readP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_EU13block_pointerFvjjE_block_invoke(uint64_t a1, AriMsg *a2, unsigned int a3)
{
  AriHost *BufCtx;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE __b[3072];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  BufCtx = (AriHost *)AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  if (ARI_CsiIceFilerReadRspCb_Extract())
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read_block_invoke", (uint64_t)"Error: Failed ARI_EXTRACT on copyReceiveData (Remaining=%d/%d)\n", v7, v8, v9, v10, v11, v12, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = -7;
  }
  else
  {
    IceFilerReadRspCb(-1431655766, 0xAAAAAAAA, __b, BufCtx);
  }
  return 0;
}

void __destroy_helper_block_e8_32r40r48c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 48);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

__n128 KTLDebugRegisterDelegate(__n128 *a1)
{
  __n128 result;

  result = *a1;
  off_253D1A548 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))a1[1].n128_u64[0];
  *(__n128 *)&gDelegate = result;
  return result;
}

BOOL KTLNVMSendRegister(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  intptr_t v26;
  const char *v27;
  uint64_t v29;
  dispatch_object_t object;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int v42;

  v2 = *(_DWORD *)(a1 + 16);
  v39 = v2;
  v40 = 14;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v31 = 0;
    v41 = 0;
    v42 = v2;
    v35 = 0;
    if (ARI_CsiFpRegister_ENC()
      || (v4 = operator new(0x18uLL),
          v5 = v35,
          v4[2] = v41,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v4))
      || !KTLUTACopyReceiveData(a1, &v31))
    {
      v14 = 0;
      v15 = 14;
      return !v15 && v14;
    }
    v6 = v31;
    (*(void (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
    v7 = ARI_CsiFpRegisterRsp_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v14 = v7 == 0;
    v15 = v40;
    if (v14)
      goto LABEL_27;
    return !v15 && v14;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 14;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2000000000;
  v34 = -1;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (ARI_CsiFpRegister_BLK())
  {
    v14 = 0;
    v15 = *((_DWORD *)v36 + 6);
    v40 = v15;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v26 = dispatch_semaphore_wait(v17, v19);
  if (v26)
    _KTLErrorPrint((uint64_t)"KTLNVMSendRegister", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v29);
  if (v39)
    AriHost::ExitTrx((AriHost *)v39);
  v15 = *((_DWORD *)v36 + 6);
  v40 = v15;
  if (v26)
  {
    v14 = 0;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v14 = *((_DWORD *)v32 + 6) == 0;
  v18 = object;
  if (object)
LABEL_23:
    dispatch_release(v18);
LABEL_24:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  if (v14)
  {
LABEL_27:
    if (v15)
    {
      if (v15 > 0xE)
        v27 = "Unknown";
      else
        v27 = off_24CC19428[v15 - 1];
      _KTLErrorPrint((uint64_t)"KTLNVMSendRegister", (uint64_t)"Error: CsiFpRegisterRsp Failure (%s)\n", v8, v9, v10, v11, v12, v13, (uint64_t)v27);
      v15 = v40;
    }
  }
  return !v15 && v14;
}

void sub_21158DADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  NSObject *v17;
  uint64_t v18;

  if (object)
    dispatch_release(object);
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v18 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMSendUpdateAck(uint64_t a1, BOOL *a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_time_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  intptr_t v28;
  const char *v29;
  uint64_t v31;
  dispatch_object_t object;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;

  v46 = 0;
  v4 = *(_DWORD *)(a1 + 16);
  v45 = v4;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
  {
    v37 = 0;
    LODWORD(v33) = v4;
    v47 = 0;
    v41 = 0;
    if (ARI_CsiFpUpdateAck_ENC()
      || (v6 = operator new(0x18uLL),
          v7 = v41,
          v6[2] = v47,
          *((_QWORD *)v6 + 2) = v7,
          *(_QWORD *)v6 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v6))
      || !KTLUTACopyReceiveData(a1, &v37))
    {
      v17 = 0;
      v16 = 0;
      goto LABEL_32;
    }
    v8 = v37;
    (*(void (**)(uint64_t))(*(_QWORD *)v37 + 16))(v37);
    v9 = ARI_CsiFpUpdateAckRsp_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    v16 = v9 == 0;
    v17 = HIDWORD(v46);
    if (v16)
      goto LABEL_27;
    goto LABEL_32;
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2000000000;
  v44 = 14;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = -1431655766;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v36 = -1;
  v18 = dispatch_semaphore_create(0);
  v19 = v18;
  object = v18;
  if (v18)
    dispatch_retain(v18);
  if (ARI_CsiFpUpdateAck_BLK())
  {
    v16 = 0;
    v17 = *((_DWORD *)v42 + 6);
    LODWORD(v46) = *((_DWORD *)v38 + 6);
    HIDWORD(v46) = v17;
    v20 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v21 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v28 = dispatch_semaphore_wait(v19, v21);
  if (v28)
    _KTLErrorPrint((uint64_t)"KTLNVMSendUpdateAck", (uint64_t)"Timeout waiting for response.\n", v22, v23, v24, v25, v26, v27, v31);
  if (v45)
    AriHost::ExitTrx((AriHost *)v45);
  v17 = *((_DWORD *)v42 + 6);
  LODWORD(v46) = *((_DWORD *)v38 + 6);
  HIDWORD(v46) = v17;
  if (v28)
  {
    v16 = 0;
    v20 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v16 = *((_DWORD *)v34 + 6) == 0;
  v20 = object;
  if (object)
LABEL_23:
    dispatch_release(v20);
LABEL_24:
  if (v19)
    dispatch_release(v19);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  if (v16)
  {
LABEL_27:
    if (v17)
    {
      if (v17 > 0xE)
        v29 = "Unknown";
      else
        v29 = off_24CC19428[v17 - 1];
      _KTLErrorPrint((uint64_t)"KTLNVMSendUpdateAck", (uint64_t)"Error: CsiFpUpdateAckRsp Failure (%s)\n", v10, v11, v12, v13, v14, v15, (uint64_t)v29);
      v17 = HIDWORD(v46);
    }
  }
LABEL_32:
  *a2 = (_DWORD)v46 != 0;
  return !v17 && v16;
}

void sub_21158DE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  NSObject *v23;
  uint64_t v24;

  if (object)
    dispatch_release(object);
  if (v23)
    dispatch_release(v23);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v24 - 112), 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32r40r48r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 56);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

void __copy_helper_block_e8_32r40r48r56c25_ZTSN8dispatch9semaphoreE(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  v4 = *(NSObject **)(a2 + 56);
  a1[7] = v4;
  if (v4)
    dispatch_retain(v4);
}

uint64_t ICE_FILER_read(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if (a2)
    return ICE_FILER_read(a1, 0, a2, a3, a4, a5, a6, a8);
  _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Invalid Parameter.\n", a3, a4, a5, a6, a7, a8, v8);
  return 0xFFFFFFFFLL;
}

intptr_t IceFilerReadRspCb(int a1, unsigned int a2, const void *a3, AriHost *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  intptr_t result;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(void);
  unsigned int (*v25)(void);
  unsigned int v26;
  uint64_t v27;

  if (pthread_mutex_lock(&ice_filer_lookup_mutex))
  {
    v14 = 0;
    if (a1)
    {
LABEL_3:
      result = _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. Uta Failure from Baseband.\n", v8, v9, v10, v11, v12, v13, v27);
      v16 = -3;
      goto LABEL_4;
    }
  }
  else
  {
    v14 = qword_253D1A5A8;
    if ((int *)qword_253D1A5A8 == &ice_filer_lookup_head)
    {
LABEL_10:
      pthread_mutex_unlock(&ice_filer_lookup_mutex);
      return _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. ARI Context ID %x not on Lookup Table.\n", v18, v19, v20, v21, v22, v23, (uint64_t)a4);
    }
    while (*(_DWORD *)v14 != (_DWORD)a4)
    {
      v14 = *(_QWORD *)(v14 + 80);
      if ((int *)v14 == &ice_filer_lookup_head)
        goto LABEL_10;
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
    if (a1)
      goto LABEL_3;
  }
  if (a3)
  {
    if (*(_DWORD *)(v14 + 48) >= a2)
    {
      result = *(_QWORD *)(v14 + 8);
      if (result)
      {
        if (a2)
        {
          v25 = *(unsigned int (**)(void))result;
          if (*(_QWORD *)result)
          {
            while (v25())
            {
              v25 = **(unsigned int (***)(void))(v14 + 8);
              if (!v25)
                goto LABEL_31;
            }
            v25 = 0;
          }
LABEL_31:
          result = _KTLErrorPrint((uint64_t)"ICE_FILER_transport_write", (uint64_t)"Error: TelephonyUtilTransportWrite (ret=%d, available=%d, written=%d).\n", v8, v9, v10, v11, v12, v13, (uint64_t)v25);
          *(_DWORD *)(v14 + 72) = -6;
        }
      }
      else
      {
        result = (intptr_t)memcpy(*(void **)(v14 + 40), a3, a2);
        *(_QWORD *)(v14 + 40) += a2;
      }
      v26 = *(_DWORD *)(v14 + 48) - a2;
      *(_DWORD *)(v14 + 48) = v26;
      if (v26)
        goto LABEL_5;
      v16 = *(_DWORD *)(v14 + 32);
    }
    else
    {
      result = _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. Buffer Overflow.\n", v8, v9, v10, v11, v12, v13, v27);
      v16 = -2;
    }
  }
  else
  {
    result = _KTLErrorPrint((uint64_t)"IceFilerReadRspCb", (uint64_t)"Error: IceFilerReadRspCb. NUL p_data from Baseband.\n", v8, v9, v10, v11, v12, v13, v27);
    v16 = -4;
  }
LABEL_4:
  *(_DWORD *)(v14 + 72) = v16;
LABEL_5:
  v17 = *(_QWORD *)(v14 + 16);
  if (!*(_QWORD *)(v17 + 8))
  {
    if (*(_DWORD *)(v17 + 16))
    {
      result = *(unsigned int *)(v14 + 72);
      if ((_DWORD)result)
      {
        v24 = *(void (**)(void))(v14 + 56);
        if (v24)
        {
          v24();
          return ICE_FILER_lookup_remove(a4);
        }
        else
        {
          result = *(_QWORD *)(v14 + 64);
          if (result)
            return dispatch_semaphore_signal((dispatch_semaphore_t)result);
        }
      }
    }
  }
  return result;
}

uint64_t ICE_FILER_read(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  void *v10;
  unsigned int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int *v33;
  AriMsg *v34;
  AriHost *BufCtx;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  dispatch_semaphore_t v42;
  NSObject *v43;
  int Req_BLK;
  dispatch_time_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[2];
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, AriMsg *, unsigned int);
  void *v58;
  unsigned int *v59;
  int v60;
  _BYTE __b[3072];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v60 = a5;
  if (!a1 || (v8 = a4) == 0 || (v10 = a2, (a2 == 0) == (a3 == 0)))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Invalid Parameter.\n", a3, a4, a5, a6, a7, a8, v52);
    return 0xFFFFFFFFLL;
  }
  v13 = a5;
  if (!*(_QWORD *)(a1 + 8) && !(_BYTE)a5 && *(_DWORD *)(a1 + 16))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Missing required transaction ID: context_id=%x\n", a3, a4, a5, a6, a7, a8, a5);
    return 0xFFFFFFFFLL;
  }
  if (pthread_mutex_lock(&ice_filer_lookup_mutex))
    goto LABEL_6;
  v23 = qword_253D1A5A8;
  if ((int *)qword_253D1A5A8 != &ice_filer_lookup_head)
  {
    v24 = qword_253D1A5A8;
    while (*(_DWORD *)v24 != v13)
    {
      v24 = *(_QWORD *)(v24 + 80);
      if ((int *)v24 == &ice_filer_lookup_head)
        goto LABEL_17;
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
LABEL_6:
    _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Context Already Exists.\n", v15, v16, v17, v18, v19, v20, v52);
    return 4294967291;
  }
LABEL_17:
  v25 = (unsigned int *)operator new(0x60uLL);
  *((_QWORD *)v25 + 8) = 0;
  *v25 = v13;
  *((_QWORD *)v25 + 1) = a3;
  *((_QWORD *)v25 + 2) = a1;
  if (a3)
    v10 = operator new[](0xC00uLL);
  *((_QWORD *)v25 + 3) = v10;
  v25[8] = v8;
  *((_QWORD *)v25 + 5) = v10;
  v25[12] = v8;
  *((_QWORD *)v25 + 7) = a6;
  *((_QWORD *)v25 + 8) = 0;
  v25[18] = 0;
  *((_QWORD *)v25 + 10) = v23;
  *((_QWORD *)v25 + 11) = &ice_filer_lookup_head;
  *(_QWORD *)(v23 + 88) = v25;
  qword_253D1A5A8 = (uint64_t)v25;
  _KTLDebugFlags = 13;
  pthread_mutex_unlock(&ice_filer_lookup_mutex);
  if (*(_QWORD *)(a1 + 8) || !*(_DWORD *)(a1 + 16))
  {
    v54 = 0;
    v53[0] = 0;
    v53[1] = 0;
    ARI_CsiIceFilerReadReq_ENC();
    v26 = operator new(0x18uLL);
    v26[2] = 0;
    *((_QWORD *)v26 + 2) = 0;
    *(_QWORD *)v26 = &unk_24CC18DE8;
    KTLUTASendAndReleaseData(a1, v26);
    if (!v25[18])
    {
      while (1)
      {
        if (a7)
          (*(void (**)(uint64_t, _QWORD))(a7 + 16))(a7, v25[8] - v25[12]);
        if (!KTLUTACopyReceiveData(a1, v53))
          break;
        memset(__b, 170, sizeof(__b));
        v33 = (unsigned int *)v53[0];
        v34 = (AriMsg *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v53[0] + 16))(v53[0]);
        BufCtx = (AriHost *)AriMsg::GetBufCtx(v34, (const unsigned __int8 *)v33[2]);
        (*(void (**)(unsigned int *))(*(_QWORD *)v33 + 16))(v33);
        if (ARI_CsiIceFilerReadRspCb_Extract())
        {
          _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: Failed ARI_EXTRACT on copyReceiveData (Remaining=%d/%d)\n", v36, v37, v38, v39, v40, v41, v25[12]);
          v25[18] = -7;
        }
        else
        {
          IceFilerReadRspCb(-1431655766, 0xAAAAAAAA, __b, BufCtx);
        }
        (*(void (**)(unsigned int *))(*(_QWORD *)v33 + 8))(v33);
        if (v25[18])
          goto LABEL_40;
      }
      _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Failed copyReceiveData (Remaining=%d/%d)\n", v27, v28, v29, v30, v31, v32, v25[12]);
    }
LABEL_40:
    if (a7)
      (*(void (**)(uint64_t, _QWORD))(a7 + 16))(a7, v25[8] - v25[12]);
    v21 = v25[18];
    ICE_FILER_lookup_remove((AriHost *)v60);
  }
  else
  {
    if (!a6)
    {
      v42 = dispatch_semaphore_create(0);
      v43 = *((_QWORD *)v25 + 8);
      *((_QWORD *)v25 + 8) = v42;
      if (v43)
        dispatch_release(v43);
    }
    v55 = MEMORY[0x24BDAC760];
    v56 = 0x40000000;
    v57 = ___ZL14ICE_FILER_readP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_EU13block_pointerFvjjE_block_invoke;
    v58 = &__block_descriptor_tmp_15;
    v59 = v25;
    Req_BLK = ARI_CsiIceFilerReadReq_BLK();
    if (!*((_QWORD *)v25 + 8))
      return 0xFFFFFFFFLL;
    if (!Req_BLK)
    {
      v45 = dispatch_time(0, 1000000 * (*(_DWORD *)(a1 + 20) - v25[8] / 0xC00 + 8 * (v25[8] / 0xC00)));
      if (dispatch_semaphore_wait(*((dispatch_semaphore_t *)v25 + 8), v45))
        _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Timeout waiting for transfer to complete\n", v46, v47, v48, v49, v50, v51, v52);
    }
    v21 = v25[18];
    ICE_FILER_lookup_remove((AriHost *)v60);
  }
  return v21;
}

{
  uint64_t v8;

  if (a2)
    return ICE_FILER_read(a1, a2, 0, a3, a4, a5, 0, a8);
  _KTLErrorPrint((uint64_t)"ICE_FILER_read", (uint64_t)"Error: ICE_FILER_read. Invalid Parameter.\n", a3, a4, a5, a6, a7, a8, v8);
  return 0xFFFFFFFFLL;
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_21158C000);
  }
  return result;
}

_QWORD *trace::ARICommandDriver::ARICommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t trace::ARICommandDriver::TraceConfig(uint64_t *a1, uint64_t a2, AriSdk::ARI_TraceSetConfigRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_TraceSetConfigRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_TraceSetConfigRspCb_SDK *)operator new(0x48uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_TraceSetConfigRspCb_SDK::ARI_TraceSetConfigRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy_;
  v74 = __Block_byref_object_dispose_;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_TraceSetConfigRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 1560477696);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_TraceSetConfigRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_TraceSetConfigRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"TraceConfig", (uint64_t)"Failed to run TraceSetConfigReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_21158EC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_TraceSetConfigRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_TraceSetConfigRspCb_SDK *v4;

  v4 = (AriSdk::ARI_TraceSetConfigRspCb_SDK *)operator new(0x48uLL);
  AriSdk::ARI_TraceSetConfigRspCb_SDK::ARI_TraceSetConfigRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21158ED80(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

uint64_t KTLDebugSetOutputFile(uint64_t a1)
{
  uint64_t result;

  result = sKTLDebugOutputFile;
  if (sKTLDebugOutputFile)
    result = fclose((FILE *)sKTLDebugOutputFile);
  sKTLDebugOutputFile = a1;
  return result;
}

double KTLDebugSetDefaults()
{
  double result;

  result = *(double *)&gDelegateDefault;
  *(_OWORD *)&gDelegate = gDelegateDefault;
  off_253D1A548 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))_KTLDebugPrintBinaryStdout;
  _KTLDebugFlags = 15;
  return result;
}

uint64_t KTLDebugSetFlags(uint64_t result)
{
  _KTLDebugFlags = result;
  return result;
}

uint64_t _KTLDebugPrint(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((_KTLDebugFlags & 1) != 0)
    return gDelegate(result, a2, &a9);
  return result;
}

uint64_t _KTLErrorPrint(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((_KTLDebugFlags & 4) != 0)
    return (*(&gDelegate + 1))(result, a2, &a9);
  return result;
}

uint64_t _KTLDebugPrintStdout(const char *a1, const char *a2, va_list a3)
{
  unsigned int SystemTime;

  if (!sKTLDebugOutputFile)
  {
    sKTLDebugOutputFile = (uint64_t)fopen("/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log", "a");
    if (!sKTLDebugOutputFile)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Warning: Failed to open %s for writing\n", "/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log");
      sKTLDebugOutputFile = (uint64_t)fopen("/dev/null", "w");
    }
  }
  SystemTime = TelephonyUtilGetSystemTime();
  fprintf((FILE *)sKTLDebugOutputFile, "%u.%03u %s:", SystemTime / 0x3E8, SystemTime % 0x3E8, a1);
  vfprintf((FILE *)sKTLDebugOutputFile, a2, a3);
  return fflush((FILE *)sKTLDebugOutputFile);
}

uint64_t _KTLDebugPrintBinaryStdout(const char *a1, int a2)
{
  size_t BufferSize;
  const char *v5;
  const char *v6;
  unsigned int SystemTime;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!sKTLDebugOutputFile)
  {
    sKTLDebugOutputFile = (uint64_t)fopen("/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log", "a");
    if (!sKTLDebugOutputFile)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Warning: Failed to open %s for writing\n", "/private/var/wireless/Library/Logs/CrashReporter/Baseband/libKTL.log");
      sKTLDebugOutputFile = (uint64_t)fopen("/dev/null", "w");
    }
  }
  BufferSize = TelephonyUtilLogGetBufferSize();
  if (MEMORY[0x24BDAC7A8]())
    memset((char *)v9 - ((BufferSize + 15) & 0x1FFFFFFF0), 170, BufferSize);
  v5 = "misc";
  if (a2 == 1)
    v5 = "recv";
  if (a2)
    v6 = v5;
  else
    v6 = "send";
  TelephonyUtilLogBinaryToBuffer();
  SystemTime = TelephonyUtilGetSystemTime();
  fprintf((FILE *)sKTLDebugOutputFile, "%u.%03u [%s] %s\n%s", SystemTime / 0x3E8, SystemTime % 0x3E8, v6, a1, (const char *)v9 - ((BufferSize + 15) & 0x1FFFFFFF0));
  return fflush((FILE *)sKTLDebugOutputFile);
}

uint64_t GetBBIPCLogs(uint64_t a1, uint64_t a2)
{
  return GetBBIPCLogs(a1, 0, a2);
}

uint64_t GetBBIPCLogs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  unsigned int v6;
  __int128 v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t LogBufferListReq_BLK;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  dispatch_time_t v36;
  intptr_t v37;
  uint64_t v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  uint64_t v58;
  int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t LogBufferReq_BLK;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  dispatch_time_t v85;
  _BOOL4 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _DWORD *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  _OWORD v118[5];
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t *v124;
  char *v125;
  uint64_t *v126;
  dispatch_object_t object;
  int v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  __int128 *v136;
  int v137;
  unsigned int v138;
  _OWORD v139[12];
  unint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  unint64_t v148;
  char __dst[8];
  char *v150;
  uint64_t v151;
  int v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  unint64_t v160;
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  v119 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v118[3] = v5;
  v118[4] = v5;
  v118[1] = v5;
  v118[2] = v5;
  v118[0] = v5;
  v140 = 0xAAAAAAAAAAAAAAAALL;
  v139[10] = v5;
  v139[11] = v5;
  v139[8] = v5;
  v139[9] = v5;
  v139[6] = v5;
  v139[7] = v5;
  v139[4] = v5;
  v139[5] = v5;
  v139[2] = v5;
  v139[3] = v5;
  v139[0] = v5;
  v139[1] = v5;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0;
  v6 = *(_DWORD *)(a1 + 16);
  v138 = v6;
  if (!*(_QWORD *)(a1 + 8) && v6)
  {
    v160 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v158 = v7;
    v159 = v7;
    v156 = v7;
    v157 = v7;
    v154 = v7;
    v155 = v7;
    v153 = v7;
    v133 = 0;
    v134 = &v133;
    v135 = 0x2000000000;
    v136 = &v153;
    v129 = 0;
    v130 = &v129;
    v131 = 0x2000000000;
    v132 = -1;
    *(_QWORD *)__dst = 0;
    v150 = __dst;
    v151 = 0x2000000000;
    v152 = -1431655766;
    v8 = dispatch_semaphore_create(0);
    v9 = v8;
    v120 = MEMORY[0x24BDAC760];
    v121 = 1174405120;
    v122 = (uint64_t)___ZL22KTLGetIPCLogBufferListP10KTLOptionsP22CsiIceIpcLogBufferList_block_invoke;
    v123 = &__block_descriptor_tmp_0;
    v124 = &v129;
    v125 = __dst;
    v126 = &v133;
    object = v8;
    if (v8)
      dispatch_retain(v8);
    LogBufferListReq_BLK = ARI_CsiIpcGetLogBufferListReq_BLK();
    v11 = LogBufferListReq_BLK;
    _KTLDebugPrint((uint64_t)"KTLGetIPCLogBufferList", (uint64_t)"sendRet=%d\n", v12, v13, v14, v15, v16, v17, LogBufferListReq_BLK);
    if (v11)
    {
      v24 = 0;
      v148 = v160;
      v145 = v157;
      v146 = v158;
      v147 = v159;
      v141 = v153;
      v142 = v154;
      v143 = v155;
      v144 = v156;
    }
    else
    {
      v36 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v37 = dispatch_semaphore_wait(v9, v36);
      if (v37)
        _KTLErrorPrint((uint64_t)"KTLGetIPCLogBufferList", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v114);
      if (v138)
        AriHost::ExitTrx((AriHost *)v138);
      v145 = v157;
      v146 = v158;
      v147 = v159;
      v148 = v160;
      v141 = v153;
      v142 = v154;
      v143 = v155;
      v144 = v156;
      v24 = !v37 && !*((_DWORD *)v130 + 6) && *((_DWORD *)v150 + 6) == 0;
    }
    _KTLDebugPrint((uint64_t)"KTLGetIPCLogBufferList", (uint64_t)"ret=%d list size=%lu\n", v18, v19, v20, v21, v22, v23, v24);
    if (object)
      dispatch_release(object);
    if (v9)
      dispatch_release(v9);
    _Block_object_dispose(__dst, 8);
    _Block_object_dispose(&v129, 8);
    _Block_object_dispose(&v133, 8);
    if (v24)
      goto LABEL_24;
LABEL_11:
    _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBufferList returned false\n", v25, v26, v27, v28, v29, v30, v113);
    return 0;
  }
  v137 = 0;
  v133 = 0;
  LODWORD(v129) = v6;
  *(_DWORD *)__dst = 0;
  *(_QWORD *)&v153 = 0;
  if (ARI_CsiIpcGetLogBufferListReq_ENC())
    goto LABEL_11;
  v31 = operator new(0x18uLL);
  v32 = v153;
  v31[2] = *(_DWORD *)__dst;
  *((_QWORD *)v31 + 2) = v32;
  *(_QWORD *)v31 = &unk_24CC18DE8;
  if (!KTLUTASendAndReleaseData(a1, v31))
    goto LABEL_11;
  if ((KTLUTACopyReceiveData(a1, &v133) & 1) == 0)
    goto LABEL_11;
  v33 = v133;
  (*(void (**)(uint64_t))(*(_QWORD *)v133 + 16))(v133);
  v34 = ARI_CsiIpcGetLogBufferListRsp_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  if (v34 | v137)
    goto LABEL_11;
LABEL_24:
  v38 = 0;
  LOBYTE(v39) = 0;
  v116 = 0;
  v40 = (unint64_t)&v141 | 0xC;
  do
  {
    strncpy(__dst, (const char *)v40, 8uLL);
    LOBYTE(v150) = 0;
    _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"Fetching log buffer entry: filename=\"%s\" size=%d level=%d next=%d buf_p=%d\n", v41, v42, v43, v44, v45, v46, (uint64_t)__dst);
    if (*(_DWORD *)(v40 - 4) && *(_DWORD *)(v40 + 8))
    {
      if (strstr(__dst, "..") || strchr(__dst, 47))
      {
        _KTLErrorPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"Skipping potentially dangerous filename \"%s\"\n", v47, v48, v49, v50, v51, v52, (uint64_t)__dst);
        goto LABEL_26;
      }
      if (a2)
        snprintf((char *)v139, 0xC8uLL, "%s/%s.bin");
      else
        snprintf((char *)v139, 0xC8uLL, "%s.bin");
      v59 = open((const char *)v139, 1537, 420);
      v60 = "Failure";
      if (v59 >= 0)
        v60 = "Success";
      _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"File Open: %s (name=\"%s\" descriptor=%d)\n", v53, v54, v55, v56, v57, v58, (uint64_t)v60);
      if (v59 < 0)
      {
        LOBYTE(v39) = 0;
        goto LABEL_26;
      }
      v39 = TelephonyUtilTransportCreateWithFD();
      v67 = "Failure";
      if (v39)
        v67 = "Success";
      _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"TelephonyUtilTransportCreateWithFD: %s (filedesc=%d)\n", v61, v62, v63, v64, v65, v66, (uint64_t)v67);
      if (v39)
      {
        v68 = *(_DWORD *)(a1 + 16);
        v137 = v68;
        if (*(_QWORD *)(a1 + 8) || !v68)
        {
          v128 = 0;
          LODWORD(v129) = v68;
          v133 = 0;
          v138 = 0;
          v120 = 0;
          if (!ARI_CsiIpcGetLogBufferReq_ENC())
          {
            v109 = operator new(0x18uLL);
            v110 = v120;
            v109[2] = v138;
            *((_QWORD *)v109 + 2) = v110;
            *(_QWORD *)v109 = &unk_24CC18DE8;
            if (KTLUTASendAndReleaseData(a1, v109))
            {
              if ((KTLUTACopyReceiveData(a1, &v133) & 1) != 0)
              {
                v111 = v133;
                (*(void (**)(uint64_t))(*(_QWORD *)v133 + 16))(v133);
                v112 = ARI_CsiIpcGetLogBufferRsp_Extract();
                (*(void (**)(uint64_t))(*(_QWORD *)v111 + 8))(v111);
                if (!(v112 | v128))
                {
                  _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBuffer: %s\n", v103, v104, v105, v106, v107, v108, (uint64_t)"Success");
LABEL_55:
                  v95 = ICE_FILER_read(a1, 0, (uint64_t)v118, *(unsigned int *)(v40 - 4), v116, 0, a3, v94);
                  LOBYTE(v39) = v95 > 0;
                  v102 = "Failure";
                  if (v95 > 0)
                    v102 = "Success";
                  _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"ICE_FILER_read: %s (return code=%d)\n", v96, v97, v98, v99, v100, v101, (uint64_t)v102);
                  goto LABEL_66;
                }
              }
            }
          }
          _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBuffer: %s\n", v103, v104, v105, v106, v107, v108, (uint64_t)"Failure");
LABEL_65:
          LOBYTE(v39) = 0;
LABEL_66:
          close(v59);
          TelephonyUtilTransportFree();
          goto LABEL_26;
        }
        v120 = 0;
        v121 = (uint64_t)&v120;
        v122 = 0x2000000000;
        LODWORD(v123) = -1;
        v133 = 0;
        v134 = &v133;
        v135 = 0x2000000000;
        LODWORD(v136) = -1431655766;
        v129 = 0;
        v130 = &v129;
        v131 = 0x2000000000;
        v132 = 0;
        v69 = dispatch_semaphore_create(0);
        *(_QWORD *)&v153 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v153 + 1) = 1174405120;
        *(_QWORD *)&v154 = ___ZL18KTLGetIPCLogBufferP10KTLOptionsjjjPi_block_invoke;
        *((_QWORD *)&v154 + 1) = &__block_descriptor_tmp_19;
        *(_QWORD *)&v155 = &v120;
        *((_QWORD *)&v155 + 1) = &v133;
        *(_QWORD *)&v156 = &v129;
        v70 = v69;
        *((_QWORD *)&v156 + 1) = v69;
        if (v69)
          dispatch_retain(v69);
        LogBufferReq_BLK = ARI_CsiIpcGetLogBufferReq_BLK();
        v72 = LogBufferReq_BLK;
        _KTLDebugPrint((uint64_t)"KTLGetIPCLogBuffer", (uint64_t)"sendRet=%d\n", v73, v74, v75, v76, v77, v78, LogBufferReq_BLK);
        if (!v72)
        {
          v85 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
          if (!dispatch_semaphore_wait(v70, v85))
          {
            v116 = *((_DWORD *)v130 + 6);
            if (*(_DWORD *)(v121 + 24))
              v86 = 0;
            else
              v86 = *((_DWORD *)v134 + 6) == 0;
LABEL_48:
            _KTLDebugPrint((uint64_t)"KTLGetIPCLogBuffer", (uint64_t)"ret=%d\n", v79, v80, v81, v82, v83, v84, v86);
            if (*((_QWORD *)&v156 + 1))
              dispatch_release(*((dispatch_object_t *)&v156 + 1));
            if (v70)
              dispatch_release(v70);
            _Block_object_dispose(&v129, 8);
            _Block_object_dispose(&v133, 8);
            _Block_object_dispose(&v120, 8);
            v93 = "Failure";
            if (v86)
              v93 = "Success";
            _KTLDebugPrint((uint64_t)"GetBBIPCLogs", (uint64_t)"KTLGetIPCLogBuffer: %s\n", v87, v88, v89, v90, v91, v92, (uint64_t)v93);
            if (v86)
              goto LABEL_55;
            goto LABEL_65;
          }
          _KTLErrorPrint((uint64_t)"KTLGetIPCLogBuffer", (uint64_t)"Timeout waiting for response.\n", v79, v80, v81, v82, v83, v84, v115);
        }
        v86 = 0;
        v116 = *((_DWORD *)v130 + 6);
        goto LABEL_48;
      }
    }
LABEL_26:
    v40 += 24;
    ++v38;
  }
  while (v38 != 5);
  return v39 & 1;
}

void sub_21158FA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  NSObject *v44;
  uint64_t v45;
  NSObject *v47;

  v47 = *(NSObject **)(v45 - 184);
  if (v47)
    dispatch_release(v47);
  if (v44)
    dispatch_release(v44);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21158FA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,NSObject *object,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  NSObject *v44;

  if (object)
    dispatch_release(object);
  if (v44)
    dispatch_release(v44);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL22KTLGetIPCLogBufferListP10KTLOptionsP22CsiIceIpcLogBufferList_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiIpcGetLogBufferListRsp_Extract();
  _KTLDebugPrint((uint64_t)"KTLGetIPCLogBufferList_block_invoke", (uint64_t)"blockRet=%d\n", v2, v3, v4, v5, v6, v7, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void ktl::KTLARIPacket::~KTLARIPacket(AriMsg **this, unsigned __int8 *a2)
{
  *this = (AriMsg *)&unk_24CC18DE8;
  AriMsg::ReleaseEncodedMessage(this[2], a2);
}

{
  *this = (AriMsg *)&unk_24CC18DE8;
  AriMsg::ReleaseEncodedMessage(this[2], a2);
  operator delete(this);
}

uint64_t ktl::KTLPacket::getBuffer(ktl::KTLPacket *this)
{
  return *((_QWORD *)this + 2);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t ___ZL18KTLGetIPCLogBufferP10KTLOptionsjjjPi_block_invoke(uint64_t a1, AriMsg *a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiIpcGetLogBufferRsp_Extract();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  _KTLDebugPrint((uint64_t)"KTLGetIPCLogBuffer_block_invoke", (uint64_t)"blockRet=%d blockCtxId=%d\n", v6, v7, v8, v9, v10, v11, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

_QWORD *eUICC::VinylCommandDriver::VinylCommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  if (*(_DWORD *)(a2 + 20) >> 4 <= 0x270u)
    *(_DWORD *)(a2 + 20) = 10000;
  return result;
}

{
  *result = a2;
  if (*(_DWORD *)(a2 + 20) >> 4 <= 0x270u)
    *(_DWORD *)(a2 + 20) = 10000;
  return result;
}

uint64_t eUICC::VinylCommandDriver::GetVinylType(eUICC::VinylCommandDriver *this, AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *a2, AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t SimDataRspCb;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  v26 = 0;
  v27 = 0;
  AriSdk::MsgBase::getRawBytes();
  v24 = 0;
  v25 = 0;
  SimDataRspCb = ktl::CommandDriver::perform<AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK>((uint64_t *)this, 755040256, &v24, a3, v5, v6, v7, v8);
  v16 = SimDataRspCb;
  v17 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
      if ((v16 & 1) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if ((SimDataRspCb & 1) == 0)
LABEL_6:
    _KTLErrorPrint((uint64_t)"GetVinylType", (uint64_t)"%s \n", v10, v11, v12, v13, v14, v15, (uint64_t)"VinylCommandDriver GetVinylType perform failure");
LABEL_7:
  v20 = v27;
  if (!v27)
    return v16;
  v21 = (unint64_t *)&v27->__shared_owners_;
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (v22)
    return v16;
  ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
  std::__shared_weak_count::__release_weak(v20);
  return v16;
}

void sub_21158FDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_21158FDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ktl::CommandDriver::perform<AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK>(uint64_t *a1, uint64_t a2, uint64_t **a3, AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *v39;
  const unsigned __int8 *v40;
  uint64_t *v41;
  dispatch_time_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  NSObject *v50;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  dispatch_object_t object;

  *a4 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = **a3;
    v14 = (*a3)[1] - v13;
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v60) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, v14);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && (((unsigned int (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v60, 1, v15, 0)? (v22 = (_DWORD)v60 == (_DWORD)v14): (v22 = 0), v22))
    {
      v60 = 0;
      if (KTLUTACopyReceiveData(*a1, &v60))
      {
        v38 = v60;
        if (v60)
        {
          v39 = (AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *)operator new(0xD8uLL);
          v40 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 16))(v38);
          AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::ARI_IBISimAccessGetSimDataRspCb_SDK(v39, v40);
          *a4 = v39;
          (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
          goto LABEL_26;
        }
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v29 = "error while trying to get response from device \n";
LABEL_11:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v29, v23, v24, v25, v26, v27, v28, v59);
    goto LABEL_12;
  }
  v60 = 0;
  v61 = &v60;
  v62 = 0x3002000000;
  v63 = __Block_byref_object_copy__0;
  v64 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v31 = AriHost::Send();
  if ((_DWORD)v31)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v32, v33, v34, v35, v36, v37, v31);
    goto LABEL_23;
  }
  v41 = v61;
  v42 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v41[5], v42))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v43, v44, v45, v46, v47, v48, v59);
LABEL_23:
    v49 = 0;
    _Block_object_dispose(&v60, 8);
    v50 = object;
    if (!object)
      goto LABEL_25;
    goto LABEL_24;
  }
  v49 = 1;
  _Block_object_dispose(&v60, 8);
  v50 = object;
  if (object)
LABEL_24:
    dispatch_release(v50);
LABEL_25:
  if ((v49 & 1) == 0)
    goto LABEL_12;
LABEL_26:
  hasDeclaredGmid = AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::hasDeclaredGmid(*a4);
  v52 = *a4;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v52) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a4);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v53, v54, v55, v56, v57, v58, a2);
      goto LABEL_12;
    }
    v29 = "Received NACK\n";
    goto LABEL_11;
  }
  if (!AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::unpack(v52))
    return 1;
LABEL_12:
  if (*a4)
    (*(void (**)(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *))(*(_QWORD *)*a4 + 16))(*a4);
  result = 0;
  *a4 = 0;
  return result;
}

void sub_211590138(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21159014C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object)
{
  _Block_object_dispose(&a17, 8);
  if (!object)
    _Unwind_Resume(a1);
  dispatch_release(object);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::GetData(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylGetDataRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylGetDataRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylGetDataRspCb_SDK *)operator new(0x210uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylGetDataRspCb_SDK::ARI_IBIVinylGetDataRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylGetDataRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372285952);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylGetDataRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetData", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver GetData perform failure");
  return v42;
}

void sub_211590574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::InstallVad(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylInstallVadRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::ARI_IBIVinylInstallVadRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372646400);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"InstallVad", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver InstallVad perform failure");
  return v42;
}

void sub_2115909FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::StreamFW(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylInstallFwRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  _KTLDebugFlags = 13;
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::ARI_IBIVinylInstallFwRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372679168);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"StreamFW", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver StreamFW perform failure");
  _KTLDebugFlags = 15;
  return v42;
}

void sub_211590E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::SwitchCardMode(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::ARI_IBIVinylSwitchModeRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372613632);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"SwitchCardMode", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver SwitchCardMode perform failure");
  return v42;
}

void sub_211591314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::GetEid(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylGetEidRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylGetEidRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylGetEidRspCb_SDK *)operator new(0x68uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylGetEidRspCb_SDK::ARI_IBIVinylGetEidRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylGetEidRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372253184);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylGetEidRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetEid", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver GetEid perform failure");
  return v42;
}

void sub_21159179C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylTapeRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylTapeRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylTapeRspCb_SDK *)operator new(0x90uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylTapeRspCb_SDK::ARI_IBIVinylTapeRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylTapeRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372351488);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylTapeRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylTapeRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"DeleteProfile", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver DeleteProfile perform failure");
  return v42;
}

void sub_211591C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::InitPerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylInitPsoRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *)operator new(0x78uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::ARI_IBIVinylInitPsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372384256);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"InitPerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver InitPerso perform failure");
  return v42;
}

void sub_2115920A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::AuthPerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *)operator new(0x78uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::ARI_IBIVinylAuthPsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372417024);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"AuthPerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver AuthPerso perform failure");
  return v42;
}

void sub_21159252C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::FinalizePerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::ARI_IBIVinylFinalizePsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372449792);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"FinalizePerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver FinalizePerso perform failure");
  return v42;
}

void sub_2115929B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t eUICC::VinylCommandDriver::ValidatePerso(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *)operator new(0x78uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::ARI_IBIVinylValidatePsoRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__0;
  v74 = __Block_byref_object_dispose__0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 3372482560);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"ValidatePerso", (uint64_t)"%s \n", v36, v37, v38, v39, v40, v41, (uint64_t)"VinylCommandDriver ValidatePerso perform failure");
  return v42;
}

void sub_211592E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk35ARI_IBISimAccessGetSimDataRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *)operator new(0xD8uLL);
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::ARI_IBISimAccessGetSimDataRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211592F48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_IBIVinylGetDataRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylGetDataRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylGetDataRspCb_SDK *)operator new(0x210uLL);
  AriSdk::ARI_IBIVinylGetDataRspCb_SDK::ARI_IBIVinylGetDataRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211592FBC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_IBIVinylInstallVadRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::ARI_IBIVinylInstallVadRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211593030(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk30ARI_IBIVinylInstallFwRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::ARI_IBIVinylInstallFwRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115930A4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_IBIVinylSwitchModeRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::ARI_IBIVinylSwitchModeRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211593118(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_IBIVinylGetEidRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylGetEidRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylGetEidRspCb_SDK *)operator new(0x68uLL);
  AriSdk::ARI_IBIVinylGetEidRspCb_SDK::ARI_IBIVinylGetEidRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21159318C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk25ARI_IBIVinylTapeRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylTapeRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylTapeRspCb_SDK *)operator new(0x90uLL);
  AriSdk::ARI_IBIVinylTapeRspCb_SDK::ARI_IBIVinylTapeRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211593200(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_IBIVinylInitPsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *)operator new(0x78uLL);
  AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::ARI_IBIVinylInitPsoRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211593274(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_IBIVinylAuthPsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *)operator new(0x78uLL);
  AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::ARI_IBIVinylAuthPsoRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115932E8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk32ARI_IBIVinylFinalizePsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::ARI_IBIVinylFinalizePsoRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21159335C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk32ARI_IBIVinylValidatePsoRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *)operator new(0x78uLL);
  AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::ARI_IBIVinylValidatePsoRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115933D0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLCalculate8bitXor(int8x16_t *a1, unsigned int a2)
{
  uint64_t v2;
  unsigned __int8 v3;
  int8x16_t *v5;
  int8x16_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  unint64_t v10;
  uint64_t v11;
  int8x8_t v12;
  int8x8_t *v13;
  uint64_t v14;
  int8x8_t v15;
  uint64_t v16;
  uint64_t v17;
  __int8 *v18;
  char v19;

  if (!a2)
    return 0;
  if (a2 >= 8)
  {
    if (a2 >= 0x20)
    {
      v2 = a2 & 0xFFFFFFE0;
      v5 = a1 + 1;
      v6 = 0uLL;
      v7 = v2;
      v8 = 0uLL;
      do
      {
        v6 = veorq_s8(v5[-1], v6);
        v8 = veorq_s8(*v5, v8);
        v5 += 2;
        v7 -= 32;
      }
      while (v7);
      v9 = veorq_s8(v8, v6);
      *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
      v10 = v9.i64[0] ^ HIDWORD(v9.i64[0]) ^ ((unint64_t)(v9.i64[0] ^ HIDWORD(v9.i64[0])) >> 16);
      v3 = v10 ^ BYTE1(v10);
      if (v2 == a2)
        return v3;
      if ((a2 & 0x18) == 0)
        goto LABEL_14;
    }
    else
    {
      v3 = 0;
      v2 = 0;
    }
    v11 = v2;
    v2 = a2 & 0xFFFFFFF8;
    v12 = (int8x8_t)v3;
    v13 = (int8x8_t *)&a1->i8[v11];
    v14 = v11 - v2;
    do
    {
      v15 = *v13++;
      v12 = veor_s8(v15, v12);
      v14 += 8;
    }
    while (v14);
    v16 = *(_QWORD *)&v12 ^ HIDWORD(*(_QWORD *)&v12) ^ ((*(_QWORD *)&v12 ^ HIDWORD(*(_QWORD *)&v12)) >> 16);
    v3 = v16 ^ BYTE1(v16);
    if (v2 == a2)
      return v3;
    goto LABEL_14;
  }
  v2 = 0;
  v3 = 0;
LABEL_14:
  v17 = a2 - v2;
  v18 = &a1->i8[v2];
  do
  {
    v19 = *v18++;
    v3 ^= v19;
    --v17;
  }
  while (v17);
  return v3;
}

uint64_t ktl::CommandDriver::perform(uint64_t *a1, uint64_t **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int (**v9)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  dispatch_time_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  dispatch_object_t object;

  v8 = *a1;
  v9 = *(unsigned int (***)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))(*a1 + 8);
  if (v9 || !*(_DWORD *)(v8 + 16))
  {
    v10 = **a2;
    v11 = (*a2)[1] - v10;
    v12 = *(unsigned int *)(v8 + 20);
    LODWORD(v47) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", a3, a4, a5, a6, a7, a8, v11);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v10);
    if (*v9)
    {
      if ((*v9)(v9, v10, v11, &v47, 1, v12, 0) && (_DWORD)v47 == (_DWORD)v11)
        return 1;
    }
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v13, v14, v15, v16, v17, v18, v11);
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"error sending\n", v20, v21, v22, v23, v24, v25, v46);
    return 0;
  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x3002000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v29 = AriHost::Send();
  if ((_DWORD)v29)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v30, v31, v32, v33, v34, v35, v29);
    goto LABEL_17;
  }
  v36 = v48;
  v37 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)v36[5], v37))
  {
    v26 = 1;
    _Block_object_dispose(&v47, 8);
    v44 = object;
    if (object)
      goto LABEL_18;
    return v26;
  }
  _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v38, v39, v40, v41, v42, v43, v45);
LABEL_17:
  v26 = 0;
  _Block_object_dispose(&v47, 8);
  v44 = object;
  if (!object)
    return v26;
LABEL_18:
  dispatch_release(v44);
  return v26;
}

void sub_211593748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object)
{
  _Block_object_dispose(&a17, 8);
  if (object)
    dispatch_release(object);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performENSt3__110shared_ptrIKNS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

BOOL KTLAudioEnableHWLoopback(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  intptr_t v26;
  uint64_t v28;
  dispatch_object_t object;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  int v39;
  unsigned int v40;

  v2 = *(_DWORD *)(a1 + 16);
  v38 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v30 = 0;
    v39 = 0;
    v40 = v2;
    v34 = 0;
    if (ARI_CsiIceAudEnableLoopbackHWReq_ENC()
      || (v10 = operator new(0x18uLL),
          v11 = v34,
          v10[2] = v39,
          *((_QWORD *)v10 + 2) = v11,
          *(_QWORD *)v10 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v10)))
    {
      v15 = 0;
      v12 = 0xFFFFFFFFLL;
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
      if (KTLUTACopyReceiveData(a1, &v30))
      {
        v13 = v30;
        LODWORD(v34) = -1;
        (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
        v14 = ARI_CsiIceAudEnableLoopbackHWRespCb_Extract();
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
        v15 = v14 == 0;
        v12 = v34;
        if (!(_DWORD)v34)
          return !(_DWORD)v12 && v15;
      }
      else
      {
        v15 = 0;
      }
    }
LABEL_27:
    _KTLErrorPrint((uint64_t)"KTLAudioEnableHWLoopback", (uint64_t)"Error on the result: %d\n", v4, v5, v6, v7, v8, v9, v12);
    return !(_DWORD)v12 && v15;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2000000000;
  v37 = -1;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2000000000;
  v33 = -1;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (ARI_CsiIceAudEnableLoopbackHWReq_BLK())
  {
    v15 = 0;
    v12 = *((unsigned int *)v35 + 6);
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v26 = dispatch_semaphore_wait(v17, v19);
  if (v26)
    _KTLErrorPrint((uint64_t)"KTLAudioEnableHWLoopback", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v28);
  if (v38)
    AriHost::ExitTrx((AriHost *)v38);
  v12 = *((unsigned int *)v35 + 6);
  if (v26)
  {
    v15 = 0;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v15 = *((_DWORD *)v31 + 6) == 0;
  v18 = object;
  if (object)
LABEL_23:
    dispatch_release(v18);
LABEL_24:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  if ((_DWORD)v12)
    goto LABEL_27;
  return !(_DWORD)v12 && v15;
}

void sub_211593A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40r48c25_ZTSN8dispatch9semaphoreE(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  v4 = *(NSObject **)(a2 + 48);
  a1[6] = v4;
  if (v4)
    dispatch_retain(v4);
}

BOOL KTLAudioDisableHWLoopback(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  intptr_t v20;
  uint64_t v22;
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;

  v2 = *(_DWORD *)(a1 + 16);
  v32 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v24 = 0;
    v33 = 0;
    v34 = v2;
    v28 = 0;
    if (ARI_CsiIceAudDisableLoopbackHWReq_ENC()
      || (v4 = operator new(0x18uLL),
          v5 = v28,
          v4[2] = v33,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v4)))
    {
      v9 = 0;
      v6 = -1;
    }
    else
    {
      v6 = -1;
      if (KTLUTACopyReceiveData(a1, &v24))
      {
        v7 = v24;
        LODWORD(v28) = -1;
        (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
        v8 = ARI_CsiIceAudDisableLoopbackHWRespCb_Extract();
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
        v9 = v8 == 0;
        v6 = v28;
      }
      else
      {
        v9 = 0;
      }
    }
    return !v6 && v9;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = -1;
  v10 = dispatch_semaphore_create(0);
  v11 = v10;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  if (ARI_CsiIceAudDisableLoopbackHWReq_BLK())
  {
    v9 = 0;
    v6 = *((_DWORD *)v29 + 6);
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v20 = dispatch_semaphore_wait(v11, v13);
  if (v20)
    _KTLErrorPrint((uint64_t)"KTLAudioDisableHWLoopback", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  if (v32)
    AriHost::ExitTrx((AriHost *)v32);
  v6 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    v9 = *((_DWORD *)v25 + 6) == 0;
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v9 = 0;
  v12 = object;
  if (object)
LABEL_22:
    dispatch_release(v12);
LABEL_23:
  if (v11)
    dispatch_release(v11);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v6 && v9;
}

void sub_211593DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  NSObject *v17;
  uint64_t v18;

  if (object)
    dispatch_release(object);
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v18 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL KTLStartProvision(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v5;
  BOOL v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  intptr_t v23;
  uint64_t v24;
  dispatch_object_t object;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *(*v36)(uint64_t, uint64_t);
  uint64_t (*v37)();
  _BYTE v38[1220];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 16);
  v30 = v5;
  if (*(_QWORD *)(a1 + 8))
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2000000000;
    v29 = -1;
    v33 = 0;
    v34 = &v33;
    v35 = 0x4F002000000;
    v36 = __Block_byref_object_copy__2;
    v37 = __Block_byref_object_dispose__2;
    memset(v38, 170, sizeof(v38));
    v12 = dispatch_semaphore_create(0);
    v13 = v12;
    v24 = MEMORY[0x24BDAC760];
    object = v12;
    if (v12)
      dispatch_retain(v12);
    if (ARI_CsiIceStartProvisionReq_BLK())
    {
      memcpy(a3, v34 + 5, 0x4C4uLL);
      v14 = 0;
      v15 = object;
      if (!object)
        goto LABEL_23;
    }
    else
    {
      v16 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v23 = dispatch_semaphore_wait(v13, v16);
      if (v23)
        _KTLErrorPrint((uint64_t)"KTLStartProvision", (uint64_t)"Timeout waiting for response.\n", v17, v18, v19, v20, v21, v22, v24);
      if (v30)
        AriHost::ExitTrx((AriHost *)v30);
      memcpy(a3, v34 + 5, 0x4C4uLL);
      if (v23)
      {
        v14 = 0;
        v15 = object;
        if (!object)
          goto LABEL_23;
      }
      else
      {
        v14 = *((_DWORD *)v27 + 6) == 0;
        v15 = object;
        if (!object)
        {
LABEL_23:
          if (v13)
            dispatch_release(v13);
          _Block_object_dispose(&v33, 8);
          _Block_object_dispose(&v26, 8);
          if (v14)
            return a3[1] == 0;
          return 0;
        }
      }
    }
    dispatch_release(v15);
    goto LABEL_23;
  }
  v26 = 0;
  v31 = 0;
  v32 = v5;
  v33 = 0;
  if (ARI_CsiIceStartProvisionReq_ENC())
    return 0;
  v7 = operator new(0x18uLL);
  v8 = v33;
  v7[2] = v31;
  *((_QWORD *)v7 + 2) = v8;
  *(_QWORD *)v7 = &unk_24CC18DE8;
  if (!KTLUTASendAndReleaseData(a1, v7))
    return 0;
  if ((KTLUTACopyReceiveData(a1, &v26) & 1) == 0)
    return 0;
  v9 = v26;
  (*(void (**)(uint64_t))(*(_QWORD *)v26 + 16))(v26);
  v10 = ARI_CsiIceStartProvisionResp_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  if (v10)
    return 0;
  return a3[1] == 0;
}

void sub_211594128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  NSObject *v22;

  if (object)
    dispatch_release(object);
  if (v22)
    dispatch_release(v22);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0x4C4uLL);
}

BOOL KTLFinishProvision(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  BOOL v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  NSObject *v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  intptr_t v33;
  uint64_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  dispatch_object_t object;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  __n128 (*v55)(uint64_t, uint64_t);
  uint64_t (*v56)();
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[2];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 16);
  v49 = v5;
  if (*(_QWORD *)(a1 + 8))
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2000000000;
    v48 = -1;
    v52 = 0;
    v53 = &v52;
    v54 = 0xD802000000;
    v55 = __Block_byref_object_copy__2;
    v56 = __Block_byref_object_dispose__3;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v57 = v12;
    v58 = v12;
    v59 = v12;
    v60 = v12;
    v61 = v12;
    v62 = v12;
    v63 = v12;
    v64 = v12;
    v65 = v12;
    v66[0] = v12;
    *(_OWORD *)((char *)v66 + 12) = v12;
    v13 = dispatch_semaphore_create(0);
    v14 = v13;
    object = v13;
    if (v13)
      dispatch_retain(v13);
    if (ARI_CsiIceFinishProvisionReq_BLK())
    {
      v15 = 0;
      v16 = v53;
      v17 = *(_OWORD *)(v53 + 9);
      v18 = *(_OWORD *)(v53 + 7);
      *(_OWORD *)a3 = *(_OWORD *)(v53 + 5);
      *(_OWORD *)(a3 + 16) = v18;
      *(_OWORD *)(a3 + 32) = v17;
      v19 = *(_OWORD *)(v16 + 13);
      v20 = *(_OWORD *)(v16 + 17);
      v21 = *(_OWORD *)(v16 + 11);
      *(_OWORD *)(a3 + 80) = *(_OWORD *)(v16 + 15);
      *(_OWORD *)(a3 + 96) = v20;
      *(_OWORD *)(a3 + 48) = v21;
      *(_OWORD *)(a3 + 64) = v19;
      v22 = *(_OWORD *)(v16 + 21);
      v23 = *(_OWORD *)(v16 + 23);
      v24 = *(_OWORD *)(v16 + 19);
      *(_OWORD *)(a3 + 156) = *(_OWORD *)((char *)v16 + 196);
      *(_OWORD *)(a3 + 128) = v22;
      *(_OWORD *)(a3 + 144) = v23;
      *(_OWORD *)(a3 + 112) = v24;
      v25 = object;
      if (!object)
        goto LABEL_16;
      goto LABEL_15;
    }
    v26 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v33 = dispatch_semaphore_wait(v14, v26);
    if (v33)
      _KTLErrorPrint((uint64_t)"KTLFinishProvision", (uint64_t)"Timeout waiting for response.\n", v27, v28, v29, v30, v31, v32, v43);
    if (v49)
      AriHost::ExitTrx((AriHost *)v49);
    v34 = v53;
    v35 = *(_OWORD *)(v53 + 9);
    v36 = *(_OWORD *)(v53 + 7);
    *(_OWORD *)a3 = *(_OWORD *)(v53 + 5);
    *(_OWORD *)(a3 + 16) = v36;
    *(_OWORD *)(a3 + 32) = v35;
    v37 = *(_OWORD *)(v34 + 13);
    v38 = *(_OWORD *)(v34 + 17);
    v39 = *(_OWORD *)(v34 + 11);
    *(_OWORD *)(a3 + 80) = *(_OWORD *)(v34 + 15);
    *(_OWORD *)(a3 + 96) = v38;
    *(_OWORD *)(a3 + 48) = v39;
    *(_OWORD *)(a3 + 64) = v37;
    v40 = *(_OWORD *)(v34 + 21);
    v41 = *(_OWORD *)(v34 + 23);
    v42 = *(_OWORD *)(v34 + 19);
    *(_OWORD *)(a3 + 156) = *(_OWORD *)((char *)v34 + 196);
    *(_OWORD *)(a3 + 128) = v40;
    *(_OWORD *)(a3 + 144) = v41;
    *(_OWORD *)(a3 + 112) = v42;
    if (v33)
    {
      v15 = 0;
      v25 = object;
      if (!object)
        goto LABEL_16;
    }
    else
    {
      v15 = *((_DWORD *)v46 + 6) == 0;
      v25 = object;
      if (!object)
      {
LABEL_16:
        if (v14)
          dispatch_release(v14);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v45, 8);
        if (v15)
          return *(_DWORD *)(a3 + 20) == 0;
        return 0;
      }
    }
LABEL_15:
    dispatch_release(v25);
    goto LABEL_16;
  }
  v45 = 0;
  v50 = 0;
  v51 = v5;
  v52 = 0;
  if (ARI_CsiIceFinishProvisionReq_ENC())
    return 0;
  v7 = operator new(0x18uLL);
  v8 = v52;
  v7[2] = v50;
  *((_QWORD *)v7 + 2) = v8;
  *(_QWORD *)v7 = &unk_24CC18DE8;
  if (!KTLUTASendAndReleaseData(a1, v7))
    return 0;
  if ((KTLUTACopyReceiveData(a1, &v45) & 1) == 0)
    return 0;
  v9 = v45;
  (*(void (**)(uint64_t))(*(_QWORD *)v45 + 16))(v45);
  v10 = ARI_CsiIceFinishProvisionResp_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  if (v10)
    return 0;
  return *(_DWORD *)(a3 + 20) == 0;
}

void sub_211594554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  NSObject *v23;

  if (object)
    dispatch_release(object);
  if (v23)
    dispatch_release(v23);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *(_OWORD *)(a2 + 40);
  v3 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(_OWORD *)(a1 + 40) = v2;
  v4 = *(_OWORD *)(a2 + 88);
  v5 = *(_OWORD *)(a2 + 104);
  v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v6;
  *(_OWORD *)(a1 + 104) = v5;
  *(_OWORD *)(a1 + 88) = v4;
  result = *(__n128 *)(a2 + 152);
  v8 = *(_OWORD *)(a2 + 168);
  v9 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 196) = *(_OWORD *)(a2 + 196);
  *(_OWORD *)(a1 + 184) = v9;
  *(_OWORD *)(a1 + 168) = v8;
  *(__n128 *)(a1 + 152) = result;
  return result;
}

BOOL KTLGetManifestStatus(uint64_t a1, _DWORD *a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  intptr_t v23;
  uint64_t v24;
  dispatch_object_t object;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *(*v36)(uint64_t, uint64_t);
  uint64_t (*v37)();
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 16);
  v30 = v4;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2000000000;
    v29 = -1;
    v33 = 0;
    v34 = &v33;
    v35 = 0x13802000000;
    v36 = __Block_byref_object_copy__5;
    v37 = __Block_byref_object_dispose__6;
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v52 = v11;
    v53 = v11;
    v54 = v11;
    v38 = v11;
    v39 = v11;
    v40 = v11;
    v41 = v11;
    v42 = v11;
    v43 = v11;
    v44 = v11;
    v45 = v11;
    v46 = v11;
    v47 = v11;
    v48 = v11;
    v49 = v11;
    v50 = v11;
    v51 = v11;
    v12 = dispatch_semaphore_create(0);
    v13 = v12;
    object = v12;
    if (v12)
      dispatch_retain(v12);
    if (ARI_CsiIceGetManifestStatusReq_BLK())
    {
      memcpy(a2, v34 + 5, 0x110uLL);
      v14 = 0;
      v15 = object;
      if (!object)
        goto LABEL_23;
    }
    else
    {
      v16 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v23 = dispatch_semaphore_wait(v13, v16);
      if (v23)
        _KTLErrorPrint((uint64_t)"KTLGetManifestStatus", (uint64_t)"Timeout waiting for response.\n", v17, v18, v19, v20, v21, v22, v24);
      if (v30)
        AriHost::ExitTrx((AriHost *)v30);
      memcpy(a2, v34 + 5, 0x110uLL);
      if (v23)
      {
        v14 = 0;
        v15 = object;
        if (!object)
          goto LABEL_23;
      }
      else
      {
        v14 = *((_DWORD *)v27 + 6) == 0;
        v15 = object;
        if (!object)
        {
LABEL_23:
          if (v13)
            dispatch_release(v13);
          _Block_object_dispose(&v33, 8);
          _Block_object_dispose(&v26, 8);
          if (v14)
            return *a2 == 0;
          return 0;
        }
      }
    }
    dispatch_release(v15);
    goto LABEL_23;
  }
  v26 = 0;
  v31 = 0;
  v32 = v4;
  v33 = 0;
  if (ARI_CsiIceGetManifestStatusReq_ENC())
    return 0;
  v6 = operator new(0x18uLL);
  v7 = v33;
  v6[2] = v31;
  *((_QWORD *)v6 + 2) = v7;
  *(_QWORD *)v6 = &unk_24CC18DE8;
  if (!KTLUTASendAndReleaseData(a1, v6))
    return 0;
  if ((KTLUTACopyReceiveData(a1, &v26) & 1) == 0)
    return 0;
  v8 = v26;
  (*(void (**)(uint64_t))(*(_QWORD *)v26 + 16))(v26);
  v9 = ARI_CsiIceGetManifestStatusResp_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  if (v9)
    return 0;
  return *a2 == 0;
}

void sub_211594960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  NSObject *v23;

  if (object)
    dispatch_release(object);
  if (v23)
    dispatch_release(v23);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0x110uLL);
}

_QWORD *Bsp::BspCommandDriver::BspCommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t Bsp::BspCommandDriver::GetIMEIInfo(Bsp::BspCommandDriver *this, AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *a2, AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK **a3)
{
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
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  v26 = 0;
  v27 = 0;
  AriSdk::MsgBase::getRawBytes();
  v24 = 0;
  v25 = 0;
  v9 = ktl::CommandDriver::perform<AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK>((uint64_t *)this, 83918848, &v24, a3, v5, v6, v7, v8);
  v16 = v9;
  v17 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
      if ((v16 & 1) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if ((v9 & 1) == 0)
LABEL_6:
    _KTLErrorPrint((uint64_t)"GetIMEIInfo", (uint64_t)"Failed request\n", v10, v11, v12, v13, v14, v15, (uint64_t)v24);
LABEL_7:
  v20 = v27;
  if (!v27)
    return v16;
  v21 = (unint64_t *)&v27->__shared_owners_;
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (v22)
    return v16;
  ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
  std::__shared_weak_count::__release_weak(v20);
  return v16;
}

void sub_211594B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_211594B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ktl::CommandDriver::perform<AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK>(uint64_t *a1, uint64_t a2, uint64_t **a3, AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *v39;
  const unsigned __int8 *v40;
  uint64_t *v41;
  dispatch_time_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  NSObject *v50;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  dispatch_object_t object;

  *a4 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = **a3;
    v14 = (*a3)[1] - v13;
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v60) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, v14);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && (((unsigned int (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v60, 1, v15, 0)? (v22 = (_DWORD)v60 == (_DWORD)v14): (v22 = 0), v22))
    {
      v60 = 0;
      if (KTLUTACopyReceiveData(*a1, &v60))
      {
        v38 = v60;
        if (v60)
        {
          v39 = (AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)operator new(0x60uLL);
          v40 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 16))(v38);
          AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK(v39, v40);
          *a4 = v39;
          (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
          goto LABEL_26;
        }
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v29 = "error while trying to get response from device \n";
LABEL_11:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v29, v23, v24, v25, v26, v27, v28, v59);
    goto LABEL_12;
  }
  v60 = 0;
  v61 = &v60;
  v62 = 0x3002000000;
  v63 = __Block_byref_object_copy__3;
  v64 = __Block_byref_object_dispose__3;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v31 = AriHost::Send();
  if ((_DWORD)v31)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v32, v33, v34, v35, v36, v37, v31);
    goto LABEL_23;
  }
  v41 = v61;
  v42 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v41[5], v42))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v43, v44, v45, v46, v47, v48, v59);
LABEL_23:
    v49 = 0;
    _Block_object_dispose(&v60, 8);
    v50 = object;
    if (!object)
      goto LABEL_25;
    goto LABEL_24;
  }
  v49 = 1;
  _Block_object_dispose(&v60, 8);
  v50 = object;
  if (object)
LABEL_24:
    dispatch_release(v50);
LABEL_25:
  if ((v49 & 1) == 0)
    goto LABEL_12;
LABEL_26:
  hasDeclaredGmid = AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::hasDeclaredGmid(*a4);
  v52 = *a4;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v52) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a4);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v53, v54, v55, v56, v57, v58, a2);
      goto LABEL_12;
    }
    v29 = "Received NACK\n";
    goto LABEL_11;
  }
  if (!AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::unpack(v52))
    return 1;
LABEL_12:
  if (*a4)
    (*(void (**)(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *))(*(_QWORD *)*a4 + 16))(*a4);
  result = 0;
  *a4 = 0;
  return result;
}

void sub_211594EA4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_211594EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object)
{
  _Block_object_dispose(&a17, 8);
  if (!object)
    _Unwind_Resume(a1);
  dispatch_release(object);
  _Unwind_Resume(a1);
}

uint64_t Bsp::BspCommandDriver::GetBBWakeReason(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *v38;
  const unsigned __int8 *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  dispatch_time_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  NSObject *v65;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  dispatch_object_t object;

  _KTLErrorPrint((uint64_t)"GetBBWakeReason", (uint64_t)"Getting Baseband wake reason", (uint64_t)a3, a4, a5, a6, a7, a8, v74);
  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v16 = *a1;
  v17 = *(_QWORD **)(*a1 + 8);
  if (v17 || !*(_DWORD *)(v16 + 16))
  {
    v18 = MEMORY[0];
    v19 = MEMORY[8] - MEMORY[0];
    v20 = *(unsigned int *)(v16 + 20);
    LODWORD(v76) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v10, v11, v12, v13, v14, v15, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v18);
    if (*v17
      && ((v27 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v17)(v17, v18, v19, &v76, 1, v20, 0), (_DWORD)v76 == (_DWORD)v19)? (v28 = v27): (v28 = 0), (v28 & 1) != 0))
    {
      v76 = 0;
      v29 = KTLUTACopyReceiveData(*a1, &v76);
      v36 = v76;
      if (v76)
        v37 = v29;
      else
        v37 = 0;
      if (v37 == 1)
      {
        v38 = (AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *)operator new(0x50uLL);
        v39 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v36 + 16))(v36);
        AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::ARI_CsiIceWakeupReasonRspCb_SDK(v38, v39);
        *a3 = v38;
        (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v21, v22, v23, v24, v25, v26, v19);
    }
    v40 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v40, v30, v31, v32, v33, v34, v35, v75);
    goto LABEL_17;
  }
  v76 = 0;
  v77 = &v76;
  v78 = 0x3002000000;
  v79 = __Block_byref_object_copy__3;
  v80 = __Block_byref_object_dispose__3;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v49 = AriHost::Send();
  if ((_DWORD)v49)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v50, v51, v52, v53, v54, v55, v49);
    goto LABEL_28;
  }
  v56 = v77;
  v57 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v56[5], v57))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v58, v59, v60, v61, v62, v63, v75);
LABEL_28:
    v64 = 0;
    _Block_object_dispose(&v76, 8);
    v65 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v64 = 1;
  _Block_object_dispose(&v76, 8);
  v65 = object;
  if (object)
LABEL_29:
    dispatch_release(v65);
LABEL_30:
  if ((v64 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::hasDeclaredGmid(*a3);
  v67 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v67) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v68, v69, v70, v71, v72, v73, 4111007744);
      goto LABEL_17;
    }
    v40 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::unpack(v67))
  {
    v47 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v47 = 0;
  *a3 = 0;
LABEL_20:
  if ((v47 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetBBWakeReason", (uint64_t)"Failed request\n", v41, v42, v43, v44, v45, v46, v75);
  return v47;
}

void sub_2115952E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t Bsp::BspCommandDriver::SwTrap(uint64_t *a1, const void **a2)
{
  __int128 v4;
  _QWORD *v5;
  void *v6;
  int v7;
  const void *v8;
  size_t v9;
  char *v10;
  char *v11;
  const char *v12;
  const char *v13;
  void **v14;
  int v15;
  int v16;
  _DWORD *v17;
  void *v18;
  _DWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v44;
  uint64_t *v45[2];
  _OWORD v46[4];
  void *__p[2];
  __int128 v48;
  void *v49[2];
  uint64_t *v50;
  uint64_t *v51;
  void **v52;
  char v53;

  v50 = 0;
  v51 = 0;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v48 = v4;
  *(_OWORD *)v49 = v4;
  v46[3] = v4;
  *(_OWORD *)__p = v4;
  v46[1] = v4;
  v46[2] = v4;
  v46[0] = v4;
  AriSdk::ARI_CsiBspSwTrapReq_v3_SDK::ARI_CsiBspSwTrapReq_v3_SDK((AriSdk::ARI_CsiBspSwTrapReq_v3_SDK *)v46);
  v5 = operator new(8uLL);
  *v5 = 0x600DC0FFEELL;
  v6 = __p[0];
  __p[0] = v5;
  if (v6)
    operator delete(v6);
  v7 = *((char *)a2 + 23);
  if (v7 >= 0)
    v8 = a2;
  else
    v8 = *a2;
  if (v7 >= 0)
    v9 = *((unsigned __int8 *)a2 + 23);
  else
    v9 = (size_t)a2[1];
  if (v9)
  {
    if ((v9 & 0x8000000000000000) != 0)
      std::vector<char>::__throw_length_error[abi:ne180100]();
    v10 = (char *)operator new(v9);
    v11 = &v10[v9];
    memmove(v10, v8, v9);
    if (v9 >= 0x201)
    {
      AriOsa::LogSrcInfo((AriOsa *)"/AppleInternal/Library/BuildRoots/f82e4213-595f-11ef-b136-76625042721f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "operator=", v12);
      if (v53 >= 0)
        v14 = (void **)&v52;
      else
        v14 = v52;
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Array assignment too large(%p), got(%zu) max(%zu)", v13, v14, 360, &__p[1], v9, 512);
      if (v53 < 0)
        operator delete(v52);
      if (v10)
        operator delete(v10);
      goto LABEL_23;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (__p[1])
  {
    *(void **)&v48 = __p[1];
    operator delete(__p[1]);
  }
  __p[1] = v10;
  *(_QWORD *)&v48 = v11;
  *((_QWORD *)&v48 + 1) = v11;
LABEL_23:
  v16 = (int)__p[1];
  v15 = v48;
  v17 = operator new(4uLL);
  *v17 = v15 - v16;
  v18 = v49[0];
  v49[0] = v17;
  if (v18)
    operator delete(v18);
  v19 = operator new(4uLL);
  *v19 = 0;
  v20 = v49[1];
  v49[1] = v19;
  if (v20)
    operator delete(v20);
  AriSdk::MsgBase::getRawBytes();
  v27 = (std::__shared_weak_count *)v51;
  v45[0] = v50;
  v45[1] = v51;
  if (v51)
  {
    v28 = (unint64_t *)(v51 + 1);
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  v30 = ktl::CommandDriver::perform(a1, v45, v21, v22, v23, v24, v25, v26);
  v37 = v30;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v39 = __ldaxr(p_shared_owners);
    while (__stlxr(v39 - 1, p_shared_owners));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
      if ((v37 & 1) != 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  if ((v30 & 1) == 0)
LABEL_35:
    _KTLErrorPrint((uint64_t)"SwTrap", (uint64_t)"Failed to send request (this message does not expect a response)\n", v31, v32, v33, v34, v35, v36, v44);
LABEL_36:
  MEMORY[0x212BDC8A8](v46);
  v40 = (std::__shared_weak_count *)v51;
  if (v51)
  {
    v41 = (unint64_t *)(v51 + 1);
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  return v37;
}

void sub_211595604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17)
{
  void *v17;
  uint64_t v18;

  if (*(char *)(v18 - 49) < 0)
    operator delete(*(void **)(v18 - 72));
  if (v17)
  {
    operator delete(v17);
    MEMORY[0x212BDC8A8](&a17);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v18 - 88);
    _Unwind_Resume(a1);
  }
  MEMORY[0x212BDC8A8](&a17);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v18 - 88);
  _Unwind_Resume(a1);
}

void std::vector<char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CC18BA8, MEMORY[0x24BEDAAF0]);
}

void sub_2115956F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk29ARI_CsiMsCpsReadImeiRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *v4;

  v4 = (AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)operator new(0x60uLL);
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115957B0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_CsiIceWakeupReasonRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *v4;

  v4 = (AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::ARI_CsiIceWakeupReasonRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211595824(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetFirmwareVersion(uint64_t a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 Info;
  int v12;
  _DWORD v14[130];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 170, sizeof(v14));
  Info = KTLSysGetInfo(a1, 4, (uint64_t)v14, v6, v7, v8, v9, v10);
  if (Info)
  {
    if (v14[128] < *a3)
      v12 = v14[128] + 1;
    else
      v12 = *a3;
    *a3 = v12;
    memcpy(a2, v14, (v12 - 1));
    a2[*a3 - 1] = 0;
  }
  else
  {
    *a3 = 0;
  }
  return Info;
}

uint64_t KTLGetIMEI(uint64_t a1, _BYTE *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  _BOOL4 v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  memset(v19, 170, 24);
  if (*a3 < 0xFu)
    return 0;
  v11 = KTLGetIMEIInfo(a1, a4, (uint64_t)v19, a4, a5, a6, a7, a8);
  result = 0;
  if (a2)
  {
    if (v11)
    {
      bzero(a2, *a3);
      *a2 = (BYTE4(v19[0]) >> 4) | 0x30;
      v12 = BYTE5(v19[0]);
      a2[1] = BYTE5(v19[0]) & 0xF | 0x30;
      a2[2] = (v12 >> 4) | 0x30;
      v13 = BYTE6(v19[0]);
      a2[3] = BYTE6(v19[0]) & 0xF | 0x30;
      a2[4] = (v13 >> 4) | 0x30;
      v14 = HIBYTE(v19[0]);
      a2[5] = HIBYTE(v19[0]) & 0xF | 0x30;
      a2[6] = (v14 >> 4) | 0x30;
      v15 = LOBYTE(v19[1]);
      a2[7] = v19[1] & 0xF | 0x30;
      a2[8] = (v15 >> 4) | 0x30;
      v16 = BYTE1(v19[1]);
      a2[9] = BYTE1(v19[1]) & 0xF | 0x30;
      a2[10] = (v16 >> 4) | 0x30;
      v17 = BYTE2(v19[1]);
      a2[11] = BYTE2(v19[1]) & 0xF | 0x30;
      a2[12] = (v17 >> 4) | 0x30;
      v18 = BYTE3(v19[1]);
      a2[13] = BYTE3(v19[1]) & 0xF | 0x30;
      a2[14] = (v18 >> 4) | 0x30;
      a2[15] = 0;
      result = 1;
      *a3 = 16;
    }
  }
  return result;
}

uint64_t KTLGetIMEI_V2(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  _DWORD *v4;
  void *v5;
  uint64_t IMEIInfo;
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *v7;
  _BYTE *v8;
  _BYTE *v9;
  _BYTE *v10;
  _BYTE *v11;
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *v13;
  _OWORD v14[4];
  void *__p;
  uint64_t v16;

  if (!a2)
    return 0;
  v16 = a1;
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[2] = v3;
  v14[3] = v3;
  v14[0] = v3;
  v14[1] = v3;
  AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::ARI_CsiMsCpsReadImeiReq_SDK((AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *)v14);
  v13 = (AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
  v4 = operator new(4uLL);
  *v4 = 0;
  v5 = __p;
  __p = v4;
  if (v5)
    operator delete(v5);
  IMEIInfo = Bsp::BspCommandDriver::GetIMEIInfo((Bsp::BspCommandDriver *)&v16, (AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *)v14, &v13);
  if ((_DWORD)IMEIInfo)
  {
    *(_DWORD *)(a2 + 36) = 16;
    *(_DWORD *)(a2 + 16) = 16;
    *(_DWORD *)(a2 + 84) = 17;
    *(_DWORD *)(a2 + 60) = 17;
    v7 = v13;
    v8 = (_BYTE *)*((_QWORD *)v13 + 9);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)a2 = (v8[4] >> 4) | 0x30;
    *(_BYTE *)(a2 + 1) = v8[5] & 0xF | 0x30;
    *(_BYTE *)(a2 + 2) = (v8[5] >> 4) | 0x30;
    *(_BYTE *)(a2 + 3) = v8[6] & 0xF | 0x30;
    *(_BYTE *)(a2 + 4) = (v8[6] >> 4) | 0x30;
    *(_BYTE *)(a2 + 5) = v8[7] & 0xF | 0x30;
    *(_BYTE *)(a2 + 6) = (v8[7] >> 4) | 0x30;
    *(_BYTE *)(a2 + 7) = v8[8] & 0xF | 0x30;
    *(_BYTE *)(a2 + 8) = (v8[8] >> 4) | 0x30;
    *(_BYTE *)(a2 + 9) = v8[9] & 0xF | 0x30;
    *(_BYTE *)(a2 + 10) = (v8[9] >> 4) | 0x30;
    *(_BYTE *)(a2 + 11) = v8[10] & 0xF | 0x30;
    *(_BYTE *)(a2 + 12) = (v8[10] >> 4) | 0x30;
    *(_BYTE *)(a2 + 13) = v8[11] & 0xF | 0x30;
    *(_BYTE *)(a2 + 14) = (v8[11] >> 4) | 0x30;
    *(_BYTE *)(a2 + 15) = 0;
    *(_DWORD *)(a2 + 16) = 16;
    v9 = (_BYTE *)*((_QWORD *)v7 + 9);
    *(_QWORD *)(a2 + 40) = 0;
    *(_QWORD *)(a2 + 48) = 0;
    *(_BYTE *)(a2 + 56) = 0;
    *(_BYTE *)(a2 + 40) = (v9[12] >> 4) | 0x30;
    *(_BYTE *)(a2 + 41) = v9[13] & 0xF | 0x30;
    *(_BYTE *)(a2 + 42) = (v9[13] >> 4) | 0x30;
    *(_BYTE *)(a2 + 43) = v9[14] & 0xF | 0x30;
    *(_BYTE *)(a2 + 44) = (v9[14] >> 4) | 0x30;
    *(_BYTE *)(a2 + 45) = v9[15] & 0xF | 0x30;
    *(_BYTE *)(a2 + 46) = (v9[15] >> 4) | 0x30;
    *(_BYTE *)(a2 + 47) = v9[16] & 0xF | 0x30;
    *(_BYTE *)(a2 + 48) = (v9[16] >> 4) | 0x30;
    *(_BYTE *)(a2 + 49) = v9[17] & 0xF | 0x30;
    *(_BYTE *)(a2 + 50) = (v9[17] >> 4) | 0x30;
    *(_BYTE *)(a2 + 51) = v9[18] & 0xF | 0x30;
    *(_BYTE *)(a2 + 52) = (v9[18] >> 4) | 0x30;
    *(_BYTE *)(a2 + 53) = v9[19] & 0xF | 0x30;
    *(_BYTE *)(a2 + 54) = (v9[19] >> 4) | 0x30;
    *(_BYTE *)(a2 + 55) = v9[20] & 0xF | 0x30;
    *(_BYTE *)(a2 + 56) = 0;
    *(_DWORD *)(a2 + 60) = 17;
    v10 = (_BYTE *)*((_QWORD *)v7 + 10);
    if (v10)
    {
      *(_QWORD *)(a2 + 28) = 0;
      *(_QWORD *)(a2 + 20) = 0;
      *(_BYTE *)(a2 + 20) = (*v10 >> 4) | 0x30;
      *(_BYTE *)(a2 + 21) = v10[1] & 0xF | 0x30;
      *(_BYTE *)(a2 + 22) = (v10[1] >> 4) | 0x30;
      *(_BYTE *)(a2 + 23) = v10[2] & 0xF | 0x30;
      *(_BYTE *)(a2 + 24) = (v10[2] >> 4) | 0x30;
      *(_BYTE *)(a2 + 25) = v10[3] & 0xF | 0x30;
      *(_BYTE *)(a2 + 26) = (v10[3] >> 4) | 0x30;
      *(_BYTE *)(a2 + 27) = v10[4] & 0xF | 0x30;
      *(_BYTE *)(a2 + 28) = (v10[4] >> 4) | 0x30;
      *(_BYTE *)(a2 + 29) = v10[5] & 0xF | 0x30;
      *(_BYTE *)(a2 + 30) = (v10[5] >> 4) | 0x30;
      *(_BYTE *)(a2 + 31) = v10[6] & 0xF | 0x30;
      *(_BYTE *)(a2 + 32) = (v10[6] >> 4) | 0x30;
      *(_BYTE *)(a2 + 33) = v10[7] & 0xF | 0x30;
      *(_BYTE *)(a2 + 34) = (v10[7] >> 4) | 0x30;
      *(_BYTE *)(a2 + 35) = 0;
      *(_DWORD *)(a2 + 36) = 16;
      v11 = (_BYTE *)*((_QWORD *)v7 + 10);
      *(_BYTE *)(a2 + 80) = 0;
      *(_QWORD *)(a2 + 64) = 0;
      *(_QWORD *)(a2 + 72) = 0;
      *(_BYTE *)(a2 + 64) = (v11[8] >> 4) | 0x30;
      *(_BYTE *)(a2 + 65) = v11[9] & 0xF | 0x30;
      *(_BYTE *)(a2 + 66) = (v11[9] >> 4) | 0x30;
      *(_BYTE *)(a2 + 67) = v11[10] & 0xF | 0x30;
      *(_BYTE *)(a2 + 68) = (v11[10] >> 4) | 0x30;
      *(_BYTE *)(a2 + 69) = v11[11] & 0xF | 0x30;
      *(_BYTE *)(a2 + 70) = (v11[11] >> 4) | 0x30;
      *(_BYTE *)(a2 + 71) = v11[12] & 0xF | 0x30;
      *(_BYTE *)(a2 + 72) = (v11[12] >> 4) | 0x30;
      *(_BYTE *)(a2 + 73) = v11[13] & 0xF | 0x30;
      *(_BYTE *)(a2 + 74) = (v11[13] >> 4) | 0x30;
      *(_BYTE *)(a2 + 75) = v11[14] & 0xF | 0x30;
      *(_BYTE *)(a2 + 76) = (v11[14] >> 4) | 0x30;
      *(_BYTE *)(a2 + 77) = v11[15] & 0xF | 0x30;
      *(_BYTE *)(a2 + 78) = (v11[15] >> 4) | 0x30;
      *(_WORD *)(a2 + 79) = v11[16] & 0xF | 0x30;
      *(_DWORD *)(a2 + 84) = 17;
    }
    else
    {
      *(_DWORD *)(a2 + 84) = 0;
      *(_QWORD *)(a2 + 64) = 0;
      *(_QWORD *)(a2 + 72) = 0;
      *(_BYTE *)(a2 + 80) = 0;
      *(_QWORD *)(a2 + 28) = 0;
      *(_QWORD *)(a2 + 20) = 0;
      *(_DWORD *)(a2 + 36) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 84) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 41) = 0u;
    *(_QWORD *)(a2 + 68) = 0;
    *(_QWORD *)(a2 + 60) = 0;
    *(_QWORD *)(a2 + 73) = 0;
  }
  MEMORY[0x212BDC8F0](v14);
  return IMEIInfo;
}

uint64_t KTLGetMEID(uint64_t a1, _BYTE *a2, _DWORD *a3, int a4)
{
  uint64_t result;
  _BOOL4 v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  memset(v15, 170, 24);
  if (*a3 < 0xEu)
    return 0;
  v7 = KTLGetMEIDInfo(a1, a4, (uint64_t)v15);
  result = 0;
  if (a2)
  {
    if (v7)
    {
      bzero(a2, *a3);
      v8 = BYTE4(v15[0]);
      *a2 = BYTE4(v15[0]) & 0xF | 0x30;
      a2[1] = (v8 >> 4) | 0x30;
      v9 = BYTE5(v15[0]);
      a2[2] = BYTE5(v15[0]) & 0xF | 0x30;
      a2[3] = (v9 >> 4) | 0x30;
      v10 = BYTE6(v15[0]);
      a2[4] = BYTE6(v15[0]) & 0xF | 0x30;
      a2[5] = (v10 >> 4) | 0x30;
      v11 = HIBYTE(v15[0]);
      a2[6] = HIBYTE(v15[0]) & 0xF | 0x30;
      a2[7] = (v11 >> 4) | 0x30;
      v12 = LOBYTE(v15[1]);
      a2[8] = v15[1] & 0xF | 0x30;
      a2[9] = (v12 >> 4) | 0x30;
      v13 = BYTE1(v15[1]);
      a2[10] = BYTE1(v15[1]) & 0xF | 0x30;
      a2[11] = (v13 >> 4) | 0x30;
      v14 = BYTE2(v15[1]);
      a2[12] = BYTE2(v15[1]) & 0xF | 0x30;
      a2[13] = (v14 >> 4) | 0x30;
      a2[14] = 0;
      result = 1;
      *a3 = 14;
    }
  }
  return result;
}

uint64_t KTLIsValidIMEIString(const char *a1)
{
  uint64_t result;

  result = strncmp(a1, "00000000000000", 0xFuLL);
  if ((_DWORD)result)
    return strncmp(a1, "00499901064000", 0xFuLL) != 0;
  return result;
}

BOOL KTLIsValidMEIDString(const char *a1)
{
  return strncmp(a1, "00000000000000", 0xEuLL) != 0;
}

uint64_t KTLGetIMEISV(uint64_t a1, _BYTE *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  _BOOL4 v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  memset(v19, 170, 24);
  if (*a3 < 0x10u)
    return 0;
  v11 = KTLGetIMEIInfo(a1, a4, (uint64_t)v19, a4, a5, a6, a7, a8);
  result = 0;
  if (a2)
  {
    if (v11)
    {
      bzero(a2, *a3);
      *a2 = (BYTE4(v19[1]) >> 4) | 0x30;
      v12 = BYTE5(v19[1]);
      a2[1] = BYTE5(v19[1]) & 0xF | 0x30;
      a2[2] = (v12 >> 4) | 0x30;
      v13 = BYTE6(v19[1]);
      a2[3] = BYTE6(v19[1]) & 0xF | 0x30;
      a2[4] = (v13 >> 4) | 0x30;
      v14 = HIBYTE(v19[1]);
      a2[5] = HIBYTE(v19[1]) & 0xF | 0x30;
      a2[6] = (v14 >> 4) | 0x30;
      v15 = LOBYTE(v19[2]);
      a2[7] = v19[2] & 0xF | 0x30;
      a2[8] = (v15 >> 4) | 0x30;
      v16 = BYTE1(v19[2]);
      a2[9] = BYTE1(v19[2]) & 0xF | 0x30;
      a2[10] = (v16 >> 4) | 0x30;
      v17 = BYTE2(v19[2]);
      a2[11] = BYTE2(v19[2]) & 0xF | 0x30;
      a2[12] = (v17 >> 4) | 0x30;
      v18 = BYTE3(v19[2]);
      a2[13] = BYTE3(v19[2]) & 0xF | 0x30;
      a2[14] = (v18 >> 4) | 0x30;
      a2[15] = BYTE4(v19[2]) & 0xF | 0x30;
      a2[16] = 0;
      result = 1;
      *a3 = 17;
    }
  }
  return result;
}

uint64_t KTLGetSIMInfo(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t VinylType;
  __int128 v6;
  _DWORD *v7;
  void *v8;
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *v9;
  int v10;
  int v11;
  _BYTE *v12;
  int v13;
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *v15;
  _OWORD v16[4];
  void *__p;
  uint64_t v18;

  VinylType = 0;
  if (a1 && a2)
  {
    v18 = a1;
    if (*(_DWORD *)(a1 + 20) >> 4 <= 0x270u)
      *(_DWORD *)(a1 + 20) = 10000;
    __p = (void *)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[2] = v6;
    v16[3] = v6;
    v16[0] = v6;
    v16[1] = v6;
    AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK((AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v16);
    v15 = 0;
    v7 = operator new(4uLL);
    *v7 = a3;
    v8 = __p;
    __p = v7;
    if (v8)
      operator delete(v8);
    *(_BYTE *)(a2 + 4) = 0;
    *(_DWORD *)a2 = 0;
    VinylType = eUICC::VinylCommandDriver::GetVinylType((eUICC::VinylCommandDriver *)&v18, (AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v16, &v15);
    if (!(_DWORD)VinylType)
      goto LABEL_21;
    v9 = v15;
    v10 = **((_DWORD **)v15 + 9);
    if (!v10 || v10 == 6 && **((_DWORD **)v15 + 16) == 2)
    {
      *(_BYTE *)(a2 + 4) = 0;
    }
    else
    {
      v11 = 1;
      *(_BYTE *)(a2 + 4) = 1;
      v12 = (_BYTE *)*((_QWORD *)v9 + 17);
      if (v12)
      {
        v13 = *v12;
        if (v13 == 2)
        {
          v11 = 3;
        }
        else if (v13 == 1)
        {
          v11 = 2;
        }
        else
        {
          if (*v12)
          {
            *(_DWORD *)a2 = 0;
            goto LABEL_20;
          }
          v11 = 1;
        }
      }
      *(_DWORD *)a2 = v11;
    }
LABEL_20:
    (*(void (**)(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *))(*(_QWORD *)v9 + 16))(v9);
LABEL_21:
    MEMORY[0x212BDCC50](v16);
  }
  return VinylType;
}

uint64_t KTLGetSimSlotMapping(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
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
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[20];
  BOOL v31;

  v2 = 0;
  if (!a1 || !a2)
    return v2;
  v31 = 0;
  memset(v30, 170, sizeof(v30));
  *(_QWORD *)a2 = 0x100000000;
  v5 = KTLIsBBSimStackMappingEnabled(a1, &v31);
  if (!v5 || v31)
  {
    if (v5)
      v27 = "BB internal SIM slot -> stack instance mapping enabled. Using default SIM stack mapping in KTL.\n";
    else
      v27 = "Treating BB as single-SIM. Using default SIM stack mapping in KTL.\n";
    _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)v27, v6, v7, v8, v9, v10, v11, v28);
    return 1;
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"BB internal SIM slot -> stack instance mapping disabled. Retrieveing SIM stack mapping from BB.\n.", v6, v7, v8, v9, v10, v11, v28);
    if (KTLGetSimStackMapping(a1, (uint64_t)v30))
    {
      if (v30[0])
        v18 = *(_DWORD *)&v30[4];
      else
        v18 = 255;
      *(_DWORD *)a2 = v18;
      _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"simSlotMapping->slot_instance_id[%lu] = %d\n", v12, v13, v14, v15, v16, v17, 0);
      if (v30[0] <= 1u)
        v25 = 255;
      else
        v25 = *(_DWORD *)&v30[8];
      *(_DWORD *)(a2 + 4) = v25;
      v2 = 1;
      _KTLDebugPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"simSlotMapping->slot_instance_id[%lu] = %d\n", v19, v20, v21, v22, v23, v24, 1);
      return v2;
    }
    _KTLErrorPrint((uint64_t)"KTLGetSimSlotMapping", (uint64_t)"Failed to retrieve SIM stack mapping from BB.\n", v12, v13, v14, v15, v16, v17, v29);
    return 0;
  }
}

uint64_t KTLGetSimSlotInstance(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  unsigned int v11;
  unint64_t v12;

  result = 0;
  if (a1 && a3)
  {
    v11 = a2;
    if (a2 < 2)
    {
      v12 = 0xAAAAAAAAAAAAAAAALL;
      result = KTLGetSimSlotMapping(a1, (uint64_t)&v12);
      if ((_DWORD)result)
        *a3 = *((_DWORD *)&v12 + v11);
    }
    else
    {
      _KTLErrorPrint((uint64_t)"KTLGetSimSlotInstance", (uint64_t)"simSlot parameter: %d is >= KTL max number of supported SIMs: %d\n", (uint64_t)a3, a4, a5, a6, a7, a8, a2);
      return 0;
    }
  }
  return result;
}

uint64_t KTLGetSIMSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v6;

  v2 = 0;
  if (a1)
  {
    if (a2)
    {
      v6 = 0xAAAAAAAAAAAAAAAALL;
      v2 = KTLGetSimSlotMapping(a1, (uint64_t)&v6);
      if ((_DWORD)v2)
      {
        KTLGetSIMInfo(a1, a2, v6);
        KTLGetSIMInfo(a1, a2 + 8, SHIDWORD(v6));
      }
    }
  }
  return v2;
}

const char *asString(int a1)
{
  if ((a1 - 1) > 2)
    return "unknown SIM type";
  else
    return off_24CC191B8[a1 - 1];
}

uint64_t KTLEFICheckSIMReady(uint64_t a1, BOOL *a2)
{
  uint64_t v2;
  BOOL v6;

  v2 = 0;
  if (!a1)
    return v2;
  if (!a2)
    return v2;
  *a2 = 0;
  v2 = 0;
  if (!KTLPing(a1, a2))
    return v2;
  if (*a2)
  {
    v2 = KTLIsSIMSlotReady(a1, (char *)a2, 0);
    v6 = 0;
    if ((_DWORD)v2 && *a2)
    {
      if (KTLIsSIMSlotReady(a1, (char *)&v6, 1))
        *a2 = v6;
    }
    return v2;
  }
  return 1;
}

uint64_t KTLIsSIMSlotReady(uint64_t a1, char *a2, int a3)
{
  __int128 v5;
  _DWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t VinylType;
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *v15;
  unsigned int v16;
  char v17;
  AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *v19;
  _OWORD v20[4];
  void *__p;
  uint64_t v22;

  v22 = a1;
  if (*(_DWORD *)(a1 + 20) >> 4 <= 0x270u)
    *(_DWORD *)(a1 + 20) = 10000;
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[2] = v5;
  v20[3] = v5;
  v20[0] = v5;
  v20[1] = v5;
  AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK((AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v20);
  v19 = 0;
  v6 = operator new(4uLL);
  *v6 = a3;
  v7 = __p;
  __p = v6;
  if (v7)
    operator delete(v7);
  VinylType = eUICC::VinylCommandDriver::GetVinylType((eUICC::VinylCommandDriver *)&v22, (AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *)v20, &v19);
  if ((_DWORD)VinylType)
  {
    v15 = v19;
    v16 = **((_DWORD **)v19 + 9);
    v17 = 1;
    if (v16 > 6)
    {
      if (v16 - 128 >= 3)
      {
        if (v16 != 254)
        {
          _KTLErrorPrint((uint64_t)"KTLIsSIMSlotReady", (uint64_t)"Unknown sim state 0x%x\n", v8, v9, v10, v11, v12, v13, **((unsigned int **)v19 + 9));
          v15 = v19;
          *a2 = 0;
          if (!v15)
            goto LABEL_15;
          goto LABEL_14;
        }
        goto LABEL_12;
      }
    }
    else if (((1 << v16) & 0x6D) == 0)
    {
LABEL_12:
      v17 = 0;
    }
    *a2 = v17;
LABEL_14:
    (*(void (**)(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *))(*(_QWORD *)v15 + 16))(v15);
    goto LABEL_15;
  }
  *a2 = 0;
LABEL_15:
  MEMORY[0x212BDCC50](v20);
  return VinylType;
}

BOOL KTLNVMReadGroupEnumList(uint64_t a1, void *a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_time_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  intptr_t v28;
  uint64_t v30;
  dispatch_object_t object;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  AriHost *v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *(*v45)(uint64_t, uint64_t);
  uint64_t (*v46)();
  _BYTE v47[3504];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 16);
  v40 = (AriHost *)v4;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
  {
    v36 = 0;
    LODWORD(v32) = v4;
    v41 = 0;
    v42 = 0;
    if (ARI_CsiBspNvmGroupEnumListReq_ENC()
      || (v6 = operator new(0x18uLL),
          v7 = v42,
          v6[2] = v41,
          *((_QWORD *)v6 + 2) = v7,
          *(_QWORD *)v6 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v6))
      || !KTLUTACopyReceiveData(a1, &v36))
    {
      v17 = 0;
      v16 = 0;
      return v17 == 1 && v16;
    }
    v8 = v36;
    (*(void (**)(uint64_t))(*(_QWORD *)v36 + 16))(v36);
    v9 = ARI_CsiBspNvmGroupEnumListRespCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    v16 = v9 == 0;
    v17 = HIDWORD(v40);
    if (v16)
      goto LABEL_27;
    return v17 == 1 && v16;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0xDD802000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  memset(v47, 170, sizeof(v47));
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2000000000;
  v35 = -1;
  v18 = dispatch_semaphore_create(0);
  v19 = v18;
  v30 = MEMORY[0x24BDAC760];
  object = v18;
  if (v18)
    dispatch_retain(v18);
  if (ARI_CsiBspNvmGroupEnumListReq_BLK())
  {
    v17 = *((_DWORD *)v37 + 6);
    HIDWORD(v40) = v17;
    memcpy(a2, v43 + 5, 0xDB0uLL);
    v16 = 0;
    v20 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v21 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v28 = dispatch_semaphore_wait(v19, v21);
  if (v28)
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupEnumList", (uint64_t)"Timeout waiting for response.\n", v22, v23, v24, v25, v26, v27, v30);
  if ((_DWORD)v40)
    AriHost::ExitTrx((AriHost *)v40);
  v17 = *((_DWORD *)v37 + 6);
  HIDWORD(v40) = v17;
  memcpy(a2, v43 + 5, 0xDB0uLL);
  if (v28)
  {
    v16 = 0;
    v20 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v16 = *((_DWORD *)v33 + 6) == 0;
  v20 = object;
  if (object)
LABEL_23:
    dispatch_release(v20);
LABEL_24:
  if (v19)
    dispatch_release(v19);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  if (v16)
  {
LABEL_27:
    if (v17 != 1)
    {
      _KTLErrorPrint((uint64_t)"KTLNVMReadGroupEnumList", (uint64_t)"Error: CsiBspNvmGroupEnumListRespCb Failure\n", v10, v11, v12, v13, v14, v15, v30);
      v17 = HIDWORD(v40);
    }
  }
  return v17 == 1 && v16;
}

void sub_211596C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  NSObject *v27;

  if (object)
    dispatch_release(object);
  if (v27)
    dispatch_release(v27);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0xDB0uLL);
}

BOOL KTLNVMReadGroupStart(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  intptr_t v26;
  uint64_t v28;
  dispatch_object_t object;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  unsigned int v40;

  v2 = *(_DWORD *)(a1 + 16);
  v38 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v30 = 0;
    v39 = 0;
    v40 = v2;
    v34 = 0;
    if (ARI_CsiBspNvmReadGroupReq_ENC()
      || (v4 = operator new(0x18uLL),
          v5 = v34,
          v4[2] = v39,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v4))
      || !KTLUTACopyReceiveData(a1, &v30))
    {
      v15 = 0;
      v14 = 0;
      return v15 == 1 && v14;
    }
    v6 = v30;
    (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
    v7 = ARI_CsiBspNvmReadGroupRespCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v14 = v7 == 0;
    v15 = HIDWORD(v38);
    if (v14)
      goto LABEL_27;
    return v15 == 1 && v14;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2000000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2000000000;
  v33 = -1;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (ARI_CsiBspNvmReadGroupReq_BLK())
  {
    v14 = 0;
    v15 = *((_DWORD *)v35 + 6);
    HIDWORD(v38) = v15;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v26 = dispatch_semaphore_wait(v17, v19);
  if (v26)
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupStart", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v28);
  if ((_DWORD)v38)
    AriHost::ExitTrx((AriHost *)v38);
  v15 = *((_DWORD *)v35 + 6);
  HIDWORD(v38) = v15;
  if (v26)
  {
    v14 = 0;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v14 = *((_DWORD *)v31 + 6) == 0;
  v18 = object;
  if (object)
LABEL_23:
    dispatch_release(v18);
LABEL_24:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  if (v14)
  {
LABEL_27:
    if (v15 != 1)
    {
      _KTLErrorPrint((uint64_t)"KTLNVMReadGroupStart", (uint64_t)"Error: CsiBspNvmReadGroupRespCb Failure\n", v8, v9, v10, v11, v12, v13, v28);
      v15 = HIDWORD(v38);
    }
  }
  return v15 == 1 && v14;
}

void sub_211596FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMReadGroupBlock(uint64_t a1, uint64_t a2, int *a3, void *a4, _DWORD *a5)
{
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_time_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  BOOL v31;
  NSObject *v32;
  int v33;
  uint64_t v35;
  dispatch_object_t object;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *(*v53)(uint64_t, uint64_t);
  uint64_t (*v54)();
  _BYTE v55[3504];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v9 = *(_DWORD *)(a1 + 16);
  v49 = v9;
  if (*(_QWORD *)(a1 + 8))
    v10 = 1;
  else
    v10 = v9 == 0;
  if (!v10)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2000000000;
    v48 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0xDD802000000;
    v53 = __Block_byref_object_copy__4;
    v54 = __Block_byref_object_dispose__4;
    memset(v55, 170, sizeof(v55));
    v41 = 0;
    v42 = &v41;
    v43 = 0x2000000000;
    v44 = -1431655766;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2000000000;
    v40 = -1;
    v21 = dispatch_semaphore_create(0);
    v22 = v21;
    object = v21;
    if (v21)
      dispatch_retain(v21);
    if (!ARI_CsiBspNvmReadGroupBlockReq_BLK())
    {
      v23 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v22, v23))
      {
        v30 = 1;
LABEL_17:
        *a3 = *((_DWORD *)v46 + 6);
        memcpy(a4, v51 + 5, 0xDB0uLL);
        *a5 = *((_DWORD *)v42 + 6);
        if (v30)
        {
          v31 = *((_DWORD *)v38 + 6) == 0;
          v32 = object;
          if (!object)
          {
LABEL_23:
            if (v22)
              dispatch_release(v22);
            _Block_object_dispose(&v37, 8);
            _Block_object_dispose(&v41, 8);
            _Block_object_dispose(&v50, 8);
            _Block_object_dispose(&v45, 8);
            if (v31)
              goto LABEL_26;
            goto LABEL_29;
          }
        }
        else
        {
          v31 = 0;
          v32 = object;
          if (!object)
            goto LABEL_23;
        }
        dispatch_release(v32);
        goto LABEL_23;
      }
      _KTLErrorPrint((uint64_t)"KTLNVMReadGroupBlock", (uint64_t)"Timeout waiting for response.\n", v24, v25, v26, v27, v28, v29, v35);
    }
    v30 = 0;
    goto LABEL_17;
  }
  v45 = 0;
  LODWORD(v41) = v9;
  LODWORD(v37) = 0;
  v50 = 0;
  if (ARI_CsiBspNvmReadGroupBlockReq_ENC()
    || (v17 = operator new(0x18uLL),
        v18 = v50,
        v17[2] = v37,
        *((_QWORD *)v17 + 2) = v18,
        *(_QWORD *)v17 = &unk_24CC18DE8,
        !KTLUTASendAndReleaseData(a1, v17))
    || (KTLUTACopyReceiveData(a1, &v45) & 1) == 0)
  {
    *a5 = 0;
    goto LABEL_29;
  }
  v19 = v45;
  (*(void (**)(uint64_t))(*(_QWORD *)v45 + 16))(v45);
  v20 = ARI_CsiBspNvmReadGroupBlockRespCb_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  *a5 = 0;
  if (v20)
  {
LABEL_29:
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupBlock", (uint64_t)"Error: CsiBspNvmReadGroupBlockRespCb Failure\n", v11, v12, v13, v14, v15, v16, v35);
    return 0;
  }
LABEL_26:
  v33 = *a3;
  if (!*a3)
  {
    _KTLErrorPrint((uint64_t)"KTLNVMReadGroupBlock", (uint64_t)"Error: CsiBspNvmReadGroupBlockRespCb Failure\n", v11, v12, v13, v14, v15, v16, v35);
    v33 = *a3;
  }
  return v33 != 0;
}

void sub_2115973E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  NSObject *v32;

  if (object)
    dispatch_release(object);
  if (v32)
    dispatch_release(v32);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40r48r56r64c25_ZTSN8dispatch9semaphoreE(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  v4 = *(NSObject **)(a2 + 64);
  a1[8] = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r40r48r56r64c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 64);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

const char *KTLFlashPluginGetResultString(unsigned int a1)
{
  if (a1 > 0xE)
    return "Unknown";
  else
    return off_24CC193B0[a1];
}

BOOL KTLNVMSendDeregister(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  intptr_t v26;
  const char *v27;
  uint64_t v29;
  dispatch_object_t object;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int v42;

  v2 = *(_DWORD *)(a1 + 16);
  v39 = v2;
  v40 = 14;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v31 = 0;
    v41 = 0;
    v42 = v2;
    v35 = 0;
    if (ARI_CsiFpRegister_ENC()
      || (v4 = operator new(0x18uLL),
          v5 = v35,
          v4[2] = v41,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v4))
      || !KTLUTACopyReceiveData(a1, &v31))
    {
      v14 = 0;
      v15 = 14;
      return !v15 && v14;
    }
    v6 = v31;
    (*(void (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
    v7 = ARI_CsiFpRegisterRsp_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v14 = v7 == 0;
    v15 = v40;
    if (v14)
      goto LABEL_27;
    return !v15 && v14;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 14;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2000000000;
  v34 = -1;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (ARI_CsiFpRegister_BLK())
  {
    v14 = 0;
    v15 = *((_DWORD *)v36 + 6);
    v40 = v15;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v26 = dispatch_semaphore_wait(v17, v19);
  if (v26)
    _KTLErrorPrint((uint64_t)"KTLNVMSendDeregister", (uint64_t)"Timeout waiting for response.\n", v20, v21, v22, v23, v24, v25, v29);
  if (v39)
    AriHost::ExitTrx((AriHost *)v39);
  v15 = *((_DWORD *)v36 + 6);
  v40 = v15;
  if (v26)
  {
    v14 = 0;
    v18 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v14 = *((_DWORD *)v32 + 6) == 0;
  v18 = object;
  if (object)
LABEL_23:
    dispatch_release(v18);
LABEL_24:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  if (v14)
  {
LABEL_27:
    if (v15)
    {
      if (v15 > 0xE)
        v27 = "Unknown";
      else
        v27 = off_24CC19428[v15 - 1];
      _KTLErrorPrint((uint64_t)"KTLNVMSendDeregister", (uint64_t)"Error: CsiFpRegisterRsp Failure (%s)\n", v8, v9, v10, v11, v12, v13, (uint64_t)v27);
      v15 = v40;
    }
  }
  return !v15 && v14;
}

void sub_21159786C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  NSObject *v17;
  uint64_t v18;

  if (object)
    dispatch_release(object);
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v18 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMSendGetStatus(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  unsigned int v17;
  __int128 v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  NSObject *v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  intptr_t v33;
  uint64_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const char *v38;
  uint64_t v40;
  dispatch_object_t object;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  __n128 (*v53)(uint64_t, uint64_t);
  uint64_t (*v54)();
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  unint64_t v59;
  unsigned int v60;
  int v61;
  int v62;

  v4 = *(_DWORD *)(a1 + 16);
  v60 = v4;
  v61 = 14;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
  {
    v46 = 0;
    LODWORD(v42) = v4;
    v62 = 0;
    v50 = 0;
    if (ARI_CsiFpGetStatus_ENC()
      || (v6 = operator new(0x18uLL),
          v7 = v50,
          v6[2] = v62,
          *((_QWORD *)v6 + 2) = v7,
          *(_QWORD *)v6 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v6))
      || !KTLUTACopyReceiveData(a1, &v46))
    {
      v16 = 0;
      v17 = 14;
      return !v17 && v16;
    }
    v8 = v46;
    (*(void (**)(uint64_t))(*(_QWORD *)v46 + 16))(v46);
    v9 = ARI_CsiFpGetStatusRsp_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    v16 = v9 == 0;
    v17 = v61;
    if (!v9)
      goto LABEL_27;
    return !v17 && v16;
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x7002000000;
  v53 = __Block_byref_object_copy__10;
  v54 = __Block_byref_object_dispose__11;
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v55 = v18;
  v56 = v18;
  v57 = v18;
  v58 = v18;
  v59 = 0xAAAAAAAAAAAAAAAALL;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2000000000;
  v49 = 14;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2000000000;
  v45 = -1;
  v19 = dispatch_semaphore_create(0);
  v20 = v19;
  object = v19;
  if (v19)
    dispatch_retain(v19);
  if (ARI_CsiFpGetStatus_BLK())
  {
    v16 = 0;
    v17 = *((_DWORD *)v47 + 6);
    v61 = v17;
    v21 = v51;
    *(_OWORD *)a2 = *(_OWORD *)(v51 + 5);
    v22 = *(_OWORD *)(v21 + 9);
    v23 = *(_OWORD *)(v21 + 11);
    v24 = *(_OWORD *)(v21 + 7);
    *(_QWORD *)(a2 + 64) = v21[13];
    *(_OWORD *)(a2 + 32) = v22;
    *(_OWORD *)(a2 + 48) = v23;
    *(_OWORD *)(a2 + 16) = v24;
    v25 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v26 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v33 = dispatch_semaphore_wait(v20, v26);
  if (v33)
    _KTLErrorPrint((uint64_t)"KTLNVMSendGetStatus", (uint64_t)"Timeout waiting for response.\n", v27, v28, v29, v30, v31, v32, v40);
  if (v60)
    AriHost::ExitTrx((AriHost *)v60);
  v17 = *((_DWORD *)v47 + 6);
  v61 = v17;
  v34 = v51;
  *(_OWORD *)a2 = *(_OWORD *)(v51 + 5);
  v35 = *(_OWORD *)(v34 + 9);
  v36 = *(_OWORD *)(v34 + 11);
  v37 = *(_OWORD *)(v34 + 7);
  *(_QWORD *)(a2 + 64) = v34[13];
  *(_OWORD *)(a2 + 32) = v35;
  *(_OWORD *)(a2 + 48) = v36;
  *(_OWORD *)(a2 + 16) = v37;
  if (v33)
  {
    v16 = 0;
    v25 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v16 = *((_DWORD *)v43 + 6) == 0;
  v25 = object;
  if (object)
LABEL_23:
    dispatch_release(v25);
LABEL_24:
  if (v20)
    dispatch_release(v20);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  if (v16)
  {
LABEL_27:
    if (v17)
    {
      if (v17 > 0xE)
        v38 = "Unknown";
      else
        v38 = off_24CC19428[v17 - 1];
      _KTLErrorPrint((uint64_t)"KTLNVMSendGetStatus", (uint64_t)"Error: CsiFpGetStatusRsp Failure (%s)\n", v10, v11, v12, v13, v14, v15, (uint64_t)v38);
      v17 = v61;
    }
  }
  return !v17 && v16;
}

void sub_211597C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  NSObject *v27;

  if (object)
    dispatch_release(object);
  if (v27)
    dispatch_release(v27);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  result = *(__n128 *)(a2 + 56);
  v3 = *(_OWORD *)(a2 + 72);
  v4 = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

BOOL KTLNVMSendSnapshot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  unsigned int v7;
  BOOL v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  unsigned int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  intptr_t v31;
  const char *v32;
  uint64_t v34;
  dispatch_object_t object;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  int v50;

  v49 = 0;
  v7 = *(_DWORD *)(a1 + 16);
  v48 = v7;
  if (*(_QWORD *)(a1 + 8))
    v8 = 1;
  else
    v8 = v7 == 0;
  if (v8)
  {
    v40 = 0;
    ++KTLNVMSendSnapshot::seqId;
    LODWORD(v36) = v7;
    v50 = 0;
    v44 = 0;
    if (ARI_CsiFpSnapshot_ENC()
      || (v9 = operator new(0x18uLL),
          v10 = v44,
          v9[2] = v50,
          *((_QWORD *)v9 + 2) = v10,
          *(_QWORD *)v9 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v9))
      || !KTLUTACopyReceiveData(a1, &v40))
    {
      v20 = 0;
      v19 = 0;
      goto LABEL_32;
    }
    v11 = v40;
    (*(void (**)(uint64_t))(*(_QWORD *)v40 + 16))(v40);
    v12 = ARI_CsiFpSnapshotRsp_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    v19 = v12 == 0;
    v20 = HIDWORD(v49);
    if (v19)
      goto LABEL_27;
    goto LABEL_32;
  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x2000000000;
  v47 = 14;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2000000000;
  v43 = -1431655766;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = -1;
  v21 = dispatch_semaphore_create(0);
  v22 = v21;
  ++KTLNVMSendSnapshot::seqId;
  object = v21;
  if (v21)
    dispatch_retain(v21);
  if (ARI_CsiFpSnapshot_BLK())
  {
    v19 = 0;
    v20 = *((_DWORD *)v45 + 6);
    LODWORD(v49) = *((_DWORD *)v41 + 6);
    HIDWORD(v49) = v20;
    v23 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v24 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v31 = dispatch_semaphore_wait(v22, v24);
  if (v31)
    _KTLErrorPrint((uint64_t)"KTLNVMSendSnapshot", (uint64_t)"Timeout waiting for response.\n", v25, v26, v27, v28, v29, v30, v34);
  if (v48)
    AriHost::ExitTrx((AriHost *)v48);
  v20 = *((_DWORD *)v45 + 6);
  LODWORD(v49) = *((_DWORD *)v41 + 6);
  HIDWORD(v49) = v20;
  if (v31)
  {
    v19 = 0;
    v23 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = *((_DWORD *)v37 + 6) == 0;
  v23 = object;
  if (object)
LABEL_23:
    dispatch_release(v23);
LABEL_24:
  if (v22)
    dispatch_release(v22);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  if (v19)
  {
LABEL_27:
    if (v20)
    {
      if (v20 > 0xE)
        v32 = "Unknown";
      else
        v32 = off_24CC19428[v20 - 1];
      _KTLErrorPrint((uint64_t)"KTLNVMSendSnapshot", (uint64_t)"Error: CsiFpSnapshotRsp Failure (%s)\n", v13, v14, v15, v16, v17, v18, (uint64_t)v32);
      v20 = HIDWORD(v49);
    }
  }
LABEL_32:
  *a5 = (_DWORD)v49 != 0;
  return !v20 && v19;
}

void sub_211598054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  NSObject *v26;

  if (object)
    dispatch_release(object);
  if (v26)
    dispatch_release(v26);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

BOOL KTLNVMReadUpdateHeader(uint64_t a1, _OWORD *a2, _DWORD *a3, _DWORD *a4)
{
  int v8;
  BOOL v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  unsigned int v21;
  __int128 v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_time_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  NSObject *v37;
  const char *v38;
  uint64_t v40;
  dispatch_object_t object;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  __n128 (*v63)(uint64_t, uint64_t);
  uint64_t (*v64)();
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v59 = 0;
  v8 = *(_DWORD *)(a1 + 16);
  v58 = v8;
  if (*(_QWORD *)(a1 + 8))
    v9 = 1;
  else
    v9 = v8 == 0;
  if (v9)
  {
    v54 = 0;
    LODWORD(v50) = v8;
    LODWORD(v46) = 0;
    v60 = 0;
    if (ARI_CsiFpUpdateHeader_ENC()
      || (v10 = operator new(0x18uLL),
          v11 = v60,
          v10[2] = v46,
          *((_QWORD *)v10 + 2) = v11,
          *(_QWORD *)v10 = &unk_24CC18DE8,
          !KTLUTASendAndReleaseData(a1, v10))
      || !KTLUTACopyReceiveData(a1, &v54))
    {
      v21 = 0;
      v20 = 0;
      *a4 = 0;
      return !v21 && v20;
    }
    v12 = v54;
    (*(void (**)(uint64_t))(*(_QWORD *)v54 + 16))(v54);
    v13 = ARI_CsiFpUpdateHeaderData_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    v20 = v13 == 0;
    v21 = v59;
    *a4 = 0;
    if (v20)
      goto LABEL_26;
    return !v21 && v20;
  }
  v60 = 0;
  v61 = &v60;
  v62 = 0x7802000000;
  v63 = __Block_byref_object_copy__16;
  v64 = __Block_byref_object_dispose__17;
  *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v65 = v22;
  v66 = v22;
  v67 = v22;
  v68 = v22;
  v69 = v22;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2000000000;
  v57 = 14;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2000000000;
  v53 = -1431655766;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2000000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2000000000;
  v45 = -1;
  v23 = dispatch_semaphore_create(0);
  v24 = v23;
  object = v23;
  if (v23)
    dispatch_retain(v23);
  if (ARI_CsiFpUpdateHeader_BLK())
    goto LABEL_16;
  v25 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v24, v25))
  {
    _KTLErrorPrint((uint64_t)"KTLNVMReadUpdateHeader", (uint64_t)"Timeout waiting for response.\n", v26, v27, v28, v29, v30, v31, v40);
LABEL_16:
    v32 = 0;
    goto LABEL_17;
  }
  v32 = 1;
LABEL_17:
  v21 = *((_DWORD *)v55 + 6);
  v59 = v21;
  v33 = v61;
  *a2 = *(_OWORD *)(v61 + 5);
  v34 = *(_OWORD *)(v33 + 9);
  v35 = *(_OWORD *)(v33 + 13);
  v36 = *(_OWORD *)(v33 + 7);
  a2[3] = *(_OWORD *)(v33 + 11);
  a2[4] = v35;
  a2[1] = v36;
  a2[2] = v34;
  *a3 = *((_DWORD *)v51 + 6);
  *a4 = *((_DWORD *)v47 + 6);
  if (!v32)
  {
    v20 = 0;
    v37 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v20 = *((_DWORD *)v43 + 6) == 0;
  v37 = object;
  if (object)
LABEL_22:
    dispatch_release(v37);
LABEL_23:
  if (v24)
    dispatch_release(v24);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
  if (v20)
  {
LABEL_26:
    if (v21)
    {
      if (v21 > 0xE)
        v38 = "Unknown";
      else
        v38 = off_24CC19428[v21 - 1];
      _KTLErrorPrint((uint64_t)"KTLNVMReadUpdateHeader", (uint64_t)"Error: CsiFpUpdateHeaderData Failure (%s)\n", v14, v15, v16, v17, v18, v19, (uint64_t)v38);
      v21 = v59;
    }
  }
  return !v21 && v20;
}

void sub_211598458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  NSObject *v33;
  uint64_t v34;

  if (object)
    dispatch_release(object);
  if (v33)
    dispatch_release(v33);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  result = *(__n128 *)(a2 + 56);
  v3 = *(_OWORD *)(a2 + 72);
  v4 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void __copy_helper_block_e8_32r40r48r56r64r72c25_ZTSN8dispatch9semaphoreE(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  _Block_object_assign(a1 + 8, *(const void **)(a2 + 64), 8);
  v4 = *(NSObject **)(a2 + 72);
  a1[9] = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r40r48r56r64r72c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 64), 8);
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

_QWORD *nvm::ARICommandDriver::ARICommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t nvm::ARICommandDriver::NVMSnapshot(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBINvmSnapshotRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBINvmSnapshotRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBINvmSnapshotRspCb_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBINvmSnapshotRspCb_SDK::ARI_IBINvmSnapshotRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__36;
  v74 = __Block_byref_object_dispose__37;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBINvmSnapshotRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178706432);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBINvmSnapshotRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"NVMSnapshot", (uint64_t)"Failed IBINvmSnapshotReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115989D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_IBINvmSnapshotRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBINvmSnapshotRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBINvmSnapshotRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBINvmSnapshotRspCb_SDK::ARI_IBINvmSnapshotRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_211598AE4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLCDSendStartCoredumpCommand(_QWORD *a1, _WORD *a2, uint64_t a3, uint64_t a4, unsigned int **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *, _WORD *, uint64_t, unsigned int *, uint64_t, uint64_t, _QWORD);
  size_t v20;
  unsigned int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int __size;
  int __size_4;

  __size = 0;
  if (a3 <= 8)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"maxLen( %u) is less than sizeof command(%lu)\n", a3, a4, (uint64_t)a5, a6, a7, a8, a3);
    return 0;
  }
  *(_DWORD *)a2 = a3;
  a2[2] = 16;
  a2[3] = a3 ^ WORD1(a3) ^ 0x10;
  __size_4 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendEnhancedCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d\n", a3, a4, (uint64_t)a5, a6, a7, a8, 16);
  if (!*a1
    || !((unsigned int (*)(_QWORD *, _WORD *, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a1)(a1, a2, 8, &__size_4, 1, a4, 0)|| __size_4 != 8)
  {
    v35 = "Failed to send PSI\n";
LABEL_16:
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)v35, v13, v14, v15, v16, v17, v18, v49);
    return 0;
  }
  v19 = (uint64_t (*)(_QWORD *, _WORD *, uint64_t, unsigned int *, uint64_t, uint64_t, _QWORD))a1[1];
  if (!v19 || (v19(a1, a2, a3, &__size, 1, a4, 0) & 1) == 0)
  {
    v35 = "Failed to read coredump list table\n";
    goto LABEL_16;
  }
  v20 = __size;
  if (__size < 8 || __size > a3)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"read byte (%u) is less than the dump list size (%lu) or more than maxlen(%u)\n", v13, v14, v15, v16, v17, v18, __size);
    return 0;
  }
  v21 = (unsigned int *)malloc(__size);
  if (!v21)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Failed to allocate memory for core dump lists\n", v22, v23, v24, v25, v26, v27, v49);
    return 1;
  }
  v28 = v21;
  memcpy(v21, a2, v20);
  if (!v28[1] || *v28 < 0x10000)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Failed after checking of core dump lists:\n", v29, v30, v31, v32, v33, v34, v49);
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Number of entries: %u\n", v37, v38, v39, v40, v41, v42, v28[1]);
    _KTLDebugPrint((uint64_t)"KTLCDSendStartCoredumpCommand", (uint64_t)"Version: %u\n", v43, v44, v45, v46, v47, v48, *v28);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Read Buffer as CoreDump Header List:", 1, a2);
    free(v28);
    return 0;
  }
  *a5 = v28;
  return 1;
}

uint64_t KTLCDProcessCoredumpEntry(_QWORD *a1, _QWORD *a2, uint64_t a3, unsigned int *a4, uint64_t __size, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  unsigned int v11;
  int v13;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  unsigned int (*v30)(_QWORD *, void *, uint64_t, uint64_t *, _QWORD, uint64_t, _QWORD);
  uint64_t v32;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  if ((_DWORD)__size)
  {
    v11 = __size;
    v13 = a3;
    v37 = 0;
    v38 = 0xAAAA0011AAAAAAAALL;
    v16 = malloc(__size);
    if (v16)
    {
      v17 = v16;
      LODWORD(v38) = v13;
      HIWORD(v38) = v13 ^ HIWORD(v13) ^ 0x11;
      if (!*a1)
      {
LABEL_34:
        v24 = 0;
        goto LABEL_35;
      }
      v24 = 0;
      if (!((unsigned int (*)(_QWORD *, unint64_t *, uint64_t, char *, uint64_t, uint64_t, _QWORD))*a1)(a1, &v38, 8, (char *)&v37 + 4, 1, a8, 0))goto LABEL_35;
      v36 = a7;
      if (HIDWORD(v37) != 8)
        goto LABEL_35;
      v25 = *a4;
      a6[1] = *a4;
      v26 = a6[2];
      if (v26)
      {
        v27 = v25 / v26;
        if (v27 < v11)
          v28 = 1;
        else
          v28 = v27 / v11;
        if (v25)
          goto LABEL_11;
      }
      else
      {
        a6[2] = 1;
        if (v25 < v11)
          v28 = 1;
        else
          v28 = v25 / v11;
        if (v25)
        {
LABEL_11:
          v35 = v28;
          while (1)
          {
            v29 = v11 >= v25 ? v25 : v11;
            v30 = (unsigned int (*)(_QWORD *, void *, uint64_t, uint64_t *, _QWORD, uint64_t, _QWORD))a1[1];
            if (!v30)
              break;
            if (!v30(a1, v17, v29, &v37, 0, a8, 0) || (_DWORD)v37 == 0)
              break;
            v25 -= v37;
            if (!--v28)
            {
              *a6 = *a4 - v25;
              (*(void (**)(uint64_t, _DWORD *, unsigned int *))(v36 + 16))(v36, a6, a4);
              v28 = v35;
            }
            if (!*a2)
              goto LABEL_34;
            v32 = ((uint64_t (*)(_QWORD *, void *, _QWORD, char *, uint64_t, uint64_t, _QWORD))*a2)(a2, v17, v37, (char *)&v37 + 4, 1, a8, 0);
            v24 = v32;
            if (!v25 || (v32 & 1) == 0)
              goto LABEL_35;
          }
          _KTLDebugPrint((uint64_t)"KTLCDProcessCoredumpEntry", (uint64_t)"Read failed. success = %u, read %u of %u\n", v18, v19, v20, v21, v22, v23, 0);
          goto LABEL_34;
        }
      }
      v24 = 1;
LABEL_35:
      free(v17);
      return v24;
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLCDProcessCoredumpEntry", (uint64_t)"Chunk size cannot be zero\n", a3, (uint64_t)a4, __size, (uint64_t)a6, a7, a8, v34);
  }
  return 0;
}

uint64_t KTLCDSendEndCoredumpCommand(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t v19;
  const char *v20;
  uint64_t v22;
  int v23;
  int v24;

  v23 = 0;
  if (!a2 || a3 <= 8)
  {
    _KTLDebugPrint((uint64_t)"KTLCDSendEndCoredumpCommand", (uint64_t)"maxLen( %u) is less than sizeof command(%lu)\n", a3, a4, a5, a6, a7, a8, a3);
    return 0;
  }
  *(_DWORD *)a2 = a3;
  *(_WORD *)(a2 + 4) = 18;
  *(_WORD *)(a2 + 6) = a3 ^ WORD1(a3) ^ 0x12;
  v24 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendEnhancedCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d\n", a3, a4, a5, a6, a7, a8, 18);
  if (!*a1
    || !((unsigned int (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a1)(a1, a2, 8, &v24, 1, a4, 0)|| v24 != 8)
  {
    v20 = "Failed to send PSI command\n";
    goto LABEL_11;
  }
  v18 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))a1[1];
  if (!v18 || (v19 = 1, (v18(a1, a2, a3, &v23, 1, a4, 0) & 1) == 0))
  {
    v20 = "Failed to read response\n";
LABEL_11:
    _KTLDebugPrint((uint64_t)"KTLCDSendEndCoredumpCommand", (uint64_t)v20, v12, v13, v14, v15, v16, v17, v22);
    return 0;
  }
  return v19;
}

BOOL KTLGetAntennaPort(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  _BOOL4 v29;
  int v30;
  int v31;
  _BOOL8 v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  dispatch_time_t v46;
  NSObject *v47;
  uint64_t v48;
  dispatch_object_t object;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t *v62;
  std::__shared_weak_count *v63;
  _OWORD v64[4];
  unint64_t v65;
  int v66;
  int v67;

  if (!a1 || !a2)
  {
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPort", (uint64_t)"These parameters cannot be NULL: opt: %p, antennaPort: %p\n", a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  v66 = 0x7FFFFFFF;
  v67 = -1;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v64[2] = v10;
  v64[3] = v10;
  v64[0] = v10;
  v64[1] = v10;
  AriSdk::ARI_CsiIceGetTxAntennaReq_SDK::ARI_CsiIceGetTxAntennaReq_SDK((AriSdk::ARI_CsiIceGetTxAntennaReq_SDK *)v64);
  v62 = 0;
  v63 = 0;
  AriSdk::MsgBase::getRawBytes();
  v17 = *(_QWORD **)(a1 + 8);
  if (!v17 && *(_DWORD *)(a1 + 16))
  {
    v37 = dispatch_semaphore_create(0);
    v38 = v37;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2000000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2000000000;
    v57 = -1;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2000000000;
    v53 = 0x7FFFFFFF;
    object = v37;
    if (v37)
      dispatch_retain(v37);
    if (AriHost::Send())
    {
      v45 = "Failed to send the message of CsiIceGetTxAntennaReq.\n";
    }
    else
    {
      v46 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v38, v46))
      {
        if (*((_BYTE *)v59 + 24))
        {
          v30 = *((_DWORD *)v55 + 6);
          v31 = *((_DWORD *)v51 + 6);
          v66 = v31;
          v67 = v30;
          v29 = 1;
          v47 = object;
          if (!object)
          {
LABEL_36:
            _Block_object_dispose(&v50, 8);
            _Block_object_dispose(&v54, 8);
            _Block_object_dispose(&v58, 8);
            if (v38)
              dispatch_release(v38);
            goto LABEL_16;
          }
LABEL_35:
          dispatch_release(v47);
          goto LABEL_36;
        }
LABEL_34:
        v29 = 0;
        v30 = -1;
        v31 = 0x7FFFFFFF;
        v47 = object;
        if (!object)
          goto LABEL_36;
        goto LABEL_35;
      }
      v45 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPort", (uint64_t)v45, v39, v40, v41, v42, v43, v44, v48);
    goto LABEL_34;
  }
  v18 = *v62;
  v19 = v62[1] - *v62;
  v20 = *(unsigned int *)(a1 + 20);
  LODWORD(v58) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v11, v12, v13, v14, v15, v16, v19);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v18);
  if (!*v17
    || ((v27 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v17)(v17, v18, v19, &v58, 1, v20, 0), (_DWORD)v58 == (_DWORD)v19)? (v28 = v27): (v28 = 0), (v28 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v21, v22, v23, v24, v25, v26, v19);
    goto LABEL_15;
  }
  v58 = 0;
  if (!KTLUTACopyReceiveData(a1, &v58))
  {
LABEL_15:
    v29 = 0;
    v30 = -1;
    v31 = 0x7FFFFFFF;
    goto LABEL_16;
  }
  v29 = KTLGetAntennaPortParseAndRelease(v58, &v67, &v66);
  v31 = v66;
  v30 = v67;
LABEL_16:
  if (v30)
    v32 = 0;
  else
    v32 = v29;
  *a2 = v31;
  v33 = v63;
  if (v63)
  {
    p_shared_owners = (unint64_t *)&v63->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  MEMORY[0x212BDCA04](v64);
  return v32;
}

void sub_2115993F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  NSObject *v27;
  uint64_t v28;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  if (v27)
  {
    dispatch_release(v27);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v28 - 160);
    MEMORY[0x212BDCA04](v28 - 144);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v28 - 160);
  MEMORY[0x212BDCA04](v28 - 144);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLGetAntennaPortP10KTLOptionsP14KTLAntennaPort_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  _DWORD *v6;
  void *v7;

  v6 = operator new(0x30uLL);
  v7 = operator new[](a3);
  v6[2] = a3;
  *((_QWORD *)v6 + 2) = v7;
  *(_QWORD *)v6 = &unk_24CC19598;
  v6[6] = a3;
  *((_QWORD *)v6 + 4) = v7;
  *((_QWORD *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = KTLGetAntennaPortParseAndRelease((uint64_t)v6, (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  return 0;
}

void sub_211599518(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetAntennaPortParseAndRelease(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  __int128 v6;
  const unsigned __int8 *v7;
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
  uint64_t v19;
  int v20;
  _DWORD *v21;
  _OWORD v23[4];
  __int128 v24;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23[3] = v6;
  v24 = v6;
  v23[1] = v6;
  v23[2] = v6;
  v23[0] = v6;
  v7 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::ARI_CsiIceGetTxAntennaRspCb_SDK((AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *)v23, v7);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v23) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPortParseAndRelease", (uint64_t)"NACK Received\n", v8, v9, v10, v11, v12, v13, *(uint64_t *)&v23[0]);
  v20 = AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::unpack((AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *)v23);
  if (v20)
  {
    _KTLErrorPrint((uint64_t)"KTLGetAntennaPortParseAndRelease", (uint64_t)"Failed to unpack response.\n", v14, v15, v16, v17, v18, v19, *(uint64_t *)&v23[0]);
  }
  else
  {
    v21 = (_DWORD *)*((_QWORD *)&v24 + 1);
    *a2 = *(_DWORD *)v24;
    *a3 = *v21;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCB18](v23);
  return v20 == 0;
}

uint64_t KTLSetAntennaPort(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  _DWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  dispatch_time_t v45;
  NSObject *v46;
  uint64_t v47;
  dispatch_object_t object;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  ktl::KTLPacket *v53;
  ktl::KTLPacket **v54;
  uint64_t v55;
  char v56;
  uint64_t *v57;
  std::__shared_weak_count *v58;
  _OWORD v59[4];
  __int128 v60;
  unsigned int v61;

  v8 = a1;
  if (!a1)
  {
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPort", (uint64_t)"These parameters cannot be NULL: opt: %p\n", a3, a4, a5, a6, a7, a8, 0);
    return v8;
  }
  v61 = -1;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v59[3] = v10;
  v60 = v10;
  v59[1] = v10;
  v59[2] = v10;
  v59[0] = v10;
  AriSdk::ARI_CsiIceSetTxAntennaReq_SDK::ARI_CsiIceSetTxAntennaReq_SDK((AriSdk::ARI_CsiIceSetTxAntennaReq_SDK *)v59);
  v11 = operator new(4uLL);
  *v11 = a2;
  v12 = (void *)v60;
  *(_QWORD *)&v60 = v11;
  if (v12)
    operator delete(v12);
  v57 = 0;
  v58 = 0;
  AriSdk::MsgBase::getRawBytes();
  v19 = *(_QWORD **)(v8 + 8);
  if (!v19 && *(_DWORD *)(v8 + 16))
  {
    v36 = dispatch_semaphore_create(0);
    v37 = v36;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2000000000;
    v56 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2000000000;
    v52 = -1;
    object = v36;
    if (v36)
      dispatch_retain(v36);
    if (AriHost::Send())
    {
      v44 = "Failed to send the message of CsiIceSetTxAntennaReq.\n";
    }
    else
    {
      v45 = dispatch_time(0, 1000000 * *(unsigned int *)(v8 + 20));
      if (!dispatch_semaphore_wait(v37, v45))
      {
        if (*((_BYTE *)v54 + 24))
        {
          v31 = *((_DWORD *)v50 + 6);
          v61 = v31;
          LODWORD(v8) = 1;
          v46 = object;
          if (!object)
          {
LABEL_37:
            _Block_object_dispose(&v49, 8);
            _Block_object_dispose(&v53, 8);
            if (v37)
              dispatch_release(v37);
            goto LABEL_17;
          }
LABEL_36:
          dispatch_release(v46);
          goto LABEL_37;
        }
LABEL_35:
        LODWORD(v8) = 0;
        v31 = -1;
        v46 = object;
        if (!object)
          goto LABEL_37;
        goto LABEL_36;
      }
      v44 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPort", (uint64_t)v44, v38, v39, v40, v41, v42, v43, v47);
    goto LABEL_35;
  }
  v20 = *v57;
  v21 = v57[1] - *v57;
  v22 = *(unsigned int *)(v8 + 20);
  LODWORD(v53) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v13, v14, v15, v16, v17, v18, v21);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v20);
  if (!*v19
    || ((v29 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, ktl::KTLPacket **, uint64_t, uint64_t, _QWORD))*v19)(v19, v20, v21, &v53, 1, v22, 0), (_DWORD)v53 == (_DWORD)v21)? (v30 = v29): (v30 = 0), (v30 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v23, v24, v25, v26, v27, v28, v21);
    goto LABEL_16;
  }
  v53 = 0;
  if (!KTLUTACopyReceiveData(v8, (uint64_t *)&v53))
  {
LABEL_16:
    LODWORD(v8) = 0;
    v31 = -1;
    goto LABEL_17;
  }
  LODWORD(v8) = KTLSetAntennaPortParseAndRelease(v53, &v61);
  v31 = v61;
LABEL_17:
  if (v31)
    v8 = 0;
  else
    v8 = v8;
  v32 = v58;
  if (v58)
  {
    p_shared_owners = (unint64_t *)&v58->__shared_owners_;
    do
      v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  MEMORY[0x212BDCA34](v59);
  return v8;
}

void sub_211599968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  NSObject *v27;
  uint64_t v28;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  if (v27)
  {
    dispatch_release(v27);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
    MEMORY[0x212BDCA34](v28 - 144);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  MEMORY[0x212BDCA34](v28 - 144);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLSetAntennaPortP10KTLOptions14KTLAntennaPort_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  _DWORD *v6;
  void *v7;

  v6 = operator new(0x30uLL);
  v7 = operator new[](a3);
  v6[2] = a3;
  *((_QWORD *)v6 + 2) = v7;
  *(_QWORD *)v6 = &unk_24CC19598;
  v6[6] = a3;
  *((_QWORD *)v6 + 4) = v7;
  *((_QWORD *)v6 + 5) = 0;
  memcpy(v7, a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = KTLSetAntennaPortParseAndRelease((ktl::KTLPacket *)v6, (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return 0;
}

void sub_211599A8C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLSetAntennaPortParseAndRelease(ktl::KTLPacket *a1, unsigned int *a2)
{
  __int128 v4;
  const unsigned __int8 *v5;
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
  int v18;
  _OWORD v20[4];
  unsigned int *v21;

  v21 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  v5 = (const unsigned __int8 *)(*(uint64_t (**)(ktl::KTLPacket *))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::ARI_CsiIceSetTxAntennaRspCb_SDK((AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPortParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  v18 = AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::unpack((AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *)v20);
  if (v18)
    _KTLErrorPrint((uint64_t)"KTLSetAntennaPortParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  else
    *a2 = *v21;
  (*(void (**)(ktl::KTLPacket *))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCB54](v20);
  return v18 == 0;
}

BOOL KTLGetRxDiversity(uint64_t a1, int a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v11;
  BOOL v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  _BOOL8 result;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  dispatch_time_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  AriHost *v35;
  int v36;
  uint64_t v37;
  NSObject *object;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  unsigned int v58;

  if (!a1 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetRxDiversity", (uint64_t)"These parameters cannot be NULL: opt: %p, rxDiversity: %p\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  v11 = *(_DWORD *)(a1 + 16);
  v57 = -1;
  v58 = v11;
  v55 = 0x7FFFFFFF;
  v56 = a2;
  if (*(_QWORD *)(a1 + 8))
    v12 = 1;
  else
    v12 = v11 == 0;
  if (!v12)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2000000000;
    v54 = -1;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2000000000;
    v50 = -1;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2000000000;
    v46 = a2;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2000000000;
    v42 = 0x7FFFFFFF;
    v19 = dispatch_semaphore_create(0);
    v20 = v19;
    object = v19;
    if (v19)
      dispatch_retain(v19);
    if (ARI_CsiIceGetRxDiversityReq_BLK())
    {
      _KTLErrorPrint((uint64_t)"KTLGetRxDiversity", (uint64_t)"Failed to send request.\n", v21, v22, v23, v24, v25, v26, v37);
      v27 = 0;
      v17 = -1;
      goto LABEL_25;
    }
    v28 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v20, v28))
    {
      _KTLErrorPrint((uint64_t)"KTLGetRxDiversity", (uint64_t)"Timeout waiting for response.\n", v29, v30, v31, v32, v33, v34, v37);
      v27 = 0;
      v17 = -1;
      v35 = (AriHost *)v58;
      if (!v58)
        goto LABEL_25;
    }
    else if (*((_DWORD *)v52 + 6))
    {
      v27 = 0;
      v17 = -1;
      v35 = (AriHost *)v58;
      if (!v58)
        goto LABEL_25;
    }
    else
    {
      v17 = *((_DWORD *)v48 + 6);
      v36 = *((_DWORD *)v44 + 6);
      v55 = *((_DWORD *)v40 + 6);
      v56 = v36;
      v27 = 1;
      v35 = (AriHost *)v58;
      if (!v58)
      {
LABEL_25:
        if (object)
          dispatch_release(object);
        if (v20)
          dispatch_release(v20);
        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v51, 8);
        result = 0;
        if (!v27)
          goto LABEL_32;
        goto LABEL_30;
      }
    }
    AriHost::ExitTrx(v35);
    goto LABEL_25;
  }
  v47 = 0;
  LODWORD(v43) = v11;
  LODWORD(v39) = 0;
  v51 = 0;
  if (!ARI_CsiIceGetRxDiversityReq_ENC()
    && (v13 = operator new(0x18uLL),
        v14 = v51,
        v13[2] = v39,
        *((_QWORD *)v13 + 2) = v14,
        *(_QWORD *)v13 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v13))
    && KTLUTACopyReceiveData(a1, &v47))
  {
    v15 = v47;
    (*(void (**)(uint64_t))(*(_QWORD *)v47 + 16))(v47);
    v16 = ARI_CsiIceGetRxDiversityRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
    v17 = v57;
    result = 0;
    if (!v16)
    {
LABEL_30:
      if (!v17)
        result = v56 == a2;
    }
  }
  else
  {
    result = 0;
  }
LABEL_32:
  *a3 = v55;
  return result;
}

void sub_211599EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  NSObject *v29;
  uint64_t v30;

  if (object)
    dispatch_release(object);
  if (v29)
    dispatch_release(v29);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v30 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLGetRxDiversityP10KTLOptions13KTLAntennaRATP14KTLRxDiversity_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiIceGetRxDiversityRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

BOOL KTLSetRxDiversity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  BOOL v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  int v16;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  AriHost *v33;
  uint64_t v34;
  NSObject *object;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;

  if (!a1)
  {
    _KTLErrorPrint((uint64_t)"KTLSetRxDiversity", (uint64_t)"These parameters cannot be NULL: opt: %p\n", a3, a4, a5, a6, a7, a8, 0);
    return 0;
  }
  v9 = *(_DWORD *)(a1 + 16);
  v44 = -1;
  v45 = v9;
  if (*(_QWORD *)(a1 + 8))
    v10 = 1;
  else
    v10 = v9 == 0;
  if (!v10)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2000000000;
    v43 = -1;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2000000000;
    v39 = -1;
    v18 = dispatch_semaphore_create(0);
    v19 = v18;
    object = v18;
    if (v18)
      dispatch_retain(v18);
    if (ARI_CsiIceRxDiversityReq_BLK())
    {
      _KTLErrorPrint((uint64_t)"KTLSetRxDiversity", (uint64_t)"Failed to send request.\n", v20, v21, v22, v23, v24, v25, v34);
      v15 = 0;
      v16 = -1;
LABEL_23:
      if (object)
        dispatch_release(object);
      if (v19)
        dispatch_release(v19);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
      return !v16 && v15;
    }
    v26 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v19, v26))
    {
      _KTLErrorPrint((uint64_t)"KTLSetRxDiversity", (uint64_t)"Timeout waiting for response.\n", v27, v28, v29, v30, v31, v32, v34);
      v15 = 0;
      v16 = -1;
      v33 = (AriHost *)v45;
      if (!v45)
        goto LABEL_23;
    }
    else if (*((_DWORD *)v41 + 6))
    {
      v15 = 0;
      v16 = -1;
      v33 = (AriHost *)v45;
      if (!v45)
        goto LABEL_23;
    }
    else
    {
      v16 = *((_DWORD *)v37 + 6);
      v15 = 1;
      v33 = (AriHost *)v45;
      if (!v45)
        goto LABEL_23;
    }
    AriHost::ExitTrx(v33);
    goto LABEL_23;
  }
  v36 = 0;
  v46 = 0;
  v47 = v9;
  v40 = 0;
  if (!ARI_CsiIceRxDiversityReq_ENC()
    && (v11 = operator new(0x18uLL),
        v12 = v40,
        v11[2] = v46,
        *((_QWORD *)v11 + 2) = v12,
        *(_QWORD *)v11 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v11))
    && KTLUTACopyReceiveData(a1, &v36))
  {
    v13 = v36;
    (*(void (**)(uint64_t))(*(_QWORD *)v36 + 16))(v36);
    v14 = ARI_CsiIceRxDiversityRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    v15 = v14 == 0;
    v16 = v44;
  }
  else
  {
    v15 = 0;
    v16 = -1;
  }
  return !v16 && v15;
}

void sub_21159A270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t ___Z17KTLSetRxDiversityP10KTLOptions13KTLAntennaRAT14KTLRxDiversity_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiIceRxDiversityRspCb_Extract();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

BOOL KTLRFFilePushReq(uint64_t a1, int a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  __int128 v12;
  _DWORD *v13;
  void *v14;
  _DWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  _BOOL8 v36;
  char v37;
  uint64_t v38;
  const unsigned __int8 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *v46;
  _DWORD *v47;
  NSObject *v48;
  NSObject *v49;
  int started;
  dispatch_time_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  BOOL v62;
  char v63;
  std::__shared_weak_count *v64;
  unint64_t *p_shared_owners;
  unint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70[7];
  dispatch_object_t object;
  int v72;
  int v73;
  AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *v74;
  AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t *v82;
  std::__shared_weak_count *v83;
  _OWORD v84[4];
  __int128 v85;

  if (a1 && a4)
  {
    v10 = a3;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v84[3] = v12;
    v85 = v12;
    v84[1] = v12;
    v84[2] = v12;
    v84[0] = v12;
    AriSdk::ARI_CsiIceRFFilerWriteReq_SDK::ARI_CsiIceRFFilerWriteReq_SDK((AriSdk::ARI_CsiIceRFFilerWriteReq_SDK *)v84);
    v13 = operator new(4uLL);
    *v13 = a2;
    v14 = (void *)v85;
    *(_QWORD *)&v85 = v13;
    if (v14)
      operator delete(v14);
    v15 = operator new(4uLL);
    *v15 = v10;
    v16 = (void *)*((_QWORD *)&v85 + 1);
    *((_QWORD *)&v85 + 1) = v15;
    if (v16)
      operator delete(v16);
    v82 = 0;
    v83 = 0;
    AriSdk::MsgBase::getRawBytes();
    if (MEMORY[0] == MEMORY[8])
    {
      _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)"Failed to setup CsiIceRFFilerWriteReq\n", v17, v18, v19, v20, v21, v22, v68);
      v36 = 0;
LABEL_61:
      MEMORY[0x212BDCA1C](v84);
      return v36;
    }
    v78 = 0;
    v79 = &v78;
    v80 = 0x2000000000;
    v81 = 0;
    v23 = *(_QWORD **)(a1 + 8);
    if (!v23 && *(_DWORD *)(a1 + 16))
    {
      v74 = 0;
      v75 = &v74;
      v76 = 0x2000000000;
      v77 = 0;
      v48 = dispatch_semaphore_create(0);
      v49 = v48;
      v70[1] = MEMORY[0x24BDAC760];
      v70[2] = 1174405120;
      v70[3] = (uint64_t)___Z16KTLRFFilePushReqP10KTLOptionsjjPi_block_invoke;
      v70[4] = (uint64_t)&__block_descriptor_tmp_17;
      v72 = a2;
      v73 = v10;
      v70[5] = (uint64_t)&v78;
      v70[6] = (uint64_t)&v74;
      object = v48;
      if (v48)
        dispatch_retain(v48);
      started = AriHost::StartStream();
      v51 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (dispatch_semaphore_wait(v49, v51))
      {
        _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)"Timeout waiting for response.\n", v52, v53, v54, v55, v56, v57, v68);
        *((_BYTE *)v79 + 24) = 0;
      }
      else
      {
        if (*((_BYTE *)v79 + 24))
          v62 = started == 0;
        else
          v62 = 0;
        v63 = v62;
        *((_BYTE *)v79 + 24) = v63;
        if (v62)
          *a4 = *((_DWORD *)v75 + 6);
      }
      if (object)
        dispatch_release(object);
      if (v49)
        dispatch_release(v49);
      _Block_object_dispose(&v74, 8);
LABEL_56:
      v36 = *((_BYTE *)v79 + 24) != 0;
      _Block_object_dispose(&v78, 8);
      v64 = v83;
      if (v83)
      {
        p_shared_owners = (unint64_t *)&v83->__shared_owners_;
        do
          v66 = __ldaxr(p_shared_owners);
        while (__stlxr(v66 - 1, p_shared_owners));
        if (!v66)
        {
          ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
          std::__shared_weak_count::__release_weak(v64);
        }
      }
      goto LABEL_61;
    }
    v24 = *v82;
    v25 = v82[1] - *v82;
    v26 = *(unsigned int *)(a1 + 20);
    LODWORD(v74) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v17, v18, v19, v20, v21, v22, v25);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v24);
    if (*v23
      && ((v33 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **, uint64_t, uint64_t, _QWORD))*v23)(v23, v24, v25, &v74, 1, v26, 0), (_DWORD)v74 == (_DWORD)v25)? (v34 = v33): (v34 = 0), (v34 & 1) != 0))
    {
      v35 = 1;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v27, v28, v29, v30, v31, v32, v25);
      v35 = 0;
    }
    *((_BYTE *)v79 + 24) = v35;
    v70[0] = 0;
    v37 = KTLUTACopyReceiveData(a1, v70);
    v38 = v70[0];
    *((_BYTE *)v79 + 24) = v37;
    v74 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
    v75 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **)0xAAAAAAAAAAAAAAAALL;
    v39 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 16))(v38);
    getResponse<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>(&v74, v39);
    v46 = v74;
    if (*((_BYTE *)v79 + 24))
    {
      if (v74)
      {
        v47 = (_DWORD *)*((_QWORD *)v74 + 8);
        if (*v47 == a2)
        {
          **((_DWORD **)v74 + 9) = v10;
          *((_BYTE *)v79 + 24) = v10 != 0;
          if (v10)
          {
LABEL_37:
            *a4 = 0;
            v59 = (std::__shared_weak_count *)v75;
            if (v75)
            {
              v60 = (unint64_t *)(v75 + 1);
              do
                v61 = __ldaxr(v60);
              while (__stlxr(v61 - 1, v60));
              if (!v61)
              {
                ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
                std::__shared_weak_count::__release_weak(v59);
              }
            }
            goto LABEL_56;
          }
        }
        else
        {
          *((_BYTE *)v79 + 24) = 0;
        }
        goto LABEL_35;
      }
      *((_BYTE *)v79 + 24) = 0;
    }
    else
    {
      *((_BYTE *)v79 + 24) = 0;
      if (v46)
      {
        v47 = (_DWORD *)*((_QWORD *)v46 + 8);
LABEL_35:
        v69 = *v47;
        v58 = "Response in error. response->instance_t1: %d(expecting nInstance: %d), response->result_t2: %d(expecting %d), \n";
        goto LABEL_36;
      }
    }
    v58 = "Failed to get response!\n";
LABEL_36:
    _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)v58, v40, v41, v42, v43, v44, v45, v69);
    goto LABEL_37;
  }
  _KTLErrorPrint((uint64_t)"KTLRFFilePushReq", (uint64_t)"Parameters are not correct: opt: %p, filerID: %p\n", a3, (uint64_t)a4, a5, a6, a7, a8, a1);
  return 0;
}

void sub_21159A7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,dispatch_object_t object,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  NSObject *v31;
  uint64_t v32;

  if (object)
    dispatch_release(object);
  if (v31)
    dispatch_release(v31);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a31);
  MEMORY[0x212BDCA1C](v32 - 160);
  _Unwind_Resume(a1);
}

void sub_21159A804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a31);
  MEMORY[0x212BDCA1C](v31 - 160);
  _Unwind_Resume(a1);
}

uint64_t ___Z16KTLRFFilePushReqP10KTLOptionsjjPi_block_invoke(uint64_t a1, void *a2, size_t __sz)
{
  size_t v5;
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
  AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  uint64_t v32;
  AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *v33;
  unint64_t v34;

  v5 = __sz;
  v6 = operator new[](__sz);
  memcpy(v6, a2, v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v33 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
    v34 = 0xAAAAAAAAAAAAAAAALL;
    getResponse<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>(&v33, (const unsigned __int8 *)v6);
    v19 = v33;
    v20 = v33 && **((_DWORD **)v33 + 8) == *(_DWORD *)(a1 + 56) && **((_DWORD **)v33 + 9) == *(_DWORD *)(a1 + 60);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v20;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = AriMsg::GetBufCtx((AriMsg *)a2, (const unsigned __int8 *)v5);
      _KTLDebugPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Filer ID: %d (0x%x)\n", v21, v22, v23, v24, v25, v26, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v27 = 0;
      v28 = (std::__shared_weak_count *)v34;
      if (!v34)
        goto LABEL_18;
    }
    else if (v19)
    {
      _KTLErrorPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Response in error. response->instance_t1: %d(expecting nInstance: %d), response->result_t2: %d(expecting %d), \n", v13, v14, v15, v16, v17, v18, **((unsigned int **)v19 + 8));
      v27 = 0xFFFFFFFFLL;
      v28 = (std::__shared_weak_count *)v34;
      if (!v34)
        goto LABEL_18;
    }
    else
    {
      _KTLErrorPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Failed to get response!\n", v13, v14, v15, v16, v17, v18, v32);
      v27 = 0xFFFFFFFFLL;
      v28 = (std::__shared_weak_count *)v34;
      if (!v34)
        goto LABEL_18;
    }
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  else
  {
    _KTLErrorPrint((uint64_t)"KTLRFFilePushReq_block_invoke", (uint64_t)"Failed to allocate packet memory\n", v7, v8, v9, v10, v11, v12, v32);
    v27 = 0xFFFFFFFFLL;
  }
LABEL_18:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return v27;
}

void sub_21159AA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void getResponse<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>(AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK **a1, const unsigned __int8 *a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *v6;
  unint64_t v7;

  if (a2)
  {
    v4 = (std::__shared_weak_count *)operator new(0x68uLL);
    v4->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)off_24CC195D8;
    v6 = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)&v4[1];
    AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::ARI_CsiIceRFFilerWriteRspCb_SDK((AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)&v4[1], a2);
    if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)&v4[1]) == 67600384
      || AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::unpack(v6))
    {
      *a1 = 0;
      a1[1] = 0;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    else
    {
      *a1 = v6;
      a1[1] = (AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *)v4;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

void sub_21159AB4C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_21159AB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ktl::KTLReceivePacket::~KTLReceivePacket(ktl::KTLReceivePacket *this)
{
  void *v1;

  *(_QWORD *)this = &unk_24CC19598;
  v1 = (void *)*((_QWORD *)this + 2);
  if (v1)
    operator delete[](v1);
}

{
  void *v2;

  *(_QWORD *)this = &unk_24CC19598;
  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
    operator delete[](v2);
  operator delete(this);
}

uint64_t ktl::KTLReceivePacket::getBuffer(ktl::KTLReceivePacket *this)
{
  return *((_QWORD *)this + 4);
}

void std::__shared_ptr_emplace<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24CC195D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24CC195D8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 8))(a1 + 24);
}

BOOL KTLSecGetFusingState(uint64_t a1, int *a2)
{
  unsigned int v2;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  intptr_t v24;
  int v25;
  uint64_t v26;
  dispatch_object_t object;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;

  v41 = 0;
  v42 = -1;
  v2 = *(_DWORD *)(a1 + 16);
  v40 = v2;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v2 == 0;
  if (!v5)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2000000000;
    v39 = -1;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2000000000;
    v35 = -1431655766;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2000000000;
    v31 = -1;
    v14 = dispatch_semaphore_create(0);
    v15 = v14;
    v26 = MEMORY[0x24BDAC760];
    object = v14;
    if (v14)
      dispatch_retain(v14);
    if (ARI_CsiSecGetFusingStateReq_BLK())
    {
      v10 = 0;
      v11 = *((_DWORD *)v37 + 6);
      v12 = *((_DWORD *)v33 + 6);
      v16 = object;
      if (!object)
        goto LABEL_25;
    }
    else
    {
      v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v24 = dispatch_semaphore_wait(v15, v17);
      if (v24)
        _KTLErrorPrint((uint64_t)"KTLSecGetFusingState", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v26);
      if (v40)
        AriHost::ExitTrx((AriHost *)v40);
      v11 = *((_DWORD *)v37 + 6);
      v12 = *((_DWORD *)v33 + 6);
      if (v24)
      {
        v10 = 0;
        v16 = object;
        if (!object)
        {
LABEL_25:
          if (v15)
            dispatch_release(v15);
          _Block_object_dispose(&v28, 8);
          _Block_object_dispose(&v32, 8);
          _Block_object_dispose(&v36, 8);
          goto LABEL_28;
        }
      }
      else
      {
        v10 = *((_DWORD *)v29 + 6) == 0;
        v16 = object;
        if (!object)
          goto LABEL_25;
      }
    }
    dispatch_release(v16);
    goto LABEL_25;
  }
  v32 = 0;
  LODWORD(v28) = v2;
  v43 = 0;
  v36 = 0;
  if (!ARI_CsiSecGetFusingStateReq_ENC()
    && (v6 = operator new(0x18uLL),
        v7 = v36,
        v6[2] = v43,
        *((_QWORD *)v6 + 2) = v7,
        *(_QWORD *)v6 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v6))
    && KTLUTACopyReceiveData(a1, &v32))
  {
    v8 = v32;
    (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
    v9 = ARI_CsiSecGetFusingStateRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    v10 = v9 == 0;
    v12 = v41;
    v11 = v42;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v11 = -1;
  }
LABEL_28:
  if (v12)
    v25 = 3;
  else
    v25 = 1;
  *a2 = v25;
  return !v11 && v10;
}

void sub_21159AF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;
  uint64_t v22;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t KTLSecGetRandomNum(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t RandomNum;
  uint64_t v11;
  int v12;
  __int128 v13;
  uint64_t v15;
  AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *v16;
  _OWORD v17[4];
  uint64_t v18;

  if (!a2)
    return 0;
  v18 = a1;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[2] = v3;
  v17[3] = v3;
  v17[0] = v3;
  v17[1] = v3;
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v17);
  v16 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
  RandomNum = security::ARICommandDriver::GetRandomNum((security::ARICommandDriver *)&v18, (AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v17, &v16);
  if ((RandomNum & 1) == 0)
    _KTLErrorPrint((uint64_t)"KTLSecGetRandomNum", (uint64_t)"Failed GetRandomNum ARI command\n", v4, v5, v6, v7, v8, v9, v15);
  v11 = *((_QWORD *)v16 + 8);
  v12 = *(_DWORD *)(v11 + 32);
  v13 = *(_OWORD *)(v11 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v11;
  *(_OWORD *)(a2 + 16) = v13;
  *(_DWORD *)(a2 + 32) = v12;
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v17);
  return RandomNum;
}

void sub_21159B068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)va);
  _Unwind_Resume(a1);
}

_QWORD *security::ARICommandDriver::ARICommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t security::ARICommandDriver::GetRandomNum(security::ARICommandDriver *this, AriSdk::ARI_CsiSecGetRandomNumReq_SDK *a2, AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *(_QWORD *)this;
  v12 = *(_QWORD **)(*(_QWORD *)this + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*(_QWORD *)this, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)operator new(0x48uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::ARI_CsiSecGetRandomNumRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__16_0;
  v74 = __Block_byref_object_dispose__17_0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*(_QWORD *)this + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 84082688);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(_QWORD))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetRandomNum", (uint64_t)"Failed CsiSecGetRandomNumReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_21159B474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

BOOL KTLSecGetSNUM(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  intptr_t v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_object_t object;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __n128 (*v37)(uint64_t, uint64_t);
  uint64_t (*v38)();
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 16);
  v31 = v2;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v2 == 0;
  if (v5)
  {
    v27 = 0;
    v32 = 0;
    v33 = v2;
    v34 = 0;
    if (!ARI_CsiSecGetSNUMReq_ENC())
    {
      v6 = operator new(0x18uLL);
      v7 = v34;
      v6[2] = v32;
      *((_QWORD *)v6 + 2) = v7;
      *(_QWORD *)v6 = &unk_24CC18DE8;
      if (KTLUTASendAndReleaseData(a1, v6))
      {
        if (KTLUTACopyReceiveData(a1, &v27))
        {
          v8 = v27;
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
          v9 = ARI_CsiSecGetSNUMRspCb_Extract();
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
          return v9 == 0;
        }
      }
    }
    return 0;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x4002000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  memset(v39, 170, 24);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = -1;
  v12 = dispatch_semaphore_create(0);
  v13 = v12;
  v25 = MEMORY[0x24BDAC760];
  object = v12;
  if (v12)
    dispatch_retain(v12);
  if (!ARI_CsiSecGetSNUMReq_BLK())
  {
    v16 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v23 = dispatch_semaphore_wait(v13, v16);
    if (v23)
      _KTLErrorPrint((uint64_t)"KTLSecGetSNUM", (uint64_t)"Timeout waiting for response.\n", v17, v18, v19, v20, v21, v22, v25);
    if (v31)
      AriHost::ExitTrx((AriHost *)v31);
    v24 = v35[7];
    *(_OWORD *)a2 = *(_OWORD *)(v35 + 5);
    *(_QWORD *)(a2 + 16) = v24;
    if (v23)
    {
      v10 = 0;
      v15 = object;
      if (!object)
        goto LABEL_18;
    }
    else
    {
      v10 = *((_DWORD *)v28 + 6) == 0;
      v15 = object;
      if (!object)
        goto LABEL_18;
    }
    goto LABEL_17;
  }
  v10 = 0;
  v14 = v35[7];
  *(_OWORD *)a2 = *(_OWORD *)(v35 + 5);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = object;
  if (object)
LABEL_17:
    dispatch_release(v15);
LABEL_18:
  if (v13)
    dispatch_release(v13);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v34, 8);
  return v10;
}

void sub_21159B7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  NSObject *v22;

  if (object)
    dispatch_release(object);
  if (v22)
    dispatch_release(v22);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

BOOL KTLSecGetChipId(uint64_t a1, _DWORD *a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  intptr_t v22;
  uint64_t v23;
  dispatch_object_t object;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;

  v4 = *(_DWORD *)(a1 + 16);
  v33 = v4;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
  {
    v25 = 0;
    v34 = 0;
    v35 = v4;
    v29 = 0;
    if (ARI_CsiSecGetChipIdReq_ENC())
      return 0;
    v6 = operator new(0x18uLL);
    v7 = v29;
    v6[2] = v34;
    *((_QWORD *)v6 + 2) = v7;
    *(_QWORD *)v6 = &unk_24CC18DE8;
    if (!KTLUTASendAndReleaseData(a1, v6) || !KTLUTACopyReceiveData(a1, &v25))
      return 0;
    v8 = v25;
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 16))(v25);
    v9 = ARI_CsiSecGetChipIdRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    return v9 == 0;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2000000000;
  v32 = -1431655766;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = -1;
  v11 = dispatch_semaphore_create(0);
  v12 = v11;
  object = v11;
  if (v11)
    dispatch_retain(v11);
  if (!ARI_CsiSecGetChipIdReq_BLK())
  {
    v15 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v22 = dispatch_semaphore_wait(v12, v15);
    if (v22)
      _KTLErrorPrint((uint64_t)"KTLSecGetChipId", (uint64_t)"Timeout waiting for response.\n", v16, v17, v18, v19, v20, v21, v23);
    if (v33)
      AriHost::ExitTrx((AriHost *)v33);
    *a2 = *((_DWORD *)v30 + 6);
    if (v22)
    {
      v10 = 0;
      v13 = object;
      if (!object)
        goto LABEL_15;
    }
    else
    {
      v10 = *((_DWORD *)v26 + 6) == 0;
      v13 = object;
      if (!object)
        goto LABEL_15;
    }
    goto LABEL_14;
  }
  v10 = 0;
  *a2 = *((_DWORD *)v30 + 6);
  v13 = object;
  if (object)
LABEL_14:
    dispatch_release(v13);
LABEL_15:
  if (v12)
    dispatch_release(v12);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v10;
}

void sub_21159BB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

BOOL KTLSecGetPkHash(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  __int128 v11;
  NSObject *v12;
  NSObject *v13;
  __int16 v14;
  __int128 v15;
  NSObject *v16;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  intptr_t v25;
  __int16 v26;
  __int128 v27;
  uint64_t v28;
  dispatch_object_t object;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  __n128 (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)();
  __int128 v42;
  __int128 v43;
  __int16 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 16);
  v34 = v4;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (!v5)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x5002000000;
    v40 = __Block_byref_object_copy__5_0;
    v41 = __Block_byref_object_dispose__6_0;
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v11;
    v43 = v11;
    v44 = -21846;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2000000000;
    v33 = -1;
    v12 = dispatch_semaphore_create(0);
    v13 = v12;
    v28 = MEMORY[0x24BDAC760];
    object = v12;
    if (v12)
      dispatch_retain(v12);
    if (ARI_CsiSecGetPkHashReq_BLK())
    {
      v10 = 0;
      v14 = *((_WORD *)v38 + 36);
      v15 = *(_OWORD *)(v38 + 7);
      *(_OWORD *)a2 = *(_OWORD *)(v38 + 5);
      *(_OWORD *)(a2 + 16) = v15;
      *(_WORD *)(a2 + 32) = v14;
      v16 = object;
      if (!object)
        goto LABEL_16;
      goto LABEL_15;
    }
    v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v25 = dispatch_semaphore_wait(v13, v18);
    if (v25)
      _KTLErrorPrint((uint64_t)"KTLSecGetPkHash", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v28);
    if (v34)
      AriHost::ExitTrx((AriHost *)v34);
    v26 = *((_WORD *)v38 + 36);
    v27 = *(_OWORD *)(v38 + 7);
    *(_OWORD *)a2 = *(_OWORD *)(v38 + 5);
    *(_OWORD *)(a2 + 16) = v27;
    *(_WORD *)(a2 + 32) = v26;
    if (v25)
    {
      v10 = 0;
      v16 = object;
      if (!object)
        goto LABEL_16;
    }
    else
    {
      v10 = *((_DWORD *)v31 + 6) == 0;
      v16 = object;
      if (!object)
      {
LABEL_16:
        if (v13)
          dispatch_release(v13);
        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&v37, 8);
        if (!*(_WORD *)(a2 + 32))
          goto LABEL_19;
        return v10;
      }
    }
LABEL_15:
    dispatch_release(v16);
    goto LABEL_16;
  }
  v30 = 0;
  v35 = 0;
  v36 = v4;
  v37 = 0;
  if (ARI_CsiSecGetPkHashReq_ENC()
    || (v6 = operator new(0x18uLL),
        v7 = v37,
        v6[2] = v35,
        *((_QWORD *)v6 + 2) = v7,
        *(_QWORD *)v6 = &unk_24CC18DE8,
        !KTLUTASendAndReleaseData(a1, v6))
    || !KTLUTACopyReceiveData(a1, &v30))
  {
    v10 = 0;
    if (*(_WORD *)(a2 + 32))
      return v10;
    goto LABEL_19;
  }
  v8 = v30;
  (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
  v9 = ARI_CsiSecGetPkHashRspCb_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v10 = v9 == 0;
  if (!*(_WORD *)(a2 + 32))
  {
LABEL_19:
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_WORD *)(a2 + 32) = 32;
  }
  return v10;
}

void sub_21159BE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  NSObject *v22;

  if (object)
    dispatch_release(object);
  if (v22)
    dispatch_release(v22);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__5_0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 40);
  v3 = *(_OWORD *)(a2 + 56);
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

BOOL KTLGetPersonalizationInfo(uint64_t a1, _DWORD *a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _BOOL8 result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  size_t v21;
  size_t v22;
  uint64_t v23;
  int v24;
  AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *v25;
  _OWORD v26[4];
  uint64_t v27;
  _OWORD v28[2];
  unsigned __int16 v29;
  _WORD v30[12];
  _OWORD __src[2];
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  memset(v30, 170, sizeof(v30));
  v24 = 0;
  v29 = -21846;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[0] = v4;
  v28[1] = v4;
  v27 = a1;
  v26[2] = v4;
  v26[3] = v4;
  v26[0] = v4;
  v26[1] = v4;
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v26);
  v25 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)0xAAAAAAAAAAAAAAAALL;
  if ((security::ARICommandDriver::GetRandomNum((security::ARICommandDriver *)&v27, (AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v26, &v25) & 1) != 0)
  {
    v11 = *((_QWORD *)v25 + 8);
    v12 = *(_OWORD *)(v11 + 16);
    __src[0] = *(_OWORD *)v11;
    __src[1] = v12;
    v32 = *(_DWORD *)(v11 + 32);
    AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v26);
    result = KTLSecGetSNUM(a1, (uint64_t)v30);
    if (result)
    {
      result = KTLSecGetChipId(a1, &v24);
      if (result)
      {
        result = KTLSecGetPkHash(a1, (uint64_t)v28);
        if (result)
        {
          v20 = v32;
          v21 = v30[8];
          v22 = v29;
          if (v32 > 0x20 || v30[8] > 0x10u || v29 >= 0x21u)
          {
            _KTLErrorPrint((uint64_t)"KTLGetPersonalizationInfo", (uint64_t)"Invalid buffer size(s) returned from baseband:\nnonce(%u)\tnonce_max(%u)\nsnum(%u)\tsnum_max(%u)\npkhash(%u)\tpkhash_max(%u)\n", v14, v15, v16, v17, v18, v19, v32);
            return 0;
          }
          else
          {
            *a2 = v24;
            a2[1] = v20;
            a2[2] = v21;
            a2[3] = v22;
            bzero((char *)a2 + v20 + 16, 80 - v20);
            memcpy(a2 + 4, __src, v20);
            memcpy(a2 + 12, v30, v21);
            memcpy(a2 + 16, v28, v22);
            return 1;
          }
        }
      }
    }
  }
  else
  {
    _KTLErrorPrint((uint64_t)"KTLSecGetRandomNum", (uint64_t)"Failed GetRandomNum ARI command\n", v5, v6, v7, v8, v9, v10, v23);
    AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)v26);
    return 0;
  }
  return result;
}

void sub_21159C148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)va);
  _Unwind_Resume(a1);
}

BOOL KTLSecGetFactoryDebugEnabled(uint64_t a1, _DWORD *a2)
{
  unsigned int v4;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  intptr_t v22;
  uint64_t v23;
  dispatch_object_t object;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  uint64_t (*v33)();
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;

  v4 = *(_DWORD *)(a1 + 16);
  v35 = v4;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
  {
    v25 = 0;
    v36 = 0;
    v37 = v4;
    v29 = 0;
    if (ARI_CsiIceGetFactoryDebugEnabledReq_ENC())
      return 0;
    v6 = operator new(0x18uLL);
    v7 = v29;
    v6[2] = v36;
    *((_QWORD *)v6 + 2) = v7;
    *(_QWORD *)v6 = &unk_24CC18DE8;
    if (!KTLUTASendAndReleaseData(a1, v6) || !KTLUTACopyReceiveData(a1, &v25))
      return 0;
    v8 = v25;
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 16))(v25);
    v9 = ARI_CsiIceGetFactoryDebugEnabledResp_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    return v9 == 0;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3002000000;
  v32 = __Block_byref_object_copy__9;
  v33 = __Block_byref_object_dispose__10;
  v34 = -1431655766;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = -1;
  v11 = dispatch_semaphore_create(0);
  v12 = v11;
  object = v11;
  if (v11)
    dispatch_retain(v11);
  if (!ARI_CsiIceGetFactoryDebugEnabledReq_BLK())
  {
    v15 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v22 = dispatch_semaphore_wait(v12, v15);
    if (v22)
      _KTLErrorPrint((uint64_t)"KTLSecGetFactoryDebugEnabled", (uint64_t)"Timeout waiting for response.\n", v16, v17, v18, v19, v20, v21, v23);
    if (v35)
      AriHost::ExitTrx((AriHost *)v35);
    *a2 = *((_DWORD *)v30 + 10);
    if (v22)
    {
      v10 = 0;
      v13 = object;
      if (!object)
        goto LABEL_15;
    }
    else
    {
      v10 = *((_DWORD *)v26 + 6) == 0;
      v13 = object;
      if (!object)
        goto LABEL_15;
    }
    goto LABEL_14;
  }
  v10 = 0;
  *a2 = *((_DWORD *)v30 + 10);
  v13 = object;
  if (object)
LABEL_14:
    dispatch_release(v13);
LABEL_15:
  if (v12)
    dispatch_release(v12);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v10;
}

void sub_21159C3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 40) = *(_DWORD *)(a2 + 40);
  return result;
}

uint64_t security::ARICommandDriver::GetPersonalizationParams(uint64_t *a1, uint64_t a2, AriSdk::ARI_GetPersonalizationParametersRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *)operator new(0xA8uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::ARI_GetPersonalizationParametersRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__16_0;
  v74 = __Block_byref_object_dispose__17_0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4245028864);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetPersonalizationParams", (uint64_t)"Failed GetPersonalizationParametersReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_21159C87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t security::ARICommandDriver::CsiSecCollectScrtBlob(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *)operator new(0x60uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::ARI_CsiSecCollectScrtBlobRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__16_0;
  v74 = __Block_byref_object_dispose__17_0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4245094400);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"CsiSecCollectScrtBlob", (uint64_t)"Failed CsiSecCollectScrtBlobReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_21159CCF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t security::ARICommandDriver::CsiSecReadSikPKey(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *)operator new(0x60uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::ARI_CsiSecReadSikPKeyRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__16_0;
  v74 = __Block_byref_object_dispose__17_0;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4245127168);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"CsiSecReadSikPKey", (uint64_t)"Failed CsiSecReadSikPKeyReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_21159D170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16_0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17_0(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk31ARI_CsiSecGetRandomNumRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *v4;

  v4 = (AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *)operator new(0x48uLL);
  AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::ARI_CsiSecGetRandomNumRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21159D27C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk41ARI_GetPersonalizationParametersRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *v4;

  v4 = (AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *)operator new(0xA8uLL);
  AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::ARI_GetPersonalizationParametersRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21159D2F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk34ARI_CsiSecCollectScrtBlobRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *v4;

  v4 = (AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *)operator new(0x60uLL);
  AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::ARI_CsiSecCollectScrtBlobRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21159D364(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk30ARI_CsiSecReadSikPKeyRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *v4;

  v4 = (AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *)operator new(0x60uLL);
  AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::ARI_CsiSecReadSikPKeyRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_21159D3D8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t getRestoreOSMode(void)
{
  unsigned __int8 v0;
  ctu::Gestalt *v2;
  void *v3;
  unint64_t *v4;
  unint64_t v5;
  char v6;
  _QWORD v7[2];
  __int128 v8;

    return getRestoreOSMode(void)::restoreOS;
  v2 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v3 = off_253D1A528;
  if (!off_253D1A528)
  {
    ctu::Gestalt::create_default_global(v2);
    std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100]((uint64_t)&off_253D1A528, &v8);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&v8);
    v3 = off_253D1A528;
  }
  v7[0] = v3;
  v7[1] = qword_253D1A530;
  if (qword_253D1A530)
  {
    v4 = (unint64_t *)(qword_253D1A530 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v6 = (*(uint64_t (**)(void *))(*(_QWORD *)v3 + 96))(v3);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)v7);
  getRestoreOSMode(void)::restoreOS = v6;
  return getRestoreOSMode(void)::restoreOS;
}

void sub_21159D4E0(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

uint64_t std::shared_ptr<ctu::Gestalt>::operator=[abi:ne180100](uint64_t result, __int128 *a2)
{
  uint64_t v2;
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v2 = result;
  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(result + 8);
  *(_OWORD *)result = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      return v2;
    }
  }
  return result;
}

uint64_t KTLPSIFormatEnhancedCommand(uint64_t a1, __int16 a2, int a3)
{
  *(_DWORD *)a1 = a3;
  *(_WORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 6) = a2 ^ HIWORD(a3) ^ a3;
  return 1;
}

uint64_t KTLPSIFormatEnhancedCommandMrcData(uint64_t a1, __int16 a2, int a3)
{
  *(_DWORD *)a1 = a3;
  *(_WORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 6) = a2 ^ HIWORD(a3) ^ a3;
  return 1;
}

uint64_t KTLPSISendEnhancedCommand(uint64_t a1, uint64_t (**a2)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v12)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t result;
  int v14;

  v14 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendEnhancedCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d\n", a3, a4, a5, a6, a7, a8, *(unsigned __int16 *)(a1 + 4));
  v12 = *a2;
  if (*a2)
  {
    LODWORD(result) = v12(a2, a1, a3, &v14, 1, a4, 0);
    LODWORD(v12) = v14;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if ((_DWORD)v12 == (_DWORD)a3)
    return result;
  else
    return 0;
}

uint64_t KTLPSISendMrcTrainingCommand(uint64_t a1, uint64_t (**a2)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD), uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v13)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t result;
  int v15;

  v15 = 0;
  _KTLDebugPrint((uint64_t)"KTLPSISendMrcTrainingCommand", (uint64_t)"Sending PSI enhanced command: command %d, param %d, length = %u\n", a3, a4, (uint64_t)a5, a6, a7, a8, *(unsigned __int16 *)(a1 + 4));
  v13 = *a2;
  if (*a2)
  {
    LODWORD(result) = v13(a2, a1, a3, &v15, 1, a4, 0);
    LODWORD(v13) = v15;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if ((_DWORD)v13 == (_DWORD)a3)
    result = result;
  else
    result = 0;
  *a5 = (_DWORD)v13;
  return result;
}

uint64_t KTLPSIReadResponse(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, unsigned __int16 *, uint64_t, unsigned int *, _QWORD, uint64_t, _QWORD);
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  unsigned int v23;

  _KTLDebugPrint((uint64_t)"KTLPSIReadResponse", (uint64_t)"Reading response from PSI\n", a3, (uint64_t)a4, a5, a6, a7, a8, v22);
  v23 = 0;
  v17 = *(uint64_t (**)(uint64_t, unsigned __int16 *, uint64_t, unsigned int *, _QWORD, uint64_t, _QWORD))(a1 + 8);
  if (v17)
  {
    v18 = v17(a1, a4, a2, &v23, 0, a3, 0);
    v19 = v18;
    v20 = v23;
    if (v23 && (_KTLDebugFlags & 2) != 0)
    {
      off_253D1A548("Rx:", 1, a4);
      v20 = v23;
      if ((v19 & 1) == 0)
        goto LABEL_11;
    }
    else if (!v18)
    {
      goto LABEL_11;
    }
    if (v20 >= 2 && v20 <= a2)
    {
      _KTLDebugPrint((uint64_t)"KTLPSIReadResponse", (uint64_t)"Read response from PSI: code = %u\n", v12, v20, v13, v14, v15, v16, *a4);
      return 1;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_11:
  _KTLDebugPrint((uint64_t)"KTLPSIReadResponse", (uint64_t)"Failed reading response from PSI: bytesRead = %u\n", v12, v20, v13, v14, v15, v16, v20);
  return 0;
}

uint64_t KTLPSIReadMrcResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, unsigned int *, _QWORD, uint64_t, _QWORD);
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  unsigned int v24;

  _KTLDebugPrint((uint64_t)"KTLPSIReadMrcResponse", (uint64_t)"Reading response from PSI, maxLength = %u\n", a3, a4, a5, a6, a7, a8, a2);
  v24 = 0;
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, _QWORD, uint64_t, _QWORD))(a1 + 8);
  if (!v17)
  {
    v20 = 0;
    goto LABEL_11;
  }
  v18 = v17(a1, a4, a2, &v24, 0, a3, 0);
  v19 = v18;
  v20 = v24;
  if (v24 && (_KTLDebugFlags & 2) != 0)
  {
    off_253D1A548("Rx:", 1, a4);
    v20 = v24;
    if ((v19 & 1) != 0)
      goto LABEL_8;
LABEL_11:
    v21 = 0;
    v22 = "Failed reading response from PSI: bytesRead = %u\n";
    goto LABEL_12;
  }
  if (!v18)
    goto LABEL_11;
LABEL_8:
  if (v20 < 2 || v20 > a2)
    goto LABEL_11;
  v21 = 1;
  v22 = "Successful Read response from PSI,bytesRead = %u\n";
LABEL_12:
  _KTLDebugPrint((uint64_t)"KTLPSIReadMrcResponse", (uint64_t)v22, v12, v20, v13, v14, v15, v16, v20);
  return v21;
}

uint64_t KTLCreateEBLLengthPacket(_DWORD *a1, int a2)
{
  *a1 = a2;
  return 1;
}

BOOL KTLParseEBLLengthAck(unsigned __int16 *a1)
{
  return *a1 == 52428;
}

uint64_t KTLSendEBLImage(uint64_t a1, _QWORD *a2, uint64_t a3, char a4, uint64_t a5)
{
  int v7;
  uint64_t result;
  int v10;
  char v11;

  v11 = a4;
  v10 = 0;
  if (!*a2)
    return 0;
  v7 = a3;
  if (!((unsigned int (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a2)(a2, a1, a3, &v10, 1, a5, 0)|| v10 != v7)
  {
    return 0;
  }
  if (*a2)
  {
    LODWORD(result) = ((uint64_t (*)(_QWORD *, char *, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a2)(a2, &v11, 1, &v10, 1, a5, 0);
    v7 = v10;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if (v7 == 1)
    return result;
  else
    return 0;
}

uint64_t KTLSendEBLImageNoXor(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t result;
  int v6;

  v4 = a3;
  v6 = 0;
  if (!*a2)
    return 0;
  LODWORD(result) = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a2)(a2, a1, a3, &v6, 1, a4, 0);
  if (v6 == v4)
    return result;
  else
    return 0;
}

BOOL KTLParseEBLDownloadResult(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1) << 8 == 42240;
}

const char *PSIModeDescription(int a1)
{
  if (a1 <= 52479)
  {
    if (a1 == 462)
      return "Secure";
    if (a1 == 43520)
      return "Normal";
  }
  else
  {
    switch(a1)
    {
      case 52480:
        return "Coredump";
      case 61166:
        return "BadEEPROM";
      case 56577:
        return "Enhanced";
    }
  }
  return "Unknown";
}

uint64_t KTLParsePSIRunning(unsigned __int16 *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  int v10;
  const char *v11;

  result = 0;
  if (a1 && a2)
  {
    v10 = *a1;
    if (v10 > 0xEEEE)
      return 0;
    *a2 = v10;
    if (v10 <= 52479)
    {
      if (v10 == 462)
      {
        v11 = "Secure";
        goto LABEL_17;
      }
      if (v10 == 43520)
      {
        v11 = "Normal";
        goto LABEL_17;
      }
    }
    else
    {
      switch(v10)
      {
        case 52480:
          v11 = "Coredump";
          goto LABEL_17;
        case 61166:
          v11 = "BadEEPROM";
          goto LABEL_17;
        case 56577:
          v11 = "Enhanced";
LABEL_17:
          _KTLDebugPrint((uint64_t)"KTLParsePSIRunning", (uint64_t)"PSI is running in %s mode\n", a3, a4, a5, a6, a7, a8, (uint64_t)v11);
          return 1;
      }
    }
    v11 = "Unknown";
    goto LABEL_17;
  }
  return result;
}

uint64_t KTLParsePSIICEPersonalizionInfo(_OWORD *a1, unsigned int a2, uint64_t *a3)
{
  uint64_t result;
  __int128 v6;
  __int128 v7;

  result = 0;
  if (a1)
  {
    if (a2 >= 0x4C)
    {
      result = (uint64_t)malloc(0x4CuLL);
      if (result)
      {
        v6 = a1[1];
        *(_OWORD *)result = *a1;
        *(_OWORD *)(result + 16) = v6;
        v7 = a1[3];
        *(_OWORD *)(result + 32) = a1[2];
        *(_OWORD *)(result + 48) = v7;
        *(_OWORD *)(result + 60) = *(_OWORD *)((char *)a1 + 60);
        if (*(_WORD *)result == 3777)
        {
          *a3 = result;
          return 1;
        }
        else
        {
          free((void *)result);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICEPersonalizionInfoSha384(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = 0;
  if (a1)
  {
    if (a2 >= 0x78)
    {
      result = (uint64_t)malloc(0x78uLL);
      if (result)
      {
        v6 = *(_OWORD *)(a1 + 80);
        *(_OWORD *)(result + 64) = *(_OWORD *)(a1 + 64);
        *(_OWORD *)(result + 80) = v6;
        *(_OWORD *)(result + 96) = *(_OWORD *)(a1 + 96);
        *(_QWORD *)(result + 112) = *(_QWORD *)(a1 + 112);
        v7 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)result = *(_OWORD *)a1;
        *(_OWORD *)(result + 16) = v7;
        v8 = *(_OWORD *)(a1 + 48);
        *(_OWORD *)(result + 32) = *(_OWORD *)(a1 + 32);
        *(_OWORD *)(result + 48) = v8;
        if (*(_WORD *)result == 3777)
        {
          *a3 = result;
          return 1;
        }
        else
        {
          free((void *)result);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICEHashResponse(const void *a1, size_t __size, _QWORD *a3)
{
  uint64_t result;
  size_t v6;
  _WORD *v7;

  result = 0;
  if (a1)
  {
    if (__size >= 8)
    {
      v6 = __size;
      result = (uint64_t)malloc(__size);
      if (result)
      {
        v7 = (_WORD *)result;
        memcpy((void *)result, a1, v6);
        if (*v7 == 3777 && 96 * (unint64_t)*((unsigned int *)v7 + 1) <= (unsigned __int16)v7[1])
        {
          *a3 = v7;
          return 1;
        }
        else
        {
          free(v7);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICEHashResponseSha384(const void *a1, size_t __size, _QWORD *a3)
{
  uint64_t result;
  size_t v6;
  _WORD *v7;

  result = 0;
  if (a1)
  {
    if (__size >= 8)
    {
      v6 = __size;
      result = (uint64_t)malloc(__size);
      if (result)
      {
        v7 = (_WORD *)result;
        memcpy((void *)result, a1, v6);
        if (*v7 == 3777 && 112 * (unint64_t)*((unsigned int *)v7 + 1) <= (unsigned __int16)v7[1])
        {
          *a3 = v7;
          return 1;
        }
        else
        {
          free(v7);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLParsePSIICETestModeResponse(const void *a1, size_t __size, unsigned __int16 **a3)
{
  uint64_t result;
  size_t v6;
  unsigned __int16 *v7;

  result = 0;
  if (a1)
  {
    if (__size >= 4)
    {
      v6 = __size;
      result = (uint64_t)malloc(__size);
      if (result)
      {
        v7 = (unsigned __int16 *)result;
        memcpy((void *)result, a1, v6);
        if (v6 - 4 == v7[1])
        {
          *a3 = v7;
          return 1;
        }
        else
        {
          free(v7);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t KTLEBLReceivePacket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)(void);
  uint64_t v11;

  v8 = *(uint64_t (**)(void))(a1 + 8);
  if (v8 && (v8() & 1) != 0)
  {
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Received:", 1, a2);
    _KTLDebugPrint((uint64_t)"KTLEBLReceivePacket", (uint64_t)"Packet read < Minimum size (%d < %ld)\n", a3, 0, a5, a6, a7, a8, 0);
    return 0;
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLEBLReceivePacket", (uint64_t)"Packet read failed.\n", a3, a4, a5, a6, a7, a8, v11);
    return 0;
  }
}

uint64_t KTLEBLSendReadfileData(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t result;
  int v6;

  v4 = a3;
  v6 = 0;
  if (!*a1)
    return 0;
  LODWORD(result) = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a1)(a1, a2, a3, &v6, 1, a4, 0);
  if (v6 == v4)
    return result;
  else
    return 0;
}

uint64_t KTLEBLSendPacket(uint64_t (**a1)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t (*v12)(_QWORD, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t result;
  int v14;

  v14 = 0;
  v11 = (*(_DWORD *)(a2 + 4) + 8);
  _KTLDebugPrint((uint64_t)"KTLEBLSendPacket", (uint64_t)"Sending command of length %u, type %u\n", a3, a4, a5, a6, a7, a8, v11);
  v12 = *a1;
  if (*a1)
  {
    LODWORD(result) = v12(a1, a2, v11, &v14, 1, a3, 0);
    LODWORD(v12) = v14;
  }
  else
  {
    LODWORD(result) = 0;
  }
  if ((_DWORD)v12 == (_DWORD)v11)
    return result;
  else
    return 0;
}

uint64_t KTLEBLParseStartInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  switch(*(_DWORD *)a1)
  {
    case 1:
      v8 = *(_DWORD *)(a1 + 4);
      if (v8 > 0xB)
      {
        if (v8 == 12)
        {
          v10 = *(_QWORD *)(a1 + 8);
          *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 16);
          *(_QWORD *)a2 = v10;
          result = 1;
        }
        else
        {
          _KTLDebugPrint((uint64_t)"KTLEBLParseStartInfo", (uint64_t)"Error: packet malformed, payload too large for StartInfo.\n", a3, a4, a5, a6, a7, a8, v11);
          result = 0;
        }
      }
      else
      {
        _KTLDebugPrint((uint64_t)"KTLEBLParseStartInfo", (uint64_t)"Error: packet malformed, payload too small for StartInfo.\n", a3, a4, a5, a6, a7, a8, v11);
        result = 0;
      }
      break;
    default:
      _KTLDebugPrint((uint64_t)"KTLEBLParseStartInfo", (uint64_t)"Error: packet id mismatch (expected=%d (%s), got=%d (%s))\n", a3, a4, a5, a6, a7, a8, 1);
      result = 0;
      break;
  }
  return result;
}

uint64_t KTLEBLCreateStartACKPacket(uint64_t a1, _DWORD *a2)
{
  *(_QWORD *)a1 = 0x1000000002;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_DWORD *)(a1 + 12) = a2[1];
  *(_DWORD *)(a1 + 16) = a2[2];
  *(_DWORD *)(a1 + 20) = a2[3];
  return 1;
}

uint64_t KTLEBLParseReadfile(uint64_t a1, void *a2, _DWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return KTLEBLParseReadfileExt(a1, a2, 0x1000uLL, a3, a4, a6, a7, a8);
}

uint64_t KTLEBLParseReadfileExt(uint64_t a1, void *a2, size_t a3, _DWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v12;
  unsigned int v13;
  const char *v14;
  uint64_t result;
  uint64_t v16;

  if (a1 && a2 && a4 && a5)
  {
    switch(*(_DWORD *)a1)
    {
      case 3:
        v12 = *(unsigned int *)(a1 + 16);
        v13 = *(_DWORD *)(a1 + 4);
        if (v13 < (int)v12 + 12)
        {
          v14 = "Error: packet malformed, payload too small for Readfile.\n";
          goto LABEL_10;
        }
        if (v13 > (int)v12 + 12)
        {
          v14 = "Error: packet malformed, payload too large for Readfile.\n";
          goto LABEL_10;
        }
        if (v12 > a3)
        {
          _KTLDebugPrint((uint64_t)"KTLEBLParseReadfileExt", (uint64_t)"Error: given filename size (%lu) is too small to copy. We need %d size.\n", a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a3);
          return 0;
        }
        bzero(a2, a3);
        strncpy((char *)a2, (const char *)(a1 + 20), *(unsigned int *)(a1 + 16));
        *a4 = *(_DWORD *)(a1 + 8);
        *a5 = *(_DWORD *)(a1 + 12);
        result = 1;
        break;
      default:
        v16 = 3;
        v14 = "Error: packet id mismatch (expected=%d (%s), got=%d (%s))\n";
LABEL_10:
        _KTLDebugPrint((uint64_t)"KTLEBLParseReadfileExt", (uint64_t)v14, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v16);
        return 0;
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLEBLParseReadfileExt", (uint64_t)"Error: one of given parameter got null.(pkt: %p, fname: %p, offset: %p, length: %p)\n", a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a1);
    return 0;
  }
  return result;
}

uint64_t KTLEBLParseDone(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t result;
  uint64_t v10;

  switch(*a1)
  {
    case 4:
      v8 = a1[1];
      if (v8 > 3)
      {
        if (v8 == 4)
        {
          *a2 = a1[2];
          result = 1;
        }
        else
        {
          _KTLDebugPrint((uint64_t)"KTLEBLParseDone", (uint64_t)"Error: packet malformed, payload too large for Done.\n", a3, a4, a5, a6, a7, a8, v10);
          result = 0;
        }
      }
      else
      {
        _KTLDebugPrint((uint64_t)"KTLEBLParseDone", (uint64_t)"Error: packet malformed, payload too small for Done.\n", a3, a4, a5, a6, a7, a8, v10);
        result = 0;
      }
      break;
    default:
      _KTLDebugPrint((uint64_t)"KTLEBLParseDone", (uint64_t)"Error: packet id mismatch (expected=%d (%s), got=%d (%s))\n", a3, a4, a5, a6, a7, a8, 4);
      result = 0;
      break;
  }
  return result;
}

uint64_t KTLEBLCreateDoneACKPacket(_QWORD *a1)
{
  *a1 = 5;
  return 1;
}

uint64_t KTLInitOptions(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v12;

  v8 = a4 != 0;
  v9 = a5 != 0;
  v10 = v8 ^ v9;
  if (((v8 ^ v9) & 1) != 0)
  {
    *(_DWORD *)a1 = a2;
    *(_DWORD *)(a1 + 4) = a3;
    *(_QWORD *)(a1 + 8) = a4;
    *(_DWORD *)(a1 + 16) = a5;
    *(_DWORD *)(a1 + 20) = a6;
    return v8 ^ v9;
  }
  else
  {
    *(_DWORD *)(a1 + 4) = 3;
    _KTLErrorPrint((uint64_t)"KTLInitOptions", (uint64_t)"Provide either transport or ARI id, not both\n", a3, a4, a5, a6, a7, a8, v12);
    return v10;
  }
}

uint64_t KTLOpenChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t vars0;

  *(_QWORD *)(a1 + 24) = 0;
  v8 = *(_DWORD *)(a1 + 4);
  if (v8 < 3)
    return 1;
  if (v8 == 3)
    _KTLErrorPrint((uint64_t)"KTLOpenChannel", (uint64_t)"Invalid transport option selected.  See previous error.  Abort!\n", a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t KTLCloseChannel(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  _QWORD *v3;

  v1 = *(_DWORD *)(a1 + 4);
  if ((v1 - 1) < 2)
    return 1;
  if (!v1)
  {
    v2 = *(_QWORD **)(a1 + 24);
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)v2[5];
        (*(void (**)(_QWORD *))(*v2 + 8))(v2);
        v2 = v3;
      }
      while (v3);
    }
    return 1;
  }
  return 0;
}

uint64_t KTLEFISendData(uint64_t a1, _DWORD *a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t result;
  _DWORD *v24;
  uint64_t v25;
  _DWORD __dst[771];
  uint64_t v27;

  v9 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned __int8 *)a2 | 0x20) == 0x61)
  {
    if (a3 > 0xC00)
    {
      _KTLErrorPrint((uint64_t)"KTLEFISendData", (uint64_t)"AT string size (%u) larger than max size (%u).\n", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
      goto LABEL_23;
    }
    v12 = (a3 - 1);
    if (*((_BYTE *)a2 + v12) == 10)
    {
      if (*((_BYTE *)a2 + (a3 - 2)) == 13)
        goto LABEL_22;
      if (a3 <= 0xBFF)
      {
        *((_BYTE *)a2 + a3) = 10;
        *((_BYTE *)a2 + v12) = 13;
        LODWORD(v9) = a3 + 1;
        goto LABEL_22;
      }
    }
    else if (a3 <= 0xBFE)
    {
      *(_WORD *)((char *)a2 + a3) = 2573;
      LODWORD(v9) = a3 + 2;
      goto LABEL_22;
    }
    _KTLErrorPrint((uint64_t)"KTLEFISendData", (uint64_t)"Not enough space left to append \\r\\n to AT string.\n", a3, (uint64_t)a4, a5, a6, a7, a8, v25);
LABEL_22:
    bzero(__dst, 0xC00uLL);
    __dst[768] = v9;
    memcpy(__dst, a2, v9);
    __dst[769] = *(_DWORD *)(a1 + 20);
    __dst[770] = 1;
    if (!ARI_CsiIceAtExtReq_ENC())
    {
      v24 = operator new(0x18uLL);
      v24[2] = 0;
      *((_QWORD *)v24 + 2) = 0;
      *(_QWORD *)v24 = &unk_24CC18DE8;
      result = KTLUTASendAndReleaseData(a1, v24);
      goto LABEL_24;
    }
LABEL_23:
    result = 0;
LABEL_24:
    *a4 = 1;
    return result;
  }
  if (a3 >= 0xC && *a2 == -1417756450)
  {
    v13 = *(_QWORD **)(a1 + 8);
    v14 = *(unsigned int *)(a1 + 20);
    __dst[0] = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, a2);
    if (*v13
      && ((v21 = ((uint64_t (*)(_QWORD *, _DWORD *, uint64_t, _DWORD *, uint64_t, uint64_t, _QWORD))*v13)(v13, a2, v9, __dst, 1, v14, 0), __dst[0] == (_DWORD)v9)? (v22 = v21): (v22 = 0), (v22 & 1) != 0))
    {
      result = 1;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v15, v16, v17, v18, v19, v20, v9);
      result = 0;
    }
    *a4 = 0;
  }
  else
  {
    _KTLErrorPrint((uint64_t)"KTLEFISendData", (uint64_t)"Unrecognized message type.\n", a3, (uint64_t)a4, a5, a6, a7, a8, v25);
    return 0;
  }
  return result;
}

uint64_t KTLRawSendData(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v21;

  v21 = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", a3, a4, a5, a6, a7, a8, a3);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, a2);
  if (!*a1
    || ((v18 = 1,
         ((unsigned int (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a1)(a1, a2, a3, &v21, 1, a4, 0))? (v19 = v21 == (_DWORD)a3): (v19 = 0), !v19))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v12, v13, v14, v15, v16, v17, a3);
    return 0;
  }
  return v18;
}

uint64_t KTLEFIReceiveData(uint64_t a1, char *a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int *v9;
  AriMsg *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  const char *v28;
  unsigned int v29;
  BOOL v30;
  size_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned int v40;
  const void *v41;
  _OWORD v43[4];
  unint64_t v44;
  unsigned int *v45;
  size_t __b[387];

  *(size_t *)((char *)&__b[385] + 4) = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  *a3 = 0;
  if (a5)
  {
    if (!KTLUTACopyReceiveData(a1, (uint64_t *)&v45))
      return 0;
    while (1)
    {
      v9 = v45;
      v10 = (AriMsg *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v45 + 16))(v45);
      if (AriMsg::GetBufGmid(v10, (const unsigned __int8 *)v9[2]) != -116752384)
        break;
      v44 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43[2] = v17;
      v43[3] = v17;
      v43[0] = v17;
      v43[1] = v17;
      v18 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
      MEMORY[0x212BDC830](v43, v18, v9[2]);
      memset(__b, 170, 0xC0CuLL);
      if (a4 - *a3 < 0xAAAAAAAA)
      {
        _KTLErrorPrint((uint64_t)"KTLEFIReceiveData", (uint64_t)"Received AT string size %u, but caller provided buffer size %u\n", v19, v20, v21, v22, v23, v24, (*a3 - 1431655766));
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 8))(v9);
        AriMsg::~AriMsg((AriMsg *)v43);
        return 0;
      }
      v25 = 0;
      do
      {
        v26 = *((_BYTE *)__b + v25);
        if (!v26)
          v26 = 32;
        *((_BYTE *)__b + v25++) = v26;
      }
      while (v25 < LODWORD(__b[384]));
      memcpy(a2, __b, LODWORD(__b[384]));
      v27 = *a3;
      if ((_DWORD)v27)
      {
        if (v27 < 8)
        {
          v28 = &a2[-v27];
          v29 = LODWORD(__b[384]) + v27;
        }
        else
        {
          v28 = a2 - 8;
          v29 = LODWORD(__b[384]) + 8;
        }
      }
      else
      {
        v29 = __b[384];
        v28 = a2;
      }
      v31 = v29;
      if (strnstr(v28, "\r\nOK\r\n", v29))
        v30 = 1;
      else
        v30 = strnstr(v28, "\r\nERROR\r\n", v31) != 0;
      a2 += LODWORD(__b[384]);
      *a3 += LODWORD(__b[384]);
      AriMsg::~AriMsg((AriMsg *)v43);
      v9 = v45;
      if (v45)
        goto LABEL_19;
      v45 = 0;
      if (v30)
        return 1;
LABEL_20:
      if ((KTLUTACopyReceiveData(a1, (uint64_t *)&v45) & 1) == 0)
        return 0;
    }
    _KTLErrorPrint((uint64_t)"KTLEFIReceiveData", (uint64_t)"EFI receive expected AT response (%u) but found (%u)\n", v11, v12, v13, v14, v15, v16, 4178214912);
    v30 = 0;
LABEL_19:
    (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 8))(v9);
    v45 = 0;
    if (v30)
      return 1;
    goto LABEL_20;
  }
  if (!KTLUTACopyReceiveData(a1, (uint64_t *)&v45))
    return 0;
  v39 = v45;
  v40 = v45[2];
  v32 = v40 <= a4;
  if (v40 > a4)
  {
    _KTLErrorPrint((uint64_t)"KTLEFIReceiveData", (uint64_t)"Receved message of size %u, but caller provided buffer size %u\n", v33, v34, v35, v36, v37, v38, v45[2]);
  }
  else
  {
    v41 = (const void *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v45 + 16))(v45);
    memcpy(a2, v41, v39[2]);
    *a3 = v39[2];
  }
  (*(void (**)(unsigned int *))(*(_QWORD *)v39 + 8))(v39);
  return v32;
}

void sub_21159EE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  AriMsg::~AriMsg((AriMsg *)va);
  _Unwind_Resume(a1);
}

uint64_t KTLUTACopyReceiveData(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_time_t v11;
  uint64_t result;
  _QWORD *v13;
  AriMsg *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v11 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  while (1)
  {
    result = ktl::KTLReceivePacket::fetchARIMsgFromTransport(a1, v4, v5, v6, v7, v8, v9, v10);
    *a2 = result;
    if (!result)
      break;
    v13 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
    v14 = (AriMsg *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)*a2 + 16))(*a2);
    result = AriMsg::GetBufMsgDir(v14, (const unsigned __int8 *)*(unsigned int *)(*a2 + 8));
    if ((_DWORD)result == 1)
      break;
    _KTLDebugPrint((uint64_t)"KTLUTACopyReceiveData", (uint64_t)"Skipping unexpected message (groupId=%d, msgId=0x%x) with unexpected direction (%d) and retrying receive.\n", v15, v16, v17, v18, v19, v20, (*v13 >> 35) & 0x3FLL);
    if (*a2)
      (*(void (**)(uint64_t))(*(_QWORD *)*a2 + 8))(*a2);
    *a2 = 0;
    if (dispatch_time(0, 0) > v11)
      return 0;
  }
  return result;
}

uint64_t KTLUTASendAndReleaseData(uint64_t a1, unsigned int *a2)
{
  _QWORD *v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int v23;

  v4 = *(_QWORD **)(a1 + 8);
  v5 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)a2 + 16))(a2);
  v6 = a2[2];
  v7 = *(unsigned int *)(a1 + 20);
  v23 = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v8, v9, v10, v11, v12, v13, v6);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v5);
  if (!*v4
    || ((v20 = 1,
         ((unsigned int (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*v4)(v4, v5, v6, &v23, 1, v7, 0))? (v21 = v23 == (_DWORD)v6): (v21 = 0), !v21))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v14, v15, v16, v17, v18, v19, v6);
    v20 = 0;
  }
  (*(void (**)(unsigned int *))(*(_QWORD *)a2 + 8))(a2);
  return v20;
}

BOOL KTLUTACopyReceiveNextMessage(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t ARIMsgFromTransport;

  ARIMsgFromTransport = ktl::KTLReceivePacket::fetchARIMsgFromTransport(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  *a2 = ARIMsgFromTransport;
  return ARIMsgFromTransport != 0;
}

uint64_t KTLRawReceiveData(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t (*v3)(void);
  uint64_t v6;

  *a3 = 0;
  v3 = *(uint64_t (**)(void))(a1 + 8);
  if (!v3)
    return 0;
  v6 = v3();
  if (*a3)
  {
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Rx:", 1, a2);
  }
  return v6;
}

uint64_t KTLRawReceiveDataExact(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, _QWORD);
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v16;

  *a3 = 0;
  if (!(_DWORD)a4)
    return 1;
  v6 = a4;
  v10 = a2;
  do
  {
    v16 = 0;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, _QWORD))(a1 + 8);
    if (!v11 || (v11(a1, v10, v6, &v16, 1, a5, 0) & 1) == 0)
      return 0;
    v12 = v16;
    v13 = *a3 + v16;
    *a3 = v13;
    v10 += v12;
    v6 = (v6 - v12);
  }
  while ((_DWORD)v6);
  if (!v13 || (_KTLDebugFlags & 2) == 0)
    return 1;
  v14 = 1;
  off_253D1A548("Rx:", 1, a2);
  return v14;
}

void ice_filer_lookup_node::~ice_filer_lookup_node(ice_filer_lookup_node *this)
{
  NSObject *v1;

  v1 = *((_QWORD *)this + 8);
  if (v1)
    dispatch_release(v1);
}

uint64_t ICE_FILER_write(uint64_t a1, uint64_t a2, uint64_t a3, AriHost *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    return ICE_FILER_write(a1, 0, a2, a3, a4, a5, a7, a8);
  _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: %s. Invalid Parameter.\n", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)"ICE_FILER_write");
  return 0xFFFFFFFFLL;
}

uint64_t ICE_FILER_write(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, AriHost *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  void *v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned int v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  dispatch_semaphore_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, AriMsg *, unsigned __int8 *);
  void *v56;
  const char *v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  char *v61;
  const char *v62;
  void *v63;
  uint64_t (*v64)(uint64_t, AriMsg *, unsigned __int8 *);
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  int v68;
  uint64_t *p_shared_owners;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int *v77;
  AriMsg *v78;
  AriHost *BufCtx;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  dispatch_time_t v87;
  uint64_t v88;
  uint64_t v89[6];
  int v90[2];
  std::__shared_weak_count *v91;
  int v92;

  if (!a1 || (v8 = a4) == 0 || (v10 = a2, (a2 == 0) == (a3 == 0)))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: ICE_FILER_write. Invalid Parameter.\n", a3, a4, (uint64_t)a5, a6, a7, a8, v88);
    return 0xFFFFFFFFLL;
  }
  if (!*(_QWORD *)(a1 + 8) && !(_BYTE)a5 && *(_DWORD *)(a1 + 16))
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Missing required transaction ID: context_id=%x\n", a3, a4, (uint64_t)a5, a6, a7, a8, (uint64_t)a5);
    return 0xFFFFFFFFLL;
  }
  if (pthread_mutex_lock(&ice_filer_lookup_mutex))
  {
LABEL_6:
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: ICE_FILER_write. Context Already Exists.\n", v14, v15, v16, v17, v18, v19, v88);
    return 4294967291;
  }
  v22 = qword_253D1A5A8;
  if ((int *)qword_253D1A5A8 != &ice_filer_lookup_head)
  {
    v23 = qword_253D1A5A8;
    while (*(_DWORD *)v23 != (_DWORD)a5)
    {
      v23 = *(_QWORD *)(v23 + 80);
      if ((int *)v23 == &ice_filer_lookup_head)
        goto LABEL_17;
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
    goto LABEL_6;
  }
LABEL_17:
  v24 = (unsigned int *)operator new(0x60uLL);
  *((_QWORD *)v24 + 8) = 0;
  *v24 = a5;
  *((_QWORD *)v24 + 1) = a3;
  *((_QWORD *)v24 + 2) = a1;
  if (a3)
    v10 = operator new[](0xC00uLL);
  *((_QWORD *)v24 + 3) = v10;
  v24[8] = v8;
  *((_QWORD *)v24 + 5) = v10;
  v24[12] = v8;
  *((_QWORD *)v24 + 7) = a6;
  *((_QWORD *)v24 + 8) = 0;
  v24[18] = 0;
  *((_QWORD *)v24 + 10) = v22;
  *((_QWORD *)v24 + 11) = &ice_filer_lookup_head;
  *(_QWORD *)(v22 + 88) = v24;
  qword_253D1A5A8 = (uint64_t)v24;
  _KTLDebugFlags = 13;
  pthread_mutex_unlock(&ice_filer_lookup_mutex);
  if (!*(_QWORD *)(a1 + 8) && *(_DWORD *)(a1 + 16))
  {
    if (!a6)
    {
      v52 = dispatch_semaphore_create(0);
      v53 = *((_QWORD *)v24 + 8);
      *((_QWORD *)v24 + 8) = v52;
      if (v53)
        dispatch_release(v53);
    }
    v54 = MEMORY[0x24BDAC760];
    v55 = ___ZL15ICE_FILER_writeP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_E_block_invoke;
    v56 = &__block_descriptor_tmp_9;
    v57 = "ICE_FILER_write";
    do
    {
      v58 = v24[12];
      if (!v58)
        break;
      if (v58 >= 0xC00)
        v59 = 3072;
      else
        v59 = v24[12];
      v60 = *((_QWORD *)v24 + 1);
      v61 = (char *)*((_QWORD *)v24 + 5);
      if (v60)
      {
        v62 = v57;
        v63 = v56;
        v64 = v55;
        v65 = v54;
        v90[0] = 0;
        v66 = *(_QWORD *)(v60 + 8);
        v67 = v59;
        if (v66)
        {
          while (1)
          {
            if (!((unsigned int (*)(void))v66)())
            {
              v66 = 0;
              goto LABEL_94;
            }
            if (v67 < v90[0])
              break;
            if (v67 == v90[0])
            {
              v61 = (char *)*((_QWORD *)v24 + 5);
              v54 = v65;
              v55 = v64;
              v56 = v63;
              v57 = v62;
              goto LABEL_69;
            }
            v61 += v90[0];
            v66 = *(_QWORD *)(*((_QWORD *)v24 + 1) + 8);
            v67 -= v90[0];
            if (!v66)
              goto LABEL_94;
          }
          v66 = 1;
        }
LABEL_94:
        _KTLErrorPrint((uint64_t)"ICE_FILER_transport_read", (uint64_t)"Error: TelephonyUtilTransportRead (ret=%d, available=%d, read=%d).\n", v25, v26, v27, v28, v29, v30, v66);
        v24[18] = -6;
        break;
      }
LABEL_69:
      *(_QWORD *)v90 = 0;
      v91 = 0;
      CreateFilerWriteRequest(v61, v59);
      v89[1] = v54;
      v89[2] = 0x40000000;
      v89[3] = (uint64_t)v55;
      v89[4] = (uint64_t)v56;
      v89[5] = (uint64_t)v24;
      v68 = AriHost::Send();
      if (v68)
      {
        _KTLErrorPrint((uint64_t)v57, (uint64_t)"%s: Failed to send (Remaining=%d/%d).  Aborting...\n", v25, v26, v27, v28, v29, v30, (uint64_t)v57);
        v24[18] = -6;
      }
      else
      {
        if (!*((_QWORD *)v24 + 1))
          *((_QWORD *)v24 + 5) += v59;
        v24[12] -= v59;
      }
      if (v91)
      {
        p_shared_owners = &v91->__shared_owners_;
        do
          v70 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v70 - 1, (unint64_t *)p_shared_owners));
        if (!v70)
        {
          ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
          std::__shared_weak_count::__release_weak(v91);
        }
      }
    }
    while (!v68);
    if (!*((_QWORD *)v24 + 8))
      return 0xFFFFFFFFLL;
    v87 = dispatch_time(0, 1000000 * (*(_DWORD *)(a1 + 20) - v24[8] / 0xC00 + 8 * (v24[8] / 0xC00)));
    if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)v24 + 8), v87))
      goto LABEL_91;
    v86 = "Timeout waiting for transfer to complete\n";
LABEL_88:
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)v86, v71, v72, v73, v74, v75, v76, v88);
    goto LABEL_91;
  }
  v89[0] = 0;
  v31 = v24[12];
  if (!v31)
    goto LABEL_84;
  while (1)
  {
    v32 = v31 >= 0xC00 ? 3072 : v31;
    v33 = *((_QWORD *)v24 + 1);
    v34 = (char *)*((_QWORD *)v24 + 5);
    if (v33)
      break;
LABEL_32:
    *(_QWORD *)v90 = 0;
    v91 = 0;
    CreateFilerWriteRequest(v34, v32);
    v37 = *(_QWORD **)(a1 + 8);
    v38 = MEMORY[0];
    v39 = MEMORY[8] - MEMORY[0];
    v40 = *(unsigned int *)(a1 + 20);
    v92 = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v41, v42, v43, v44, v45, v46, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v38);
    if (*v37
      && ((v47 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, int *, uint64_t, uint64_t, _QWORD))*v37)(v37, v38, v39, &v92, 1, v40, 0), v92 == (_DWORD)v39)? (v48 = v47): (v48 = 0), (v48 & 1) != 0))
    {
      if (*((_QWORD *)v24 + 1))
        goto LABEL_40;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v25, v26, v27, v28, v29, v30, v39);
      if (*((_QWORD *)v24 + 1))
      {
LABEL_40:
        v31 = v24[12] - v32;
        v24[12] = v31;
        v49 = v91;
        if (v91)
          goto LABEL_44;
        goto LABEL_49;
      }
    }
    *((_QWORD *)v24 + 5) += v32;
    v31 = v24[12] - v32;
    v24[12] = v31;
    v49 = v91;
    if (v91)
    {
LABEL_44:
      v50 = (unint64_t *)&v49->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
      v31 = v24[12];
    }
LABEL_49:
    if (!v31)
      goto LABEL_84;
  }
  v90[0] = 0;
  v35 = *(_QWORD *)(v33 + 8);
  v36 = v32;
  if (v35)
  {
    while (1)
    {
      if (!((unsigned int (*)(void))v35)())
      {
        v35 = 0;
        goto LABEL_83;
      }
      if (v36 < v90[0])
        break;
      if (v36 == v90[0])
      {
        v34 = (char *)*((_QWORD *)v24 + 5);
        goto LABEL_32;
      }
      v34 += v90[0];
      v35 = *(_QWORD *)(*((_QWORD *)v24 + 1) + 8);
      v36 -= v90[0];
      if (!v35)
        goto LABEL_83;
    }
    v35 = 1;
  }
LABEL_83:
  _KTLErrorPrint((uint64_t)"ICE_FILER_transport_read", (uint64_t)"Error: TelephonyUtilTransportRead (ret=%d, available=%d, read=%d).\n", v25, v26, v27, v28, v29, v30, v35);
  v24[18] = -6;
LABEL_84:
  if (!KTLUTACopyReceiveData(a1, v89))
  {
    v86 = "Error: ICE_FILER_write. Failed copyReceiveData\n";
    goto LABEL_88;
  }
  v90[0] = -1431655766;
  v77 = (unsigned int *)v89[0];
  v78 = (AriMsg *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v89[0] + 16))(v89[0]);
  BufCtx = (AriHost *)AriMsg::GetBufCtx(v78, (const unsigned __int8 *)v77[2]);
  (*(void (**)(unsigned int *))(*(_QWORD *)v77 + 16))(v77);
  if (ARI_CsiIceFilerWriteRspCb_Extract())
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: ICE_FILER_write. Failed ARI_EXTRACT (Remaining=%d/%d)\n", v80, v81, v82, v83, v84, v85, v24[12]);
    v24[18] = -7;
  }
  else
  {
    IceFilerWriteRspCb(v90[0], BufCtx, v80, v81, v82, v83, v84, v85, v88);
  }
  (*(void (**)(unsigned int *))(*(_QWORD *)v77 + 8))(v77);
LABEL_91:
  v20 = v24[18];
  ICE_FILER_lookup_remove(a5);
  return v20;
}

void sub_21159F9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21159F9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21159F9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ICE_FILER_write(uint64_t a1, void *a2, uint64_t a3, AriHost *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    return ICE_FILER_write(a1, a2, 0, a3, a4, a5, a7, a8);
  _KTLErrorPrint((uint64_t)"ICE_FILER_write", (uint64_t)"Error: %s. Invalid Parameter.\n", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)"ICE_FILER_write");
  return 0xFFFFFFFFLL;
}

uint64_t CreateFilerWriteRequest(const void *a1, unsigned int a2)
{
  __int128 v4;
  _DWORD *v5;
  void *v6;
  size_t v7;
  void *v8;
  void *v9;
  _OWORD v11[4];
  void *__p[2];
  _BYTE __dst[3072];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[3] = v4;
  *(_OWORD *)__p = v4;
  v11[1] = v4;
  v11[2] = v4;
  v11[0] = v4;
  AriSdk::ARI_CsiIceFilerWriteReq_SDK::ARI_CsiIceFilerWriteReq_SDK((AriSdk::ARI_CsiIceFilerWriteReq_SDK *)v11);
  v5 = operator new(4uLL);
  *v5 = a2;
  v6 = __p[0];
  __p[0] = v5;
  if (v6)
    operator delete(v6);
  if (a2 <= 0xBFF)
    v7 = 3072 - a2;
  else
    v7 = 0;
  bzero(&__dst[a2], v7);
  memcpy(__dst, a1, a2);
  v8 = operator new(0xC00uLL);
  memcpy(v8, __dst, 0xC00uLL);
  v9 = __p[1];
  __p[1] = v8;
  if (v9)
    operator delete(v9);
  AriSdk::MsgBase::getRawBytes();
  return MEMORY[0x212BDC8D8](v11);
}

uint64_t ___ZL15ICE_FILER_writeP10KTLOptionsPvP26TelephonyUtilTransport_tagjiPFviS1_E_block_invoke(uint64_t a1, AriMsg *this, unsigned __int8 *a3)
{
  AriHost *BufCtx;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  BufCtx = (AriHost *)AriMsg::GetBufCtx(this, (const unsigned __int8 *)a3);
  if (ARI_CsiIceFilerWriteRspCb_Extract())
  {
    _KTLErrorPrint((uint64_t)"ICE_FILER_write_block_invoke", (uint64_t)"Error: ICE_FILER_write. Failed ARI_EXTRACT (Remaining=%d/%d)\n", v5, v6, v7, v8, v9, v10, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = -7;
  }
  else
  {
    IceFilerWriteRspCb(-1431655766, BufCtx, v5, v6, v7, v8, v9, v10, v12);
  }
  return 0;
}

intptr_t IceFilerWriteRspCb(int a1, AriHost *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  intptr_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;

  if (!pthread_mutex_lock(&ice_filer_lookup_mutex))
  {
    v17 = qword_253D1A5A8;
    if ((int *)qword_253D1A5A8 == &ice_filer_lookup_head)
    {
LABEL_8:
      pthread_mutex_unlock(&ice_filer_lookup_mutex);
      return _KTLErrorPrint((uint64_t)"IceFilerWriteRspCb", (uint64_t)"Error: IceFilerWriteRspCb. ARI Context ID not on Lookup Table.\n", v20, v21, v22, v23, v24, v25, a9);
    }
    while (*(_DWORD *)v17 != (_DWORD)a2)
    {
      v17 = *(_QWORD *)(v17 + 80);
      if ((int *)v17 == &ice_filer_lookup_head)
        goto LABEL_8;
    }
    pthread_mutex_unlock(&ice_filer_lookup_mutex);
    if (a1)
      goto LABEL_3;
LABEL_10:
    result = *(unsigned int *)(v17 + 32);
    *(_DWORD *)(v17 + 72) = result;
    v19 = *(_QWORD *)(v17 + 16);
    if (*(_QWORD *)(v19 + 8))
      return result;
    goto LABEL_11;
  }
  v17 = 0;
  if (!a1)
    goto LABEL_10;
LABEL_3:
  _KTLErrorPrint((uint64_t)"IceFilerWriteRspCb", (uint64_t)"Error: IceFilerWriteRspCb. Failure from Baseband.\n", v11, v12, v13, v14, v15, v16, v27);
  result = 4294967293;
  *(_DWORD *)(v17 + 72) = -3;
  v19 = *(_QWORD *)(v17 + 16);
  if (*(_QWORD *)(v19 + 8))
    return result;
LABEL_11:
  if (*(_DWORD *)(v19 + 16))
  {
    v26 = *(void (**)(void))(v17 + 56);
    if (v26)
    {
      v26();
      return ICE_FILER_lookup_remove(a2);
    }
    else
    {
      result = *(_QWORD *)(v17 + 64);
      if (result)
        return dispatch_semaphore_signal((dispatch_semaphore_t)result);
    }
  }
  return result;
}

uint64_t ICE_FILER_lookup_remove(AriHost *a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  result = pthread_mutex_lock(&ice_filer_lookup_mutex);
  if ((_DWORD)result)
  {
    if (!(_DWORD)a1)
      return result;
    return AriHost::ExitTrx(a1);
  }
  v3 = qword_253D1A5A8;
  if ((int *)qword_253D1A5A8 != &ice_filer_lookup_head)
  {
    while (*(_DWORD *)v3 != (_DWORD)a1)
    {
      v3 = *(_QWORD *)(v3 + 80);
      if ((int *)v3 == &ice_filer_lookup_head)
        goto LABEL_15;
    }
    if (*(_QWORD *)(v3 + 8))
    {
      v4 = *(void **)(v3 + 24);
      if (v4)
        operator delete[](v4);
    }
    v5 = *(_QWORD *)(v3 + 80);
    *(_QWORD *)(v5 + 88) = *(_QWORD *)(v3 + 88);
    *(_QWORD *)(*(_QWORD *)(v3 + 88) + 80) = v5;
    v6 = *(NSObject **)(v3 + 64);
    if (v6)
      dispatch_release(v6);
    operator delete((void *)v3);
    if ((int *)qword_253D1A5A8 == &ice_filer_lookup_head)
      _KTLDebugFlags = 15;
  }
LABEL_15:
  result = pthread_mutex_unlock(&ice_filer_lookup_mutex);
  if ((_DWORD)a1)
    return AriHost::ExitTrx(a1);
  return result;
}

uint64_t _GLOBAL__sub_I_ice_filer_cpp()
{
  ice_filer_lookup_head = 0;
  qword_253D1A580 = 0;
  dword_253D1A588 = 0;
  qword_253D1A568 = 0;
  unk_253D1A570 = 0;
  qword_253D1A560 = 0;
  dword_253D1A578 = 0;
  qword_253D1A590 = 0;
  unk_253D1A598 = 0;
  dword_253D1A5A0 = 0;
  qword_253D1A5A8 = (uint64_t)&ice_filer_lookup_head;
  unk_253D1A5B0 = &ice_filer_lookup_head;
  return __cxa_atexit((void (*)(void *))ice_filer_lookup_node::~ice_filer_lookup_node, &ice_filer_lookup_head, &dword_21158C000);
}

uint64_t ktl::KTLReceivePacket::fetchARIMsgFromTransport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  if (*(_QWORD *)(a1 + 24))
  {
    _KTLDebugPrint((uint64_t)"fetchARIMsgFromTransport", (uint64_t)"Pulling next message from backlog\n", a3, a4, a5, a6, a7, a8, v26);
    v9 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;
  }
  else
  {
    v10 = operator new(0x30uLL);
    v16 = operator new[](0x7FFFuLL);
    v10[2] = 0x7FFF;
    *((_QWORD *)v10 + 2) = v16;
    *(_QWORD *)v10 = &unk_24CC19598;
    v10[6] = 0x7FFF;
    *((_QWORD *)v10 + 4) = v16;
    *((_QWORD *)v10 + 5) = 0;
    v17 = *(unsigned int *)(a1 + 20);
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 8);
    if (v18)
    {
      v18();
      v12 = 0;
    }
    _KTLDebugPrint((uint64_t)"sKTLPacketCopyReceiveData", (uint64_t)"Receive Data failed.\n", v11, v12, v13, v17, v14, v15, v26);
    (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 8))(v10);
    _KTLErrorPrint((uint64_t)"fetchARIMsgFromTransport", (uint64_t)"Failed initial receive\n", v19, v20, v21, v22, v23, v24, v27);
    return 0;
  }
  return v9;
}

void sub_2115A0318(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2115A0330(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ktl::KTLReceivePacket::setMessageBounds(uint64_t this, unsigned int a2, int a3)
{
  *(_QWORD *)(this + 32) = *(_QWORD *)(this + 16) + a2;
  *(_DWORD *)(this + 8) = a3;
  return this;
}

uint64_t sFetchMessageRemainder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v6;
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
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t (*v24)(uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, _QWORD);
  uint64_t v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  MEMORY[0x24BDAC7A8]();
  if ((_DWORD)v7)
    memset((char *)v26 - ((v6 + 15) & 0x1FFFFFFF0), 170, v6);
  _KTLDebugPrint((uint64_t)"sFetchMessageRemainder", (uint64_t)"Have %u bytes, expect %u more...", v7, v8, v9, v10, v11, v12, *(unsigned int *)(a2 + 8));
  v19 = 0;
  if ((_DWORD)a3)
  {
    v20 = *(_QWORD *)(a1 + 8);
    v21 = *(unsigned int *)(a1 + 20);
    v22 = a3;
    v23 = (char *)v26 - ((v6 + 15) & 0x1FFFFFFF0);
    while (1)
    {
      HIDWORD(v26[0]) = 0;
      v24 = *(uint64_t (**)(uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, _QWORD))(v20 + 8);
      if (!v24 || (v24(v20, v23, v22, (char *)v26 + 4, 1, v21, 0) & 1) == 0)
        break;
      v19 += HIDWORD(v26[0]);
      v23 += HIDWORD(v26[0]);
      v22 = (v22 - HIDWORD(v26[0]));
      if (!(_DWORD)v22)
      {
        if (v19)
        {
          if ((_KTLDebugFlags & 2) != 0)
            off_253D1A548("Rx:", 1, (char *)v26 - ((v6 + 15) & 0x1FFFFFFF0));
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    if (v19 == (_DWORD)a3)
    {
      _KTLDebugPrint((uint64_t)"sFetchMessageRemainder", (uint64_t)"Success\n", v13, v14, v15, v16, v17, v18, v26[0]);
      memcpy((void *)(*(_QWORD *)(a2 + 32) + *(unsigned int *)(a2 + 8)), (char *)v26 - ((v6 + 15) & 0x1FFFFFFF0), v6);
      *(_DWORD *)(a2 + 8) += a3;
      return 1;
    }
  }
  _KTLDebugPrint((uint64_t)"sFetchMessageRemainder", (uint64_t)"Failed receive of remaining packet bytes (expected=%u, actual=%u)\n", v13, v14, v15, v16, v17, v18, a3);
  return 0;
}

void *ktl::KTLReceivePacket::append(ktl::KTLReceivePacket *this, size_t __n, unsigned __int8 *__src)
{
  int v3;
  void *result;

  v3 = __n;
  result = memcpy((void *)(*((_QWORD *)this + 4) + *((unsigned int *)this + 2)), __src, __n);
  *((_DWORD *)this + 2) += v3;
  return result;
}

BOOL KTLBspSetApWakeInterval(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  intptr_t v20;
  uint64_t v22;
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned int v34;

  v2 = *(_DWORD *)(a1 + 16);
  v32 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v24 = 0;
    v33 = 0;
    v34 = v2;
    v28 = 0;
    if (!ARI_CsiIceBspSetApWakeIntervalReq_ENC()
      && (v4 = operator new(0x18uLL),
          v5 = v28,
          v4[2] = v33,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      v6 = v24;
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
      v7 = ARI_CsiIceBspSetApWakeIntervalRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      v8 = v7 == 0;
      v9 = HIDWORD(v32);
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    return !v9 && v8;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1431655766;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = -1;
  v10 = dispatch_semaphore_create(0);
  v11 = v10;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  if (ARI_CsiIceBspSetApWakeIntervalReq_BLK())
  {
    v8 = 0;
    v9 = *((_DWORD *)v29 + 6);
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v20 = dispatch_semaphore_wait(v11, v13);
  if (v20)
    _KTLErrorPrint((uint64_t)"KTLBspSetApWakeInterval", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  if ((_DWORD)v32)
    AriHost::ExitTrx((AriHost *)v32);
  v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    v8 = *((_DWORD *)v25 + 6) == 0;
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v8 = 0;
  v12 = object;
  if (object)
LABEL_22:
    dispatch_release(v12);
LABEL_23:
  if (v11)
    dispatch_release(v11);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_2115A07E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t KTLPing(uint64_t a1, BOOL *a2)
{
  int RestoreOSMode;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_time_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  uint64_t v39;
  dispatch_object_t object;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t *v45;
  std::__shared_weak_count *v46;
  _OWORD v47[4];

  *a2 = 0;
  RestoreOSMode = getRestoreOSMode();
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[2] = v5;
  v47[3] = v5;
  v47[1] = v5;
  v47[0] = v5;
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)v47);
  v45 = 0;
  v46 = 0;
  AriSdk::MsgBase::getRawBytes();
  v12 = *(_QWORD **)(a1 + 8);
  if (!v12 && *(_DWORD *)(a1 + 16))
  {
    v25 = dispatch_semaphore_create(0);
    v26 = v25;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2000000000;
    v44 = 0;
    object = v25;
    if (v25)
      dispatch_retain(v25);
    if (AriHost::Send())
    {
      v24 = 0;
      v27 = object;
      if (!object)
        goto LABEL_22;
    }
    else
    {
      v28 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (dispatch_semaphore_wait(v26, v28))
      {
        _KTLErrorPrint((uint64_t)"KTLPing", (uint64_t)"Timeout waiting for response.\n", v29, v30, v31, v32, v33, v34, v39);
        v24 = 0;
        v27 = object;
        if (!object)
          goto LABEL_22;
      }
      else
      {
        v24 = *((_BYTE *)v42 + 24) != 0;
        v27 = object;
        if (!object)
        {
LABEL_22:
          _Block_object_dispose(&v41, 8);
          if (v26)
            dispatch_release(v26);
          goto LABEL_24;
        }
      }
    }
    dispatch_release(v27);
    goto LABEL_22;
  }
  v13 = *v45;
  v14 = v45[1] - *v45;
  v15 = *(unsigned int *)(a1 + 20);
  LODWORD(v41) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v6, v7, v8, v9, v10, v11, v14);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v13);
  if (*v12
    && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v41, 1, v15, 0), (_DWORD)v41 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
  {
    v41 = 0;
    if (KTLUTACopyReceiveData(a1, &v41))
      v24 = KTLPingParseAndRelease(v41, a2, RestoreOSMode);
    else
      v24 = 0;
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    v24 = 0;
  }
LABEL_24:
  v35 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v37 = __ldaxr(p_shared_owners);
    while (__stlxr(v37 - 1, p_shared_owners));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)v47);
  return v24;
}

void sub_2115A0B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, dispatch_object_t object, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  uint64_t v26;

  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a21, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
      AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)(v26 - 128));
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a21, 8);
    if (!v25)
      goto LABEL_3;
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)(v26 - 128));
  _Unwind_Resume(a1);
}

void sub_2115A0BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)(v17 - 128));
  _Unwind_Resume(a1);
}

void sub_2115A0C78(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLPingParseAndRelease(uint64_t a1, BOOL *a2, int a3)
{
  __int128 v6;
  const unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  BOOL v17;
  _OWORD v18[4];
  _DWORD *v19;

  v19 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18[2] = v6;
  v18[3] = v6;
  v18[0] = v6;
  v18[1] = v6;
  v7 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v18, v7);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v18) == 67600384)
  {
    v14 = "NACK Received\n";
LABEL_5:
    _KTLErrorPrint((uint64_t)"KTLPingParseAndRelease", (uint64_t)v14, v8, v9, v10, v11, v12, v13, *(uint64_t *)&v18[0]);
    v15 = 0;
    goto LABEL_6;
  }
  if (AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v18))
  {
    v14 = "Malformed response\n";
    goto LABEL_5;
  }
  v17 = (*v19 - 3) < 2;
  if (!a3)
    v17 = *v19 == 4;
  *a2 = v17;
  v15 = 1;
LABEL_6:
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCCA4](v18);
  return v15;
}

void __copy_helper_block_e8_32r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  v4 = *(NSObject **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 56);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

BOOL KTLMonMemoryStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  BOOL v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  intptr_t v25;
  uint64_t v26;
  uint64_t v27;
  dispatch_object_t object;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(uint64_t, uint64_t);
  uint64_t (*v33)();
  _QWORD v34[3];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;

  v3 = *(_DWORD *)(a1 + 16);
  v43 = v3;
  if (!a3)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2000000000;
    v42 = -1;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2000000000;
    v38 = -1431655766;
    v29 = 0;
    v30 = &v29;
    v31 = 0x4002000000;
    v32 = __Block_byref_object_copy__6;
    v33 = __Block_byref_object_dispose__6;
    memset(v34, 170, sizeof(v34));
    v14 = dispatch_semaphore_create(0);
    v15 = v14;
    v27 = MEMORY[0x24BDAC760];
    object = v14;
    if (v14)
      dispatch_retain(v14);
    if (ARI_CsiMonMemoryStatusReq_BLK())
    {
      v11 = 0;
      v12 = *((_DWORD *)v36 + 6);
      v16 = v30[7];
      *(_OWORD *)a3 = *(_OWORD *)(v30 + 5);
      *(_QWORD *)(a3 + 16) = v16;
      v17 = object;
      if (!object)
        goto LABEL_25;
    }
    else
    {
      v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v25 = dispatch_semaphore_wait(v15, v18);
      if (v25)
        _KTLErrorPrint((uint64_t)"KTLMonMemoryStatus", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v27);
      if ((_DWORD)v43)
        AriHost::ExitTrx((AriHost *)v43);
      v12 = *((_DWORD *)v36 + 6);
      v26 = v30[7];
      *(_OWORD *)a3 = *(_OWORD *)(v30 + 5);
      *(_QWORD *)(a3 + 16) = v26;
      if (v25)
      {
        v11 = 0;
        v17 = object;
        if (!object)
        {
LABEL_25:
          if (v15)
            dispatch_release(v15);
          _Block_object_dispose(&v29, 8);
          _Block_object_dispose(&v35, 8);
          _Block_object_dispose(&v39, 8);
          return !v12 && v11;
        }
      }
      else
      {
        v11 = *((_DWORD *)v40 + 6) == 0;
        v17 = object;
        if (!object)
          goto LABEL_25;
      }
    }
    dispatch_release(v17);
    goto LABEL_25;
  }
  v39 = 0;
  LODWORD(v35) = v3;
  v44 = 0;
  v29 = 0;
  if (!ARI_CsiMonMemoryStatusReq_ENC()
    && (v7 = operator new(0x18uLL),
        v8 = v29,
        v7[2] = v44,
        *((_QWORD *)v7 + 2) = v8,
        *(_QWORD *)v7 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v7))
    && KTLUTACopyReceiveData(a1, &v39))
  {
    v9 = v39;
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 16))(v39);
    v10 = ARI_CsiMonMemoryStatusRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    v11 = v10 == 0;
    v12 = HIDWORD(v43);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  return !v12 && v11;
}

void sub_2115A1104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  uint64_t v26;

  if (object)
    dispatch_release(object);
  if (v25)
    dispatch_release(v25);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 112), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

BOOL KTLCddGetDebugLog(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  int v3;
  BOOL v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  int v13;
  int v14;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  dispatch_object_t object;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t (*v40)();
  unint64_t v41;
  int v42;
  uint64_t v43;
  int v44;

  v43 = 0;
  v3 = *(_DWORD *)(a1 + 16);
  v42 = v3;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v7 = 1;
  else
    v7 = v3 == 0;
  if (v7)
  {
    v32 = 0;
    LODWORD(v28) = v3;
    v44 = 0;
    v36 = 0;
    if (!ARI_CsiCddGetDebugLogReq_ENC()
      && (v8 = operator new(0x18uLL),
          v9 = v36,
          v8[2] = v44,
          *((_QWORD *)v8 + 2) = v9,
          *(_QWORD *)v8 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v8))
      && KTLUTACopyReceiveData(a1, &v32))
    {
      v10 = v32;
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      v11 = ARI_CsiCddGetDebugLogRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      v12 = v11 == 0;
      v13 = v43;
      v14 = HIDWORD(v43);
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v12 = 0;
    }
    *a3 = 0;
    goto LABEL_24;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3002000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__5;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2000000000;
  v35 = -1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = 0;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (!ARI_CsiCddGetDebugLogReq_BLK())
  {
    v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (!dispatch_semaphore_wait(v17, v18))
    {
      *a3 = *((_DWORD *)v29 + 6);
      v12 = *((_DWORD *)v33 + 6) == 0;
      v13 = *((_DWORD *)v37 + 10);
      v14 = *((_DWORD *)v37 + 11);
      v25 = object;
      if (!object)
        goto LABEL_19;
      goto LABEL_18;
    }
    _KTLErrorPrint((uint64_t)"KTLCddGetDebugLog", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v26);
  }
  v12 = 0;
  *a3 = *((_DWORD *)v29 + 6);
  v13 = *((_DWORD *)v37 + 10);
  v14 = *((_DWORD *)v37 + 11);
  v25 = object;
  if (object)
LABEL_18:
    dispatch_release(v25);
LABEL_19:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_24:
  *a2 = v14;
  return !v13 && v12;
}

void sub_2115A147C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  NSObject *v26;

  if (object)
    dispatch_release(object);
  if (v26)
    dispatch_release(v26);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  return result;
}

BOOL KTLSahGetCrashReport(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  int v3;
  BOOL v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  int v13;
  int v14;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  dispatch_object_t object;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t (*v40)();
  unint64_t v41;
  int v42;
  uint64_t v43;
  int v44;

  v43 = 0;
  v3 = *(_DWORD *)(a1 + 16);
  v42 = v3;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v7 = 1;
  else
    v7 = v3 == 0;
  if (v7)
  {
    v32 = 0;
    LODWORD(v28) = v3;
    v44 = 0;
    v36 = 0;
    if (!ARI_CsiSahGetCrashReportReq_ENC()
      && (v8 = operator new(0x18uLL),
          v9 = v36,
          v8[2] = v44,
          *((_QWORD *)v8 + 2) = v9,
          *(_QWORD *)v8 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v8))
      && KTLUTACopyReceiveData(a1, &v32))
    {
      v10 = v32;
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      v11 = ARI_CsiSahGetCrashReportRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      v12 = v11 == 0;
      v13 = v43;
      v14 = HIDWORD(v43);
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v12 = 0;
    }
    *a3 = 0;
    goto LABEL_24;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3002000000;
  v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__8;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2000000000;
  v35 = -1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = 0;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (!ARI_CsiSahGetCrashReportReq_BLK())
  {
    v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (!dispatch_semaphore_wait(v17, v18))
    {
      *a3 = *((_DWORD *)v29 + 6);
      v12 = *((_DWORD *)v33 + 6) == 0;
      v13 = *((_DWORD *)v37 + 10);
      v14 = *((_DWORD *)v37 + 11);
      v25 = object;
      if (!object)
        goto LABEL_19;
      goto LABEL_18;
    }
    _KTLErrorPrint((uint64_t)"KTLSahGetCrashReport", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v26);
  }
  v12 = 0;
  *a3 = *((_DWORD *)v29 + 6);
  v13 = *((_DWORD *)v37 + 10);
  v14 = *((_DWORD *)v37 + 11);
  v25 = object;
  if (object)
LABEL_18:
    dispatch_release(v25);
LABEL_19:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_24:
  *a2 = v14;
  return !v13 && v12;
}

void sub_2115A1804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  NSObject *v26;

  if (object)
    dispatch_release(object);
  if (v26)
    dispatch_release(v26);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

BOOL KTLCddGetParamDump(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  int v3;
  BOOL v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  int v13;
  int v14;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  dispatch_object_t object;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t (*v40)();
  unint64_t v41;
  int v42;
  uint64_t v43;
  int v44;

  v43 = 0;
  v3 = *(_DWORD *)(a1 + 16);
  v42 = v3;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v7 = 1;
  else
    v7 = v3 == 0;
  if (v7)
  {
    v32 = 0;
    LODWORD(v28) = v3;
    v44 = 0;
    v36 = 0;
    if (!ARI_CsiCddGetParamDumpReq_ENC()
      && (v8 = operator new(0x18uLL),
          v9 = v36,
          v8[2] = v44,
          *((_QWORD *)v8 + 2) = v9,
          *(_QWORD *)v8 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v8))
      && KTLUTACopyReceiveData(a1, &v32))
    {
      v10 = v32;
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      v11 = ARI_CsiCddGetParamDumpRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      v12 = v11 == 0;
      v13 = v43;
      v14 = HIDWORD(v43);
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v12 = 0;
    }
    *a3 = 0;
    goto LABEL_24;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3002000000;
  v39 = __Block_byref_object_copy__10_0;
  v40 = __Block_byref_object_dispose__11_0;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2000000000;
  v35 = -1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = 0;
  v16 = dispatch_semaphore_create(0);
  v17 = v16;
  object = v16;
  if (v16)
    dispatch_retain(v16);
  if (!ARI_CsiCddGetParamDumpReq_BLK())
  {
    v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (!dispatch_semaphore_wait(v17, v18))
    {
      *a3 = *((_DWORD *)v29 + 6);
      v12 = *((_DWORD *)v33 + 6) == 0;
      v13 = *((_DWORD *)v37 + 10);
      v14 = *((_DWORD *)v37 + 11);
      v25 = object;
      if (!object)
        goto LABEL_19;
      goto LABEL_18;
    }
    _KTLErrorPrint((uint64_t)"KTLCddGetParamDump", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v26);
  }
  v12 = 0;
  *a3 = *((_DWORD *)v29 + 6);
  v13 = *((_DWORD *)v37 + 10);
  v14 = *((_DWORD *)v37 + 11);
  v25 = object;
  if (object)
LABEL_18:
    dispatch_release(v25);
LABEL_19:
  if (v17)
    dispatch_release(v17);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
LABEL_24:
  *a2 = v14;
  return !v13 && v12;
}

void sub_2115A1B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  NSObject *v26;

  if (object)
    dispatch_release(object);
  if (v26)
    dispatch_release(v26);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10_0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  return result;
}

BOOL KTLBspSwTrap(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  intptr_t v18;
  _BOOL8 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22[6];
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;

  v2 = *(_DWORD *)(a1 + 16);
  v28 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (!v3)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2000000000;
    v27 = -1;
    v9 = dispatch_semaphore_create(0);
    v10 = v9;
    v22[1] = MEMORY[0x24BDAC760];
    v22[2] = 1174405120;
    v22[3] = (uint64_t)__KTLBspSwTrap_block_invoke;
    v22[4] = (uint64_t)&__block_descriptor_tmp_13;
    v22[5] = (uint64_t)&v24;
    object = v9;
    if (v9)
      dispatch_retain(v9);
    if (ARI_CsiBspSwTrapReq_BLK())
      goto LABEL_18;
    v11 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v18 = dispatch_semaphore_wait(v10, v11);
    if (v18)
      _KTLErrorPrint((uint64_t)"KTLBspSwTrap", (uint64_t)"Timeout waiting for response.\n", v12, v13, v14, v15, v16, v17, v21);
    if (v28)
      AriHost::ExitTrx((AriHost *)v28);
    if (v18)
    {
LABEL_18:
      v19 = 0;
      v20 = object;
      if (!object)
      {
LABEL_20:
        if (v10)
          dispatch_release(v10);
        _Block_object_dispose(&v24, 8);
        return v19;
      }
    }
    else
    {
      v19 = *((_DWORD *)v25 + 6) == 0;
      v20 = object;
      if (!object)
        goto LABEL_20;
    }
    dispatch_release(v20);
    goto LABEL_20;
  }
  v22[0] = 0;
  v29 = 0;
  v30 = v2;
  v24 = 0;
  if (ARI_CsiBspSwTrapReq_ENC())
    return 0;
  v4 = operator new(0x18uLL);
  v5 = v24;
  v4[2] = v29;
  *((_QWORD *)v4 + 2) = v5;
  *(_QWORD *)v4 = &unk_24CC18DE8;
  if (!KTLUTASendAndReleaseData(a1, v4) || !KTLUTACopyReceiveData(a1, v22))
    return 0;
  v6 = v22[0];
  (*(void (**)(uint64_t))(*(_QWORD *)v22[0] + 16))(v22[0]);
  v7 = ARI_CsiBspSwTrapRspCb_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  return v7 == 0;
}

void sub_2115A1E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  NSObject *v17;

  if (object)
  {
    dispatch_release(object);
    if (!v17)
    {
LABEL_3:
      _Block_object_dispose(&a17, 8);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_3;
  }
  dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  v4 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r40c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

BOOL KTLBspDebugJtagMode(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  intptr_t v20;
  uint64_t v22;
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned int v34;

  v2 = *(_DWORD *)(a1 + 16);
  v32 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v24 = 0;
    v33 = 0;
    v34 = v2;
    v28 = 0;
    if (!ARI_CsiBspDebugJtagModeReq_ENC()
      && (v4 = operator new(0x18uLL),
          v5 = v28,
          v4[2] = v33,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      v6 = v24;
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
      v7 = ARI_CsiBspDebugJtagModeRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      v8 = v7 == 0;
      v9 = HIDWORD(v32);
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    return !v9 && v8;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1431655766;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = -1;
  v10 = dispatch_semaphore_create(0);
  v11 = v10;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  if (ARI_CsiBspDebugJtagModeReq_BLK())
  {
    v8 = 0;
    v9 = *((_DWORD *)v29 + 6);
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v20 = dispatch_semaphore_wait(v11, v13);
  if (v20)
    _KTLErrorPrint((uint64_t)"KTLBspDebugJtagMode", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  if ((_DWORD)v32)
    AriHost::ExitTrx((AriHost *)v32);
  v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    v8 = *((_DWORD *)v25 + 6) == 0;
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v8 = 0;
  v12 = object;
  if (object)
LABEL_22:
    dispatch_release(v12);
LABEL_23:
  if (v11)
    dispatch_release(v11);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_2115A2210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

BOOL KTLBspSetNvItemsToState(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  intptr_t v20;
  uint64_t v22;
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned int v34;

  v2 = *(_DWORD *)(a1 + 16);
  v32 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v24 = 0;
    v33 = 0;
    v34 = v2;
    v28 = 0;
    if (!ARI_CsiBspSetNvItemsToStateReq_ENC()
      && (v4 = operator new(0x18uLL),
          v5 = v28,
          v4[2] = v33,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      v6 = v24;
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
      v7 = ARI_CsiBspSetNvItemsToStateRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      v8 = v7 == 0;
      v9 = HIDWORD(v32);
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    return !v9 && v8;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1431655766;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = -1;
  v10 = dispatch_semaphore_create(0);
  v11 = v10;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  if (ARI_CsiBspSetNvItemsToStateReq_BLK())
  {
    v8 = 0;
    v9 = *((_DWORD *)v29 + 6);
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v20 = dispatch_semaphore_wait(v11, v13);
  if (v20)
    _KTLErrorPrint((uint64_t)"KTLBspSetNvItemsToState", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  if ((_DWORD)v32)
    AriHost::ExitTrx((AriHost *)v32);
  v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    v8 = *((_DWORD *)v25 + 6) == 0;
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v8 = 0;
  v12 = object;
  if (object)
LABEL_22:
    dispatch_release(v12);
LABEL_23:
  if (v11)
    dispatch_release(v11);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_2115A2514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

BOOL KTLBspShutdown(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  intptr_t v18;
  _BOOL8 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22[6];
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;

  v2 = *(_DWORD *)(a1 + 16);
  v28 = v2;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (!v3)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2000000000;
    v27 = -1;
    v9 = dispatch_semaphore_create(0);
    v10 = v9;
    v22[1] = MEMORY[0x24BDAC760];
    v22[2] = 1174405120;
    v22[3] = (uint64_t)__KTLBspShutdown_block_invoke;
    v22[4] = (uint64_t)&__block_descriptor_tmp_16;
    v22[5] = (uint64_t)&v24;
    object = v9;
    if (v9)
      dispatch_retain(v9);
    if (ARI_CsiBspShutdownReq_BLK())
      goto LABEL_18;
    v11 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v18 = dispatch_semaphore_wait(v10, v11);
    if (v18)
      _KTLErrorPrint((uint64_t)"KTLBspShutdown", (uint64_t)"Timeout waiting for response.\n", v12, v13, v14, v15, v16, v17, v21);
    if (v28)
      AriHost::ExitTrx((AriHost *)v28);
    if (v18)
    {
LABEL_18:
      v19 = 0;
      v20 = object;
      if (!object)
      {
LABEL_20:
        if (v10)
          dispatch_release(v10);
        _Block_object_dispose(&v24, 8);
        return v19;
      }
    }
    else
    {
      v19 = *((_DWORD *)v25 + 6) == 0;
      v20 = object;
      if (!object)
        goto LABEL_20;
    }
    dispatch_release(v20);
    goto LABEL_20;
  }
  v22[0] = 0;
  v29 = 0;
  v30 = v2;
  v24 = 0;
  if (ARI_CsiBspShutdownReq_ENC())
    return 0;
  v4 = operator new(0x18uLL);
  v5 = v24;
  v4[2] = v29;
  *((_QWORD *)v4 + 2) = v5;
  *(_QWORD *)v4 = &unk_24CC18DE8;
  if (!KTLUTASendAndReleaseData(a1, v4) || !KTLUTACopyReceiveData(a1, v22))
    return 0;
  v6 = v22[0];
  (*(void (**)(uint64_t))(*(_QWORD *)v22[0] + 16))(v22[0]);
  v7 = ARI_CsiBspShutdownRspCb_Extract();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  return v7 == 0;
}

void sub_2115A27E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  NSObject *v17;

  if (object)
  {
    dispatch_release(object);
    if (!v17)
    {
LABEL_3:
      _Block_object_dispose(&a17, 8);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_3;
  }
  dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

BOOL KTLSysGetInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  BOOL v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  intptr_t v25;
  BOOL v26;
  NSObject *v27;
  uint64_t v29[7];
  dispatch_object_t object;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;

  if (!a3)
  {
    _KTLErrorPrint((uint64_t)"KTLSysGetInfo", (uint64_t)"System Information Parameter is missing.\n", 0, a4, a5, a6, a7, a8, v29[0]);
    return 0;
  }
  v10 = *(_DWORD *)(a1 + 16);
  v35 = v10;
  if (*(_QWORD *)(a1 + 8))
    v11 = 1;
  else
    v11 = v10 == 0;
  if (!v11)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2000000000;
    v34 = -1;
    v16 = dispatch_semaphore_create(0);
    v17 = v16;
    v29[1] = MEMORY[0x24BDAC760];
    v29[2] = 1174405120;
    v29[3] = (uint64_t)__KTLSysGetInfo_block_invoke;
    v29[4] = (uint64_t)&__block_descriptor_tmp_18_2;
    v29[5] = (uint64_t)&v31;
    v29[6] = a3;
    object = v16;
    if (v16)
      dispatch_retain(v16);
    if (ARI_CsiSysGetInfoReqV2_BLK())
      goto LABEL_21;
    v18 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v25 = dispatch_semaphore_wait(v17, v18);
    if (v25)
      _KTLErrorPrint((uint64_t)"KTLSysGetInfo", (uint64_t)"Timeout waiting for response.\n", v19, v20, v21, v22, v23, v24, v29[0]);
    if (v35)
      AriHost::ExitTrx((AriHost *)v35);
    if (v25)
    {
LABEL_21:
      v26 = 0;
      v27 = object;
      if (!object)
        goto LABEL_23;
    }
    else
    {
      v26 = *((_DWORD *)v32 + 6) == 0;
      v27 = object;
      if (!object)
      {
LABEL_23:
        if (v17)
          dispatch_release(v17);
        _Block_object_dispose(&v31, 8);
        if (v26)
          return *(_DWORD *)(a3 + 516) == 0;
        return 0;
      }
    }
    dispatch_release(v27);
    goto LABEL_23;
  }
  v29[0] = 0;
  v36 = 0;
  v37 = v10;
  v31 = 0;
  if (!ARI_CsiSysGetInfoReqV2_ENC())
  {
    v12 = operator new(0x18uLL);
    v13 = v31;
    v12[2] = v36;
    *((_QWORD *)v12 + 2) = v13;
    *(_QWORD *)v12 = &unk_24CC18DE8;
    if (KTLUTASendAndReleaseData(a1, v12))
    {
      if ((KTLUTACopyReceiveData(a1, v29) & 1) != 0)
      {
        v14 = v29[0];
        (*(void (**)(uint64_t))(*(_QWORD *)v29[0] + 16))(v29[0]);
        v15 = ARI_CsiSysGetInfoRspCbV2_Extract();
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
        if (!v15)
          return *(_DWORD *)(a3 + 516) == 0;
      }
    }
  }
  return 0;
}

void sub_2115A2AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17)
{
  NSObject *v17;

  if (object)
  {
    dispatch_release(object);
    if (!v17)
    {
LABEL_3:
      _Block_object_dispose(&a17, 8);
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_3;
  }
  dispatch_release(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r48c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  v4 = *(NSObject **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r48c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 48);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

BOOL KTLBspGetCalibrationStatus(uint64_t a1, _DWORD *a2)
{
  unsigned int v2;
  BOOL v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  intptr_t v24;
  uint64_t v25;
  dispatch_object_t object;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  int v41;

  v40 = 0;
  v2 = *(_DWORD *)(a1 + 16);
  v39 = v2;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v5 = 1;
  else
    v5 = v2 == 0;
  if (!v5)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2000000000;
    v38 = -1431655766;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2000000000;
    v34 = -1431655766;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2000000000;
    v30 = -1;
    v14 = dispatch_semaphore_create(0);
    v15 = v14;
    v25 = MEMORY[0x24BDAC760];
    object = v14;
    if (v14)
      dispatch_retain(v14);
    if (ARI_CsiBspGetCalibrationStatusReq_BLK())
    {
      v10 = 0;
      v11 = *((_DWORD *)v36 + 6);
      v12 = *((_DWORD *)v32 + 6);
      v16 = object;
      if (!object)
        goto LABEL_25;
    }
    else
    {
      v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v24 = dispatch_semaphore_wait(v15, v17);
      if (v24)
        _KTLErrorPrint((uint64_t)"KTLBspGetCalibrationStatus", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v25);
      if (v39)
        AriHost::ExitTrx((AriHost *)v39);
      v11 = *((_DWORD *)v36 + 6);
      v12 = *((_DWORD *)v32 + 6);
      if (v24)
      {
        v10 = 0;
        v16 = object;
        if (!object)
        {
LABEL_25:
          if (v15)
            dispatch_release(v15);
          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v35, 8);
          goto LABEL_28;
        }
      }
      else
      {
        v10 = *((_DWORD *)v28 + 6) == 0;
        v16 = object;
        if (!object)
          goto LABEL_25;
      }
    }
    dispatch_release(v16);
    goto LABEL_25;
  }
  v31 = 0;
  LODWORD(v27) = v2;
  v41 = 0;
  v35 = 0;
  if (!ARI_CsiBspGetCalibrationStatusReq_ENC()
    && (v6 = operator new(0x18uLL),
        v7 = v35,
        v6[2] = v41,
        *((_QWORD *)v6 + 2) = v7,
        *(_QWORD *)v6 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v6))
    && KTLUTACopyReceiveData(a1, &v31))
  {
    v8 = v31;
    (*(void (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
    v9 = ARI_CsiBspGetCalibrationStatusRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    v10 = v9 == 0;
    v12 = v40;
    v11 = HIDWORD(v40);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v10 = 0;
  }
LABEL_28:
  *a2 = v12;
  return !v11 && v10;
}

void sub_2115A2EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;
  uint64_t v22;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL KTLBspStateGet(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v3;
  BOOL v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  intptr_t v24;
  uint64_t v25;
  dispatch_object_t object;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;

  v3 = *(_DWORD *)(a1 + 16);
  v39 = v3;
  v40 = -1;
  if (!a3)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2000000000;
    v38 = -1431655766;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2000000000;
    v34 = -1;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2000000000;
    v30 = -1431655766;
    v14 = dispatch_semaphore_create(0);
    v15 = v14;
    v25 = MEMORY[0x24BDAC760];
    object = v14;
    if (v14)
      dispatch_retain(v14);
    if (ARI_CsiBspStateGetReq_BLK())
    {
      v11 = 0;
      v12 = *((_DWORD *)v36 + 6);
      *a3 = *((_DWORD *)v28 + 6);
      v16 = object;
      if (!object)
        goto LABEL_25;
    }
    else
    {
      v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v24 = dispatch_semaphore_wait(v15, v17);
      if (v24)
        _KTLErrorPrint((uint64_t)"KTLBspStateGet", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v25);
      if (v39)
        AriHost::ExitTrx((AriHost *)v39);
      v12 = *((_DWORD *)v36 + 6);
      *a3 = *((_DWORD *)v28 + 6);
      if (v24)
      {
        v11 = 0;
        v16 = object;
        if (!object)
        {
LABEL_25:
          if (v15)
            dispatch_release(v15);
          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&v35, 8);
          return !v12 && v11;
        }
      }
      else
      {
        v11 = *((_DWORD *)v32 + 6) == 0;
        v16 = object;
        if (!object)
          goto LABEL_25;
      }
    }
    dispatch_release(v16);
    goto LABEL_25;
  }
  v31 = 0;
  LODWORD(v27) = v3;
  v41 = 0;
  v35 = 0;
  if (!ARI_CsiBspStateGetReq_ENC()
    && (v7 = operator new(0x18uLL),
        v8 = v35,
        v7[2] = v41,
        *((_QWORD *)v7 + 2) = v8,
        *(_QWORD *)v7 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v7))
    && KTLUTACopyReceiveData(a1, &v31))
  {
    v9 = v31;
    (*(void (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
    v10 = ARI_CsiBspStateGetRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    v11 = v10 == 0;
    v12 = v40;
  }
  else
  {
    v11 = 0;
    v12 = -1;
  }
  return !v12 && v11;
}

void sub_2115A321C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;
  uint64_t v22;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL KTLBspStateSet(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  intptr_t v20;
  uint64_t v22;
  dispatch_object_t object;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  unsigned int v35;

  v2 = *(_DWORD *)(a1 + 16);
  v32 = v2;
  v33 = -1;
  if (*(_QWORD *)(a1 + 8))
    v3 = 1;
  else
    v3 = v2 == 0;
  if (v3)
  {
    v24 = 0;
    v34 = 0;
    v35 = v2;
    v28 = 0;
    if (!ARI_CsiBspStateSetReq_ENC()
      && (v4 = operator new(0x18uLL),
          v5 = v28,
          v4[2] = v34,
          *((_QWORD *)v4 + 2) = v5,
          *(_QWORD *)v4 = &unk_24CC18DE8,
          KTLUTASendAndReleaseData(a1, v4))
      && KTLUTACopyReceiveData(a1, &v24))
    {
      v6 = v24;
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
      v7 = ARI_CsiBspStateSetRspCb_Extract();
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      v8 = v7 == 0;
      v9 = v33;
    }
    else
    {
      v8 = 0;
      v9 = -1;
    }
    return !v9 && v8;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1431655766;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = -1;
  v10 = dispatch_semaphore_create(0);
  v11 = v10;
  object = v10;
  if (v10)
    dispatch_retain(v10);
  if (ARI_CsiBspStateSetReq_BLK())
  {
    v8 = 0;
    v9 = *((_DWORD *)v29 + 6);
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v13 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  v20 = dispatch_semaphore_wait(v11, v13);
  if (v20)
    _KTLErrorPrint((uint64_t)"KTLBspStateSet", (uint64_t)"Timeout waiting for response.\n", v14, v15, v16, v17, v18, v19, v22);
  if (v32)
    AriHost::ExitTrx((AriHost *)v32);
  v9 = *((_DWORD *)v29 + 6);
  if (!v20)
  {
    v8 = *((_DWORD *)v25 + 6) == 0;
    v12 = object;
    if (!object)
      goto LABEL_23;
    goto LABEL_22;
  }
  v8 = 0;
  v12 = object;
  if (object)
LABEL_22:
    dispatch_release(v12);
LABEL_23:
  if (v11)
    dispatch_release(v11);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return !v9 && v8;
}

void sub_2115A3540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t KTLBspIceAtStringWrite(uint64_t a1, uint64_t a2)
{
  _DWORD *v4;

  if (!a2)
    return 0;
  *(_DWORD *)(a2 + 3076) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(a2 + 3080) = 1;
  if (ARI_CsiIceAtExtReq_ENC())
    return 0;
  v4 = operator new(0x18uLL);
  v4[2] = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = &unk_24CC18DE8;
  return KTLUTASendAndReleaseData(a1, v4);
}

BOOL KTLBspIceAtString()
{
  uint64_t v0;
  FILE *v1;
  FILE *v2;
  _DWORD *v3;
  const void *v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  BOOL v8;
  dispatch_time_t v9;
  char v10;
  NSObject *v11;
  __int128 v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  size_t v30;
  size_t v31;
  dispatch_time_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  intptr_t v39;
  AriHost *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  _BYTE v51[4];
  int v52;
  _OWORD __src[193];
  _QWORD __b[391];
  uint64_t __dst;
  uint64_t *p_dst;
  uint64_t v57;
  int v58;
  uint64_t v59;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v59 = *MEMORY[0x24BDAC8D0];
  v52 = 0;
  v7 = *(_DWORD *)(v0 + 16);
  v6 = *(_DWORD *)(v0 + 20);
  v3[769] = v6;
  v3[770] = 1;
  if (*(_QWORD *)(v0 + 8))
    v8 = 1;
  else
    v8 = v7 == 0;
  if (v8)
  {
    v47 = 0;
    memset(__b, 170, 0xC0CuLL);
    bzero(__src, 0xC0CuLL);
    v9 = dispatch_time(0, 1000000 * v6);
    LODWORD(v43) = v7;
    __dst = 0;
    if (ARI_CsiIceAtExtReq_ENC())
    {
      v10 = 0;
    }
    else
    {
      v17 = operator new(0x18uLL);
      v18 = __dst;
      v17[2] = 0;
      *((_QWORD *)v17 + 2) = v18;
      *(_QWORD *)v17 = &unk_24CC18DE8;
      v10 = KTLUTASendAndReleaseData(v5, v17);
    }
    while (1)
    {
      if ((v10 & 1) == 0)
      {
LABEL_38:
        v15 = 0;
        return !v52 && v15;
      }
      if (KTLUTACopyReceiveData(v5, &v47))
      {
        v19 = v47;
        (*(void (**)(uint64_t))(*(_QWORD *)v47 + 16))(v47);
        v20 = ARI_CsiIceAtExtRsp_Extract();
        (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
        v10 = v20 == 0;
        if (!(v20 | v52))
        {
          v26 = LODWORD(__b[384]);
          if (LODWORD(__b[384]))
          {
            v27 = 0;
            do
            {
              if (!*((_BYTE *)__b + v27))
              {
                _KTLDebugPrint((uint64_t)"KTLBspIceAtString", (uint64_t)"Embedded null found in AT response at buffer offset %u\n", v26, v21, v22, v23, v24, v25, v27);
                *((_BYTE *)__b + v27) = 32;
                v26 = LODWORD(__b[384]);
              }
              ++v27;
            }
            while (v27 < v26);
          }
          else
          {
            v26 = 0;
          }
          fwrite(__b, 1uLL, v26, v2);
          fflush(v2);
          __dst = 0;
          p_dst = 0;
          v28 = LODWORD(__src[192]);
          if (LODWORD(__src[192]) <= 7)
          {
            memcpy(&__dst, __src, LODWORD(__src[192]));
          }
          else
          {
            __dst = *(_QWORD *)&v51[LODWORD(__src[192])];
            v28 = 8;
          }
          v29 = (char *)&__dst + v28;
          v30 = LODWORD(__b[384]);
          if (LODWORD(__b[384]) >= 8)
            v31 = 8;
          else
            v31 = LODWORD(__b[384]);
          memcpy(v29, __b, v31);
          if (strnstr((const char *)__b, "\r\nOK\r\n", v30)
            || strnstr((const char *)__b, "\r\nERROR\r\n", LODWORD(__b[384]))
            || strnstr((const char *)&__dst, "\r\nOK\r\n", 0x10uLL)
            || strnstr((const char *)&__dst, "\r\nERROR\r\n", 0x10uLL))
          {
            v15 = 1;
            return !v52 && v15;
          }
          memcpy(__src, __b, 0xC0CuLL);
          v10 = 1;
        }
      }
      else
      {
        v10 = 0;
      }
      if (dispatch_time(0, 0) > v9)
        goto LABEL_38;
    }
  }
  __dst = 0;
  p_dst = &__dst;
  v57 = 0x2000000000;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2000000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2000000000;
  v46 = -1;
  __b[0] = 0;
  __b[1] = __b;
  __b[2] = 0xC3802000000;
  __b[3] = __Block_byref_object_copy__22;
  __b[4] = __Block_byref_object_dispose__23;
  bzero(&__b[5], 0xC0CuLL);
  v11 = dispatch_semaphore_create(0);
  *(_QWORD *)&__src[4] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src[2] = v12;
  __src[3] = v12;
  __src[0] = v12;
  __src[1] = v12;
  AriSdk::ARI_CsiIceAtExtReq_SDK::ARI_CsiIceAtExtReq_SDK((AriSdk::ARI_CsiIceAtExtReq_SDK *)__src);
  v13 = operator new(0xC0CuLL);
  memcpy(v13, v4, 0xC0CuLL);
  v14 = *(void **)&__src[4];
  *(_QWORD *)&__src[4] = v13;
  if (v14)
    operator delete(v14);
  AriSdk::MsgBase::getRawBytes();
  if (v11)
    dispatch_retain(v11);
  if (AriHost::StartStream())
  {
    v15 = 0;
    v52 = *((_DWORD *)v48 + 6);
    v16 = v11;
    if (!v11)
      goto LABEL_46;
    goto LABEL_45;
  }
  v32 = dispatch_time(0, 1000000 * *(unsigned int *)(v5 + 20));
  v39 = dispatch_semaphore_wait(v11, v32);
  if (v39)
    _KTLErrorPrint((uint64_t)"KTLBspIceAtString", (uint64_t)"Timeout waiting for response.\n", v33, v34, v35, v36, v37, v38, v42);
  v40 = (AriHost *)*((unsigned int *)p_dst + 6);
  if ((_DWORD)v40)
    AriHost::EndStream(v40);
  v52 = *((_DWORD *)v48 + 6);
  if (!v39)
  {
    v15 = *((_DWORD *)v44 + 6) == 0;
    v16 = v11;
    if (!v11)
      goto LABEL_46;
    goto LABEL_45;
  }
  v15 = 0;
  v16 = v11;
  if (v11)
LABEL_45:
    dispatch_release(v16);
LABEL_46:
  MEMORY[0x212BDC860](__src);
  if (v11)
    dispatch_release(v11);
  _Block_object_dispose(__b, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&__dst, 8);
  return !v52 && v15;
}

void sub_2115A3C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,NSObject *object,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  NSObject *v33;
  uint64_t v34;

  if (object)
    dispatch_release(object);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  MEMORY[0x212BDC860](&a33);
  if (v33)
    dispatch_release(v33);
  _Block_object_dispose(&STACK[0xCD0], 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 40), (const void *)(a2 + 40), 0xC0CuLL);
}

void __copy_helper_block_e8_32r40r48r56r72c25_ZTSN8dispatch9semaphoreE(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  _Block_object_assign(a1 + 6, *(const void **)(a2 + 48), 8);
  _Block_object_assign(a1 + 7, *(const void **)(a2 + 56), 8);
  v4 = *(NSObject **)(a2 + 72);
  a1[9] = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r40r48r56r72c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

BOOL KTLGetIMEIInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v11;
  _DWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  _BOOL8 v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  dispatch_time_t v42;
  NSObject *v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  uint64_t v48;
  dispatch_object_t object;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  std::__shared_weak_count *v55;
  _OWORD v56[4];
  void *__p;

  if (!a1 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfo", (uint64_t)"opt(%p) or respParam(%p) is NULL\n", a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v56[2] = v11;
  v56[3] = v11;
  v56[0] = v11;
  v56[1] = v11;
  AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::ARI_CsiMsCpsReadImeiReq_SDK((AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *)v56);
  v12 = operator new(4uLL);
  *v12 = a2;
  v13 = __p;
  __p = v12;
  if (v13)
    operator delete(v13);
  v54 = 0;
  v55 = 0;
  AriSdk::MsgBase::getRawBytes();
  v20 = *(_QWORD **)(a1 + 8);
  if (v20 || !*(_DWORD *)(a1 + 16))
  {
    v21 = *v54;
    v22 = v54[1] - *v54;
    v23 = *(unsigned int *)(a1 + 20);
    LODWORD(v50) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v14, v15, v16, v17, v18, v19, v22);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v21);
    if (*v20
      && ((v30 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v20)(v20, v21, v22, &v50, 1, v23, 0), (_DWORD)v50 == (_DWORD)v22)? (v31 = v30): (v31 = 0), (v31 & 1) != 0))
    {
      v50 = 0;
      if (KTLUTACopyReceiveData(a1, &v50))
        v32 = KTLGetIMEIInfoParseAndRelease(v50, a3);
      else
        v32 = 0;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v24, v25, v26, v27, v28, v29, v22);
      v32 = 0;
    }
    goto LABEL_29;
  }
  v33 = dispatch_semaphore_create(0);
  v34 = v33;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2000000000;
  v53 = 0;
  object = v33;
  if (v33)
    dispatch_retain(v33);
  if (AriHost::Send())
  {
    v41 = "Failed to send the message of CsiMsCpsReadImeiReq.\n";
    goto LABEL_25;
  }
  v42 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v34, v42))
  {
    v41 = "Timeout waiting for response.\n";
LABEL_25:
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfo", (uint64_t)v41, v35, v36, v37, v38, v39, v40, v48);
    v32 = 0;
    v43 = object;
    if (!object)
      goto LABEL_27;
    goto LABEL_26;
  }
  v32 = *((_BYTE *)v51 + 24) != 0;
  v43 = object;
  if (object)
LABEL_26:
    dispatch_release(v43);
LABEL_27:
  _Block_object_dispose(&v50, 8);
  if (v34)
    dispatch_release(v34);
LABEL_29:
  v44 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v46 = __ldaxr(p_shared_owners);
    while (__stlxr(v46 - 1, p_shared_owners));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  MEMORY[0x212BDC8F0](v56);
  return v32;
}

void sub_2115A4320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a19, 8);
  if (v25)
  {
    dispatch_release(v25);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
    MEMORY[0x212BDC8F0](&a25);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x212BDC8F0](&a25);
  _Unwind_Resume(a1);
}

void sub_2115A4430(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetIMEIInfoParseAndRelease(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  const unsigned __int8 *v5;
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
  int v18;
  uint64_t v19;
  _OWORD v21[4];
  __int128 v22;
  __int128 v23;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v4;
  v23 = v4;
  v21[2] = v4;
  v21[3] = v4;
  v21[0] = v4;
  v21[1] = v4;
  v5 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK((AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)v21, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v21) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfoParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v21[0]);
  v18 = AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::unpack((AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *)v21);
  if (v18)
  {
    _KTLErrorPrint((uint64_t)"KTLGetIMEIInfoParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v21[0]);
  }
  else
  {
    v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 16);
    *(_OWORD *)a2 = **((_OWORD **)&v22 + 1);
    *(_QWORD *)(a2 + 16) = v19;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCA58](v21);
  return v18 == 0;
}

BOOL KTLGetMEIDInfo(uint64_t a1, int a2, uint64_t a3)
{
  unsigned int v5;
  BOOL v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BOOL8 v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  intptr_t v24;
  uint64_t v25;
  uint64_t v26;
  dispatch_object_t object;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32[3];
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  __n128 (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)();
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 16);
  v34 = v5;
  v35 = a2;
  if (*(_QWORD *)(a1 + 8))
    v6 = 1;
  else
    v6 = v5 == 0;
  if (v6)
  {
    v32[0] = 0;
    LODWORD(v28) = v5;
    v36 = 0;
    v37 = 0;
    if (ARI_CsiMsCpsReadMeidReq_ENC())
      return 0;
    v7 = operator new(0x18uLL);
    v8 = v37;
    v7[2] = v36;
    *((_QWORD *)v7 + 2) = v8;
    *(_QWORD *)v7 = &unk_24CC18DE8;
    if (!KTLUTASendAndReleaseData(a1, v7) || !KTLUTACopyReceiveData(a1, v32))
      return 0;
    v9 = v32[0];
    (*(void (**)(uint64_t))(*(_QWORD *)v32[0] + 16))(v32[0]);
    v10 = ARI_CsiMsCpsReadMeidRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    return v10 == 0;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x4002000000;
  v40 = __Block_byref_object_copy__31;
  v41 = __Block_byref_object_dispose__32;
  memset(v42, 170, 24);
  v32[0] = 0;
  v32[1] = (uint64_t)v32;
  v32[2] = 0x2000000000;
  v33 = -1431655766;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1;
  v12 = dispatch_semaphore_create(0);
  v13 = v12;
  object = v12;
  if (v12)
    dispatch_retain(v12);
  if (!ARI_CsiMsCpsReadMeidReq_BLK())
  {
    v17 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    v24 = dispatch_semaphore_wait(v13, v17);
    if (v24)
      _KTLErrorPrint((uint64_t)"KTLGetMEIDInfo", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v26);
    if (v34)
      AriHost::ExitTrx((AriHost *)v34);
    v25 = v38[7];
    *(_OWORD *)a3 = *(_OWORD *)(v38 + 5);
    *(_QWORD *)(a3 + 16) = v25;
    if (v24)
    {
      v11 = 0;
      v15 = object;
      if (!object)
        goto LABEL_15;
    }
    else
    {
      v11 = *((_DWORD *)v29 + 6) == 0;
      v15 = object;
      if (!object)
        goto LABEL_15;
    }
    goto LABEL_14;
  }
  v11 = 0;
  v14 = v38[7];
  *(_OWORD *)a3 = *(_OWORD *)(v38 + 5);
  *(_QWORD *)(a3 + 16) = v14;
  v15 = object;
  if (object)
LABEL_14:
    dispatch_release(v15);
LABEL_15:
  if (v13)
    dispatch_release(v13);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v37, 8);
  return v11;
}

void sub_2115A4864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, dispatch_object_t object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  NSObject *v22;
  uint64_t v23;

  if (object)
    dispatch_release(object);
  if (v22)
    dispatch_release(v22);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v23 - 136), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__31(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

unint64_t KTLBmmProvideBootTimeInfo(uint64_t a1, _DWORD *a2)
{
  unint64_t v2;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  NSObject *v36;
  dispatch_time_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  dispatch_object_t object;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t *v50;
  std::__shared_weak_count *v51;
  _OWORD v52[4];

  v2 = (unint64_t)a2;
  if (a2)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v52[2] = v4;
    v52[3] = v4;
    v52[0] = v4;
    v52[1] = v4;
    AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::ARI_CsiBmmProvideBootTimeInfoReq_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *)v52);
    v50 = 0;
    v51 = 0;
    AriSdk::MsgBase::getRawBytes();
    v11 = *(_QWORD **)(a1 + 8);
    if (v11 || !*(_DWORD *)(a1 + 16))
    {
      v12 = *v50;
      v13 = v50[1] - *v50;
      v14 = *(unsigned int *)(a1 + 20);
      LODWORD(v46) = 0;
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, v13);
      if ((_KTLDebugFlags & 2) != 0)
        off_253D1A548("Tx:", 0, v12);
      if (!*v11
        || ((v21 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v11)(v11, v12, v13, &v46, 1, v14, 0), (_DWORD)v46 == (_DWORD)v13)? (v22 = v21): (v22 = 0), (v22 & 1) == 0))
      {
        _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v15, v16, v17, v18, v19, v20, v13);
        goto LABEL_14;
      }
      v46 = 0;
      if (!KTLUTACopyReceiveData(a1, &v46) || !KTLBmmProvideBootTimeInfoParseAndRelease(v46, (void *)v2))
      {
LABEL_14:
        v2 = 0;
        v23 = v51;
        if (!v51)
        {
LABEL_19:
          AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::~ARI_CsiBmmProvideBootTimeInfoReq_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *)v52);
          return v2;
        }
LABEL_15:
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v25 = __ldaxr(p_shared_owners);
        while (__stlxr(v25 - 1, p_shared_owners));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
        goto LABEL_19;
      }
LABEL_34:
      if (!*(_DWORD *)(v2 + 3600))
      {
        v2 = *(_DWORD *)(v2 + 3604) == 0;
        v23 = v51;
        if (!v51)
          goto LABEL_19;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    v27 = dispatch_semaphore_create(0);
    v28 = v27;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2000000000;
    v49 = 0;
    object = v27;
    if (v27)
      dispatch_retain(v27);
    if (AriHost::Send())
    {
      _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfo", (uint64_t)"Failed to send the message of CsiBmmProvideBootTimeInfoReq.\n", v29, v30, v31, v32, v33, v34, v44);
      v35 = 0;
      v36 = object;
      if (!object)
        goto LABEL_27;
      goto LABEL_26;
    }
    v37 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v28, v37))
    {
      _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfo", (uint64_t)"Timeout waiting for response.\n", v38, v39, v40, v41, v42, v43, v44);
      v35 = 0;
      v36 = object;
      if (!object)
        goto LABEL_27;
    }
    else
    {
      v35 = *((_BYTE *)v47 + 24) != 0;
      v36 = object;
      if (!object)
      {
LABEL_27:
        _Block_object_dispose(&v46, 8);
        if (v28)
        {
          dispatch_release(v28);
          if (!v35)
            goto LABEL_14;
        }
        else if (!v35)
        {
          goto LABEL_14;
        }
        goto LABEL_34;
      }
    }
LABEL_26:
    dispatch_release(v36);
    goto LABEL_27;
  }
  return v2;
}

void sub_2115A4C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a19, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
      AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::~ARI_CsiBmmProvideBootTimeInfoReq_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *)&a25);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a19, 8);
    if (!v25)
      goto LABEL_3;
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::~ARI_CsiBmmProvideBootTimeInfoReq_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *)&a25);
  _Unwind_Resume(a1);
}

void sub_2115A4C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v16;
  va_list va;
  uint64_t v18;
  va_list va1;

  va_start(va1, a15);
  va_start(va, a15);
  v16 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::~ARI_CsiBmmProvideBootTimeInfoReq_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *)va1);
  _Unwind_Resume(a1);
}

void sub_2115A4D48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLBmmProvideBootTimeInfoParseAndRelease(uint64_t a1, void *a2)
{
  __int128 v4;
  const unsigned __int8 *v5;
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
  int v18;
  _OWORD v20[4];
  void *__src[2];
  __int128 v22;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__src = v4;
  v22 = v4;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  v5 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK((AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfoParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  v18 = AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::unpack((AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *)v20);
  if (v18)
    _KTLErrorPrint((uint64_t)"KTLBmmProvideBootTimeInfoParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  else
    memcpy(a2, __src[0], 0xE1CuLL);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCD7C](v20);
  return v18 == 0;
}

uint64_t KTLTriggerDelayedResponse(uint64_t a1, int a2)
{
  __int128 v4;
  _DWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_time_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  uint64_t v40;
  dispatch_object_t object;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t *v46;
  std::__shared_weak_count *v47;
  _OWORD v48[4];
  void *__p;

  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v48[2] = v4;
  v48[3] = v4;
  v48[0] = v4;
  v48[1] = v4;
  AriSdk::ARI_CsiDelayedOutstandingReq_SDK::ARI_CsiDelayedOutstandingReq_SDK((AriSdk::ARI_CsiDelayedOutstandingReq_SDK *)v48);
  v5 = operator new(4uLL);
  *v5 = a2;
  v6 = __p;
  __p = v5;
  if (v6)
    operator delete(v6);
  v46 = 0;
  v47 = 0;
  AriSdk::MsgBase::getRawBytes();
  v13 = *(_QWORD **)(a1 + 8);
  if (v13 || !*(_DWORD *)(a1 + 16))
  {
    v14 = *v46;
    v15 = v46[1] - *v46;
    v16 = *(unsigned int *)(a1 + 20);
    LODWORD(v42) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v7, v8, v9, v10, v11, v12, v15);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v14);
    if (*v13
      && ((v23 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v13)(v13, v14, v15, &v42, 1, v16, 0), (_DWORD)v42 == (_DWORD)v15)? (v24 = v23): (v24 = 0), (v24 & 1) != 0))
    {
      v42 = 0;
      if (KTLUTACopyReceiveData(a1, &v42))
      {
        v25 = KTLTriggerDelayedResponseParseAndRelease(v42);
        v26 = v47;
        if (!v47)
          goto LABEL_29;
      }
      else
      {
        v25 = 0;
        v26 = v47;
        if (!v47)
          goto LABEL_29;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v17, v18, v19, v20, v21, v22, v15);
      v25 = 0;
      v26 = v47;
      if (!v47)
        goto LABEL_29;
    }
    goto LABEL_25;
  }
  v27 = dispatch_semaphore_create(0);
  v28 = v27;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2000000000;
  v45 = 0;
  object = v27;
  if (v27)
    dispatch_retain(v27);
  AriHost::Send();
  v29 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v28, v29))
  {
    _KTLErrorPrint((uint64_t)"KTLTriggerDelayedResponse", (uint64_t)"Timeout waiting for response.\n", v30, v31, v32, v33, v34, v35, v40);
    v25 = 0;
    v36 = object;
    if (!object)
      goto LABEL_22;
    goto LABEL_21;
  }
  v25 = *((_BYTE *)v43 + 24) != 0;
  v36 = object;
  if (object)
LABEL_21:
    dispatch_release(v36);
LABEL_22:
  _Block_object_dispose(&v42, 8);
  if (v28)
    dispatch_release(v28);
  v26 = v47;
  if (v47)
  {
LABEL_25:
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v38 = __ldaxr(p_shared_owners);
    while (__stlxr(v38 - 1, p_shared_owners));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
LABEL_29:
  MEMORY[0x212BDCBCC](v48);
  return v25;
}

void sub_2115A514C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a19, 8);
  if (v25)
  {
    dispatch_release(v25);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
    MEMORY[0x212BDCBCC](&a25);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x212BDCBCC](&a25);
  _Unwind_Resume(a1);
}

void sub_2115A5258(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLTriggerDelayedResponseParseAndRelease(uint64_t a1)
{
  __int128 v2;
  const unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  _OWORD v13[4];

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v2;
  v13[3] = v2;
  v13[0] = v2;
  v13[1] = v2;
  v3 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiDelayedOutstandingResp_SDK::ARI_CsiDelayedOutstandingResp_SDK((AriSdk::ARI_CsiDelayedOutstandingResp_SDK *)v13, v3);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v13) == 67600384)
  {
    v10 = "NACK Received\n";
  }
  else
  {
    if (!AriSdk::ARI_CsiDelayedOutstandingResp_SDK::unpack((AriSdk::ARI_CsiDelayedOutstandingResp_SDK *)v13))
    {
      _KTLDebugPrint((uint64_t)"KTLTriggerDelayedResponseParseAndRelease", (uint64_t)"Delayed response received\n", v4, v5, v6, v7, v8, v9, *(uint64_t *)&v13[0]);
      v11 = 1;
      goto LABEL_6;
    }
    v10 = "Malformed response\n";
  }
  _KTLErrorPrint((uint64_t)"KTLTriggerDelayedResponseParseAndRelease", (uint64_t)v10, v4, v5, v6, v7, v8, v9, *(uint64_t *)&v13[0]);
  v11 = 0;
LABEL_6:
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  AriSdk::ARI_CsiDelayedOutstandingResp_SDK::~ARI_CsiDelayedOutstandingResp_SDK((AriSdk::ARI_CsiDelayedOutstandingResp_SDK *)v13);
  return v11;
}

void sub_2115A5338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AriSdk::ARI_CsiDelayedOutstandingResp_SDK::~ARI_CsiDelayedOutstandingResp_SDK((AriSdk::ARI_CsiDelayedOutstandingResp_SDK *)&a9);
  _Unwind_Resume(a1);
}

uint64_t KTLIsBBSimStackMappingEnabled(uint64_t a1, BOOL *a2)
{
  uint64_t v2;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  dispatch_time_t v33;
  NSObject *v34;
  std::__shared_weak_count *v35;
  unint64_t *p_shared_owners;
  unint64_t v37;
  uint64_t v39;
  dispatch_object_t object;
  ktl::KTLPacket *v41;
  ktl::KTLPacket **v42;
  uint64_t v43;
  char v44;
  uint64_t *v45;
  std::__shared_weak_count *v46;
  _OWORD v47[4];

  v2 = 0;
  if (!a1 || !a2)
    return v2;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[2] = v5;
  v47[3] = v5;
  v47[0] = v5;
  v47[1] = v5;
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::ARI_CsiMSimGetSimStackMappingStatusReq_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *)v47);
  v45 = 0;
  v46 = 0;
  AriSdk::MsgBase::getRawBytes();
  v12 = *(_QWORD **)(a1 + 8);
  if (v12 || !*(_DWORD *)(a1 + 16))
  {
    v13 = *v45;
    v14 = v45[1] - *v45;
    v15 = *(unsigned int *)(a1 + 20);
    LODWORD(v41) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v6, v7, v8, v9, v10, v11, v14);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, ktl::KTLPacket **, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v41, 1, v15, 0), (_DWORD)v41 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v41 = 0;
      if (KTLUTACopyReceiveData(a1, (uint64_t *)&v41))
        v2 = KTLIsBBSimStackMappingEnabledParseAndRelease(v41, a2);
      else
        v2 = 0;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
      v2 = 0;
    }
    goto LABEL_26;
  }
  v24 = dispatch_semaphore_create(0);
  v25 = v24;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2000000000;
  v44 = 0;
  object = v24;
  if (v24)
    dispatch_retain(v24);
  if (AriHost::Send())
  {
    v32 = "Failed to send message CsiMSimGetSimStackMappingStatusReq.\n";
    goto LABEL_22;
  }
  v33 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v25, v33))
  {
    v32 = "Timeout waiting for response.\n";
LABEL_22:
    _KTLErrorPrint((uint64_t)"KTLIsBBSimStackMappingEnabled", (uint64_t)v32, v26, v27, v28, v29, v30, v31, v39);
    v2 = 0;
    v34 = object;
    if (!object)
      goto LABEL_24;
    goto LABEL_23;
  }
  v2 = *((_BYTE *)v42 + 24) != 0;
  v34 = object;
  if (object)
LABEL_23:
    dispatch_release(v34);
LABEL_24:
  _Block_object_dispose(&v41, 8);
  if (v25)
    dispatch_release(v25);
LABEL_26:
  v35 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v37 = __ldaxr(p_shared_owners);
    while (__stlxr(v37 - 1, p_shared_owners));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::~ARI_CsiMSimGetSimStackMappingStatusReq_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *)v47);
  return v2;
}

void sub_2115A5618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a19, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
      AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::~ARI_CsiMSimGetSimStackMappingStatusReq_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *)&a25);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a19, 8);
    if (!v25)
      goto LABEL_3;
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::~ARI_CsiMSimGetSimStackMappingStatusReq_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *)&a25);
  _Unwind_Resume(a1);
}

void sub_2115A5680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v16;
  va_list va;
  uint64_t v18;
  va_list va1;

  va_start(va1, a15);
  va_start(va, a15);
  v16 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::~ARI_CsiMSimGetSimStackMappingStatusReq_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *)va1);
  _Unwind_Resume(a1);
}

void sub_2115A573C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLIsBBSimStackMappingEnabledParseAndRelease(ktl::KTLPacket *a1, BOOL *a2)
{
  __int128 v4;
  const unsigned __int8 *v5;
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
  uint64_t v18;
  _OWORD v20[4];
  _DWORD *v21;

  v21 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  v5 = (const unsigned __int8 *)(*(uint64_t (**)(ktl::KTLPacket *))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK((AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384)
  {
    _KTLDebugPrint((uint64_t)"KTLIsBBSimStackMappingEnabledParseAndRelease", (uint64_t)"Not supported\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  }
  else
  {
    if (!AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::unpack((AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *)v20))
    {
      *a2 = *v21 != 0;
      v18 = 1;
      goto LABEL_6;
    }
    _KTLErrorPrint((uint64_t)"KTLIsBBSimStackMappingEnabledParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  }
  v18 = 0;
LABEL_6:
  (*(void (**)(ktl::KTLPacket *))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCE24](v20);
  return v18;
}

BOOL KTLGetSimStackMapping(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  _BOOL4 v24;
  int v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  dispatch_time_t v39;
  NSObject *v40;
  uint64_t v41;
  dispatch_object_t object;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t *v51;
  std::__shared_weak_count *v52;
  _OWORD v53[4];
  int v54;

  v2 = 0;
  if (!a1 || !a2)
    return v2;
  v54 = -1;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[2] = v5;
  v53[3] = v5;
  v53[0] = v5;
  v53[1] = v5;
  AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::ARI_IBIMSimGetSimStackMappingReq_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *)v53);
  v51 = 0;
  v52 = 0;
  AriSdk::MsgBase::getRawBytes();
  v12 = *(_QWORD **)(a1 + 8);
  if (!v12 && *(_DWORD *)(a1 + 16))
  {
    v30 = dispatch_semaphore_create(0);
    v31 = v30;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2000000000;
    v50 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2000000000;
    v46 = -1;
    object = v30;
    if (v30)
      dispatch_retain(v30);
    if (AriHost::Send())
    {
      v38 = "Failed to send message IBIMSimGetSimStackMappingReq.\n";
    }
    else
    {
      v39 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v31, v39))
      {
        v24 = *((_BYTE *)v48 + 24) != 0;
        v25 = *((_DWORD *)v44 + 6);
        v54 = v25;
        v40 = object;
        if (!object)
        {
LABEL_34:
          _Block_object_dispose(&v43, 8);
          _Block_object_dispose(&v47, 8);
          if (v31)
            dispatch_release(v31);
          goto LABEL_15;
        }
LABEL_33:
        dispatch_release(v40);
        goto LABEL_34;
      }
      v38 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetSimStackMapping", (uint64_t)v38, v32, v33, v34, v35, v36, v37, v41);
    v24 = 0;
    v25 = -1;
    v40 = object;
    if (!object)
      goto LABEL_34;
    goto LABEL_33;
  }
  v13 = *v51;
  v14 = v51[1] - *v51;
  v15 = *(unsigned int *)(a1 + 20);
  LODWORD(v47) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v6, v7, v8, v9, v10, v11, v14);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v13);
  if (!*v12
    || ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v47, 1, v15, 0), (_DWORD)v47 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    goto LABEL_14;
  }
  v47 = 0;
  if (!KTLUTACopyReceiveData(a1, &v47))
  {
LABEL_14:
    v24 = 0;
    v25 = -1;
    goto LABEL_15;
  }
  v24 = KTLGetSimStackMappingParseAndRelease(v47, &v54, a2);
  v25 = v54;
LABEL_15:
  if (v25)
    v2 = 0;
  else
    v2 = v24;
  v26 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::~ARI_IBIMSimGetSimStackMappingReq_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *)v53);
  return v2;
}

void sub_2115A5B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  NSObject *v27;
  uint64_t v28;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  if (v27)
  {
    dispatch_release(v27);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
    AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::~ARI_IBIMSimGetSimStackMappingReq_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *)(v28 - 144));
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::~ARI_IBIMSimGetSimStackMappingReq_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *)(v28 - 144));
  _Unwind_Resume(a1);
}

void sub_2115A5C60(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetSimStackMappingParseAndRelease(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  __int128 v6;
  const unsigned __int8 *v7;
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
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  _OWORD v24[4];
  __int128 v25;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[3] = v6;
  v25 = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  v7 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::ARI_IBIMSimGetSimStackMappingRspCb_SDK((AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *)v24, v7);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v24) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLGetSimStackMappingParseAndRelease", (uint64_t)"NACK Received\n", v8, v9, v10, v11, v12, v13, *(uint64_t *)&v24[0]);
  v20 = AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::unpack((AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *)v24);
  if (v20)
  {
    _KTLErrorPrint((uint64_t)"KTLGetSimStackMappingParseAndRelease", (uint64_t)"Failed to unpack response.\n", v14, v15, v16, v17, v18, v19, *(uint64_t *)&v24[0]);
  }
  else
  {
    v21 = *((_QWORD *)&v25 + 1);
    *a2 = *(_DWORD *)v25;
    v22 = *(_DWORD *)(v21 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v21;
    *(_DWORD *)(a3 + 16) = v22;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCDA0](v24);
  return v20 == 0;
}

void __copy_helper_block_e8_32r40r56c25_ZTSN8dispatch9semaphoreE(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  v4 = *(NSObject **)(a2 + 56);
  a1[7] = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r40r56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 56);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

BOOL KTLGetSimTrayStatus(uint64_t a1, int a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v11;
  _DWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  _BOOL8 v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  dispatch_time_t v42;
  NSObject *v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  uint64_t v48;
  dispatch_object_t object;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  std::__shared_weak_count *v55;
  _OWORD v56[4];
  void *__p;

  if (!a1 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatus", (uint64_t)"opt(%p) or respParam(%p) is NULL\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v56[2] = v11;
  v56[3] = v11;
  v56[0] = v11;
  v56[1] = v11;
  AriSdk::ARI_IBISimTrayStatusReq_SDK::ARI_IBISimTrayStatusReq_SDK((AriSdk::ARI_IBISimTrayStatusReq_SDK *)v56);
  v12 = operator new(4uLL);
  *v12 = a2;
  v13 = __p;
  __p = v12;
  if (v13)
    operator delete(v13);
  v54 = 0;
  v55 = 0;
  AriSdk::MsgBase::getRawBytes();
  v20 = *(_QWORD **)(a1 + 8);
  if (v20 || !*(_DWORD *)(a1 + 16))
  {
    v21 = *v54;
    v22 = v54[1] - *v54;
    v23 = *(unsigned int *)(a1 + 20);
    LODWORD(v50) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v14, v15, v16, v17, v18, v19, v22);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v21);
    if (*v20
      && ((v30 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v20)(v20, v21, v22, &v50, 1, v23, 0), (_DWORD)v50 == (_DWORD)v22)? (v31 = v30): (v31 = 0), (v31 & 1) != 0))
    {
      v50 = 0;
      if (KTLUTACopyReceiveData(a1, &v50))
        v32 = KTLGetSimTrayStatusParseAndRelease(v50, a3);
      else
        v32 = 0;
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v24, v25, v26, v27, v28, v29, v22);
      v32 = 0;
    }
    goto LABEL_29;
  }
  v33 = dispatch_semaphore_create(0);
  v34 = v33;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2000000000;
  v53 = 0;
  object = v33;
  if (v33)
    dispatch_retain(v33);
  if (AriHost::Send())
  {
    v41 = "Failed to send the message of IBISimTrayStatusReq.\n";
    goto LABEL_25;
  }
  v42 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
  if (dispatch_semaphore_wait(v34, v42))
  {
    v41 = "Timeout waiting for response.\n";
LABEL_25:
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatus", (uint64_t)v41, v35, v36, v37, v38, v39, v40, v48);
    v32 = 0;
    v43 = object;
    if (!object)
      goto LABEL_27;
    goto LABEL_26;
  }
  v32 = *((_BYTE *)v51 + 24) != 0;
  v43 = object;
  if (object)
LABEL_26:
    dispatch_release(v43);
LABEL_27:
  _Block_object_dispose(&v50, 8);
  if (v34)
    dispatch_release(v34);
LABEL_29:
  v44 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v46 = __ldaxr(p_shared_owners);
    while (__stlxr(v46 - 1, p_shared_owners));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  MEMORY[0x212BDC95C](v56);
  return v32;
}

void sub_2115A6120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a19, 8);
  if (v25)
  {
    dispatch_release(v25);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
    MEMORY[0x212BDC95C](&a25);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  MEMORY[0x212BDC95C](&a25);
  _Unwind_Resume(a1);
}

void sub_2115A6230(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLGetSimTrayStatusParseAndRelease(uint64_t a1, _DWORD *a2)
{
  __int128 v4;
  const unsigned __int8 *v5;
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
  int v18;
  _OWORD v20[4];
  __int128 v21;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[3] = v4;
  v21 = v4;
  v20[1] = v4;
  v20[2] = v4;
  v20[0] = v4;
  v5 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_IBISimTrayStatusRspCb_SDK::ARI_IBISimTrayStatusRspCb_SDK((AriSdk::ARI_IBISimTrayStatusRspCb_SDK *)v20, v5);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v20) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatusParseAndRelease", (uint64_t)"NACK Received\n", v6, v7, v8, v9, v10, v11, *(uint64_t *)&v20[0]);
  v18 = AriSdk::ARI_IBISimTrayStatusRspCb_SDK::unpack((AriSdk::ARI_IBISimTrayStatusRspCb_SDK *)v20);
  if (v18)
    _KTLErrorPrint((uint64_t)"KTLGetSimTrayStatusParseAndRelease", (uint64_t)"Failed to unpack response.\n", v12, v13, v14, v15, v16, v17, *(uint64_t *)&v20[0]);
  else
    *a2 = **((_DWORD **)&v21 + 1);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCAAC](v20);
  return v18 == 0;
}

BOOL KTLGetCurrentBootState(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  const char *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  dispatch_time_t v46;
  NSObject *v47;
  std::__shared_weak_count *v48;
  unint64_t *p_shared_owners;
  unint64_t v50;
  uint64_t v52;
  uint64_t v53;
  dispatch_object_t object;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t *v59;
  std::__shared_weak_count *v60;
  _OWORD v61[4];

  if (!a1 || !a2)
  {
    _KTLErrorPrint((uint64_t)"KTLGetCurrentBootState", (uint64_t)"opt(%p) or bootState(%p) is NULL\n", a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v61[2] = v10;
  v61[3] = v10;
  v61[0] = v10;
  v61[1] = v10;
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)v61);
  v59 = 0;
  v60 = 0;
  AriSdk::MsgBase::getRawBytes();
  v17 = *(_QWORD **)(a1 + 8);
  if (!v17 && *(_DWORD *)(a1 + 16))
  {
    v37 = dispatch_semaphore_create(0);
    v38 = v37;
    v55 = 0;
    v56 = &v55;
    v57 = 0x2000000000;
    v58 = 0;
    object = v37;
    if (v37)
      dispatch_retain(v37);
    if (AriHost::Send())
    {
      v45 = "Failed to send command\n";
    }
    else
    {
      v46 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v38, v46))
      {
        v35 = *((_BYTE *)v56 + 24) != 0;
        v47 = object;
        if (!object)
        {
LABEL_26:
          _Block_object_dispose(&v55, 8);
          if (v38)
            dispatch_release(v38);
          goto LABEL_30;
        }
LABEL_25:
        dispatch_release(v47);
        goto LABEL_26;
      }
      v45 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetCurrentBootState", (uint64_t)v45, v39, v40, v41, v42, v43, v44, v52);
    v35 = 0;
    v47 = object;
    if (!object)
      goto LABEL_26;
    goto LABEL_25;
  }
  v18 = *v59;
  v19 = v59[1] - *v59;
  v20 = *(unsigned int *)(a1 + 20);
  LODWORD(v55) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v11, v12, v13, v14, v15, v16, v19);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v18);
  if (*v17
    && ((v27 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v17)(v17, v18, v19, &v55, 1, v20, 0), (_DWORD)v55 == (_DWORD)v19)? (v28 = v27): (v28 = 0), (v28 & 1) != 0))
  {
    v55 = 0;
    if ((KTLUTACopyReceiveData(a1, &v55) & 1) != 0)
    {
      if ((KTLGetCurrentBootStateParseAndRelease(v55, a1, a2, v30, v31, v32, v33, v34) & 1) != 0)
      {
        v35 = 1;
        goto LABEL_30;
      }
      v36 = "Failed to parse response.\n";
    }
    else
    {
      v36 = "Failed to copy received data.\n";
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v21, v22, v23, v24, v25, v26, v19);
    v36 = "Failed to send raw data.\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetCurrentBootState", (uint64_t)v36, v29, v30, v31, v32, v33, v34, v53);
  v35 = 0;
LABEL_30:
  v48 = v60;
  if (v60)
  {
    p_shared_owners = (unint64_t *)&v60->__shared_owners_;
    do
      v50 = __ldaxr(p_shared_owners);
    while (__stlxr(v50 - 1, p_shared_owners));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)v61);
  return v35;
}

void sub_2115A6650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  NSObject *v25;

  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a19, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
      AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)&a25);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a19, 8);
    if (!v25)
      goto LABEL_3;
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)&a25);
  _Unwind_Resume(a1);
}

void sub_2115A66B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v16;
  va_list va;
  uint64_t v18;
  va_list va1;

  va_start(va1, a15);
  va_start(va, a15);
  v16 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)va1);
  _Unwind_Resume(a1);
}

void sub_2115A6774(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLGetCurrentBootStateParseAndRelease(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v10;
  const unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[4];
  _DWORD *v23;

  if (!a1 || !a2 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetCurrentBootStateParseAndRelease", (uint64_t)"pkt(%p) or opt(%p) or bootState(%p) is NULL\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  v23 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[2] = v10;
  v22[3] = v10;
  v22[0] = v10;
  v22[1] = v10;
  v11 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v22, v11);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v22) == 67600384)
  {
    v18 = "NACK Received\n";
  }
  else
  {
    if (!AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack((AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)v22))
    {
      *a3 = *v23;
      v20 = 1;
      goto LABEL_10;
    }
    v18 = "Malformed response\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetCurrentBootStateParseAndRelease", (uint64_t)v18, v12, v13, v14, v15, v16, v17, v21);
  v20 = 0;
LABEL_10:
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCCA4](v22);
  return v20;
}

BOOL KTLGetFactGetTestReadyState(uint64_t a1, BOOL *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  const char *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  dispatch_time_t v47;
  NSObject *v48;
  std::__shared_weak_count *v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  uint64_t v53;
  uint64_t v54;
  dispatch_object_t object;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t *v60;
  std::__shared_weak_count *v61;
  _OWORD v62[4];

  if (!a1 || !a2 || !a3)
  {
    _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyState", (uint64_t)"opt(%p) or allReady(%p) or moduleStatus(%p) is NULL\n", (uint64_t)a3, a4, a5, a6, a7, a8, a1);
    return 0;
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v62[2] = v11;
  v62[3] = v11;
  v62[1] = v11;
  v62[0] = v11;
  AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::ARI_CsiFactGetTestReadyStateReq_SDK((AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *)v62);
  v60 = 0;
  v61 = 0;
  AriSdk::MsgBase::getRawBytes();
  v18 = *(_QWORD **)(a1 + 8);
  if (!v18 && *(_DWORD *)(a1 + 16))
  {
    v38 = dispatch_semaphore_create(0);
    v39 = v38;
    v56 = 0;
    v57 = &v56;
    v58 = 0x2000000000;
    v59 = 0;
    object = v38;
    if (v38)
      dispatch_retain(v38);
    if (AriHost::Send())
    {
      v46 = "Failed to send command\n";
    }
    else
    {
      v47 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      if (!dispatch_semaphore_wait(v39, v47))
      {
        v36 = *((_BYTE *)v57 + 24) != 0;
        v48 = object;
        if (!object)
        {
LABEL_27:
          _Block_object_dispose(&v56, 8);
          if (v39)
            dispatch_release(v39);
          goto LABEL_31;
        }
LABEL_26:
        dispatch_release(v48);
        goto LABEL_27;
      }
      v46 = "Timeout waiting for response.\n";
    }
    _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyState", (uint64_t)v46, v40, v41, v42, v43, v44, v45, v53);
    v36 = 0;
    v48 = object;
    if (!object)
      goto LABEL_27;
    goto LABEL_26;
  }
  v19 = *v60;
  v20 = v60[1] - *v60;
  v21 = *(unsigned int *)(a1 + 20);
  LODWORD(v56) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v12, v13, v14, v15, v16, v17, v20);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v19);
  if (*v18
    && ((v28 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v18)(v18, v19, v20, &v56, 1, v21, 0), (_DWORD)v56 == (_DWORD)v20)? (v29 = v28): (v29 = 0), (v29 & 1) != 0))
  {
    v56 = 0;
    if ((KTLUTACopyReceiveData(a1, &v56) & 1) != 0)
    {
      if ((KTLGetFactGetTestReadyStateParseAndRelease(v56, a1, a2, a3, v32, v33, v34, v35) & 1) != 0)
      {
        v36 = 1;
        goto LABEL_31;
      }
      v37 = "Failed to parse response.\n";
    }
    else
    {
      v37 = "Failed to copy received data.\n";
    }
  }
  else
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v22, v23, v24, v25, v26, v27, v20);
    v37 = "Failed to send raw data.\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyState", (uint64_t)v37, v30, v31, v32, v33, v34, v35, v54);
  v36 = 0;
LABEL_31:
  v49 = v61;
  if (v61)
  {
    p_shared_owners = (unint64_t *)&v61->__shared_owners_;
    do
      v51 = __ldaxr(p_shared_owners);
    while (__stlxr(v51 - 1, p_shared_owners));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::~ARI_CsiFactGetTestReadyStateReq_SDK((AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *)v62);
  return v36;
}

void sub_2115A6BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  NSObject *v25;
  uint64_t v26;

  if (object)
  {
    dispatch_release(object);
    _Block_object_dispose(&a21, 8);
    if (!v25)
    {
LABEL_3:
      std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
      AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::~ARI_CsiFactGetTestReadyStateReq_SDK((AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *)(v26 - 128));
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a21, 8);
    if (!v25)
      goto LABEL_3;
  }
  dispatch_release(v25);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::~ARI_CsiFactGetTestReadyStateReq_SDK((AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *)(v26 - 128));
  _Unwind_Resume(a1);
}

void sub_2115A6C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::~ARI_CsiFactGetTestReadyStateReq_SDK((AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *)(v17 - 128));
  _Unwind_Resume(a1);
}

void sub_2115A6D08(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLGetFactGetTestReadyStateParseAndRelease(uint64_t a1, uint64_t a2, BOOL *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v11;
  const unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  _OWORD v24[4];
  __int128 v25;

  if (!a1 || !a2 || !a3 || !a4)
  {
    _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyStateParseAndRelease", (uint64_t)"pkt(%p) or opt(%p) or allReady(%p) or moduleStatus(%p) is NULL\n", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a1);
    return 0;
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[3] = v11;
  v25 = v11;
  v24[1] = v11;
  v24[2] = v11;
  v24[0] = v11;
  v12 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::ARI_CsiFactGetTestReadyStateRspCb_SDK((AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *)v24, v12);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)v24) == 67600384)
  {
    v19 = "NACK Received\n";
  }
  else
  {
    if (!AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::unpack((AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *)v24))
    {
      v22 = (_DWORD *)*((_QWORD *)&v25 + 1);
      *a3 = *(_DWORD *)v25 != 0;
      *a4 = *v22;
      v21 = 1;
      goto LABEL_11;
    }
    v19 = "Malformed response\n";
  }
  _KTLErrorPrint((uint64_t)"KTLGetFactGetTestReadyStateParseAndRelease", (uint64_t)v19, v13, v14, v15, v16, v17, v18, v23);
  v21 = 0;
LABEL_11:
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDCD40](v24);
  return v21;
}

void __copy_helper_block_e8_32r64c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  v4 = *(NSObject **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v4;
  if (v4)
    dispatch_retain(v4);
}

void __destroy_helper_block_e8_32r64c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 64);
  if (v2)
    dispatch_release(v2);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

_QWORD *Bsp::ARICommandDriver::ARICommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t Bsp::ARICommandDriver::GetCurrentBootState(Bsp::ARICommandDriver *this, AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *a2, AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *(_QWORD *)this;
  v12 = *(_QWORD **)(*(_QWORD *)this + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*(_QWORD *)this, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)operator new(0x48uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__61;
  v74 = __Block_byref_object_dispose__62;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*(_QWORD *)this + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 84312064);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(_QWORD))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetCurrentBootState", (uint64_t)"Failed CsiGetCurrentBootStateRspCb\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A72DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t Bsp::ARICommandDriver::SysGetInfoV2(uint64_t *a1, uint64_t a2, AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *)operator new(0x48uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::ARI_CsiSysGetInfoRspCbV2_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__61;
  v74 = __Block_byref_object_dispose__62;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 84410368);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"SysGetInfoV2", (uint64_t)"Failed CsiSysGetInfoRspCbV2\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A7754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t Bsp::ARICommandDriver::GetNvItemsSetting(uint64_t *a1, uint64_t a2, AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::ARI_FactoryGetNvItemsSettingRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__61;
  v74 = __Block_byref_object_dispose__62;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4177625088);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetNvItemsSetting", (uint64_t)"Failed FactoryGetNvItemsSettingRspCb\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A7BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk35ARI_CsiGetCurrentBootStateRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *v4;

  v4 = (AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *)operator new(0x48uLL);
  AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115A7CE0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk28ARI_CsiSysGetInfoRspCbV2_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *v4;

  v4 = (AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *)operator new(0x48uLL);
  AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::ARI_CsiSysGetInfoRspCbV2_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115A7D54(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk37ARI_FactoryGetNvItemsSettingRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *v4;

  v4 = (AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::ARI_FactoryGetNvItemsSettingRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115A7DC8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

__int128 *KTLGetKDMProductName(void)
{
  uint64_t HardwareModel;

  HardwareModel = _MergedGlobals;
  if (_MergedGlobals)
  {
    if ((_BYTE)xmmword_254AB9080)
      return &xmmword_254AB9080;
  }
  else
  {
    HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals = HardwareModel;
    if ((_BYTE)xmmword_254AB9080)
      return &xmmword_254AB9080;
  }
  xmmword_254AB9160 = 0u;
  unk_254AB9170 = 0u;
  xmmword_254AB9140 = 0u;
  unk_254AB9150 = 0u;
  xmmword_254AB9120 = 0u;
  unk_254AB9130 = 0u;
  xmmword_254AB9100 = 0u;
  unk_254AB9110 = 0u;
  xmmword_254AB90E0 = 0u;
  unk_254AB90F0 = 0u;
  xmmword_254AB90C0 = 0u;
  unk_254AB90D0 = 0u;
  xmmword_254AB90A0 = 0u;
  unk_254AB90B0 = 0u;
  xmmword_254AB9080 = 0u;
  *(_OWORD *)algn_254AB9090 = 0u;
  if (HardwareModel
    && snprintf((char *)&xmmword_254AB9080, 0xFFuLL, "%c%d%c", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, *(char *)(HardwareModel + 5)) > 254)
  {
    return 0;
  }
  return &xmmword_254AB9080;
}

unint64_t KTLGetKDMFilename@<X0>(const char *a1@<X0>, char *a2@<X8>)
{
  return sKTLGetFileName(a2, a1, "kdm");
}

unint64_t sKTLGetFileName(char *a1, const char *a2, const char *a3)
{
  uint64_t HardwareModel;
  const char *v7;
  unint64_t result;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  char __str[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)__str = 0u;
  v14 = 0u;
  HardwareModel = _MergedGlobals;
  if (_MergedGlobals)
  {
    if ((_BYTE)xmmword_254AB9080)
      goto LABEL_8;
  }
  else
  {
    HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals = HardwareModel;
    if ((_BYTE)xmmword_254AB9080)
      goto LABEL_8;
  }
  xmmword_254AB9160 = 0u;
  unk_254AB9170 = 0u;
  xmmword_254AB9140 = 0u;
  unk_254AB9150 = 0u;
  xmmword_254AB9120 = 0u;
  unk_254AB9130 = 0u;
  xmmword_254AB9100 = 0u;
  unk_254AB9110 = 0u;
  xmmword_254AB90E0 = 0u;
  unk_254AB90F0 = 0u;
  xmmword_254AB90C0 = 0u;
  unk_254AB90D0 = 0u;
  xmmword_254AB90A0 = 0u;
  unk_254AB90B0 = 0u;
  xmmword_254AB9080 = 0u;
  *(_OWORD *)algn_254AB9090 = 0u;
  if (HardwareModel
    && snprintf((char *)&xmmword_254AB9080, 0xFFuLL, "%c%d%c", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, *(char *)(HardwareModel + 5)) > 254)
  {
    v7 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v7 = (const char *)&xmmword_254AB9080;
LABEL_9:
  result = snprintf(__str, 0xFFuLL, "%s%s%s.%s", v7, "_", a2, a3);
  if ((int)result > 254)
  {
    a1[23] = 0;
    *a1 = 0;
    return result;
  }
  result = strlen(__str);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = result;
  if (result >= 0x17)
  {
    v10 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v10 = result | 7;
    v11 = v10 + 1;
    v12 = (const char *)operator new(v10 + 1);
    *((_QWORD *)a1 + 1) = v9;
    *((_QWORD *)a1 + 2) = v11 | 0x8000000000000000;
    *(_QWORD *)a1 = v12;
    a1 = (char *)v12;
  }
  else
  {
    a1[23] = result;
    if (!result)
      goto LABEL_19;
  }
  result = (unint64_t)memcpy(a1, __str, v9);
LABEL_19:
  a1[v9] = 0;
  return result;
}

void KTLGetKeyword(const char *a1@<X0>, std::string *a2@<X8>)
{
  __int128 v3;
  std::string::size_type size;
  int v5;
  uint64_t HardwareModel;
  const char *v7;
  size_t v8;
  size_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  std::string::size_type v13;
  int v14;
  void *v15;
  const char *v16;
  std::string *v17;
  std::string::size_type v18;
  size_t v19;
  char v20;
  std::string::size_type v21;
  __int128 v22;
  void *v23[2];
  void *v24[2];
  std::string v25;
  _QWORD __dst[3];
  std::string v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  std::string v31;

  v31.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = v3;
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v3;
  v28 = v3;
  v29 = v3;
  strlen(a1);
  ctu::partition();
  memset(&v27, 170, sizeof(v27));
  if (SBYTE7(v29) < 0)
  {
    std::string::__init_copy_ctor_external(&v27, (const std::string::value_type *)v28, *((std::string::size_type *)&v28 + 1));
  }
  else
  {
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v28;
    v27.__r_.__value_.__r.__words[2] = v29;
  }
  size = HIBYTE(v27.__r_.__value_.__r.__words[2]);
  v5 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v27.__r_.__value_.__l.__size_;
  if (!size)
    goto LABEL_39;
  memset(__dst, 170, sizeof(__dst));
  HardwareModel = _MergedGlobals;
  if (_MergedGlobals)
  {
    if ((_BYTE)xmmword_254AB9080)
      goto LABEL_14;
  }
  else
  {
    HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals = HardwareModel;
    if ((_BYTE)xmmword_254AB9080)
      goto LABEL_14;
  }
  xmmword_254AB9160 = 0u;
  unk_254AB9170 = 0u;
  xmmword_254AB9140 = 0u;
  unk_254AB9150 = 0u;
  xmmword_254AB9120 = 0u;
  unk_254AB9130 = 0u;
  xmmword_254AB9100 = 0u;
  unk_254AB9110 = 0u;
  xmmword_254AB90E0 = 0u;
  unk_254AB90F0 = 0u;
  xmmword_254AB90C0 = 0u;
  unk_254AB90D0 = 0u;
  xmmword_254AB90A0 = 0u;
  unk_254AB90B0 = 0u;
  xmmword_254AB9080 = 0u;
  *(_OWORD *)algn_254AB9090 = 0u;
  if (HardwareModel
    && snprintf((char *)&xmmword_254AB9080, 0xFFuLL, "%c%d%c", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, *(char *)(HardwareModel + 5)) > 254)
  {
    v7 = 0;
    goto LABEL_15;
  }
LABEL_14:
  v7 = (const char *)&xmmword_254AB9080;
LABEL_15:
  v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = operator new(v11 + 1);
    __dst[1] = v9;
    __dst[2] = v12 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_22;
  }
  HIBYTE(__dst[2]) = v8;
  v10 = __dst;
  if (v8)
LABEL_22:
    memcpy(v10, v7, v9);
  *((_BYTE *)v10 + v9) = 0;
  v5 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
  v13 = HIBYTE(__dst[2]);
  v14 = SHIBYTE(__dst[2]);
  v15 = (void *)__dst[0];
  if (__dst[2] >= 0)
    v16 = (const char *)__dst;
  else
    v16 = (const char *)__dst[0];
  if (__dst[2] < 0)
    v13 = __dst[1];
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v17 = &v27;
  else
    v17 = (std::string *)v27.__r_.__value_.__r.__words[0];
  v18 = HIBYTE(v27.__r_.__value_.__r.__words[2]);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v18 = v27.__r_.__value_.__l.__size_;
  if (v13 <= v18)
    v19 = v18;
  else
    v19 = v13;
  if (strncasecmp((const char *)v17, v16, v19))
    goto LABEL_37;
  memset(&v25, 170, sizeof(v25));
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v25, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  else
    v25 = v31;
  v20 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  else
    v21 = v25.__r_.__value_.__l.__size_;
  if (!v21)
  {
LABEL_63:
    if (v20 < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
LABEL_37:
    if (v14 < 0)
      operator delete(v15);
LABEL_39:
    *((_BYTE *)&a2->__r_.__value_.__s + 23) = 0;
    a2->__r_.__value_.__s.__data_[0] = 0;
    goto LABEL_40;
  }
  *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v23 = v22;
  *(_OWORD *)v24 = v22;
  ctu::partition();
  memset(a2, 170, sizeof(std::string));
  if (SHIBYTE(v24[0]) < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)v23[0], (std::string::size_type)v23[1]);
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)v23;
    a2->__r_.__value_.__r.__words[2] = (std::string::size_type)v24[0];
  }
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
  {
    if (!a2->__r_.__value_.__l.__size_)
    {
      operator delete(a2->__r_.__value_.__l.__data_);
LABEL_75:
      operator delete((void *)0xAAAAAAAAAAAAAAAALL);
      operator delete(v24[1]);
      if (SHIBYTE(v24[0]) < 0)
        operator delete(v23[0]);
      v20 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
      goto LABEL_63;
    }
  }
  else if (!*((_BYTE *)&a2->__r_.__value_.__s + 23))
  {
    goto LABEL_75;
  }
  operator delete((void *)0xAAAAAAAAAAAAAAAALL);
  operator delete(v24[1]);
  if (SHIBYTE(v24[0]) < 0)
  {
    operator delete(v23[0]);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    {
LABEL_72:
      operator delete(v25.__r_.__value_.__l.__data_);
      if ((v14 & 0x80000000) == 0)
        goto LABEL_40;
      goto LABEL_73;
    }
  }
  else if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
  {
    goto LABEL_72;
  }
  if ((v14 & 0x80000000) == 0)
    goto LABEL_40;
LABEL_73:
  operator delete(v15);
LABEL_40:
  if (v5 < 0)
  {
    operator delete(v27.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_42:
      if ((SHIBYTE(v30) & 0x80000000) == 0)
        goto LABEL_43;
      goto LABEL_47;
    }
  }
  else if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_42;
  }
  operator delete(v31.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v30) & 0x80000000) == 0)
  {
LABEL_43:
    if ((SBYTE7(v29) & 0x80000000) == 0)
      return;
LABEL_48:
    operator delete((void *)v28);
    return;
  }
LABEL_47:
  operator delete(*((void **)&v29 + 1));
  if (SBYTE7(v29) < 0)
    goto LABEL_48;
}

void sub_2115A84DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  void *v32;
  int v33;
  int v34;
  uint64_t v35;

  std::tuple<std::string,std::string,std::string>::~tuple((uint64_t)&a13);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((v33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((v34 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else if ((v33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(v32);
  if ((v34 & 0x80000000) == 0)
  {
LABEL_4:
    std::tuple<std::string,std::string,std::string>::~tuple(v35 - 144);
    _Unwind_Resume(a1);
  }
LABEL_7:
  operator delete(a32);
  std::tuple<std::string,std::string,std::string>::~tuple(v35 - 144);
  _Unwind_Resume(a1);
}

uint64_t std::tuple<std::string,std::string,std::string>::~tuple(uint64_t a1)
{
  if ((*(char *)(a1 + 71) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 47) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
    goto LABEL_7;
  }
  operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    goto LABEL_6;
LABEL_3:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
    return a1;
LABEL_7:
  operator delete(*(void **)a1);
  return a1;
}

unint64_t KTLGetETBFilename@<X0>(const char *a1@<X0>, char *a2@<X8>)
{
  return sKTLGetFileName(a2, a1, "etb");
}

uint64_t KTLGetMaskFileExtensionName@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  switch((_DWORD)result)
  {
    case 2:
      *(_BYTE *)(a2 + 23) = 3;
      *(_WORD *)a2 = 26211;
      *(_BYTE *)(a2 + 2) = 103;
      break;
    case 1:
      *(_BYTE *)(a2 + 23) = 3;
      *(_WORD *)a2 = 29797;
      *(_BYTE *)(a2 + 2) = 98;
      break;
    case 0:
      *(_BYTE *)(a2 + 23) = 3;
      *(_WORD *)a2 = 25707;
      *(_BYTE *)(a2 + 2) = 109;
      break;
  }
  return result;
}

unint64_t KTLGetTraceConfigFilename@<X0>(const char *a1@<X0>, char *a2@<X8>)
{
  return sKTLGetFileName(a2, a1, "cfg");
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

_QWORD *hsfiler::ARICommandDriver::ARICommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t hsfiler::ARICommandDriver::StartReadSession(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__7;
  v74 = __Block_byref_object_dispose__7;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178509824);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"StartReadSession", (uint64_t)"Failed IBIFilerHSStartReadBBSessionReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A8B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::GetReadSize(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__7;
  v74 = __Block_byref_object_dispose__7;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178542592);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"GetReadSize", (uint64_t)"Failed IBIFilerHSReadBBGetSizeReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A8F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::ReadFileFromBB(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *)operator new(0x58uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::ARI_IBIFilerHSReadBBRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__7;
  v74 = __Block_byref_object_dispose__7;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178575360);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"ReadFileFromBB", (uint64_t)"Failed IBIFilerHSReadBBReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A9404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::StartWriteSession(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__7;
  v74 = __Block_byref_object_dispose__7;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178608128);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"StartWriteSession", (uint64_t)"Failed IBIFilerHSStartWriteBBSessionReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A9880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::WriteFileToBB(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::ARI_IBIFilerHSWriteBBRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__7;
  v74 = __Block_byref_object_dispose__7;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178640896);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"WriteFileToBB", (uint64_t)"Failed IBIFilerHSWriteBBReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115A9CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t hsfiler::ARICommandDriver::EndSession(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::ARI_IBIFilerHSEndBBSessionRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__7;
  v74 = __Block_byref_object_dispose__7;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 4178673664);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"EndSession", (uint64_t)"Failed IBIFilerHSEndBBSessionReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115AA174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk41ARI_IBIFilerHSStartReadBBSessionRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115AA284(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk36ARI_IBIFilerHSReadBBGetSizeRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115AA2F8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk29ARI_IBIFilerHSReadBBRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *)operator new(0x58uLL);
  AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::ARI_IBIFilerHSReadBBRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115AA36C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk42ARI_IBIFilerHSStartWriteBBSessionRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115AA3E0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk30ARI_IBIFilerHSWriteBBRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::ARI_IBIFilerHSWriteBBRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115AA454(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk35ARI_IBIFilerHSEndBBSessionRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::ARI_IBIFilerHSEndBBSessionRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115AA4C8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL KTLCpsGetSvn(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL8 result;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  memset(v10, 170, 24);
  result = KTLGetIMEIInfo(a1, 0, (uint64_t)v10, a4, a5, a6, a7, a8);
  *a2 = (BYTE4(v10[2]) & 0xF) + 10 * (BYTE3(v10[2]) >> 4);
  return result;
}

BOOL KTLCpsSetSvn(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  BOOL v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  intptr_t v22;
  uint64_t v23;
  dispatch_object_t object;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;

  v2 = *(_DWORD *)(a1 + 16);
  v33 = v2;
  v34 = 1;
  if (!a2)
    return 0;
  if (*(_QWORD *)(a1 + 8))
    v4 = 1;
  else
    v4 = v2 == 0;
  if (!v4)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2000000000;
    v32 = 1;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2000000000;
    v28 = -1;
    v12 = dispatch_semaphore_create(0);
    v13 = v12;
    object = v12;
    if (v12)
      dispatch_retain(v12);
    if (ARI_UtaMsCpsSetSvnReq_BLK())
    {
      v9 = 0;
      v10 = *((_DWORD *)v30 + 6);
      v14 = object;
      if (!object)
        goto LABEL_25;
    }
    else
    {
      v15 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
      v22 = dispatch_semaphore_wait(v13, v15);
      if (v22)
        _KTLErrorPrint((uint64_t)"KTLCpsSetSvn", (uint64_t)"Timeout waiting for response.\n", v16, v17, v18, v19, v20, v21, v23);
      if (v33)
        AriHost::ExitTrx((AriHost *)v33);
      v10 = *((_DWORD *)v30 + 6);
      if (v22)
      {
        v9 = 0;
        v14 = object;
        if (!object)
        {
LABEL_25:
          if (v13)
            dispatch_release(v13);
          _Block_object_dispose(&v25, 8);
          _Block_object_dispose(&v29, 8);
          return !v10 && v9;
        }
      }
      else
      {
        v9 = *((_DWORD *)v26 + 6) == 0;
        v14 = object;
        if (!object)
          goto LABEL_25;
      }
    }
    dispatch_release(v14);
    goto LABEL_25;
  }
  v25 = 0;
  v35 = 0;
  v36 = v2;
  v29 = 0;
  if (!ARI_UtaMsCpsSetSvnReq_ENC()
    && (v5 = operator new(0x18uLL),
        v6 = v29,
        v5[2] = v35,
        *((_QWORD *)v5 + 2) = v6,
        *(_QWORD *)v5 = &unk_24CC18DE8,
        KTLUTASendAndReleaseData(a1, v5))
    && KTLUTACopyReceiveData(a1, &v25))
  {
    v7 = v25;
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 16))(v25);
    v8 = ARI_AriUtaMsCpsSetSvnRspCb_Extract();
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    v9 = v8 == 0;
    v10 = v34;
  }
  else
  {
    v9 = 0;
    v10 = 1;
  }
  return !v10 && v9;
}

void sub_2115AA810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, dispatch_object_t object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;

  if (object)
    dispatch_release(object);
  if (v21)
    dispatch_release(v21);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t KTLCpsPriWrite(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, char *a5, uint64_t a6, char *a7, uint64_t a8, unsigned __int8 a9)
{
  unsigned int v11;
  uint64_t v12;
  unsigned int v14;
  int v17;
  __int128 v19;
  _DWORD *v20;
  void *v21;
  _DWORD *v22;
  void *v23;
  _WORD *v24;
  void *v25;
  size_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  size_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  int64_t v36;
  size_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  size_t v41;
  char *v42;
  char *v43;
  int64_t v44;
  _DWORD *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  std::__shared_weak_count *v65;
  unint64_t *p_shared_owners;
  unint64_t v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  dispatch_time_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  dispatch_object_t object;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  uint64_t *v92;
  std::__shared_weak_count *v93;
  _OWORD v94[4];
  void *__p[2];
  void *__dst[2];
  __int128 v97;
  void *v98[2];
  void *v99[2];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  int v111;

  if (!a1 || !a4)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"opt(%p) or filerId(%p) is NULL\n", a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a1);
    return 0;
  }
  v11 = a6;
  if (a6 >= 0x401)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"PRI signature size (%u) larger than max allowed (%d)", a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a6);
    return 0;
  }
  v14 = a8;
  if (a8 >= 0x65)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"Carrier bundle name length (%u) larger than max allowed (%d)", a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a8);
    return 0;
  }
  v17 = a3;
  v108 = 0;
  v109 = &v108;
  v110 = 0x2000000000;
  v111 = 0xFFFF;
  v104 = 0;
  v105 = &v104;
  v106 = 0x2000000000;
  v107 = 0x7FFFFFFF;
  v100 = 0;
  v101 = &v100;
  v102 = 0x2000000000;
  v103 = -1;
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v98 = v19;
  *(_OWORD *)v99 = v19;
  *(_OWORD *)__dst = v19;
  v97 = v19;
  v94[3] = v19;
  *(_OWORD *)__p = v19;
  v94[1] = v19;
  v94[2] = v19;
  v94[0] = v19;
  AriSdk::ARI_IBIPriWriteReq_V2_SDK::ARI_IBIPriWriteReq_V2_SDK((AriSdk::ARI_IBIPriWriteReq_V2_SDK *)v94);
  v20 = operator new(4uLL);
  *v20 = a2;
  v21 = __p[0];
  __p[0] = v20;
  if (v21)
    operator delete(v21);
  v22 = operator new(4uLL);
  *v22 = v17;
  v23 = __p[1];
  __p[1] = v22;
  if (v23)
    operator delete(v23);
  v24 = operator new(2uLL);
  *v24 = v11;
  v25 = __dst[0];
  __dst[0] = v24;
  if (v25)
    operator delete(v25);
  if (a5)
  {
    v26 = v11;
    v27 = *((_QWORD *)&v97 + 1);
    v28 = (char *)__dst[1];
    if (*((_QWORD *)&v97 + 1) - (unint64_t)__dst[1] >= v11)
    {
      v33 = v97 - (unint64_t)__dst[1];
      if ((unint64_t)v97 - (unint64_t)__dst[1] >= v11)
      {
        if (v11)
          memmove(__dst[1], a5, v11);
        v32 = &v28[v11];
      }
      else
      {
        v34 = &a5[v11];
        v35 = &a5[v33];
        if ((void *)v97 != __dst[1])
        {
          memmove(__dst[1], a5, v97 - (unint64_t)__dst[1]);
          v34 = &a5[v26];
          v28 = (char *)v97;
        }
        v36 = v34 - v35;
        if (v33 != v26)
          memmove(v28, v35, v34 - v35);
        v32 = &v28[v36];
      }
    }
    else
    {
      if (__dst[1])
      {
        *(void **)&v97 = __dst[1];
        operator delete(__dst[1]);
        v27 = 0;
        __dst[1] = 0;
        v97 = 0uLL;
      }
      v29 = 2 * v27;
      if (2 * v27 <= v11)
        v29 = v11;
      if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
        v30 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v30 = v29;
      v31 = (char *)operator new(v30);
      __dst[1] = v31;
      *((_QWORD *)&v97 + 1) = &v31[v30];
      memcpy(v31, a5, v26);
      v32 = &v31[v26];
    }
    *(_QWORD *)&v97 = v32;
  }
  if (a7)
  {
    v37 = v14;
    v38 = (unint64_t)v99[0];
    v39 = (char *)v98[0];
    if ((void *)((char *)v99[0] - (char *)v98[0]) >= (void *)v14)
    {
      v44 = (char *)v98[1] - (char *)v98[0];
      if ((void *)((char *)v98[1] - (char *)v98[0]) >= (void *)v14)
      {
        if (v14)
          memmove(v98[0], a7, v14);
        v43 = &v39[v14];
      }
      else
      {
        if (v98[1] != v98[0])
        {
          memmove(v98[0], a7, (char *)v98[1] - (char *)v98[0]);
          v39 = (char *)v98[1];
        }
        if (v44 != v14)
          memmove(v39, &a7[v44], v14 - v44);
        v43 = &v39[v14 - v44];
      }
    }
    else
    {
      if (v98[0])
      {
        v98[1] = v98[0];
        operator delete(v98[0]);
        v38 = 0;
        v98[0] = 0;
        v98[1] = 0;
        v99[0] = 0;
      }
      v40 = 2 * v38;
      if (2 * v38 <= v14)
        v40 = v14;
      if (v38 >= 0x3FFFFFFFFFFFFFFFLL)
        v41 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v41 = v40;
      v42 = (char *)operator new(v41);
      v98[0] = v42;
      v99[0] = &v42[v41];
      memcpy(v42, a7, v37);
      v43 = &v42[v37];
    }
    v98[1] = v43;
  }
  v45 = operator new(4uLL);
  *v45 = a9;
  v46 = v99[1];
  v99[1] = v45;
  if (v46)
    operator delete(v46);
  v92 = 0;
  v93 = 0;
  AriSdk::MsgBase::getRawBytes();
  v53 = *(_QWORD **)(a1 + 8);
  if (!v53 && *(_DWORD *)(a1 + 16))
  {
    v68 = dispatch_semaphore_create(0);
    v69 = v68;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2000000000;
    v91 = 0;
    object = v68;
    if (v68)
      dispatch_retain(v68);
    if (AriHost::Send())
    {
      v76 = "Failed to send the message of IBIPriWriteReq_V2.\n";
      goto LABEL_84;
    }
    v77 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 20));
    if (dispatch_semaphore_wait(v69, v77))
    {
      v76 = "Timeout waiting for response.\n";
LABEL_84:
      _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)v76, v70, v71, v72, v73, v74, v75, v86);
      v12 = 0;
      v78 = object;
      if (!object)
        goto LABEL_86;
      goto LABEL_85;
    }
    v79 = *((unsigned int *)v109 + 6);
    if (*((_BYTE *)v89 + 24) && (_DWORD)v79 == (_DWORD)a2 && (v79 = a2, !*((_DWORD *)v105 + 6)))
    {
      v12 = 1;
      *a4 = *((_DWORD *)v101 + 6);
      v78 = object;
      if (!object)
      {
LABEL_86:
        _Block_object_dispose(&v88, 8);
        if (v69)
          dispatch_release(v69);
        goto LABEL_71;
      }
    }
    else
    {
      _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"Returned Instance is %d while expecting instance is %d\n", v70, v71, v72, v73, v74, v75, v79);
      _KTLErrorPrint((uint64_t)"KTLCpsPriWrite", (uint64_t)"PRI/GRI Command Result: %d\n", v80, v81, v82, v83, v84, v85, *((unsigned int *)v105 + 6));
      v12 = 0;
      *a4 = *((_DWORD *)v101 + 6);
      v78 = object;
      if (!object)
        goto LABEL_86;
    }
LABEL_85:
    dispatch_release(v78);
    goto LABEL_86;
  }
  v54 = *v92;
  v55 = v92[1] - *v92;
  v56 = *(unsigned int *)(a1 + 20);
  LODWORD(v88) = 0;
  _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v47, v48, v49, v50, v51, v52, v55);
  if ((_KTLDebugFlags & 2) != 0)
    off_253D1A548("Tx:", 0, v54);
  if (!*v53
    || ((v63 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v53)(v53, v54, v55, &v88, 1, v56, 0), (_DWORD)v88 == (_DWORD)v55)? (v64 = v63): (v64 = 0), (v64 & 1) == 0))
  {
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v57, v58, v59, v60, v61, v62, v55);
    goto LABEL_69;
  }
  v88 = 0;
  if (!KTLUTACopyReceiveData(a1, &v88))
  {
LABEL_69:
    v12 = 0;
    goto LABEL_70;
  }
  v12 = KTLCpsPriWriteParseAndRelease(v88, (_DWORD *)v109 + 6, (_DWORD *)v105 + 6, (_DWORD *)v101 + 6);
LABEL_70:
  *a4 = 0;
LABEL_71:
  v65 = v93;
  if (v93)
  {
    p_shared_owners = (unint64_t *)&v93->__shared_owners_;
    do
      v67 = __ldaxr(p_shared_owners);
    while (__stlxr(v67 - 1, p_shared_owners));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  MEMORY[0x212BDC878](v94);
  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);
  return v12;
}

void sub_2115AAF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,char a27)
{
  NSObject *v27;
  uint64_t v28;

  if (object)
    dispatch_release(object);
  _Block_object_dispose(&a21, 8);
  if (v27)
    dispatch_release(v27);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a25);
  MEMORY[0x212BDC878](&a27);
  _Block_object_dispose((const void *)(v28 - 200), 8);
  _Block_object_dispose((const void *)(v28 - 168), 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2115AB0CC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t KTLCpsPriWriteParseAndRelease(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  __int128 v8;
  const unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  BOOL v25;
  uint64_t v26;
  _DWORD *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32 = v8;
  v33 = v8;
  v30 = v8;
  v31 = v8;
  v29 = v8;
  v9 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::ARI_IBIPriWriteRspCb_V2_SDK((AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *)&v29, v9);
  if (AriSdk::MsgBase::getMergedGMID((AriSdk::MsgBase *)&v29) == 67600384)
    _KTLErrorPrint((uint64_t)"KTLCpsPriWriteParseAndRelease", (uint64_t)"NACK Received\n", v10, v11, v12, v13, v14, v15, v29);
  v16 = AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::unpack((AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *)&v29);
  if (a2)
    v23 = v16 == 0;
  else
    v23 = 0;
  v25 = !v23 || a3 == 0 || a4 == 0;
  v26 = !v25;
  if (v25)
  {
    _KTLErrorPrint((uint64_t)"KTLCpsPriWriteParseAndRelease", (uint64_t)"Failed to unpack response.\n", v17, v18, v19, v20, v21, v22, v29);
  }
  else
  {
    v27 = (_DWORD *)*((_QWORD *)&v33 + 1);
    *a2 = *(_DWORD *)v33;
    *a3 = *v27;
    *a4 = DWORD2(v30);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
  MEMORY[0x212BDC92C](&v29);
  return v26;
}

BOOL KTLGetSimCardPresence(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  intptr_t v24;
  uint64_t v26;
  NSObject *object;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  unint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t (*v36)();
  unint64_t v37;
  unsigned int v38;
  int v39;
  unsigned int v40;

  v8 = a1;
  if (!a1)
    return v8;
  if (a2 >= 2)
  {
    _KTLErrorPrint((uint64_t)"KTLGetSimSlotInstance", (uint64_t)"simSlot parameter: %d is >= KTL max number of supported SIMs: %d\n", (uint64_t)a3, a4, a5, a6, a7, a8, a2);
    return 0;
  }
  v32 = 0xAAAAAAAAAAAAAAAALL;
  if ((KTLGetSimSlotMapping(a1, (uint64_t)&v32) & 1) == 0)
    return 0;
  v10 = *(_DWORD *)(v8 + 16);
  v38 = v10;
  if (*(_QWORD *)(v8 + 8) || !v10)
  {
    v28 = 0;
    v39 = 0;
    v40 = v10;
    v32 = 0;
    if (!ARI_CsiMsSimCardPresenceReq_ENC())
    {
      v13 = operator new(0x18uLL);
      v14 = v32;
      v13[2] = v39;
      *((_QWORD *)v13 + 2) = v14;
      *(_QWORD *)v13 = &unk_24CC18DE8;
      if (KTLUTASendAndReleaseData(v8, v13))
      {
        if (KTLUTACopyReceiveData(v8, &v28))
        {
          v15 = v28;
          (*(void (**)(uint64_t))(*(_QWORD *)v28 + 16))(v28);
          v16 = ARI_CsiMsSimCardPresenceRspCb_Extract();
          (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
          return v16 == 0;
        }
      }
    }
    return 0;
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3002000000;
  v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = -1;
  v11 = dispatch_semaphore_create(0);
  v12 = v11;
  object = v11;
  if (v11)
    dispatch_retain(v11);
  if (ARI_CsiMsSimCardPresenceReq_BLK())
  {
    v8 = 0;
    *a3 = v33[5];
  }
  else
  {
    v17 = dispatch_time(0, 1000000 * *(unsigned int *)(v8 + 20));
    v24 = dispatch_semaphore_wait(v12, v17);
    if (v24)
      _KTLErrorPrint((uint64_t)"KTLGetSimCardPresence", (uint64_t)"Timeout waiting for response.\n", v18, v19, v20, v21, v22, v23, v26);
    if (v38)
      AriHost::ExitTrx((AriHost *)v38);
    *a3 = v33[5];
    if (v24)
      v8 = 0;
    else
      v8 = *((_DWORD *)v29 + 6) == 0;
  }
  if (object)
    dispatch_release(object);
  if (v12)
    dispatch_release(v12);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v8;
}

void sub_2115AB4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_object_t object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  NSObject *v23;

  if (object)
    dispatch_release(object);
  if (v23)
    dispatch_release(v23);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  return result;
}

_QWORD *cps::ARICommandDriver::ARICommandDriver(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

{
  *result = a2;
  return result;
}

uint64_t cps::ARICommandDriver::PriRefresh(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIPriRefreshRspCb_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIPriRefreshRspCb_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIPriRefreshRspCb_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIPriRefreshRspCb_SDK::ARI_IBIPriRefreshRspCb_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__15;
  v74 = __Block_byref_object_dispose__16;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIPriRefreshRspCb_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 2231468032);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIPriRefreshRspCb_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIPriRefreshRspCb_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"PriRefresh", (uint64_t)"Failed IBIPriRefreshReq\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115AB974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t cps::ARICommandDriver::PriWrite(uint64_t *a1, uint64_t a2, AriSdk::ARI_IBIPriWriteRspCb_V3_SDK **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *v33;
  const unsigned __int8 *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  dispatch_time_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  NSObject *v60;
  char hasDeclaredGmid;
  AriSdk::MsgBase *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  dispatch_object_t object;

  AriSdk::MsgBase::getRawBytes();
  *a3 = 0;
  v11 = *a1;
  v12 = *(_QWORD **)(*a1 + 8);
  if (v12 || !*(_DWORD *)(v11 + 16))
  {
    v13 = MEMORY[0];
    v14 = MEMORY[8] - MEMORY[0];
    v15 = *(unsigned int *)(v11 + 20);
    LODWORD(v70) = 0;
    _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Sending %u bytes to device timeout=%u\n", v5, v6, v7, v8, v9, v10, MEMORY[8] - MEMORY[0]);
    if ((_KTLDebugFlags & 2) != 0)
      off_253D1A548("Tx:", 0, v13);
    if (*v12
      && ((v22 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _QWORD))*v12)(v12, v13, v14, &v70, 1, v15, 0), (_DWORD)v70 == (_DWORD)v14)? (v23 = v22): (v23 = 0), (v23 & 1) != 0))
    {
      v70 = 0;
      v24 = KTLUTACopyReceiveData(*a1, &v70);
      v31 = v70;
      if (v70)
        v32 = v24;
      else
        v32 = 0;
      if (v32 == 1)
      {
        v33 = (AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *)operator new(0x50uLL);
        v34 = (const unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
        AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::ARI_IBIPriWriteRspCb_V3_SDK(v33, v34);
        *a3 = v33;
        (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
        goto LABEL_31;
      }
    }
    else
    {
      _KTLDebugPrint((uint64_t)"KTLRawSendData", (uint64_t)"Failed sending %d bytes - amount written %u\n", v16, v17, v18, v19, v20, v21, v14);
    }
    v35 = "error while trying to get response from device \n";
LABEL_16:
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)v35, v25, v26, v27, v28, v29, v30, v69);
    goto LABEL_17;
  }
  v70 = 0;
  v71 = &v70;
  v72 = 0x3002000000;
  v73 = __Block_byref_object_copy__15;
  v74 = __Block_byref_object_dispose__16;
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  object = dispatch_semaphore_create(0);
  v44 = AriHost::Send();
  if ((_DWORD)v44)
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"An error occured sending the message. (%d)\n", v45, v46, v47, v48, v49, v50, v44);
    goto LABEL_28;
  }
  v51 = v71;
  v52 = dispatch_time(0, 1000000 * *(unsigned int *)(*a1 + 20));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v51[5], v52))
  {
    _KTLErrorPrint((uint64_t)"perform", (uint64_t)"Timeout waiting for response.\n", v53, v54, v55, v56, v57, v58, v69);
LABEL_28:
    v59 = 0;
    _Block_object_dispose(&v70, 8);
    v60 = object;
    if (!object)
      goto LABEL_30;
    goto LABEL_29;
  }
  v59 = 1;
  _Block_object_dispose(&v70, 8);
  v60 = object;
  if (object)
LABEL_29:
    dispatch_release(v60);
LABEL_30:
  if ((v59 & 1) == 0)
    goto LABEL_17;
LABEL_31:
  hasDeclaredGmid = AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::hasDeclaredGmid(*a3);
  v62 = *a3;
  if ((hasDeclaredGmid & 1) == 0)
  {
    if (AriSdk::MsgBase::getMergedGMID(v62) != 67600384)
    {
      AriSdk::MsgBase::getMergedGMID(*a3);
      _KTLErrorPrint((uint64_t)"perform", (uint64_t)"expected gmid %d, doesn't match response gmid %d \n", v63, v64, v65, v66, v67, v68, 2223112192);
      goto LABEL_17;
    }
    v35 = "Received NACK\n";
    goto LABEL_16;
  }
  if (!AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::unpack(v62))
  {
    v42 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3)
    (*(void (**)(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *))(*(_QWORD *)*a3 + 16))(*a3);
  v42 = 0;
  *a3 = 0;
LABEL_20:
  if ((v42 & 1) == 0)
    _KTLErrorPrint((uint64_t)"PriWrite", (uint64_t)"Failed IBIPriWriteReq_V3\n", v36, v37, v38, v39, v40, v41, v69);
  return v42;
}

void sub_2115ABDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  _Block_object_dispose(&a21, 8);
  if (object)
  {
    dispatch_release(object);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk26ARI_IBIPriRefreshRspCb_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIPriRefreshRspCb_SDK *v4;

  v4 = (AriSdk::ARI_IBIPriRefreshRspCb_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIPriRefreshRspCb_SDK::ARI_IBIPriRefreshRspCb_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115ABEFC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ktl13CommandDriver7performIN6AriSdk27ARI_IBIPriWriteRspCb_V3_SDKEEEbjNSt3__110shared_ptrIKNS4_6vectorIhNS4_9allocatorIhEEEEEEPPT__block_invoke(uint64_t a1, const unsigned __int8 *a2)
{
  AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *v4;

  v4 = (AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *)operator new(0x50uLL);
  AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::ARI_IBIPriWriteRspCb_V3_SDK(v4, a2);
  **(_QWORD **)(a1 + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return 0;
}

void sub_2115ABF70(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ARI_AriUtaMsCpsSetSvnRspCb_Extract()
{
  return MEMORY[0x24BECE230]();
}

uint64_t ARI_CsiBspDebugJtagModeReq_BLK()
{
  return MEMORY[0x24BECE238]();
}

uint64_t ARI_CsiBspDebugJtagModeReq_ENC()
{
  return MEMORY[0x24BECE240]();
}

uint64_t ARI_CsiBspDebugJtagModeRspCb_Extract()
{
  return MEMORY[0x24BECE248]();
}

uint64_t ARI_CsiBspGetCalibrationStatusReq_BLK()
{
  return MEMORY[0x24BECE250]();
}

uint64_t ARI_CsiBspGetCalibrationStatusReq_ENC()
{
  return MEMORY[0x24BECE258]();
}

uint64_t ARI_CsiBspGetCalibrationStatusRspCb_Extract()
{
  return MEMORY[0x24BECE260]();
}

uint64_t ARI_CsiBspNvmGroupEnumListReq_BLK()
{
  return MEMORY[0x24BECE268]();
}

uint64_t ARI_CsiBspNvmGroupEnumListReq_ENC()
{
  return MEMORY[0x24BECE270]();
}

uint64_t ARI_CsiBspNvmGroupEnumListRespCb_Extract()
{
  return MEMORY[0x24BECE278]();
}

uint64_t ARI_CsiBspNvmReadGroupBlockReq_BLK()
{
  return MEMORY[0x24BECE280]();
}

uint64_t ARI_CsiBspNvmReadGroupBlockReq_ENC()
{
  return MEMORY[0x24BECE288]();
}

uint64_t ARI_CsiBspNvmReadGroupBlockRespCb_Extract()
{
  return MEMORY[0x24BECE290]();
}

uint64_t ARI_CsiBspNvmReadGroupReq_BLK()
{
  return MEMORY[0x24BECE298]();
}

uint64_t ARI_CsiBspNvmReadGroupReq_ENC()
{
  return MEMORY[0x24BECE2A0]();
}

uint64_t ARI_CsiBspNvmReadGroupRespCb_Extract()
{
  return MEMORY[0x24BECE2A8]();
}

uint64_t ARI_CsiBspSetNvItemsToStateReq_BLK()
{
  return MEMORY[0x24BECE2B0]();
}

uint64_t ARI_CsiBspSetNvItemsToStateReq_ENC()
{
  return MEMORY[0x24BECE2B8]();
}

uint64_t ARI_CsiBspSetNvItemsToStateRspCb_Extract()
{
  return MEMORY[0x24BECE2C0]();
}

uint64_t ARI_CsiBspShutdownReq_BLK()
{
  return MEMORY[0x24BECE2C8]();
}

uint64_t ARI_CsiBspShutdownReq_ENC()
{
  return MEMORY[0x24BECE2D0]();
}

uint64_t ARI_CsiBspShutdownRspCb_Extract()
{
  return MEMORY[0x24BECE2D8]();
}

uint64_t ARI_CsiBspStateGetReq_BLK()
{
  return MEMORY[0x24BECE2E0]();
}

uint64_t ARI_CsiBspStateGetReq_ENC()
{
  return MEMORY[0x24BECE2E8]();
}

uint64_t ARI_CsiBspStateGetRspCb_Extract()
{
  return MEMORY[0x24BECE2F0]();
}

uint64_t ARI_CsiBspStateSetReq_BLK()
{
  return MEMORY[0x24BECE2F8]();
}

uint64_t ARI_CsiBspStateSetReq_ENC()
{
  return MEMORY[0x24BECE300]();
}

uint64_t ARI_CsiBspStateSetRspCb_Extract()
{
  return MEMORY[0x24BECE308]();
}

uint64_t ARI_CsiBspSwTrapReq_BLK()
{
  return MEMORY[0x24BECE310]();
}

uint64_t ARI_CsiBspSwTrapReq_ENC()
{
  return MEMORY[0x24BECE318]();
}

uint64_t ARI_CsiBspSwTrapRspCb_Extract()
{
  return MEMORY[0x24BECE320]();
}

uint64_t ARI_CsiCddGetDebugLogReq_BLK()
{
  return MEMORY[0x24BECE328]();
}

uint64_t ARI_CsiCddGetDebugLogReq_ENC()
{
  return MEMORY[0x24BECE330]();
}

uint64_t ARI_CsiCddGetDebugLogRspCb_Extract()
{
  return MEMORY[0x24BECE338]();
}

uint64_t ARI_CsiCddGetParamDumpReq_BLK()
{
  return MEMORY[0x24BECE340]();
}

uint64_t ARI_CsiCddGetParamDumpReq_ENC()
{
  return MEMORY[0x24BECE348]();
}

uint64_t ARI_CsiCddGetParamDumpRspCb_Extract()
{
  return MEMORY[0x24BECE350]();
}

uint64_t ARI_CsiFpGetStatusRsp_Extract()
{
  return MEMORY[0x24BECE358]();
}

uint64_t ARI_CsiFpGetStatus_BLK()
{
  return MEMORY[0x24BECE360]();
}

uint64_t ARI_CsiFpGetStatus_ENC()
{
  return MEMORY[0x24BECE368]();
}

uint64_t ARI_CsiFpRegisterRsp_Extract()
{
  return MEMORY[0x24BECE370]();
}

uint64_t ARI_CsiFpRegister_BLK()
{
  return MEMORY[0x24BECE378]();
}

uint64_t ARI_CsiFpRegister_ENC()
{
  return MEMORY[0x24BECE380]();
}

uint64_t ARI_CsiFpSnapshotRsp_Extract()
{
  return MEMORY[0x24BECE388]();
}

uint64_t ARI_CsiFpSnapshot_BLK()
{
  return MEMORY[0x24BECE390]();
}

uint64_t ARI_CsiFpSnapshot_ENC()
{
  return MEMORY[0x24BECE398]();
}

uint64_t ARI_CsiFpUpdateAckRsp_Extract()
{
  return MEMORY[0x24BECE3A0]();
}

uint64_t ARI_CsiFpUpdateAck_BLK()
{
  return MEMORY[0x24BECE3A8]();
}

uint64_t ARI_CsiFpUpdateAck_ENC()
{
  return MEMORY[0x24BECE3B0]();
}

uint64_t ARI_CsiFpUpdateHeaderData_Extract()
{
  return MEMORY[0x24BECE3B8]();
}

uint64_t ARI_CsiFpUpdateHeader_BLK()
{
  return MEMORY[0x24BECE3C0]();
}

uint64_t ARI_CsiFpUpdateHeader_ENC()
{
  return MEMORY[0x24BECE3C8]();
}

uint64_t ARI_CsiIceAtExtReq_ENC()
{
  return MEMORY[0x24BECE3D8]();
}

uint64_t ARI_CsiIceAtExtRsp_Extract()
{
  return MEMORY[0x24BECE3E0]();
}

uint64_t ARI_CsiIceAudDisableLoopbackHWReq_BLK()
{
  return MEMORY[0x24BECE3E8]();
}

uint64_t ARI_CsiIceAudDisableLoopbackHWReq_ENC()
{
  return MEMORY[0x24BECE3F0]();
}

uint64_t ARI_CsiIceAudDisableLoopbackHWRespCb_Extract()
{
  return MEMORY[0x24BECE3F8]();
}

uint64_t ARI_CsiIceAudEnableLoopbackHWReq_BLK()
{
  return MEMORY[0x24BECE400]();
}

uint64_t ARI_CsiIceAudEnableLoopbackHWReq_ENC()
{
  return MEMORY[0x24BECE408]();
}

uint64_t ARI_CsiIceAudEnableLoopbackHWRespCb_Extract()
{
  return MEMORY[0x24BECE410]();
}

uint64_t ARI_CsiIceBspSetApWakeIntervalReq_BLK()
{
  return MEMORY[0x24BECE418]();
}

uint64_t ARI_CsiIceBspSetApWakeIntervalReq_ENC()
{
  return MEMORY[0x24BECE420]();
}

uint64_t ARI_CsiIceBspSetApWakeIntervalRspCb_Extract()
{
  return MEMORY[0x24BECE428]();
}

uint64_t ARI_CsiIceFilerReadReq_BLK()
{
  return MEMORY[0x24BECE430]();
}

uint64_t ARI_CsiIceFilerReadReq_ENC()
{
  return MEMORY[0x24BECE438]();
}

uint64_t ARI_CsiIceFilerReadRspCb_Extract()
{
  return MEMORY[0x24BECE440]();
}

uint64_t ARI_CsiIceFilerWriteRspCb_Extract()
{
  return MEMORY[0x24BECE448]();
}

uint64_t ARI_CsiIceFinishProvisionReq_BLK()
{
  return MEMORY[0x24BECE450]();
}

uint64_t ARI_CsiIceFinishProvisionReq_ENC()
{
  return MEMORY[0x24BECE458]();
}

uint64_t ARI_CsiIceFinishProvisionResp_Extract()
{
  return MEMORY[0x24BECE460]();
}

uint64_t ARI_CsiIceGetFactoryDebugEnabledReq_BLK()
{
  return MEMORY[0x24BECE468]();
}

uint64_t ARI_CsiIceGetFactoryDebugEnabledReq_ENC()
{
  return MEMORY[0x24BECE470]();
}

uint64_t ARI_CsiIceGetFactoryDebugEnabledResp_Extract()
{
  return MEMORY[0x24BECE478]();
}

uint64_t ARI_CsiIceGetManifestStatusReq_BLK()
{
  return MEMORY[0x24BECE480]();
}

uint64_t ARI_CsiIceGetManifestStatusReq_ENC()
{
  return MEMORY[0x24BECE488]();
}

uint64_t ARI_CsiIceGetManifestStatusResp_Extract()
{
  return MEMORY[0x24BECE490]();
}

uint64_t ARI_CsiIceGetRxDiversityReq_BLK()
{
  return MEMORY[0x24BECE498]();
}

uint64_t ARI_CsiIceGetRxDiversityReq_ENC()
{
  return MEMORY[0x24BECE4A0]();
}

uint64_t ARI_CsiIceGetRxDiversityRspCb_Extract()
{
  return MEMORY[0x24BECE4A8]();
}

uint64_t ARI_CsiIceRxDiversityReq_BLK()
{
  return MEMORY[0x24BECE4B0]();
}

uint64_t ARI_CsiIceRxDiversityReq_ENC()
{
  return MEMORY[0x24BECE4B8]();
}

uint64_t ARI_CsiIceRxDiversityRspCb_Extract()
{
  return MEMORY[0x24BECE4C0]();
}

uint64_t ARI_CsiIceStartProvisionReq_BLK()
{
  return MEMORY[0x24BECE4C8]();
}

uint64_t ARI_CsiIceStartProvisionReq_ENC()
{
  return MEMORY[0x24BECE4D0]();
}

uint64_t ARI_CsiIceStartProvisionResp_Extract()
{
  return MEMORY[0x24BECE4D8]();
}

uint64_t ARI_CsiIpcGetLogBufferListReq_BLK()
{
  return MEMORY[0x24BECE4E0]();
}

uint64_t ARI_CsiIpcGetLogBufferListReq_ENC()
{
  return MEMORY[0x24BECE4E8]();
}

uint64_t ARI_CsiIpcGetLogBufferListRsp_Extract()
{
  return MEMORY[0x24BECE4F0]();
}

uint64_t ARI_CsiIpcGetLogBufferReq_BLK()
{
  return MEMORY[0x24BECE4F8]();
}

uint64_t ARI_CsiIpcGetLogBufferReq_ENC()
{
  return MEMORY[0x24BECE500]();
}

uint64_t ARI_CsiIpcGetLogBufferRsp_Extract()
{
  return MEMORY[0x24BECE508]();
}

uint64_t ARI_CsiMonMemoryStatusReq_BLK()
{
  return MEMORY[0x24BECE510]();
}

uint64_t ARI_CsiMonMemoryStatusReq_ENC()
{
  return MEMORY[0x24BECE518]();
}

uint64_t ARI_CsiMonMemoryStatusRspCb_Extract()
{
  return MEMORY[0x24BECE520]();
}

uint64_t ARI_CsiMsCpsReadMeidReq_BLK()
{
  return MEMORY[0x24BECE528]();
}

uint64_t ARI_CsiMsCpsReadMeidReq_ENC()
{
  return MEMORY[0x24BECE530]();
}

uint64_t ARI_CsiMsCpsReadMeidRspCb_Extract()
{
  return MEMORY[0x24BECE538]();
}

uint64_t ARI_CsiMsSimCardPresenceReq_BLK()
{
  return MEMORY[0x24BECE540]();
}

uint64_t ARI_CsiMsSimCardPresenceReq_ENC()
{
  return MEMORY[0x24BECE548]();
}

uint64_t ARI_CsiMsSimCardPresenceRspCb_Extract()
{
  return MEMORY[0x24BECE550]();
}

uint64_t ARI_CsiSahGetCrashReportReq_BLK()
{
  return MEMORY[0x24BECE558]();
}

uint64_t ARI_CsiSahGetCrashReportReq_ENC()
{
  return MEMORY[0x24BECE560]();
}

uint64_t ARI_CsiSahGetCrashReportRspCb_Extract()
{
  return MEMORY[0x24BECE568]();
}

uint64_t ARI_CsiSecGetChipIdReq_BLK()
{
  return MEMORY[0x24BECE570]();
}

uint64_t ARI_CsiSecGetChipIdReq_ENC()
{
  return MEMORY[0x24BECE578]();
}

uint64_t ARI_CsiSecGetChipIdRspCb_Extract()
{
  return MEMORY[0x24BECE580]();
}

uint64_t ARI_CsiSecGetFusingStateReq_BLK()
{
  return MEMORY[0x24BECE588]();
}

uint64_t ARI_CsiSecGetFusingStateReq_ENC()
{
  return MEMORY[0x24BECE590]();
}

uint64_t ARI_CsiSecGetFusingStateRspCb_Extract()
{
  return MEMORY[0x24BECE598]();
}

uint64_t ARI_CsiSecGetPkHashReq_BLK()
{
  return MEMORY[0x24BECE5A0]();
}

uint64_t ARI_CsiSecGetPkHashReq_ENC()
{
  return MEMORY[0x24BECE5A8]();
}

uint64_t ARI_CsiSecGetPkHashRspCb_Extract()
{
  return MEMORY[0x24BECE5B0]();
}

uint64_t ARI_CsiSecGetSNUMReq_BLK()
{
  return MEMORY[0x24BECE5B8]();
}

uint64_t ARI_CsiSecGetSNUMReq_ENC()
{
  return MEMORY[0x24BECE5C0]();
}

uint64_t ARI_CsiSecGetSNUMRspCb_Extract()
{
  return MEMORY[0x24BECE5C8]();
}

uint64_t ARI_CsiSysGetInfoReqV2_BLK()
{
  return MEMORY[0x24BECE5D0]();
}

uint64_t ARI_CsiSysGetInfoReqV2_ENC()
{
  return MEMORY[0x24BECE5D8]();
}

uint64_t ARI_CsiSysGetInfoRspCbV2_Extract()
{
  return MEMORY[0x24BECE5E0]();
}

uint64_t ARI_UtaMsCpsSetSvnReq_BLK()
{
  return MEMORY[0x24BECE5E8]();
}

uint64_t ARI_UtaMsCpsSetSvnReq_ENC()
{
  return MEMORY[0x24BECE5F0]();
}

uint64_t TelephonyCapabilitiesGetHardwareModel()
{
  return MEMORY[0x24BED96A8]();
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x24BED9710]();
}

uint64_t TelephonyUtilLogBinaryToBuffer()
{
  return MEMORY[0x24BED9738]();
}

uint64_t TelephonyUtilLogGetBufferSize()
{
  return MEMORY[0x24BED9740]();
}

uint64_t TelephonyUtilTransportCreateWithFD()
{
  return MEMORY[0x24BED97A0]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x24BECE808](this, a2, a3);
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x24BED9C78](this);
}

uint64_t ctu::partition()
{
  return MEMORY[0x24BED9D18]();
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE860](this, a2);
}

uint64_t AriMsg::GetBufMsgDir(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE868](this, a2);
}

uint64_t AriMsg::ReleaseEncodedMessage(AriMsg *this, unsigned __int8 *a2)
{
  return MEMORY[0x24BECE870](this, a2);
}

uint64_t AriMsg::GetBufCtx(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE888](this, a2);
}

void AriMsg::AriMsg(AriMsg *this, const unsigned __int8 *a2)
{
  MEMORY[0x24BECE8A8](this, a2);
}

void AriMsg::~AriMsg(AriMsg *this)
{
  MEMORY[0x24BECE8B8](this);
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BECE8C0](this, a2, a3);
}

uint64_t AriSdk::ARI_CsiIceAtExtReq_SDK::ARI_CsiIceAtExtReq_SDK(AriSdk::ARI_CsiIceAtExtReq_SDK *this)
{
  return MEMORY[0x24BECE9D8](this);
}

void AriSdk::ARI_CsiIceAtExtReq_SDK::~ARI_CsiIceAtExtReq_SDK(AriSdk::ARI_CsiIceAtExtReq_SDK *this)
{
  MEMORY[0x24BECE9E0](this);
}

uint64_t AriSdk::ARI_IBIPriWriteReq_V2_SDK::ARI_IBIPriWriteReq_V2_SDK(AriSdk::ARI_IBIPriWriteReq_V2_SDK *this)
{
  return MEMORY[0x24BECED68](this);
}

void AriSdk::ARI_IBIPriWriteReq_V2_SDK::~ARI_IBIPriWriteReq_V2_SDK(AriSdk::ARI_IBIPriWriteReq_V2_SDK *this)
{
  MEMORY[0x24BECED70](this);
}

uint64_t AriSdk::ARI_IBIVinylTapeRspCb_SDK::unpack(AriSdk::ARI_IBIVinylTapeRspCb_SDK *this)
{
  return MEMORY[0x24BECEE10](this);
}

uint64_t AriSdk::ARI_IBIVinylTapeRspCb_SDK::ARI_IBIVinylTapeRspCb_SDK(AriSdk::ARI_IBIVinylTapeRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECEE18](this, a2);
}

uint64_t AriSdk::ARI_CsiBspSwTrapReq_v3_SDK::ARI_CsiBspSwTrapReq_v3_SDK(AriSdk::ARI_CsiBspSwTrapReq_v3_SDK *this)
{
  return MEMORY[0x24BECEE38](this);
}

void AriSdk::ARI_CsiBspSwTrapReq_v3_SDK::~ARI_CsiBspSwTrapReq_v3_SDK(AriSdk::ARI_CsiBspSwTrapReq_v3_SDK *this)
{
  MEMORY[0x24BECEE40](this);
}

uint64_t AriSdk::ARI_IBIPriRefreshRspCb_SDK::unpack(AriSdk::ARI_IBIPriRefreshRspCb_SDK *this)
{
  return MEMORY[0x24BECEFC8](this);
}

uint64_t AriSdk::ARI_IBIPriRefreshRspCb_SDK::ARI_IBIPriRefreshRspCb_SDK(AriSdk::ARI_IBIPriRefreshRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECEFD0](this, a2);
}

uint64_t AriSdk::ARI_CsiIceFilerWriteReq_SDK::ARI_CsiIceFilerWriteReq_SDK(AriSdk::ARI_CsiIceFilerWriteReq_SDK *this)
{
  return MEMORY[0x24BECF168](this);
}

void AriSdk::ARI_CsiIceFilerWriteReq_SDK::~ARI_CsiIceFilerWriteReq_SDK(AriSdk::ARI_CsiIceFilerWriteReq_SDK *this)
{
  MEMORY[0x24BECF170](this);
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::ARI_CsiMsCpsReadImeiReq_SDK(AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *this)
{
  return MEMORY[0x24BECF190](this);
}

void AriSdk::ARI_CsiMsCpsReadImeiReq_SDK::~ARI_CsiMsCpsReadImeiReq_SDK(AriSdk::ARI_CsiMsCpsReadImeiReq_SDK *this)
{
  MEMORY[0x24BECF198](this);
}

uint64_t AriSdk::ARI_IBINvmSnapshotRspCb_SDK::unpack(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *this)
{
  return MEMORY[0x24BECF208](this);
}

uint64_t AriSdk::ARI_IBINvmSnapshotRspCb_SDK::ARI_IBINvmSnapshotRspCb_SDK(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF210](this, a2);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::unpack(AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *this)
{
  return MEMORY[0x24BECF218](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::ARI_IBIPriWriteRspCb_V2_SDK(AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF220](this, a2);
}

void AriSdk::ARI_IBIPriWriteRspCb_V2_SDK::~ARI_IBIPriWriteRspCb_V2_SDK(AriSdk::ARI_IBIPriWriteRspCb_V2_SDK *this)
{
  MEMORY[0x24BECF228](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::unpack(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *this)
{
  return MEMORY[0x24BECF230](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::ARI_IBIPriWriteRspCb_V3_SDK(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF238](this, a2);
}

uint64_t AriSdk::ARI_IBISimTrayStatusReq_SDK::ARI_IBISimTrayStatusReq_SDK(AriSdk::ARI_IBISimTrayStatusReq_SDK *this)
{
  return MEMORY[0x24BECF288](this);
}

void AriSdk::ARI_IBISimTrayStatusReq_SDK::~ARI_IBISimTrayStatusReq_SDK(AriSdk::ARI_IBISimTrayStatusReq_SDK *this)
{
  MEMORY[0x24BECF290](this);
}

uint64_t AriSdk::ARI_IBIVinylGetEidRspCb_SDK::unpack(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *this)
{
  return MEMORY[0x24BECF300](this);
}

uint64_t AriSdk::ARI_IBIVinylGetEidRspCb_SDK::ARI_IBIVinylGetEidRspCb_SDK(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF308](this, a2);
}

uint64_t AriSdk::ARI_TraceSetConfigRspCb_SDK::unpack(AriSdk::ARI_TraceSetConfigRspCb_SDK *this)
{
  return MEMORY[0x24BECF328](this);
}

uint64_t AriSdk::ARI_TraceSetConfigRspCb_SDK::ARI_TraceSetConfigRspCb_SDK(AriSdk::ARI_TraceSetConfigRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF330](this, a2);
}

uint64_t AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::unpack(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *this)
{
  return MEMORY[0x24BECF458](this);
}

uint64_t AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::ARI_CsiSysGetInfoRspCbV2_SDK(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF460](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *this)
{
  return MEMORY[0x24BECF600](this);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::ARI_IBIVinylAuthPsoRspCb_SDK(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF608](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylGetDataRspCb_SDK::unpack(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *this)
{
  return MEMORY[0x24BECF610](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataRspCb_SDK::ARI_IBIVinylGetDataRspCb_SDK(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF618](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *this)
{
  return MEMORY[0x24BECF628](this);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::ARI_IBIVinylInitPsoRspCb_SDK(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF630](this, a2);
}

uint64_t AriSdk::ARI_CsiIceGetTxAntennaReq_SDK::ARI_CsiIceGetTxAntennaReq_SDK(AriSdk::ARI_CsiIceGetTxAntennaReq_SDK *this)
{
  return MEMORY[0x24BECF6D0](this);
}

void AriSdk::ARI_CsiIceGetTxAntennaReq_SDK::~ARI_CsiIceGetTxAntennaReq_SDK(AriSdk::ARI_CsiIceGetTxAntennaReq_SDK *this)
{
  MEMORY[0x24BECF6D8](this);
}

uint64_t AriSdk::ARI_CsiIceRFFilerWriteReq_SDK::ARI_CsiIceRFFilerWriteReq_SDK(AriSdk::ARI_CsiIceRFFilerWriteReq_SDK *this)
{
  return MEMORY[0x24BECF6E0](this);
}

void AriSdk::ARI_CsiIceRFFilerWriteReq_SDK::~ARI_CsiIceRFFilerWriteReq_SDK(AriSdk::ARI_CsiIceRFFilerWriteReq_SDK *this)
{
  MEMORY[0x24BECF6E8](this);
}

uint64_t AriSdk::ARI_CsiIceSetTxAntennaReq_SDK::ARI_CsiIceSetTxAntennaReq_SDK(AriSdk::ARI_CsiIceSetTxAntennaReq_SDK *this)
{
  return MEMORY[0x24BECF6F0](this);
}

void AriSdk::ARI_CsiIceSetTxAntennaReq_SDK::~ARI_CsiIceSetTxAntennaReq_SDK(AriSdk::ARI_CsiIceSetTxAntennaReq_SDK *this)
{
  MEMORY[0x24BECF6F8](this);
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::unpack(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this)
{
  return MEMORY[0x24BECF740](this);
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::ARI_CsiMsCpsReadImeiRspCb_SDK(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF748](this, a2);
}

void AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::~ARI_CsiMsCpsReadImeiRspCb_SDK(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this)
{
  MEMORY[0x24BECF750](this);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
  return MEMORY[0x24BECF758](this);
}

void AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
  MEMORY[0x24BECF760](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *this)
{
  return MEMORY[0x24BECF840](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::ARI_IBIFilerHSReadBBRspCb_SDK(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF848](this, a2);
}

uint64_t AriSdk::ARI_IBISimTrayStatusRspCb_SDK::unpack(AriSdk::ARI_IBISimTrayStatusRspCb_SDK *this)
{
  return MEMORY[0x24BECF930](this);
}

uint64_t AriSdk::ARI_IBISimTrayStatusRspCb_SDK::ARI_IBISimTrayStatusRspCb_SDK(AriSdk::ARI_IBISimTrayStatusRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECF938](this, a2);
}

void AriSdk::ARI_IBISimTrayStatusRspCb_SDK::~ARI_IBISimTrayStatusRspCb_SDK(AriSdk::ARI_IBISimTrayStatusRspCb_SDK *this)
{
  MEMORY[0x24BECF940](this);
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::unpack(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *this)
{
  return MEMORY[0x24BECFAC8](this);
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::ARI_CsiSecReadSikPKeyRspCb_SDK(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFAD0](this, a2);
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *this)
{
  return MEMORY[0x24BECFBD0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::ARI_IBIFilerHSWriteBBRspCb_SDK(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFBD8](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::unpack(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *this)
{
  return MEMORY[0x24BECFDE0](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::ARI_IBIVinylInstallFwRspCb_SDK(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFDE8](this, a2);
}

uint64_t AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::unpack(AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *this)
{
  return MEMORY[0x24BECFEA0](this);
}

uint64_t AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::ARI_CsiIceGetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFEA8](this, a2);
}

void AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK::~ARI_CsiIceGetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceGetTxAntennaRspCb_SDK *this)
{
  MEMORY[0x24BECFEB0](this);
}

uint64_t AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::unpack(AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *this)
{
  return MEMORY[0x24BECFEB8](this);
}

uint64_t AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK::ARI_CsiIceRFFilerWriteRspCb_SDK(AriSdk::ARI_CsiIceRFFilerWriteRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFEC0](this, a2);
}

uint64_t AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::unpack(AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *this)
{
  return MEMORY[0x24BECFEC8](this);
}

uint64_t AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::ARI_CsiIceSetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFED0](this, a2);
}

void AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK::~ARI_CsiIceSetTxAntennaRspCb_SDK(AriSdk::ARI_CsiIceSetTxAntennaRspCb_SDK *this)
{
  MEMORY[0x24BECFED8](this);
}

uint64_t AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::unpack(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *this)
{
  return MEMORY[0x24BECFEF0](this);
}

uint64_t AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::ARI_CsiIceWakeupReasonRspCb_SDK(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFEF8](this, a2);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::unpack(AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *this)
{
  return MEMORY[0x24BECFF38](this);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::ARI_CsiSecGetRandomNumRspCb_SDK(AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECFF40](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::unpack(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *this)
{
  return MEMORY[0x24BED0260](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::ARI_IBIVinylInstallVadRspCb_SDK(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0268](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::unpack(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *this)
{
  return MEMORY[0x24BED0288](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::ARI_IBIVinylSwitchModeRspCb_SDK(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0290](this, a2);
}

uint64_t AriSdk::ARI_CsiDelayedOutstandingReq_SDK::ARI_CsiDelayedOutstandingReq_SDK(AriSdk::ARI_CsiDelayedOutstandingReq_SDK *this)
{
  return MEMORY[0x24BED02E0](this);
}

void AriSdk::ARI_CsiDelayedOutstandingReq_SDK::~ARI_CsiDelayedOutstandingReq_SDK(AriSdk::ARI_CsiDelayedOutstandingReq_SDK *this)
{
  MEMORY[0x24BED02E8](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *this)
{
  return MEMORY[0x24BED0620](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::ARI_IBIVinylFinalizePsoRspCb_SDK(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0628](this, a2);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::unpack(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *this)
{
  return MEMORY[0x24BED0640](this);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::ARI_IBIVinylValidatePsoRspCb_SDK(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0648](this, a2);
}

uint64_t AriSdk::ARI_CsiDelayedOutstandingResp_SDK::unpack(AriSdk::ARI_CsiDelayedOutstandingResp_SDK *this)
{
  return MEMORY[0x24BED0660](this);
}

uint64_t AriSdk::ARI_CsiDelayedOutstandingResp_SDK::ARI_CsiDelayedOutstandingResp_SDK(AriSdk::ARI_CsiDelayedOutstandingResp_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0668](this, a2);
}

void AriSdk::ARI_CsiDelayedOutstandingResp_SDK::~ARI_CsiDelayedOutstandingResp_SDK(AriSdk::ARI_CsiDelayedOutstandingResp_SDK *this)
{
  MEMORY[0x24BED0670](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
  return MEMORY[0x24BED0678](this);
}

void AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
  MEMORY[0x24BED0680](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x24BED08C8](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  MEMORY[0x24BED08D0](this);
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::unpack(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *this)
{
  return MEMORY[0x24BED0A70](this);
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::ARI_CsiSecCollectScrtBlobRspCb_SDK(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0A78](this, a2);
}

uint64_t AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::ARI_CsiFactGetTestReadyStateReq_SDK(AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *this)
{
  return MEMORY[0x24BED0CB0](this);
}

void AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK::~ARI_CsiFactGetTestReadyStateReq_SDK(AriSdk::ARI_CsiFactGetTestReadyStateReq_SDK *this)
{
  MEMORY[0x24BED0CB8](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::unpack(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this)
{
  return MEMORY[0x24BED0CC0](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::ARI_CsiGetCurrentBootStateRspCb_SDK(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0CC8](this, a2);
}

void AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::~ARI_CsiGetCurrentBootStateRspCb_SDK(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this)
{
  MEMORY[0x24BED0CD0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *this)
{
  return MEMORY[0x24BED0DF8](this);
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::ARI_IBIFilerHSEndBBSessionRspCb_SDK(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0E00](this, a2);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::unpack(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *this)
{
  return MEMORY[0x24BED0EF8](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::ARI_IBISimAccessGetSimDataRspCb_SDK(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED0F00](this, a2);
}

uint64_t AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::ARI_CsiBmmProvideBootTimeInfoReq_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *this)
{
  return MEMORY[0x24BED0F98](this);
}

void AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK::~ARI_CsiBmmProvideBootTimeInfoReq_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoReq_SDK *this)
{
  MEMORY[0x24BED0FA0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *this)
{
  return MEMORY[0x24BED1068](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1070](this, a2);
}

uint64_t AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::ARI_IBIMSimGetSimStackMappingReq_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *this)
{
  return MEMORY[0x24BED1078](this);
}

void AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK::~ARI_IBIMSimGetSimStackMappingReq_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingReq_SDK *this)
{
  MEMORY[0x24BED1080](this);
}

uint64_t AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::unpack(AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *this)
{
  return MEMORY[0x24BED11C8](this);
}

uint64_t AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::ARI_CsiFactGetTestReadyStateRspCb_SDK(AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED11D0](this, a2);
}

void AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK::~ARI_CsiFactGetTestReadyStateRspCb_SDK(AriSdk::ARI_CsiFactGetTestReadyStateRspCb_SDK *this)
{
  MEMORY[0x24BED11D8](this);
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::unpack(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *this)
{
  return MEMORY[0x24BED1218](this);
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::ARI_FactoryGetNvItemsSettingRspCb_SDK(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1220](this, a2);
}

uint64_t AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::unpack(AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *this)
{
  return MEMORY[0x24BED1460](this);
}

uint64_t AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1468](this, a2);
}

void AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK::~ARI_CsiBmmProvideBootTimeInfoRspCb_SDK(AriSdk::ARI_CsiBmmProvideBootTimeInfoRspCb_SDK *this)
{
  MEMORY[0x24BED1470](this);
}

uint64_t AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::unpack(AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *this)
{
  return MEMORY[0x24BED1510](this);
}

uint64_t AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::ARI_IBIMSimGetSimStackMappingRspCb_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1518](this, a2);
}

void AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK::~ARI_IBIMSimGetSimStackMappingRspCb_SDK(AriSdk::ARI_IBIMSimGetSimStackMappingRspCb_SDK *this)
{
  MEMORY[0x24BED1520](this);
}

uint64_t AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::unpack(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *this)
{
  return MEMORY[0x24BED1858](this);
}

uint64_t AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::ARI_GetPersonalizationParametersRspCb_SDK(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1860](this, a2);
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *this)
{
  return MEMORY[0x24BED18B8](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED18C0](this, a2);
}

uint64_t AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::ARI_CsiMSimGetSimStackMappingStatusReq_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *this)
{
  return MEMORY[0x24BED1908](this);
}

void AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK::~ARI_CsiMSimGetSimStackMappingStatusReq_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusReq_SDK *this)
{
  MEMORY[0x24BED1910](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::unpack(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *this)
{
  return MEMORY[0x24BED1970](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1978](this, a2);
}

uint64_t AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::unpack(AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *this)
{
  return MEMORY[0x24BED1A38](this);
}

uint64_t AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BED1A40](this, a2);
}

void AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK::~ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK(AriSdk::ARI_CsiMSimGetSimStackMappingStatusRspCb_SDK *this)
{
  MEMORY[0x24BED1A48](this);
}

uint64_t AriSdk::MsgBase::getRawBytes()
{
  return MEMORY[0x24BED1C50]();
}

uint64_t AriHost::StartStream()
{
  return MEMORY[0x24BED1C60]();
}

uint64_t AriHost::Send()
{
  return MEMORY[0x24BED1CC0]();
}

uint64_t AriHost::ExitTrx(AriHost *this)
{
  return MEMORY[0x24BED1CD0](this);
}

uint64_t AriHost::EndStream(AriHost *this)
{
  return MEMORY[0x24BED1CD8](this);
}

uint64_t AriSdk::ARI_IBIVinylTapeRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylTapeRspCb_SDK *this)
{
  return MEMORY[0x24BED1D00](this);
}

uint64_t AriSdk::ARI_IBIPriRefreshRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIPriRefreshRspCb_SDK *this)
{
  return MEMORY[0x24BED1D08](this);
}

uint64_t AriSdk::ARI_IBINvmSnapshotRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBINvmSnapshotRspCb_SDK *this)
{
  return MEMORY[0x24BED1D10](this);
}

uint64_t AriSdk::ARI_IBIPriWriteRspCb_V3_SDK::hasDeclaredGmid(AriSdk::ARI_IBIPriWriteRspCb_V3_SDK *this)
{
  return MEMORY[0x24BED1D18](this);
}

uint64_t AriSdk::ARI_IBIVinylGetEidRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylGetEidRspCb_SDK *this)
{
  return MEMORY[0x24BED1D20](this);
}

uint64_t AriSdk::ARI_TraceSetConfigRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_TraceSetConfigRspCb_SDK *this)
{
  return MEMORY[0x24BED1D28](this);
}

uint64_t AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSysGetInfoRspCbV2_SDK *this)
{
  return MEMORY[0x24BED1D30](this);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylAuthPsoRspCb_SDK *this)
{
  return MEMORY[0x24BED1D38](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylGetDataRspCb_SDK *this)
{
  return MEMORY[0x24BED1D40](this);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylInitPsoRspCb_SDK *this)
{
  return MEMORY[0x24BED1D48](this);
}

uint64_t AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiMsCpsReadImeiRspCb_SDK *this)
{
  return MEMORY[0x24BED1D50](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSReadBBRspCb_SDK *this)
{
  return MEMORY[0x24BED1D58](this);
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSecReadSikPKeyRspCb_SDK *this)
{
  return MEMORY[0x24BED1D60](this);
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSWriteBBRspCb_SDK *this)
{
  return MEMORY[0x24BED1D68](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylInstallFwRspCb_SDK *this)
{
  return MEMORY[0x24BED1D70](this);
}

uint64_t AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiIceWakeupReasonRspCb_SDK *this)
{
  return MEMORY[0x24BED1D78](this);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSecGetRandomNumRspCb_SDK *this)
{
  return MEMORY[0x24BED1D80](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylInstallVadRspCb_SDK *this)
{
  return MEMORY[0x24BED1D88](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylSwitchModeRspCb_SDK *this)
{
  return MEMORY[0x24BED1D90](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylFinalizePsoRspCb_SDK *this)
{
  return MEMORY[0x24BED1D98](this);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIVinylValidatePsoRspCb_SDK *this)
{
  return MEMORY[0x24BED1DA0](this);
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiSecCollectScrtBlobRspCb_SDK *this)
{
  return MEMORY[0x24BED1DA8](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_CsiGetCurrentBootStateRspCb_SDK *this)
{
  return MEMORY[0x24BED1DB0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSEndBBSessionRspCb_SDK *this)
{
  return MEMORY[0x24BED1DB8](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBISimAccessGetSimDataRspCb_SDK *this)
{
  return MEMORY[0x24BED1DC0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSReadBBGetSizeRspCb_SDK *this)
{
  return MEMORY[0x24BED1DC8](this);
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_FactoryGetNvItemsSettingRspCb_SDK *this)
{
  return MEMORY[0x24BED1DD0](this);
}

uint64_t AriSdk::ARI_GetPersonalizationParametersRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_GetPersonalizationParametersRspCb_SDK *this)
{
  return MEMORY[0x24BED1DD8](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSStartReadBBSessionRspCb_SDK *this)
{
  return MEMORY[0x24BED1DE0](this);
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK::hasDeclaredGmid(AriSdk::ARI_IBIFilerHSStartWriteBBSessionRspCb_SDK *this)
{
  return MEMORY[0x24BED1DE8](this);
}

uint64_t AriSdk::MsgBase::getMergedGMID(AriSdk::MsgBase *this)
{
  return MEMORY[0x24BED1DF0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_24CC18BB8(__p);
}

void operator delete(void *__p)
{
  off_24CC18BC0(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24CC18BC8(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CC18BD0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

