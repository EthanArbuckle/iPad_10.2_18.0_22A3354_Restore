uint64_t VTParavirtualizationGuestSupportSetUpWithHandlers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_22FEC87F4;
  block[3] = &unk_24FDDDB40;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  if (qword_253D27ED8 != -1)
    dispatch_once(&qword_253D27ED8, block);
  return dword_253D27EE0;
}

uint64_t sub_22FEC87F4(const void **a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t result;

  qword_253D27EE8 = (uint64_t)_Block_copy(a1[4]);
  qword_253D27EF8 = (uint64_t)_Block_copy(a1[5]);
  qword_253D27EF0 = (uint64_t)_Block_copy(a1[6]);
  v2 = IOServiceMatching("AppleVideoToolboxParavirtualizationDriver");
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v2);
  if (!MatchingService)
    goto LABEL_9;
  v4 = MatchingService;
  IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&dword_255E52860);
  IOObjectRelease(v4);
  if (!dword_255E52860
    || (dword_255E52864 = IODataQueueAllocateNotificationPort()) == 0
    || (v5 = dispatch_queue_create("com.apple.videotoolbox.paravirtualization.host-to-guest", 0),
        (qword_255E52868 = (uint64_t)v5) == 0)
    || (v6 = dispatch_source_create(MEMORY[0x24BDAC9E0], dword_255E52864, 0, v5),
        (qword_255E52870 = (uint64_t)v6) == 0))
  {
LABEL_9:
    result = 4294948206;
LABEL_10:
    dword_253D27EE0 = result;
    return result;
  }
  dispatch_source_set_event_handler(v6, &unk_24FDDDAF8);
  dispatch_resume((dispatch_object_t)qword_255E52870);
  result = MEMORY[0x2348AFC2C](dword_255E52860, 0, dword_255E52864, 0);
  if ((_DWORD)result)
    goto LABEL_10;
  result = sub_22FEC8ABC(0x4000uLL);
  if ((_DWORD)result)
    goto LABEL_10;
  return result;
}

uint64_t sub_22FEC8934()
{
  const __CFAllocator *v0;
  mach_msg_header_t *v1;
  mach_msg_header_t *v2;
  mach_port_name_t v3;
  mach_msg_size_t i;
  unsigned int v5;
  IOReturn v6;
  IOReturn v7;
  uint32_t dataSize;
  void *data;
  uint64_t v11;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v1 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 92, 0);
  v2 = v1;
  *(_QWORD *)&v1->msgh_bits = 0x5C00000000;
  v3 = dword_255E52864;
  v1->msgh_remote_port = 0;
  v1->msgh_local_port = v3;
  v1->msgh_id = 0;
  for (i = 92; mach_msg(v1, 117440518, 0, i, v3, 0, 0) == 268451844; i = v5)
  {
    v5 = (v2->msgh_size + 71) & 0xFFFFFFFC;
    v1 = (mach_msg_header_t *)CFAllocatorReallocate(v0, v2, v5, 0);
    v2 = v1;
    v1->msgh_bits = 0;
    v1->msgh_size = v5;
    v3 = dword_255E52864;
    v1->msgh_remote_port = 0;
    v1->msgh_local_port = v3;
    v1->msgh_id = 0;
  }
  CFAllocatorDeallocate(v0, v2);
  do
  {
    data = 0;
    v11 = 0;
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, void **))(qword_253D27EE8 + 16))(qword_253D27EE8, 0x4000, &v11, &data);
    if (!v6)
    {
      dataSize = 0x4000;
      v6 = IODataQueueDequeue((IODataQueueMemory *)qword_255E52890, data, &dataSize);
      if (!v6)
        v6 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(qword_253D27EF8 + 16))(qword_253D27EF8, v11, dataSize);
    }
    v7 = v6;
    if (v11)
      (*(void (**)(void))(qword_253D27EF0 + 16))();
  }
  while (!v7);
  return IOConnectCallScalarMethod(dword_255E52860, 4u, 0, 0, 0, 0);
}

uint64_t sub_22FEC8ABC(uint64_t a1)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v4;
  uint64_t v5;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  output = 0;
  v4 = 0;
  v5 = 0;
  outputCnt = 3;
  result = IOConnectCallScalarMethod(dword_255E52860, 0, input, 1u, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    if (outputCnt == 3)
    {
      result = 0;
      qword_255E52880 = output;
      qword_255E52888 = v4;
      qword_255E52890 = v5;
    }
    else
    {
      return 4294948206;
    }
  }
  return result;
}

uint64_t VTParavirtualizationGuestSupportRegisterGuestUUID(void *inputStruct)
{
  if (dword_255E52860)
    return IOConnectCallStructMethod(dword_255E52860, 1u, inputStruct, 0x10uLL, 0, 0);
  else
    return 4294948206;
}

uint64_t VTParavirtualizationGuestSupportDeregisterGuestUUID(void *inputStruct)
{
  if (dword_255E52860)
    return IOConnectCallStructMethod(dword_255E52860, 2u, inputStruct, 0x10uLL, 0, 0);
  else
    return 4294948206;
}

uint64_t VTParavirtualizationGuestSupportSendRawMessageToHost(uint64_t a1, uint64_t a2, IOSurfaceRef *a3, unint64_t a4)
{
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  size_t *v14;
  size_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)input = 0u;
  output = 0;
  outputCnt = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_255E52878);
  if (dword_255E52860)
  {
    if (a1 && a2)
    {
      v8 = 0;
      v9 = (uint64_t *)(a1 + 8);
      v10 = a2;
      while (*(v9 - 1))
      {
        v11 = *v9;
        v9 += 2;
        v8 += v11;
        if (!--v10)
        {
          v12 = 4294954394;
          if (a4 <= 5 && v8 >= 0x30)
          {
            if (v8 <= qword_255E52880
              || (v12 = sub_22FEC8ABC((v8 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8]), !(_DWORD)v12))
            {
              v13 = (char *)qword_255E52888;
              if (!qword_255E52888)
                goto LABEL_23;
              v14 = (size_t *)(a1 + 8);
              do
              {
                v15 = *v14;
                memcpy(v13, (const void *)*(v14 - 1), *v14);
                v13 += v15;
                v14 += 2;
                --a2;
              }
              while (a2);
              input[0] = v8;
              if (a3 && a4)
              {
                v16 = &input[1];
                do
                {
                  if (!*a3)
                    break;
                  *v16++ = IOSurfaceGetID(*a3++);
                  --a4;
                }
                while (a4);
              }
              v17 = IOConnectCallScalarMethod(dword_255E52860, 3u, input, 6u, &output, &outputCnt);
              if ((_DWORD)v17)
                v12 = v17;
              else
                v12 = output;
            }
          }
          goto LABEL_22;
        }
      }
    }
    v12 = 4294954394;
  }
  else
  {
LABEL_23:
    v12 = 4294948206;
  }
LABEL_22:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_255E52878);
  return v12;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB7B0](allocator, ptr, newsize, hint);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x24BDD7FA0]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x24BDD7FB0](dataQueue, data, dataSize);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

