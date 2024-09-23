_QWORD *PFUserCreate(char *a1, char *a2, NSObject *a3)
{
  _QWORD *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  const __CFAllocator *v12;
  uint64_t Instance;
  CFMutableDictionaryRef v14;
  NSObject *Queue;
  _QWORD block[9];
  CFDictionaryValueCallBacks valueCallBacks;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v6 = 0;
  if (PFManagerLogOpen())
    goto LABEL_16;
  if (!a1 || !a2 || !a3)
  {
    PFManagerErrorLog();
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  v7 = kPFInternetSharing;
  v8 = kPFAirDrop;
  v9 = kPFServerFirewall;
  v10 = kPFThreadBR;
  if (kPFInternetSharing != a1
    && kPFNLC != a1
    && kPFVPN != a1
    && kPFFTPProxy != a1
    && kPFAirDrop != a1
    && kPFApplicationFirewall != a1
    && kPFServerFirewall != a1
    && kPFThreadBR != a1
    || (*((_BYTE *)v19 + 24) = 1, kPFBase != a2)
    && (v7 != a1 || kPFPortMapping != a2)
    && (v7 != a1 || kPFBase_v4 != a2)
    && (v7 != a1 || kPFBase_v6 != a2)
    && (v7 != a1 || kPFBase_nat64 != a2)
    && (v7 != a1 || kPFBase_nat66 != a2)
    && (v7 != a1 || kPFShared_v4 != a2)
    && (v7 != a1 || kPFShared_v6 != a2)
    && (v7 != a1 || kPFHost_v4 != a2)
    && (v7 != a1 || kPFHost_v6 != a2)
    && (v8 != a1 || kPFMDNS != a2)
    && (v9 != a1 || kPFDefaultFirewall != a2)
    && (v9 != a1 || kPFAdaptiveFirewall != a2)
    && (v9 != a1 || kPFCustomFirewall != a2)
    && (v10 != a1 || kPFThreadBR_nat64 != a2))
  {
    PFManagerErrorLog();
    v6 = 0;
    *((_BYTE *)v19 + 24) = 0;
    goto LABEL_16;
  }
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!__pfUserTypeID)
    pthread_once(&__pfUserTypeInit, (void (*)(void))__PFUserRegister);
  Instance = _CFRuntimeCreateInstance();
  v6 = (_QWORD *)Instance;
  if (!Instance)
  {
    PFManagerErrorLog();
    goto LABEL_16;
  }
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_QWORD *)(Instance + 24) = a1;
  *(_QWORD *)(Instance + 32) = a2;
  *(_QWORD *)(Instance + 40) = a3;
  dispatch_retain(a3);
  *(_OWORD *)&valueCallBacks.version = xmmword_24D7937C0;
  *(_OWORD *)&valueCallBacks.release = *(_OWORD *)&off_24D7937D0;
  valueCallBacks.equal = 0;
  v14 = CFDictionaryCreateMutable(v12, 0, MEMORY[0x24BDBD6A0], &valueCallBacks);
  v6[6] = v14;
  if (!v14 || (Queue = PFManagerGetQueue()) == 0)
  {
    PFManagerErrorLog();
    CFRelease(v6);
    goto LABEL_15;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __PFUserCreate_block_invoke;
  block[3] = &unk_24D7937F0;
  block[4] = &v18;
  block[5] = v6;
  block[6] = a1;
  block[7] = a2;
  block[8] = Queue;
  dispatch_sync(Queue, block);
  if (!*((_BYTE *)v19 + 24))
    v6 = 0;
LABEL_16:
  _Block_object_dispose(&v18, 8);
  return v6;
}

void __PFUserRuleDictionaryRelease(int a1, xpc_object_t object)
{
  xpc_release(object);
}

uint64_t PFUserBeginRules(uint64_t a1)
{
  uint64_t Queue;
  NSObject *v3;
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  char v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v14 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = -1;
  if (a1 && (Queue = PFManagerGetQueue()) != 0 && (v3 = Queue, (v4 = xpc_array_create(0, 0)) != 0))
  {
    v5 = v4;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 0x40000000;
    v8[2] = __PFUserBeginRules_block_invoke;
    v8[3] = &unk_24D793818;
    v8[6] = a1;
    v8[7] = v4;
    v8[4] = v13;
    v8[5] = &v9;
    dispatch_sync(v3, v8);
    xpc_release(v5);
  }
  else
  {
    PFManagerErrorLog();
  }
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
  return v6;
}

uint64_t PFUserAddRule(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t Queue;
  NSObject *v9;
  xpc_object_t v10;
  void *v11;
  char v12;
  _QWORD block[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  if (a1
    && a3
    && MEMORY[0x219A0CD04](a3) == MEMORY[0x24BDACFA0]
    && (a2 & 0x8000000000000000) == 0
    && (Queue = PFManagerGetQueue()) != 0
    && (v9 = Queue, (v10 = xpc_dictionary_create(0, 0, 0)) != 0))
  {
    v11 = v10;
    v12 = PFCheckRule(a3, v10);
    *((_BYTE *)v15 + 24) = v12;
    if ((v12 & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __PFUserAddRule_block_invoke;
      block[3] = &unk_24D793840;
      block[4] = &v14;
      block[5] = a1;
      block[6] = a2;
      block[7] = v11;
      dispatch_sync(v9, block);
    }
    else
    {
      PFManagerErrorLog();
    }
    xpc_release(v11);
  }
  else
  {
    PFManagerErrorLog();
  }
  v6 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v6;
}

const void *__PFUserGetTransArray(uint64_t a1, uint64_t a2)
{
  CFStringRef v3;
  CFStringRef v4;
  const void *Value;

  v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%lld"), a2);
  if (v3)
  {
    v4 = v3;
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), v3);
    CFRelease(v4);
    return Value;
  }
  else
  {
    PFManagerErrorLog();
    return 0;
  }
}

uint64_t PFUserCommitRules(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *Queue;
  uint64_t v8;
  _QWORD block[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  if (a1 && (a2 & 0x8000000000000000) == 0 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserCommitRules_block_invoke;
    block[3] = &unk_24D793890;
    block[6] = a1;
    block[7] = a2;
    block[4] = a4;
    block[5] = &v11;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __PFUserRemoveTransArray(uint64_t a1, uint64_t a2)
{
  CFStringRef v3;

  v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%lld"), a2);
  if (v3)
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), v3);
    CFRelease(v3);
  }
  else
  {
    PFManagerErrorLog();
  }
  return v3 != 0;
}

uint64_t PFUserClearRules(uint64_t a1, uint64_t a2)
{
  NSObject *Queue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1 && (a2 & 0x8000000000000000) == 0 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserClearRules_block_invoke;
    block[3] = &unk_24D7938B8;
    block[4] = &v8;
    block[5] = a1;
    block[6] = a2;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t PFUserDeleteRules(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *Queue;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (a1 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserDeleteRules_block_invoke;
    block[3] = &unk_24D793908;
    block[5] = &v9;
    block[6] = a1;
    block[4] = a3;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t PFUserRelease(uint64_t a1, uint64_t a2)
{
  NSObject *Queue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserRelease_block_invoke;
    block[3] = &unk_24D793930;
    block[5] = &v8;
    block[6] = a1;
    block[4] = a2;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t PFUserInsertRule(uint64_t a1, void *a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  xpc_object_t v11;
  void *v12;
  char v13;
  NSObject *Queue;
  _QWORD block[8];
  __int16 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  if (a1
    && a2
    && MEMORY[0x219A0CD04](a2) == MEMORY[0x24BDACFA0]
    && a5
    && (v11 = xpc_dictionary_create(0, 0, 0)) != 0)
  {
    v12 = v11;
    v13 = PFCheckRule(a2, v11);
    *((_BYTE *)v18 + 24) = v13;
    if ((v13 & 1) != 0 && (Queue = PFManagerGetQueue()) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __PFUserInsertRule_block_invoke;
      block[3] = &unk_24D793980;
      block[6] = a1;
      block[7] = v12;
      v16 = a3;
      block[4] = a5;
      block[5] = &v17;
      dispatch_sync(Queue, block);
    }
    else
    {
      PFManagerErrorLog();
    }
    xpc_release(v12);
  }
  else
  {
    PFManagerErrorLog();
  }
  v9 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t PFUserInsertRule_S(uint64_t a1, void *a2, __int16 a3)
{
  uint64_t v6;
  xpc_object_t v8;
  void *v9;
  char v10;
  NSObject *Queue;
  _QWORD block[8];
  __int16 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  if (a1 && a2 && MEMORY[0x219A0CD04](a2) == MEMORY[0x24BDACFA0] && (v8 = xpc_dictionary_create(0, 0, 0)) != 0)
  {
    v9 = v8;
    v10 = PFCheckRule(a2, v8);
    *((_BYTE *)v19 + 24) = v10;
    if ((v10 & 1) != 0 && (Queue = PFManagerGetQueue()) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __PFUserInsertRule_S_block_invoke;
      block[3] = &unk_24D7939A8;
      block[6] = a1;
      block[7] = v9;
      v13 = a3;
      block[4] = &v18;
      block[5] = &v14;
      dispatch_sync(Queue, block);
    }
    else
    {
      PFManagerErrorLog();
    }
    xpc_release(v9);
  }
  else
  {
    PFManagerErrorLog();
  }
  v6 = v15[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

uint64_t PFUserDeleteRule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *Queue;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (a1 && (Queue = PFManagerGetQueue()) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __PFUserDeleteRule_block_invoke;
    v9[3] = &unk_24D7939F8;
    v9[6] = a1;
    v9[7] = a2;
    v9[4] = a3;
    v9[5] = &v10;
    dispatch_sync(Queue, v9);
  }
  else
  {
    PFManagerErrorLog();
  }
  v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t PFUserGetRules(uint64_t a1, uint64_t a2)
{
  NSObject *Queue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1 && a2 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserGetRules_block_invoke;
    block[3] = &unk_24D793A48;
    block[5] = &v8;
    block[6] = a1;
    block[4] = a2;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t PFUserCopyRules_S(uint64_t a1)
{
  NSObject *Queue;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v11 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserCopyRules_S_block_invoke;
    block[3] = &unk_24D793A70;
    block[4] = v10;
    block[5] = &v6;
    block[6] = a1;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v3;
}

uint64_t PFUserClearStates(uint64_t a1, uint64_t a2)
{
  NSObject *Queue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1 && (Queue = PFManagerGetQueue()) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __PFUserClearStates_block_invoke;
    block[3] = &unk_24D793AC0;
    block[5] = &v8;
    block[6] = a1;
    block[4] = a2;
    dispatch_sync(Queue, block);
  }
  else
  {
    PFManagerErrorLog();
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t PFUserNATLook(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t Queue;
  NSObject *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  BOOL v9;
  uint64_t v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  if (a1
    && a3
    && a2
    && (Queue = PFManagerGetQueue()) != 0
    && (v6 = Queue, (v7 = xpc_dictionary_create(0, 0, 0)) != 0)
    && (v8 = v7, v9 = PFCheckNATRule(a2, v7), (*((_BYTE *)v14 + 24) = v9) != 0))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = __PFUserNATLook_block_invoke;
    v12[3] = &unk_24D793B08;
    v12[4] = &v13;
    v12[5] = a1;
    v12[6] = v8;
    v12[7] = a2;
    dispatch_sync(v6, v12);
  }
  else
  {
    PFManagerErrorLog();
  }
  v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t PFUserNATLook_S(uint64_t a1, void *a2)
{
  uint64_t Queue;
  NSObject *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  BOOL v8;
  uint64_t v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  if (a1
    && a2
    && (Queue = PFManagerGetQueue()) != 0
    && (v5 = Queue, (v6 = xpc_dictionary_create(0, 0, 0)) != 0)
    && (v7 = v6, v8 = PFCheckNATRule(a2, v6), (*((_BYTE *)v17 + 24) = v8) != 0))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 0x40000000;
    v11[2] = __PFUserNATLook_S_block_invoke;
    v11[3] = &unk_24D793B30;
    v11[6] = a1;
    v11[7] = v7;
    v11[4] = &v16;
    v11[5] = &v12;
    dispatch_sync(v5, v11);
  }
  else
  {
    PFManagerErrorLog();
  }
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t PFQueryGatewayAddrAndPortForDescriptor(uint64_t a1, uint64_t a2)
{
  NSObject *Queue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a2 && PFManagerCreate() && !PFManagerLogOpen())
  {
    if (a1 && (~*(unsigned __int8 *)(a1 + 8) & 0x14) == 0 && (Queue = PFManagerGetQueue()) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __PFQueryGatewayAddrAndPortForDescriptor_block_invoke;
      block[3] = &unk_24D793B58;
      block[4] = &v8;
      block[5] = a1;
      block[6] = a2;
      dispatch_sync(Queue, block);
    }
    else
    {
      PFManagerErrorLog();
    }
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t PFFindStatesByDescriptor(NSObject *a1, uint64_t a2, uint64_t a3)
{
  CFTypeRef v6;
  uint64_t Queue;
  NSObject *v9;
  _QWORD block[7];

  v6 = PFManagerCreate();
  if (v6 && !PFManagerLogOpen())
  {
    if (a1)
    {
      if (MEMORY[0x219A0CD04](a1) == MEMORY[0x24BDACFA0])
      {
        Queue = PFManagerGetQueue();
        if (Queue)
        {
          v9 = Queue;
          dispatch_retain(a1);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __PFFindStatesByDescriptor_block_invoke;
          block[3] = &unk_24D793BD0;
          block[5] = a1;
          block[6] = a2;
          block[4] = a3;
          dispatch_async(v9, block);
          return 1;
        }
      }
    }
    PFManagerErrorLog();
  }
  PFManagerRelease(v6);
  return 0;
}

uint64_t PFStateQueryAppendTrafficDescriptor(xpc_object_t *a1, const void *a2, const unsigned __int8 *a3)
{
  xpc_object_t value;
  xpc_object_t empty;
  xpc_object_t v9;

  if (*a1)
  {
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
      goto LABEL_7;
  }
  else
  {
    *a1 = xpc_dictionary_create(0, 0, 0);
    PFManagerInfoLog();
  }
  value = xpc_dictionary_get_value(*a1, (const char *)pfXPCTrafficDescriptors);
  if (value)
  {
    empty = value;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACF78])
    {
LABEL_7:
      PFManagerErrorLog();
      return 0;
    }
  }
  else
  {
    empty = xpc_array_create_empty();
    xpc_dictionary_set_value(*a1, (const char *)pfXPCTrafficDescriptors, empty);
    PFManagerInfoLog();
    xpc_release(empty);
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_data(v9, (const char *)pfXPCTrafficDescriptor, a2, 0x30uLL);
  xpc_dictionary_set_uuid(v9, (const char *)pfXPCTrafficDescriptorId, a3);
  xpc_array_append_value(empty, v9);
  xpc_release(v9);
  return 1;
}

uint64_t PFGetDescriptorStateDetails(void *a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t value;
  void *v7;
  const unsigned __int8 *bytes;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  void *v17;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_5;
  if (a3 != 40)
    goto LABEL_5;
  value = xpc_dictionary_get_value(a1, (const char *)pfXPCResponseDescriptorId);
  if (!value)
    goto LABEL_5;
  v7 = value;
  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDAD000])
    goto LABEL_5;
  bytes = xpc_uuid_get_bytes(v7);
  uuid_copy((unsigned __int8 *)(a2 + 16), bytes);
  v10 = xpc_dictionary_get_value(a1, (const char *)pfXPCResponseStatesFound);
  if (!v10)
    goto LABEL_5;
  v11 = v10;
  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACF80])
    goto LABEL_5;
  *(_BYTE *)(a2 + 32) = xpc_BOOL_get_value(v11);
  v12 = xpc_dictionary_get_value(a1, (const char *)pfXPCResponsePacketCountIn);
  if (!v12)
    goto LABEL_5;
  v13 = v12;
  v14 = MEMORY[0x219A0CD04]();
  v15 = MEMORY[0x24BDACFF8];
  if (v14 == MEMORY[0x24BDACFF8]
    && (*(_QWORD *)a2 = xpc_uint64_get_value(v13),
        (v16 = xpc_dictionary_get_value(a1, (const char *)pfXPCResponsePacketCountOut)) != 0)
    && (v17 = v16, MEMORY[0x219A0CD04]() == v15))
  {
    *(_QWORD *)(a2 + 8) = xpc_uint64_get_value(v17);
    return 1;
  }
  else
  {
LABEL_5:
    PFManagerErrorLog();
    return 0;
  }
}

uint64_t __PFUserRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __pfUserTypeID = result;
  return result;
}

uint64_t __PFUserRelease(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;
  const void *v5;
  _QWORD block[5];

  if (*(_QWORD *)(a1 + 56))
  {
    v2 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ____PFUserRelease_block_invoke;
    block[3] = &__block_descriptor_tmp_75;
    block[4] = a1;
    dispatch_async(v2, block);
    _Block_release(*(const void **)(a1 + 56));
  }
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_release(v3);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v5 = *(const void **)(a1 + 16);
  if (v5)
  {
    PFManagerRelease(v5);
    *(_QWORD *)(a1 + 16) = 0;
  }
  return PFManagerInfoLog();
}

uint64_t PFManagerLogOpen()
{
  int v0;
  BOOL v1;

  v0 = __pfLogError;
  if (!__pfLog && (__pfLogError & 1) == 0)
  {
    do
    {
      pthread_once(&__pfLogInit, __PFManagerLogCreate);
      v0 = __pfLogError;
      if (__pfLog)
        v1 = 0;
      else
        v1 = __pfLogError == 0;
    }
    while (v1);
  }
  if (v0)
    return 22;
  else
    return 0;
}

void __PFManagerLogCreate()
{
  __pfLog = (uint64_t)os_log_create((const char *)pfLogSubsystem, "framework");
  if (!__pfLog)
  {
    __pfLogError = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __PFManagerLogCreate_cold_1();
  }
}

uint64_t PFManagerErrorLog()
{
  return os_log_with_args();
}

uint64_t PFManagerNoticeLog()
{
  return os_log_with_args();
}

uint64_t PFManagerInfoLog()
{
  return os_log_with_args();
}

uint64_t PFManagerDebugLog()
{
  return os_log_with_args();
}

uint64_t PFManagerGetQueue()
{
  uint64_t result;

  result = __pfQueue;
  if (!__pfQueue && (__pfQueueError & 1) == 0)
  {
    do
    {
      pthread_once(&__pfQueueInit, __PFManagerQueueCreate);
      result = __pfQueue;
      if (__pfQueue)
        break;
      sleep(1u);
      result = __pfQueue;
    }
    while (!__pfQueue && __pfQueueError == 0);
  }
  return result;
}

void __PFManagerQueueCreate()
{
  char label[46];
  char __str[42];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x2AuLL, "com.apple.framework.pf.%p", &__pfManager);
  __str[41] = 0;
  __pfQueue = (uint64_t)dispatch_queue_create(__str, 0);
  if (__pfQueue)
  {
    snprintf(label, 0x2EuLL, "com.apple.framework.pf.xpc.%p", &__pfManager);
    label[45] = 0;
    __pfXpcQueue = (uint64_t)dispatch_queue_create(label, 0);
    if (__pfXpcQueue)
      return;
    dispatch_release((dispatch_object_t)__pfQueue);
    __pfQueue = 0;
  }
  __pfQueueError = 1;
}

CFTypeRef PFManagerCreate()
{
  CFTypeRef result;
  const __CFAllocator *v1;
  uint64_t Instance;
  CFMutableArrayRef Mutable;

  if (__pfManager)
    return CFRetain((CFTypeRef)__pfManager);
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!__pfManagerTypeID)
    pthread_once(&__pfManagerTypeInit, (void (*)(void))__PFManagerRegister);
  Instance = _CFRuntimeCreateInstance();
  __pfManager = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    Mutable = CFArrayCreateMutable(v1, 0, MEMORY[0x24BDBD690]);
    result = (CFTypeRef)__pfManager;
    *(_QWORD *)(__pfManager + 16) = Mutable;
    if (!Mutable)
    {
      PFManagerErrorLog();
      CFRelease((CFTypeRef)__pfManager);
      result = 0;
      __pfManager = 0;
    }
  }
  else
  {
    PFManagerErrorLog();
    return (CFTypeRef)__pfManager;
  }
  return result;
}

uint64_t PFManagerAddUser(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  CFIndex Count;
  CFIndex v8;
  BOOL v9;
  CFIndex i;
  _QWORD *ValueAtIndex;

  result = 0;
  if (a1 && a2)
  {
    v5 = a2[3];
    v6 = a2[4];
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
    if (Count < 1)
      goto LABEL_9;
    v8 = Count;
    v9 = 0;
    for (i = 0; i != v8; v9 = i >= v8)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), i);
      if (ValueAtIndex[3] == v5 && ValueAtIndex[4] == v6)
        break;
      ++i;
    }
    if (v9)
    {
LABEL_9:
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL PFManagerCheckUserExists(const void *a1)
{
  _BOOL8 result;
  const __CFArray *v3;
  CFRange v4;

  result = 0;
  if (a1 && __pfManager)
  {
    if (CFArrayGetCount(*(CFArrayRef *)(__pfManager + 16)) < 1)
    {
      return 0;
    }
    else
    {
      v3 = *(const __CFArray **)(__pfManager + 16);
      v4.length = CFArrayGetCount(v3);
      v4.location = 0;
      return CFArrayContainsValue(v3, v4, a1) != 0;
    }
  }
  return result;
}

uint64_t PFManagerReleaseUser(uint64_t a1, const void *a2)
{
  uint64_t result;
  CFIndex v5;

  result = 0;
  if (a1 && a2)
  {
    if (CFArrayGetCount(*(CFArrayRef *)(a1 + 16)) < 1 || CFArrayGetCount(*(CFArrayRef *)(a1 + 16)) < 1)
    {
      return 0;
    }
    else
    {
      v5 = 0;
      while (CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v5) != a2)
      {
        if (++v5 >= CFArrayGetCount(*(CFArrayRef *)(a1 + 16)))
          return 0;
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 16), v5);
      PFManagerDebugLog();
      return 1;
    }
  }
  return result;
}

uint64_t PFManagerSendMessage(void *a1, const char *a2, const char *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  if (__pfManager)
    return PFXPCSetupAndSend(__pfQueue, __pfXpcQueue, a1, a2, a3, a4, a5, a6);
  else
    return 0;
}

uint64_t PFManagerRelease(const void *a1)
{
  if (a1)
    CFRelease(a1);
  return 0;
}

uint64_t __PFManagerRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __pfManagerTypeID = result;
  return result;
}

uint64_t __PFManagerRelease(uint64_t a1)
{
  const void *v2;
  uint64_t result;

  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 16)))
    __PFManagerRelease_cold_1();
  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  PFXPCCleanup();
  result = PFManagerDebugLog();
  __pfManager = 0;
  return result;
}

uint64_t PFCheckRule(void *a1, void *a2)
{
  xpc_object_t value;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unsigned __int8 uint64;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  void *v24;
  uint64_t v25;
  xpc_object_t v26;
  void *v27;
  uint64_t v28;
  xpc_object_t v29;
  void *v30;
  uint64_t v31;
  xpc_object_t v32;
  void *v33;
  const char *v34;
  BOOL v35;
  xpc_object_t v36;
  void *v37;
  const char *string_ptr;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  int v57;

  v57 = -1;
  value = xpc_dictionary_get_value(a1, kPFAction);
  if (!value)
    goto LABEL_3;
  v5 = value;
  v6 = MEMORY[0x219A0CD04]();
  v7 = MEMORY[0x24BDACFF8];
  if (v6 != MEMORY[0x24BDACFF8])
    goto LABEL_3;
  v9 = xpc_uint64_get_value(v5);
  v10 = v9;
  if (v9 > 0xE || ((1 << v9) & 0x7B3F) == 0)
    goto LABEL_3;
  xpc_dictionary_set_uint64(a2, kPFAction, v9);
  if (v10 > 0xE || ((1 << v10) & 0x7B3F) == 0)
    return 0;
  uint64 = xpc_dictionary_get_uint64(a1, kPFAction);
  v14 = xpc_dictionary_get_value(a1, kPFDirection);
  if (v14)
  {
    result = __PFDirCheck(v14, a2);
    if (!(_DWORD)result)
      return result;
  }
  v15 = xpc_dictionary_get_value(a1, kPFProtocol);
  if (v15)
  {
    result = __PFProtocolCheck(v15, a2);
    if (!(_DWORD)result)
      return result;
  }
  v16 = xpc_dictionary_get_value(a1, kPFFamily);
  if (v16)
  {
    result = __PFFamilyCheck(v16, a2, &v57);
    if (!(_DWORD)result)
      return result;
  }
  v17 = xpc_dictionary_get_value(a1, kPFReturnOptions);
  if (v17)
  {
    v18 = v17;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
      goto LABEL_3;
    v19 = xpc_dictionary_get_value(v18, kPFSubReturnType);
    if (!v19)
      goto LABEL_3;
    v20 = v19;
    if (MEMORY[0x219A0CD04]() != v7)
      goto LABEL_3;
    v21 = xpc_uint64_get_value(v20);
    v22 = v21;
    if (v21 >= 9)
      goto LABEL_3;
    xpc_dictionary_set_uint64(a2, kPFSubReturnType, v21);
    v23 = xpc_dictionary_get_value(v18, kPFSubReturnTTL);
    if (v23)
    {
      v24 = v23;
      if (MEMORY[0x219A0CD04]() != v7)
        goto LABEL_3;
      if (v22 != 1)
        goto LABEL_3;
      v25 = xpc_uint64_get_value(v24);
      if (v25 > 0xFF)
        goto LABEL_3;
      xpc_dictionary_set_uint64(a2, kPFSubReturnTTL, v25);
    }
    v26 = xpc_dictionary_get_value(v18, kPFSubReturnICMPCode);
    if (v26)
    {
      v27 = v26;
      if (MEMORY[0x219A0CD04]() != v7)
        goto LABEL_3;
      if (v22 != 4)
        goto LABEL_3;
      v28 = xpc_uint64_get_value(v27);
      if (v28 > 0xFF)
        goto LABEL_3;
      xpc_dictionary_set_uint64(a2, kPFSubReturnICMPCode, v28);
    }
    v29 = xpc_dictionary_get_value(v18, kPFSubReturnICMP6Code);
    if (v29)
    {
      v30 = v29;
      if (MEMORY[0x219A0CD04]() != v7)
        goto LABEL_3;
      if (v22 != 4)
        goto LABEL_3;
      v31 = xpc_uint64_get_value(v30);
      if (v31 > 0xFF)
        goto LABEL_3;
      xpc_dictionary_set_uint64(a2, kPFSubReturnICMP6Code, v31);
    }
  }
  v32 = xpc_dictionary_get_value(a1, kPFQuick);
  if (v32)
  {
    v33 = v32;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACF80])
      goto LABEL_3;
    v34 = kPFQuick;
    v35 = xpc_BOOL_get_value(v33);
    xpc_dictionary_set_BOOL(a2, v34, v35);
  }
  v36 = xpc_dictionary_get_value(a1, kPFInterface);
  if (!v36)
    goto LABEL_56;
  v37 = v36;
  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0]
    || (string_ptr = xpc_string_get_string_ptr(v37), (__PFInterfaceExists(string_ptr) & 1) == 0))
  {
LABEL_3:
    PFManagerErrorLog();
    return 0;
  }
  xpc_dictionary_set_string(a2, kPFInterface, string_ptr);
LABEL_56:
  v39 = xpc_dictionary_get_value(a1, kPFFrom);
  if (v39)
  {
    result = __PFAddressCheck(v39, a2, kPFFrom, &v57);
    if (!(_DWORD)result)
      return result;
  }
  v40 = xpc_dictionary_get_value(a1, kPFTo);
  if (v40)
  {
    result = __PFAddressCheck(v40, a2, kPFTo, &v57);
    if (!(_DWORD)result)
      return result;
  }
  v41 = xpc_dictionary_get_value(a1, kPFNATRDRAddress);
  if (!v41)
    goto LABEL_66;
  if (uint64 == 13)
  {
    v57 = -1;
    result = __PFAddressCheck(v41, a2, kPFNATRDRAddress, &v57);
    if (!(_DWORD)result)
      return result;
    goto LABEL_66;
  }
  if ((__PFAddressCheck(v41, a2, kPFNATRDRAddress, &v57) & 1) == 0)
    return 0;
LABEL_66:
  v42 = xpc_dictionary_get_value(a1, kPFFlags);
  if (!v42 || (result = __PFFlagsCheck(v42, a2), (_DWORD)result))
  {
    v43 = xpc_dictionary_get_value(a1, kPFUser);
    if (!v43 || (result = __PFUserCheck(v43, a2), (_DWORD)result))
    {
      v44 = xpc_dictionary_get_value(a1, kPFGroup);
      if (!v44 || (result = __PFGroupCheck(v44, a2), (_DWORD)result))
      {
        v45 = xpc_dictionary_get_value(a1, kPFLog);
        if (!v45 || (result = __PFLogCheck(v45, a2), (_DWORD)result))
        {
          v46 = xpc_dictionary_get_value(a1, kPFICMP);
          if (!v46 || (result = __PFICMPCheck(v46, a2), (_DWORD)result))
          {
            v47 = xpc_dictionary_get_value(a1, kPFTagDict);
            if (!v47 || (result = __PFTagCheck(v47, a2), (_DWORD)result))
            {
              v48 = xpc_dictionary_get_value(a1, kPFScrubOptions);
              if (!v48 || (result = __PFScrubOptionsCheck(v48, a2), (_DWORD)result))
              {
                v49 = xpc_dictionary_get_value(a1, kPFKeepState);
                if (!v49 || (result = __PFStateCheck(v49, a2), (_DWORD)result))
                {
                  v50 = xpc_dictionary_get_value(a1, kPFAllowOpts);
                  if (!v50 || (result = __PFAllowOptsCheck(v50, a2), (_DWORD)result))
                  {
                    v51 = xpc_dictionary_get_value(a1, kPFExtFilter);
                    if (!v51 || (result = __PFExtFilterCheck(v51, a2), (_DWORD)result))
                    {
                      v52 = xpc_dictionary_get_value(a1, kPFExtMap);
                      if (!v52 || (result = __PFExtMapCheck(v52, a2), (_DWORD)result))
                      {
                        v53 = xpc_dictionary_get_value(a1, kPFRTableID);
                        if (!v53 || (result = __PFRTableCheck(v53, a2), (_DWORD)result))
                        {
                          v54 = xpc_dictionary_get_value(a1, kPFNATPass);
                          if (!v54 || (result = __PFNatPassCheck(v54, a2), (_DWORD)result))
                          {
                            v55 = xpc_dictionary_get_value(a1, kPFMaxStates);
                            if (!v55 || (result = __PFMaxStatesCheck(v55, a2), (_DWORD)result))
                            {
                              v56 = xpc_dictionary_get_value(a1, kPFDummyNet);
                              if (!v56 || (result = __PFDummyNetCheck(v56, a2), (_DWORD)result))
                              {
                                if (uint64 > 0xCu
                                  || ((1 << uint64) & 0x1803) == 0
                                  || (result = __PFFilterConsistencyCheck(a2), (_DWORD)result))
                                {
                                  if ((uint64 & 0xFE) != 8 || (result = __PFRDRConsistencyCheck(a2), (_DWORD)result))
                                  {
                                    if (uint64 - 11 > 1)
                                      return 1;
                                    result = __PFDummyNetConsistencyCheck(a2);
                                    if ((_DWORD)result)
                                      return 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t __PFDirCheck(void *a1, void *a2)
{
  uint64_t value;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8] && (value = xpc_uint64_get_value(a1), value <= 2))
  {
    xpc_dictionary_set_uint64(a2, kPFDirection, value);
    return 1;
  }
  else
  {
    PFManagerErrorLog();
    return 0;
  }
}

uint64_t __PFProtocolCheck(void *a1, void *a2)
{
  const char *string_ptr;
  protoent *v5;
  const char *v6;
  uint64_t p_proto;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF0])
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    v5 = getprotobyname(string_ptr);
    if (!v5)
    {
LABEL_7:
      PFManagerErrorLog();
      return 0;
    }
    v6 = kPFProtocol;
    p_proto = v5->p_proto;
  }
  else
  {
    if (MEMORY[0x219A0CD04](a1) != MEMORY[0x24BDACFF8])
      goto LABEL_7;
    p_proto = xpc_uint64_get_value(a1);
    if (p_proto > 0xFF)
      goto LABEL_7;
    v6 = kPFProtocol;
  }
  xpc_dictionary_set_uint64(a2, v6, p_proto);
  return 1;
}

BOOL __PFFamilyCheck(void *a1, void *a2, _DWORD *a3)
{
  _BOOL8 v6;
  uint64_t value;
  int v8;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8])
  {
    value = xpc_uint64_get_value(a1);
    v8 = value;
    v6 = value == 30 || value == 2;
    if (value == 30 || value == 2)
    {
      xpc_dictionary_set_uint64(a2, kPFFamily, value);
      *a3 = v8;
    }
    else
    {
      PFManagerErrorLog();
    }
  }
  else
  {
    PFManagerErrorLog();
    return 0;
  }
  return v6;
}

uint64_t __PFAddressCheck(void *a1, void *a2, const char *a3, int *a4)
{
  uint64_t result;
  xpc_object_t value;
  void *v10;
  xpc_object_t v11;
  void *v12;
  char *string_ptr;
  char *v14;
  const char *v15;
  char *v16;
  int v17;
  BOOL v18;
  size_t v19;
  size_t v20;
  char *v21;
  char *v22;
  size_t v23;
  size_t v24;
  size_t v25;
  char **v26;
  xpc_object_t v27;
  void *v28;
  xpc_object_t v29;
  xpc_object_t v30;
  void *v31;
  xpc_object_t v32;
  void *v33;
  xpc_object_t v34;
  void *v35;
  int v36;
  int v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  unsigned __int8 v42;
  char v43;
  char *v44;
  int *v45;
  int *v46;
  int v47;
  char *__endptr;
  char __str[64];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v47 = -1;
  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubAddressLabel);
  if (!value)
  {
    v11 = xpc_dictionary_get_value(a1, kPFSubAddress);
    if (v11)
    {
      v12 = v11;
      if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
        goto LABEL_2;
      string_ptr = (char *)xpc_string_get_string_ptr(v12);
      v14 = strrchr(string_ptr, 47);
      if (v14)
      {
        v15 = v14;
        __endptr = 0;
        v16 = v14 + 1;
        v17 = strtol(v14 + 1, &__endptr, 0);
        if (!__endptr)
          goto LABEL_2;
        v18 = __endptr != v16 && *__endptr == 0;
        if (!v18 || v17 >= 129)
          goto LABEL_2;
        v19 = strlen(string_ptr);
        v20 = strlen(v15);
        v21 = (char *)malloc_type_malloc(v19 - v20 + 1, 0x22200CF6uLL);
        if (!v21)
        {
          v46 = __error();
          strerror(*v46);
          goto LABEL_2;
        }
        v22 = v21;
        v23 = strlen(string_ptr);
        v24 = strlen(v15);
        strlcpy(v22, string_ptr, v23 - v24 + 1);
LABEL_38:
        if ((__PFIPAddressCheck(v22, &v47) & 1) != 0)
        {
          v36 = v47;
          if (v47 != -1)
          {
            v37 = *a4;
            if (*a4 != -1 && v47 != v37)
              goto LABEL_56;
            if (v37 == -1)
            {
              xpc_dictionary_set_uint64(a2, kPFFamily, v47);
              *a4 = v36;
            }
          }
          free(v22);
          v26 = &kPFSubAddress;
          goto LABEL_23;
        }
LABEL_56:
        PFManagerErrorLog();
        v44 = v22;
        goto LABEL_69;
      }
      v22 = strndup(string_ptr, 0x40uLL);
      if (v22)
        goto LABEL_38;
    }
    else
    {
      v34 = xpc_dictionary_get_value(a1, kPFSubDynInterface);
      if (!v34)
        goto LABEL_2;
      v35 = v34;
      if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
        goto LABEL_2;
      string_ptr = (char *)xpc_string_get_string_ptr(v35);
      v38 = strndup(string_ptr, 0x40uLL);
      if (v38)
      {
        v39 = v38;
        v40 = strrchr(v38, 58);
        if (v40)
        {
          v41 = v40;
          v42 = 0;
          while (1)
          {
            if (!strcmp(v41 + 1, "network"))
            {
              v43 = 1;
            }
            else if (!strcmp(v41 + 1, "broadcast"))
            {
              v43 = 2;
            }
            else if (!strcmp(v41 + 1, "peer"))
            {
              v43 = 4;
            }
            else
            {
              if (strcmp(v41 + 1, "0"))
              {
                free(v39);
                goto LABEL_2;
              }
              v43 = 8;
            }
            v42 |= v43;
            *v41 = 0;
            v41 = strrchr(v39, 58);
            if (!v41)
              goto LABEL_61;
          }
        }
        v42 = 0;
LABEL_61:
        if ((v42 & (v42 - 1) & 6) == 0 && (__PFInterfaceExists(v39) & 1) != 0)
        {
          free(v39);
          v26 = &kPFSubDynInterface;
          goto LABEL_23;
        }
        PFManagerErrorLog();
        v44 = v39;
LABEL_69:
        free(v44);
        return 0;
      }
    }
    v45 = __error();
    strerror(*v45);
    goto LABEL_2;
  }
  v10 = value;
  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
    goto LABEL_2;
  string_ptr = (char *)xpc_string_get_string_ptr(v10);
  if (string_ptr)
  {
    v25 = strlen(kPFAny);
    if (strncmp(string_ptr, kPFAny, v25))
      goto LABEL_2;
  }
  v26 = &kPFSubAddressLabel;
LABEL_23:
  snprintf(__str, 0x40uLL, "%s%s", a3, *v26);
  xpc_dictionary_set_string(a2, __str, string_ptr);
  v27 = xpc_dictionary_get_value(a1, kPFSubLowPort);
  if (v27)
  {
    v28 = v27;
    snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubLowPort);
    result = __PFPortCheck(v28, a2, __str);
    if (!(_DWORD)result)
      return result;
    v29 = xpc_dictionary_get_value(a1, kPFSubHighPort);
    if (v29)
    {
      snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubHighPort);
      result = __PFPortCheck(v29, a2, __str);
      if (!(_DWORD)result)
        return result;
    }
    v30 = xpc_dictionary_get_value(a1, kPFSubPortOperator);
    if (v30)
    {
      v31 = v30;
      snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubPortOperator);
      if ((__PFOperatorCheck(v31, 1, v29 != 0, a2, __str) & 1) == 0)
        return 0;
      goto LABEL_29;
    }
LABEL_2:
    PFManagerErrorLog();
    return 0;
  }
LABEL_29:
  v32 = xpc_dictionary_get_value(a1, kPFSubNegated);
  if (!v32)
    return 1;
  v33 = v32;
  snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubNegated);
  result = __PFNegatedCheck(v33, a2, __str);
  if ((_DWORD)result)
    return 1;
  return result;
}

uint64_t __PFFlagsCheck(void *a1, void *a2)
{
  const char *string_ptr;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  char **v12;
  int *v13;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
    goto LABEL_2;
  string_ptr = xpc_string_get_string_ptr(a1);
  v6 = strndup(string_ptr, 0x40uLL);
  if (!v6)
  {
    v13 = __error();
    strerror(*v13);
LABEL_2:
    PFManagerErrorLog();
    return 0;
  }
  v7 = v6;
  v8 = strrchr(v6, 47);
  if (!v8)
  {
LABEL_10:
    v11 = __PFParseFlags(v7);
    if ((v11 & 0x80000000) == 0)
    {
      v12 = &kPFFlags;
LABEL_15:
      xpc_dictionary_set_uint64(a2, *v12, v11);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v9 = v8;
  if (v8 == v7)
  {
    v11 = __PFParseFlags(v7 + 1);
    if ((v11 & 0x80000000) == 0)
    {
      v12 = &kPFFlagSet;
      goto LABEL_15;
    }
LABEL_17:
    PFManagerErrorLog();
    free(v7);
    return 0;
  }
  if (v8 > v7)
  {
    v10 = __PFParseFlags(v8 + 1);
    if ((v10 & 0x80000000) != 0)
      goto LABEL_17;
    xpc_dictionary_set_uint64(a2, kPFFlagSet, v10);
    *v9 = 0;
    goto LABEL_10;
  }
LABEL_16:
  free(v7);
  return 1;
}

uint64_t __PFUserCheck(void *a1, void *a2)
{
  uint64_t v4;
  xpc_object_t value;
  void *v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *string_ptr;
  passwd *v13;
  uint64_t pw_uid;
  const char *v15;
  size_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  void *v21;
  size_t v22;
  xpc_object_t v23;
  uint64_t v24;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubUserName);
  if (value)
  {
    v7 = value;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
    {
LABEL_2:
      PFManagerErrorLog();
      return 0;
    }
    string_ptr = xpc_string_get_string_ptr(v7);
    v13 = getpwnam(string_ptr);
    if (v13)
    {
      pw_uid = v13->pw_uid;
      v15 = kPFUnknown;
    }
    else
    {
      v15 = kPFUnknown;
      v22 = strlen(kPFUnknown);
      if (strncmp(string_ptr, kPFUnknown, v22))
        goto LABEL_2;
      pw_uid = -1;
    }
    v16 = strlen(v15);
    if (!strncmp(string_ptr, v15, v16))
    {
      v17 = a2;
      v18 = 0x7FFFFFFFLL;
    }
    else
    {
      v17 = a2;
      v18 = pw_uid;
    }
    xpc_dictionary_set_uint64(v17, kPFSubLowUserID, v18);
    LODWORD(v21) = 0;
  }
  else
  {
    v8 = xpc_dictionary_get_value(a1, kPFSubLowUserID);
    if (!v8)
      goto LABEL_2;
    v9 = v8;
    v10 = MEMORY[0x219A0CD04]();
    v11 = MEMORY[0x24BDACFF8];
    if (v10 != MEMORY[0x24BDACFF8])
      goto LABEL_2;
    v19 = xpc_uint64_get_value(v9);
    if (v19 >= 0x7FFFFFFF)
      goto LABEL_2;
    xpc_dictionary_set_uint64(a2, kPFSubLowUserID, v19);
    v20 = xpc_dictionary_get_value(a1, kPFSubHighUserID);
    v21 = v20;
    if (v20)
    {
      if (MEMORY[0x219A0CD04](v20) != v11)
        goto LABEL_2;
      v24 = xpc_uint64_get_value(v21);
      if (v24 > 0x7FFFFFFE)
        goto LABEL_2;
      xpc_dictionary_set_uint64(a2, kPFSubHighUserID, v24);
      LODWORD(v21) = 1;
    }
  }
  v23 = xpc_dictionary_get_value(a1, kPFSubUserOperator);
  if (!v23)
    goto LABEL_2;
  v4 = 1;
  if ((__PFOperatorCheck(v23, 1, (int)v21, a2, kPFSubUserOperator) & 1) == 0)
    goto LABEL_2;
  return v4;
}

uint64_t __PFGroupCheck(void *a1, void *a2)
{
  uint64_t v4;
  xpc_object_t value;
  void *v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *string_ptr;
  group *v13;
  uint64_t gr_gid;
  const char *v15;
  size_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  void *v21;
  size_t v22;
  xpc_object_t v23;
  uint64_t v24;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubGroupName);
  if (value)
  {
    v7 = value;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
    {
LABEL_2:
      PFManagerErrorLog();
      return 0;
    }
    string_ptr = xpc_string_get_string_ptr(v7);
    v13 = getgrnam(string_ptr);
    if (v13)
    {
      gr_gid = v13->gr_gid;
      v15 = kPFUnknown;
    }
    else
    {
      v15 = kPFUnknown;
      v22 = strlen(kPFUnknown);
      if (strncmp(string_ptr, kPFUnknown, v22))
        goto LABEL_2;
      gr_gid = -1;
    }
    v16 = strlen(v15);
    if (!strncmp(string_ptr, v15, v16))
    {
      v17 = a2;
      v18 = 0x7FFFFFFFLL;
    }
    else
    {
      v17 = a2;
      v18 = gr_gid;
    }
    xpc_dictionary_set_uint64(v17, kPFSubLowGroupID, v18);
    LODWORD(v21) = 0;
  }
  else
  {
    v8 = xpc_dictionary_get_value(a1, kPFSubLowGroupID);
    if (!v8)
      goto LABEL_2;
    v9 = v8;
    v10 = MEMORY[0x219A0CD04]();
    v11 = MEMORY[0x24BDACFF8];
    if (v10 != MEMORY[0x24BDACFF8])
      goto LABEL_2;
    v19 = xpc_uint64_get_value(v9);
    if (v19 >= 0x7FFFFFFF)
      goto LABEL_2;
    xpc_dictionary_set_uint64(a2, kPFSubLowGroupID, v19);
    v20 = xpc_dictionary_get_value(a1, kPFSubHighGroupID);
    v21 = v20;
    if (v20)
    {
      if (MEMORY[0x219A0CD04](v20) != v11)
        goto LABEL_2;
      v24 = xpc_uint64_get_value(v21);
      if (v24 > 0x7FFFFFFE)
        goto LABEL_2;
      xpc_dictionary_set_uint64(a2, kPFSubHighGroupID, v24);
      LODWORD(v21) = 1;
    }
  }
  v23 = xpc_dictionary_get_value(a1, kPFSubGroupOperator);
  if (!v23)
    goto LABEL_2;
  v4 = 1;
  if ((__PFOperatorCheck(v23, 1, (int)v21, a2, kPFSubGroupOperator) & 1) == 0)
    goto LABEL_2;
  return v4;
}

uint64_t __PFLogCheck(void *a1, void *a2)
{
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  uint64_t v8;
  const char *string_ptr;
  unsigned __int8 v10;
  uint64_t v11;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubLogFlags);
  if (value)
  {
    v6 = value;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF8])
      goto LABEL_2;
    v8 = xpc_uint64_get_value(v6);
    if ((v8 & 7) == 0)
      goto LABEL_2;
    xpc_dictionary_set_uint64(a2, kPFSubLogFlags, v8);
    v7 = xpc_dictionary_get_value(a1, kPFSubLogTo);
    if (!v7)
      return 1;
  }
  else
  {
    v7 = xpc_dictionary_get_value(a1, kPFSubLogTo);
    if (!v7)
    {
LABEL_2:
      PFManagerErrorLog();
      return 0;
    }
  }
  if (MEMORY[0x219A0CD04](v7) != MEMORY[0x24BDACFF0])
    goto LABEL_2;
  string_ptr = xpc_string_get_string_ptr(v7);
  if (strncmp(string_ptr, "pflog", 5uLL))
    goto LABEL_2;
  v11 = 0;
  v10 = __PFRuleStrToNum(string_ptr + 5, &v11);
  if (v11)
    goto LABEL_2;
  xpc_dictionary_set_uint64(a2, kPFSubLogTo, v10);
  return 1;
}

uint64_t __PFICMPCheck(void *a1, void *a2)
{
  xpc_object_t value;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  void *v11;
  uint64_t v12;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubICMPType);
  if (!value)
    goto LABEL_2;
  v6 = value;
  v7 = MEMORY[0x219A0CD04]();
  v8 = MEMORY[0x24BDACFF8];
  if (v7 != MEMORY[0x24BDACFF8])
    goto LABEL_2;
  v9 = xpc_uint64_get_value(v6);
  if (v9 >= 0x100)
    goto LABEL_2;
  xpc_dictionary_set_uint64(a2, kPFSubICMPType, v9);
  v10 = xpc_dictionary_get_value(a1, kPFSubICMPCode);
  if (v10)
  {
    v11 = v10;
    if (MEMORY[0x219A0CD04]() == v8)
    {
      v12 = xpc_uint64_get_value(v11);
      if (v12 <= 0xFF)
      {
        xpc_dictionary_set_uint64(a2, kPFSubICMPCode, v12);
        return 1;
      }
    }
LABEL_2:
    PFManagerErrorLog();
    return 0;
  }
  return 1;
}

uint64_t __PFTagCheck(void *a1, void *a2)
{
  int v5;
  const char *string;
  const char *v7;
  xpc_object_t value;
  void *v9;
  const char *v10;
  BOOL v11;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  if (xpc_dictionary_get_value(a1, kPFSubTag))
  {
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
      goto LABEL_2;
    string = xpc_dictionary_get_string(a1, kPFSubTag);
    if (strnlen(string, 0x41uLL) > 0x40)
      goto LABEL_2;
    xpc_dictionary_set_string(a2, kPFSubTag, string);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFSubTagged))
  {
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF0])
      goto LABEL_2;
    v7 = xpc_dictionary_get_string(a1, kPFSubTagged);
    if (strnlen(v7, 0x41uLL) > 0x40)
      goto LABEL_2;
    xpc_dictionary_set_string(a2, kPFSubTagged, v7);
    v5 = 1;
  }
  value = xpc_dictionary_get_value(a1, kPFSubNotTagged);
  if (value)
  {
    v9 = value;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACF80])
    {
LABEL_2:
      PFManagerErrorLog();
      return 0;
    }
    v10 = kPFSubNotTagged;
    v11 = xpc_BOOL_get_value(v9);
    xpc_dictionary_set_BOOL(a2, v10, v11);
  }
  else if (!v5)
  {
    goto LABEL_2;
  }
  return 1;
}

uint64_t __PFScrubOptionsCheck(void *a1, void *a2)
{
  xpc_object_t value;
  void *v6;
  int v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  uint64_t v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubScrubFlags);
  if (value)
  {
    v6 = value;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF8])
      goto LABEL_2;
    v8 = xpc_uint64_get_value(v6) & 0x1F00;
    if (!v8)
      goto LABEL_2;
    xpc_dictionary_set_uint64(a2, kPFSubScrubFlags, v8);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v9 = xpc_dictionary_get_value(a1, kPFSubScrubMinTTL);
  if (v9)
  {
    v10 = v9;
    if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF8])
      goto LABEL_2;
    v11 = xpc_uint64_get_value(v10);
    if (v11 > 0xFF)
      goto LABEL_2;
    xpc_dictionary_set_uint64(a2, kPFSubScrubMinTTL, v11);
    v7 = 1;
  }
  v12 = xpc_dictionary_get_value(a1, kPFSubScrubMaxMSS);
  if (v12)
  {
    v13 = v12;
    if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8])
    {
      v14 = xpc_uint64_get_value(v13);
      if (!(v14 >> 16))
      {
        xpc_dictionary_set_uint64(a2, kPFSubScrubMaxMSS, v14);
        return 1;
      }
    }
LABEL_2:
    PFManagerErrorLog();
    return 0;
  }
  if (!v7)
    goto LABEL_2;
  return 1;
}

uint64_t __PFStateCheck(void *a1, void *a2)
{
  uint64_t value;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8] && (value = xpc_uint64_get_value(a1), value <= 3))
  {
    xpc_dictionary_set_uint64(a2, kPFKeepState, value);
    return 1;
  }
  else
  {
    PFManagerErrorLog();
    return 0;
  }
}

BOOL __PFAllowOptsCheck(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  BOOL value;

  v4 = MEMORY[0x219A0CD04]();
  v5 = MEMORY[0x24BDACF80];
  if (v4 == MEMORY[0x24BDACF80])
  {
    v6 = kPFAllowOpts;
    value = xpc_BOOL_get_value(a1);
    xpc_dictionary_set_BOOL(a2, v6, value);
  }
  else
  {
    PFManagerErrorLog();
  }
  return v4 == v5;
}

uint64_t __PFExtFilterCheck(void *a1, void *a2)
{
  uint64_t value;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8] && (value = xpc_uint64_get_value(a1), value - 1 <= 2))
  {
    xpc_dictionary_set_uint64(a2, kPFExtFilter, value);
    return 1;
  }
  else
  {
    PFManagerErrorLog();
    return 0;
  }
}

uint64_t __PFExtMapCheck(void *a1, void *a2)
{
  uint64_t value;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8] && (value = xpc_uint64_get_value(a1), value - 1 <= 2))
  {
    xpc_dictionary_set_uint64(a2, kPFExtMap, value);
    return 1;
  }
  else
  {
    PFManagerErrorLog();
    return 0;
  }
}

uint64_t __PFRTableCheck(void *a1, void *a2)
{
  uint64_t value;
  const char *string_ptr;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF8])
  {
    value = xpc_uint64_get_value(a1);
  }
  else
  {
    if (MEMORY[0x219A0CD04](a1) != MEMORY[0x24BDACFF0])
    {
      PFManagerErrorLog();
      return 0;
    }
    string_ptr = xpc_string_get_string_ptr(a1);
    value = if_nametoindex(string_ptr);
  }
  xpc_dictionary_set_uint64(a2, kPFRTableID, value);
  return 1;
}

BOOL __PFNatPassCheck(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  BOOL value;

  v4 = MEMORY[0x219A0CD04]();
  v5 = MEMORY[0x24BDACF80];
  if (v4 == MEMORY[0x24BDACF80])
  {
    v6 = kPFNATPass;
    value = xpc_BOOL_get_value(a1);
    xpc_dictionary_set_BOOL(a2, v6, value);
  }
  else
  {
    PFManagerErrorLog();
  }
  return v4 == v5;
}

BOOL __PFMaxStatesCheck(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t value;

  v4 = MEMORY[0x219A0CD04]();
  v5 = MEMORY[0x24BDACFF8];
  if (v4 == MEMORY[0x24BDACFF8])
  {
    value = xpc_uint64_get_value(a1);
    xpc_dictionary_set_uint64(a2, kPFMaxStates, value);
  }
  else
  {
    PFManagerErrorLog();
  }
  return v4 == v5;
}

uint64_t __PFDummyNetCheck(void *a1, void *a2)
{
  xpc_object_t value;
  void *v6;
  uint64_t v7;
  xpc_object_t v8;
  void *v9;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFA0])
    goto LABEL_2;
  value = xpc_dictionary_get_value(a1, kPFSubDummyNetPipe);
  v6 = value;
  if (value)
  {
    if (MEMORY[0x219A0CD04](value) != MEMORY[0x24BDACFF8])
      goto LABEL_2;
    v7 = xpc_uint64_get_value(v6);
    if (v7 - 1 > 0xFFFE)
      goto LABEL_2;
    xpc_dictionary_set_uint64(a2, kPFSubDummyNetPipe, v7);
  }
  v8 = xpc_dictionary_get_value(a1, kPFSubDummyNetPipeType);
  if (!v8
    || (v9 = v8, MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF8])
    || xpc_uint64_get_value(v9) != 0x4000
    || (xpc_dictionary_set_uint64(a2, kPFSubDummyNetPipeType, 0x4000uLL), !v6))
  {
LABEL_2:
    PFManagerErrorLog();
    return 0;
  }
  return 1;
}

uint64_t __PFFilterConsistencyCheck(void *a1)
{
  unsigned __int8 uint64;
  char v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  _BOOL4 v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;
  char __str[64];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (xpc_dictionary_get_value(a1, kPFAction))
    uint64 = xpc_dictionary_get_uint64(a1, kPFAction);
  else
    uint64 = 0;
  if (xpc_dictionary_get_value(a1, kPFProtocol))
    v3 = xpc_dictionary_get_uint64(a1, kPFProtocol);
  else
    v3 = 0;
  snprintf(__str, 0x40uLL, "%s%s", kPFFrom, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str))
    v4 = xpc_dictionary_get_uint64(a1, __str);
  else
    v4 = 0;
  snprintf(__str, 0x40uLL, "%s%s", kPFTo, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str))
    v5 = xpc_dictionary_get_uint64(a1, __str);
  else
    v5 = 0;
  if (xpc_dictionary_get_value(a1, kPFAllowOpts))
    v6 = xpc_dictionary_get_BOOL(a1, kPFAllowOpts);
  else
    v6 = 0;
  if (xpc_dictionary_get_value(a1, kPFFamily))
    v7 = xpc_dictionary_get_uint64(a1, kPFFamily);
  else
    v7 = 0;
  if (xpc_dictionary_get_value(a1, kPFKeepState))
    v8 = xpc_dictionary_get_uint64(a1, kPFKeepState);
  else
    v8 = 0;
  if (xpc_dictionary_get_value(a1, kPFReturnOptions))
    v9 = xpc_dictionary_get_uint64(a1, kPFReturnOptions);
  else
    v9 = 0;
  if (v3 != 6 && v3 != 17 && v4 | v5
    || v6 && (uint64 > 0xCu || ((1 << uint64) & 0x1801) == 0)
    || v3 == 1 && v7 == 30
    || v3 == 58 && v7 == 2
    || v3 != 1
    && v3 != 58
    && (xpc_dictionary_get_value(a1, kPFSubICMPType) || xpc_dictionary_get_value(a1, kPFSubICMPCode))
    || !v7 && (xpc_dictionary_get_value(a1, kPFSubICMPType) || xpc_dictionary_get_value(a1, kPFSubICMPCode))
    || uint64 == 1 && v8
    || v3 != 6 && v9 == 1
    || (result = 1, v9) && uint64 != 1)
  {
    PFManagerErrorLog();
    return 0;
  }
  return result;
}

uint64_t __PFRDRConsistencyCheck(void *a1)
{
  char uint64;
  int v3;
  int v4;
  int v5;
  uint64_t result;
  char __str[64];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (xpc_dictionary_get_value(a1, kPFProtocol))
    uint64 = xpc_dictionary_get_uint64(a1, kPFProtocol);
  else
    uint64 = 0;
  snprintf(__str, 0x40uLL, "%s%s", kPFFrom, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str))
    v3 = xpc_dictionary_get_uint64(a1, __str);
  else
    v3 = 0;
  snprintf(__str, 0x40uLL, "%s%s", kPFTo, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str))
    v4 = xpc_dictionary_get_uint64(a1, __str);
  else
    v4 = 0;
  snprintf(__str, 0x40uLL, "%s%s", kPFNATRDRAddress, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str))
    v5 = xpc_dictionary_get_uint64(a1, __str);
  else
    v5 = 0;
  result = 1;
  if (uint64 != 6 && uint64 != 17 && (v3 || v4 || v5))
  {
    PFManagerErrorLog();
    return 0;
  }
  return result;
}

uint64_t __PFDummyNetConsistencyCheck(void *a1)
{
  int uint64;
  int v3;
  int v4;
  uint64_t result;

  if (xpc_dictionary_get_value(a1, kPFAction))
    uint64 = xpc_dictionary_get_uint64(a1, kPFAction);
  else
    uint64 = 0;
  if (xpc_dictionary_get_value(a1, kPFDirection))
    v3 = xpc_dictionary_get_uint64(a1, kPFDirection);
  else
    v3 = 0;
  if (xpc_dictionary_get_value(a1, kPFSubDummyNetPipe))
    v4 = xpc_dictionary_get_uint64(a1, kPFSubDummyNetPipe);
  else
    v4 = 0;
  if (xpc_dictionary_get_value(a1, kPFKeepState) && xpc_dictionary_get_uint64(a1, kPFKeepState)
    || uint64 == 11 && (v4 - 0x10000) < 0xFFFF0001
    || uint64 == 11 && v4 && !v3
    || (result = 1, uint64 == 12) && v4)
  {
    PFManagerErrorLog();
    return 0;
  }
  return result;
}

BOOL PFCheckNATRule(void *a1, void *a2)
{
  xpc_object_t value;
  _BOOL8 v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  int v11;

  v11 = -1;
  value = xpc_dictionary_get_value(a1, kPFDirection);
  v5 = value != 0;
  if (value && !__PFDirCheck(value, a2))
    return 0;
  v6 = xpc_dictionary_get_value(a1, kPFProtocol);
  if (v6)
  {
    if (!__PFProtocolCheck(v6, a2))
      return 0;
    v5 = 1;
  }
  v7 = xpc_dictionary_get_value(a1, kPFFamily);
  if (v7)
  {
    if (!__PFFamilyCheck(v7, a2, &v11))
      return 0;
    v5 = 1;
  }
  v8 = xpc_dictionary_get_value(a1, kPFFrom);
  if (v8)
  {
    if (!__PFAddressCheck(v8, a2, kPFFrom, &v11))
      return 0;
    v5 = 1;
  }
  v9 = xpc_dictionary_get_value(a1, kPFTo);
  if (v9)
    return __PFAddressCheck(v9, a2, kPFTo, &v11) != 0;
  return v5;
}

uint64_t __PFInterfaceExists(const char *a1)
{
  ifaddrs **v2;
  int *v4;
  ifaddrs *v5;

  v5 = 0;
  if (getifaddrs(&v5) < 0)
  {
    v4 = __error();
    strerror(*v4);
    PFManagerErrorLog();
  }
  else
  {
    v2 = &v5;
    while (1)
    {
      v2 = (ifaddrs **)*v2;
      if (!v2)
        break;
      if (!strncmp((const char *)v2[1], a1, 0x10uLL))
      {
        MEMORY[0x219A0CAAC](v5);
        return 1;
      }
    }
    MEMORY[0x219A0CAAC](v5);
  }
  return 0;
}

uint64_t __PFIPAddressCheck(const char *a1, int *a2)
{
  uint64_t v3;
  addrinfo *v4;
  int ai_family;
  addrinfo *v8;
  addrinfo v9;

  v8 = 0;
  memset(&v9, 0, sizeof(v9));
  v9.ai_flags = 4;
  if (getaddrinfo(a1, 0, &v9, &v8))
    return 0;
  v4 = v8;
  ai_family = v8->ai_family;
  if (ai_family == 30 || ai_family == 2)
  {
    *a2 = ai_family;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  freeaddrinfo(v4);
  return v3;
}

uint64_t __PFPortCheck(void *a1, void *a2, const char *a3)
{
  const char *string_ptr;
  servent *v7;
  uint64_t s_port;

  if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACFF0])
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    v7 = getservbyname(string_ptr, "tcp");
    if (v7 || (v7 = getservbyname(string_ptr, "udp")) != 0)
    {
      s_port = v7->s_port;
LABEL_8:
      xpc_dictionary_set_uint64(a2, a3, s_port);
      return 1;
    }
  }
  else if (MEMORY[0x219A0CD04](a1) == MEMORY[0x24BDACFF8])
  {
    s_port = xpc_uint64_get_value(a1);
    if (!(s_port >> 16))
      goto LABEL_8;
  }
  PFManagerErrorLog();
  return 0;
}

uint64_t __PFOperatorCheck(void *a1, int a2, int a3, void *a4, const char *a5)
{
  uint64_t value;

  if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACFF8])
    goto LABEL_2;
  value = xpc_uint64_get_value(a1);
  if (value - 2 <= 5)
  {
    if (!a2 || a3)
      goto LABEL_2;
    goto LABEL_12;
  }
  if (value - 8 < 2)
  {
LABEL_10:
    if (!a2 || (a3 & 1) == 0)
      goto LABEL_2;
LABEL_12:
    xpc_dictionary_set_uint64(a4, a5, value);
    return 1;
  }
  if (value)
  {
    if (value != 1)
    {
LABEL_2:
      PFManagerErrorLog();
      return 0;
    }
    goto LABEL_10;
  }
  return 1;
}

BOOL __PFNegatedCheck(void *a1, void *a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  BOOL value;

  v6 = MEMORY[0x219A0CD04]();
  v7 = MEMORY[0x24BDACF80];
  if (v6 == MEMORY[0x24BDACF80])
  {
    value = xpc_BOOL_get_value(a1);
    xpc_dictionary_set_BOOL(a2, a3, value);
  }
  else
  {
    PFManagerErrorLog();
  }
  return v6 == v7;
}

uint64_t __PFParseFlags(_BYTE *a1)
{
  char v1;
  uint64_t v2;
  unsigned __int8 *v3;
  void *v4;
  int v5;

  v1 = *a1;
  if (*a1)
  {
    LODWORD(v2) = 0;
    v3 = a1 + 1;
    do
    {
      v4 = memchr("FSRPAUEW", v1, 9uLL);
      if (!v4)
        return 0xFFFFFFFFLL;
      v2 = v2 | (1 << ((_BYTE)v4 - "FSRPAUEW"));
      v5 = *v3++;
      v1 = v5;
    }
    while (v5);
    if ((_DWORD)v2)
      return v2;
  }
  return 255;
}

unint64_t __PFRuleStrToNum(const char *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  char *__endptr;
  _OWORD v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  __endptr = 0;
  v11[0] = xmmword_24D793D28;
  v11[1] = *(_OWORD *)&off_24D793D38;
  v11[2] = xmmword_24D793D48;
  v11[3] = *(_OWORD *)&off_24D793D58;
  DWORD2(v11[0]) = *__error();
  *__error() = 0;
  v4 = strtoll(a1, &__endptr, 10);
  v5 = v4;
  if (__endptr == a1 || *__endptr)
  {
    v6 = 0;
    v7 = 1;
    goto LABEL_4;
  }
  if (v4 == 0x8000000000000000)
  {
    __error();
LABEL_15:
    v6 = 0;
    v7 = 2;
    goto LABEL_4;
  }
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_15;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __error();
LABEL_17:
    v6 = 0;
    v7 = 3;
    goto LABEL_4;
  }
  if (v4 >= 0x100)
    goto LABEL_17;
  v7 = 0;
  v6 = 1;
LABEL_4:
  if (a2)
    *a2 = *(_QWORD *)&v11[v7];
  v8 = DWORD2(v11[v7]);
  *__error() = v8;
  if (v6)
    return v5;
  else
    return 0;
}

uint64_t PFXPCGetResponse()
{
  return __pfresponse;
}

uint64_t PFXPCSetupAndSend(NSObject *a1, NSObject *a2, void *a3, const char *a4, const char *a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  xpc_object_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  xpc_object_t v20;
  _QWORD handler[5];

  if (!__pfconnection)
  {
    __pfconnection = (uint64_t)xpc_connection_create_mach_service((const char *)pfXPCService, a2, 2uLL);
    if (__pfconnection)
    {
      if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACF88])
      {
        xpc_connection_set_event_handler((xpc_connection_t)__pfconnection, &__block_literal_global);
        xpc_connection_resume((xpc_connection_t)__pfconnection);
        goto LABEL_2;
      }
      if (__pfconnection)
      {
        xpc_release((xpc_object_t)__pfconnection);
        v18 = 0;
        __pfconnection = 0;
        return v18;
      }
    }
    return 0;
  }
LABEL_2:
  v15 = xpc_dictionary_create(0, 0, 0);
  if (!v15)
  {
LABEL_12:
    PFManagerErrorLog();
    return 0;
  }
  v16 = v15;
  xpc_dictionary_set_uint64(v15, (const char *)pfXPCKeyType, a6);
  if (a4 && a5)
  {
    xpc_dictionary_set_string(v16, (const char *)pfXPCKeyAppType, a4);
    xpc_dictionary_set_string(v16, (const char *)pfXPCKeyAppSubType, a5);
  }
  switch(a6)
  {
    case 0x3E9u:
      xpc_dictionary_set_value(v16, (const char *)pfXPCKeyRule, a3);
      v17 = (const char *)pfXPCKeyPriority;
      goto LABEL_19;
    case 0x3EAu:
      v17 = (const char *)pfXPCKeyInsertID;
LABEL_19:
      xpc_dictionary_set_uint64(v16, v17, a7);
      goto LABEL_27;
    case 0x3EBu:
      v19 = (const char *)pfXPCKeyRuleArray;
      goto LABEL_26;
    case 0x3ECu:
    case 0x3EDu:
      goto LABEL_27;
    case 0x3EEu:
      v19 = (const char *)pfXPCKeyRule;
      goto LABEL_26;
    default:
      if (a6 == 3000)
      {
        if (!xpc_dictionary_get_value(a3, (const char *)pfXPCTrafficDescriptors))
          goto LABEL_12;
        if (MEMORY[0x219A0CD04]() != MEMORY[0x24BDACF78])
          PFManagerErrorLog();
        v19 = (const char *)pfXPCKeyTrafficDescriptors;
      }
      else
      {
        if (a6 != 3001)
          goto LABEL_27;
        v19 = (const char *)pfXPCKeyGatewayQuery;
      }
LABEL_26:
      xpc_dictionary_set_value(v16, v19, a3);
LABEL_27:
      if (a8)
      {
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 0x40000000;
        handler[2] = ____PFXPCSendMessage_block_invoke;
        handler[3] = &unk_24D793D90;
        handler[4] = a8;
        xpc_connection_send_message_with_reply((xpc_connection_t)__pfconnection, v16, a1, handler);
        v18 = 1;
      }
      else
      {
        v20 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)__pfconnection, v16);
        v18 = __PFXPCResponseHandler(v20, 0);
      }
      xpc_release(v16);
      break;
  }
  return v18;
}

BOOL PFXPCCleanup()
{
  uint64_t v0;

  v0 = __pfconnection;
  if (__pfconnection)
  {
    xpc_connection_cancel((xpc_connection_t)__pfconnection);
    xpc_release((xpc_object_t)__pfconnection);
    __pfconnection = 0;
  }
  return v0 != 0;
}

uint64_t __PFXPCResponseHandler(void *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t uint64;

  if (a1)
  {
    v3 = a1;
    v4 = MEMORY[0x219A0CD04]();
    if (v4 == MEMORY[0x24BDACFA0])
    {
      uint64 = xpc_dictionary_get_uint64(v3, (const char *)pfXPCKeyType);
      if (uint64 != 2000)
      {
        if (uint64 == 2001)
        {
          if (!a2)
          {
            __pfresponse = (uint64_t)v3;
            return 1;
          }
          v5 = 1;
          goto LABEL_17;
        }
        if (uint64 != 2002)
        {
          v5 = 0;
          if (!a2)
            return v5;
          goto LABEL_17;
        }
        PFManagerErrorLog();
        PFXPCCleanup();
      }
      if (a2)
      {
LABEL_16:
        v5 = 0;
LABEL_17:
        (*(void (**)(uint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v3);
        return v5;
      }
    }
    else
    {
      if (v4 == MEMORY[0x24BDACFB8])
        xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
      PFManagerErrorLog();
      PFXPCCleanup();
      if (a2)
      {
        v3 = 0;
        goto LABEL_16;
      }
    }
    xpc_release(v3);
LABEL_20:
    v5 = 0;
    __pfresponse = 0;
    return v5;
  }
  PFXPCCleanup();
  if (!a2)
  {
    PFManagerErrorLog();
    goto LABEL_20;
  }
  PFManagerErrorLog();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  return 0;
}

void __PFManagerLogCreate_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2174D7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

void __PFManagerRelease_cold_1()
{
  __assert_rtn("__PFManagerRelease", "PFManager.c", 92, "CFArrayGetCount(manager->clients) == 0");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x24BDAE628](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

protoent *__cdecl getprotobyname(const char *a1)
{
  return (protoent *)MEMORY[0x24BDAE6F0](a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  return (servent *)MEMORY[0x24BDAE758](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x24BDAF3A0]();
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x24BDB0BD0](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

