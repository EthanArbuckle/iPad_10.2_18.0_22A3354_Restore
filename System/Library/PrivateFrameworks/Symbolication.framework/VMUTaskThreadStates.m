@implementation VMUTaskThreadStates

- (unint64_t)stackPointerForThreadNum:(unsigned int)a3
{
  unint64_t *stackPointers;

  stackPointers = self->_stackPointers;
  if (stackPointers && self->_threadCount > a3)
    return stackPointers[a3];
  else
    return 0;
}

- (VMUTaskThreadStates)initWithVMUTask:(id)a3
{
  id v4;
  VMUTaskThreadStates *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  VMUTaskThreadStates *v10;
  size_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  unint64_t v17;
  char *threadStates;
  size_t threadStateSize;
  unint64_t threadCount;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  ipc_space_t *v24;
  unint64_t v25;
  mach_vm_size_t v26;
  vm_map_t v27;
  mach_vm_address_t v28;
  int v30;
  _OWORD __src[14];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unsigned int v35;
  mach_vm_address_t v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VMUTaskThreadStates;
  v5 = -[VMUTaskThreadStates init](&v37, sel_init);
  if (!v5)
    goto LABEL_33;
  v36 = 0;
  v35 = 0;
  objc_msgSend(v4, "memoryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "taskThreadsWithList:listCnt:", &v36, &v35);

  if ((_DWORD)v7)
  {
    v8 = objc_msgSend(v4, "pid");
    v9 = mach_error_string(v7);
    NSLog(CFSTR("Unable to gather threads of remote process %d: %s (%d)\n"), v8, v9, v7);
    goto LABEL_4;
  }
  v11 = v35;
  v5->_threadCount = v35;
  v5->_stackPointers = (unint64_t *)malloc_type_calloc(v11, 8uLL, 0x100004000313F17uLL);
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  memset(__src, 0, sizeof(__src));
  if (!v5->_threadCount)
  {
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], v36, 0);
    goto LABEL_33;
  }
  v12 = 0;
  while (1)
  {
    v5->_threadStateSize = 272;
    v30 = 68;
    objc_msgSend(v4, "memoryCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "threadGetState:withFlavor:oldState:oldStateCnt:", *(unsigned int *)(v36 + 4 * v12), 6, __src, &v30);

    v15 = v4;
    if (!objc_msgSend(v15, "isExclave"))
      goto LABEL_15;
    v16 = HIDWORD(v34);
    if ((BYTE12(v34) & 1) == 0)
    {
      *(_QWORD *)&v34 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, v34);
      v16 = HIDWORD(v34);
    }
    if ((v16 & 3) != 0)
    {
      if ((v16 & 1) == 0)
        goto LABEL_23;
    }
    else
    {
      *(_QWORD *)&v33 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, v33);
      v16 = HIDWORD(v34);
      if ((BYTE12(v34) & 1) == 0)
      {
LABEL_23:
        *((_QWORD *)&v33 + 1) = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, *((uint64_t *)&v33 + 1));
        v16 = HIDWORD(v34);
        if ((BYTE12(v34) & 1) != 0)
          goto LABEL_14;
LABEL_13:
        *((_QWORD *)&v32 + 1) = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v15, *((uint64_t *)&v32 + 1));
        v16 = HIDWORD(v34);
        goto LABEL_14;
      }
    }
    if ((v16 & 1) == 0)
      goto LABEL_13;
LABEL_14:
    HIDWORD(v34) = v16 & 0xFFFFFFF2 | 1;
LABEL_15:

    if ((_DWORD)v14)
      break;
    v17 = *((_QWORD *)&v33 + 1);
    threadStates = (char *)v5->_threadStates;
    if (!threadStates)
    {
      threadStates = (char *)malloc_type_calloc(v5->_threadCount, v5->_threadStateSize, 0xA118E699uLL);
      v5->_threadStates = threadStates;
    }
    v5->_stackPointers[v12] = v17;
    threadStateSize = v5->_threadStateSize;
    if ((_DWORD)threadStateSize)
      memcpy(&threadStates[(threadStateSize * v12)], __src, threadStateSize);
    ++v12;
    threadCount = v5->_threadCount;
    if (v12 >= threadCount)
      goto LABEL_27;
  }
  v21 = objc_msgSend(v15, "pid");
  v22 = mach_error_string(v14);
  NSLog(CFSTR("Unable to get thread state for thread %u of remote process %d: %s (%d)\n"), v12, v21, v22, v14);
  LODWORD(threadCount) = v5->_threadCount;
LABEL_27:
  if ((_DWORD)threadCount)
  {
    v23 = 0;
    v24 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    do
    {
      mach_port_deallocate(*v24, *(_DWORD *)(v36 + 4 * v23++));
      v25 = v5->_threadCount;
    }
    while (v23 < v25);
    v26 = 4 * v25;
    v27 = *v24;
    v28 = v36;
  }
  else
  {
    v27 = *MEMORY[0x1E0C83DA0];
    v28 = v36;
    v26 = 0;
  }
  mach_vm_deallocate(v27, v28, v26);
  if (!(_DWORD)v14)
  {
LABEL_33:
    v10 = v5;
    goto LABEL_34;
  }
LABEL_4:
  v10 = 0;
LABEL_34:

  return v10;
}

- (unsigned)threadCount
{
  return self->_threadCount;
}

- (void)dealloc
{
  unint64_t *stackPointers;
  void *threadStates;
  objc_super v5;

  stackPointers = self->_stackPointers;
  if (stackPointers)
    free(stackPointers);
  threadStates = self->_threadStates;
  if (threadStates)
    free(threadStates);
  v5.receiver = self;
  v5.super_class = (Class)VMUTaskThreadStates;
  -[VMUTaskThreadStates dealloc](&v5, sel_dealloc);
}

- (VMUTaskThreadStates)initWithPid:(int)a3 task:(unsigned int)a4
{
  VMUTask *v5;
  VMUTaskThreadStates *v6;

  v5 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", *(_QWORD *)&a4);
  v6 = -[VMUTaskThreadStates initWithVMUTask:](self, "initWithVMUTask:", v5);

  return v6;
}

- (void)threadStateForThreadNum:(unsigned int)a3
{
  char *threadStates;

  threadStates = (char *)self->_threadStates;
  if (threadStates && self->_threadCount > a3)
    return &threadStates[self->_threadStateSize * a3];
  else
    return 0;
}

- (unsigned)threadStateSize
{
  return self->_threadStateSize;
}

@end
