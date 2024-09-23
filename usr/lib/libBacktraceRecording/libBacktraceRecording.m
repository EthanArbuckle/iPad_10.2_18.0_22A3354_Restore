uint64_t __introspection_dispatch_get_queues(int a1, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  int *v3;
  uint64_t v4;
  mach_vm_size_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  mach_vm_address_t v16;
  int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  size_t v28;
  int v29;
  size_t v30;
  int v31;
  size_t v32;
  char *v33;
  int v34;
  uint64_t v35;
  int v38;
  _DWORD *v39;
  mach_vm_address_t address;

  *a2 = 0;
  *a3 = 0;
  v3 = off_C090;
  if (!off_C090)
    return 0;
  v4 = 0;
  v5 = 0;
  v6 = a1 - 1;
  do
  {
    switch(v6)
    {
      case 0:
        goto LABEL_10;
      case 1:
        v7 = atomic_load((unsigned int *)v3 + 11);
        v8 = atomic_load((unsigned int *)v3 + 12);
        if (!(((int)(v8 + v7) < 0) ^ __OFADD__(v8, v7) | (v8 + v7 == 0)))
          goto LABEL_10;
        break;
      case 2:
        v9 = (unsigned int *)(v3 + 12);
        goto LABEL_9;
      case 3:
        v9 = (unsigned int *)(v3 + 11);
LABEL_9:
        v10 = atomic_load(v9);
        if (v10 > 0)
          goto LABEL_10;
        break;
      case 4:
        v13 = atomic_load((unsigned int *)v3 + 11);
        v14 = atomic_load((unsigned int *)v3 + 12);
        if (v13 + v14)
          break;
LABEL_10:
        v11 = strlen((const char *)v3 + 52) + 33;
        v12 = 8 - (v11 & 7);
        ++v4;
        if ((v11 & 7) == 0)
          v12 = 0;
        v5 += (v12 + v11);
        break;
      default:
        break;
    }
    v3 = *(int **)v3;
  }
  while (v3);
  if (v4)
  {
    address = 0;
    if (mach_vm_allocate(mach_task_self_, &address, v5, 1))
    {
      fwrite("libBacktraceRecording: can't allocate VM for dispatch queues list\n", 0x42uLL, 1uLL, __stderrp);
      return 0;
    }
    v16 = address;
    v17 = off_C090;
    if (off_C090)
    {
      do
      {
        switch(v6)
        {
          case 0:
            goto LABEL_32;
          case 1:
            v18 = atomic_load((unsigned int *)v17 + 11);
            v19 = atomic_load((unsigned int *)v17 + 12);
            if (!(((int)(v19 + v18) < 0) ^ __OFADD__(v19, v18) | (v19 + v18 == 0)))
              goto LABEL_32;
            break;
          case 2:
            v20 = (unsigned int *)(v17 + 12);
            goto LABEL_29;
          case 3:
            v20 = (unsigned int *)(v17 + 11);
LABEL_29:
            v21 = atomic_load(v20);
            if (v21 <= 0)
              break;
            goto LABEL_32;
          case 4:
            v22 = atomic_load((unsigned int *)v17 + 11);
            v23 = atomic_load((unsigned int *)v17 + 12);
            if (!(v22 + v23))
            {
LABEL_32:
              v24 = *((_QWORD *)v17 + 4);
              *(_QWORD *)(v16 + 8) = *((_QWORD *)v17 + 3);
              *(_QWORD *)(v16 + 16) = v24;
              LODWORD(v24) = atomic_load((unsigned int *)v17 + 11);
              if ((v24 & 0x80000000) != 0)
                v25 = 0;
              else
                v25 = atomic_load((unsigned int *)v17 + 11);
              *(_DWORD *)(v16 + 24) = v25;
              v26 = atomic_load((unsigned int *)v17 + 12);
              if ((v26 & 0x80000000) != 0)
                v27 = 0;
              else
                v27 = atomic_load((unsigned int *)v17 + 12);
              *(_DWORD *)(v16 + 28) = v27;
              v28 = strlen((const char *)v17 + 52);
              v29 = v28 + 33;
              v30 = 8 - (((_DWORD)v28 + 33) & 7u);
              v31 = (v28 + 33) & 7;
              v32 = v28 + 1;
              v39 = (_DWORD *)v16;
              v33 = (char *)(v16 + 32);
              if (v31)
                v34 = 8 - ((v28 + 33) & 7);
              else
                v34 = 0;
              v38 = v34;
              memcpy(v33, v17 + 13, v32);
              if (v31)
                bzero(&v33[v32], v30);
              v35 = (v38 + v29);
              *v39 = v35;
              v16 = (mach_vm_address_t)v39 + v35;
            }
            break;
          default:
            break;
        }
        v17 = *(int **)v17;
      }
      while (v17);
      v16 = address;
    }
    *a2 = v16;
    *a3 = v5;
  }
  return v4;
}

uint64_t __introspection_dispatch_queue_get_pending_items(uint64_t a1, mach_vm_address_t *a2, uint64_t *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  mach_vm_address_t v10;
  int *v11;
  int **v12;
  mach_vm_address_t address;

  *a2 = 0;
  *a3 = 0;
  v5 = dispatch_queue_serialnum(a1);
  v6 = off_C0F8;
  if (!off_C0F8)
    return 0;
  v7 = v5;
  v8 = 0;
  do
  {
    if (*(_QWORD *)(*((_QWORD *)v6 + 15) + 32) == v5)
      ++v8;
    v6 = *(int **)v6;
  }
  while (v6);
  if (v8)
  {
    address = 0;
    if (mach_vm_allocate(mach_task_self_, &address, (16 * v8) | 8, 1))
    {
      fwrite("libBacktraceRecording: can't allocate VM for work items list\n", 0x3DuLL, 1uLL, __stderrp);
      return 0;
    }
    v10 = address;
    *(_QWORD *)address = 0x1000000001;
    v11 = off_C0F8;
    if (off_C0F8)
    {
      v12 = (int **)(v10 + 8);
      do
      {
        if (*(_QWORD *)(*((_QWORD *)v11 + 15) + 32) == v7)
        {
          *v12 = v11;
          v12[1] = (int *)*((_QWORD *)v11 + 7);
          v12 += 2;
        }
        v11 = *(int **)v11;
      }
      while (v11);
    }
    *a2 = v10;
    *a3 = (16 * v8) | 8;
  }
  return v8;
}

_QWORD *__introspection_dispatch_queue_item_get_info(_QWORD *result, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  size_t v8;
  size_t v9;
  mach_vm_size_t v10;
  mach_vm_address_t v11;
  uint64_t v12;
  char *v13;
  mach_vm_address_t address;

  *a2 = 0;
  *a3 = 0;
  if (result)
  {
    v5 = result;
    v6 = *((unsigned int *)result + 23);
    v7 = strlen((const char *)(result[13] + 40)) + 1;
    v8 = strlen((const char *)(v5[14] + 52)) + 1;
    v9 = strlen((const char *)(v5[15] + 52)) + 1;
    v10 = v7 + 8 * v6 + v8 + v9 + 56;
    address = 0;
    if (mach_vm_allocate(mach_task_self_, &address, v10, 1))
    {
      return (_QWORD *)fwrite("libBacktraceRecording: can't allocate VM for item info\n", 0x37uLL, 1uLL, __stderrp);
    }
    else
    {
      v11 = address;
      *(_QWORD *)address = v5[16];
      *(_QWORD *)(v11 + 8) = v5[7];
      *(_DWORD *)(v11 + 44) = *((_DWORD *)v5 + 36);
      v12 = v5[14];
      *(_QWORD *)(v11 + 16) = *(_QWORD *)(v5[13] + 24);
      *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 32);
      *(_QWORD *)(v11 + 32) = *(_QWORD *)(v5[15] + 32);
      *(_DWORD *)(v11 + 40) = *((_DWORD *)v5 + 23);
      *(_DWORD *)(v11 + 48) = *((_DWORD *)v5 + 34);
      *(_DWORD *)(v11 + 52) = *((_DWORD *)v5 + 35);
      ptrSized_stack_frames_for_uniqued_stack(backtrace_uniquing_table, v5[12], v11 + 56, *((unsigned int *)v5 + 23));
      memcpy((void *)(v11 + 56 + 8 * v6), (const void *)(v5[13] + 40), v7);
      v13 = (char *)(v11 + 56 + 8 * v6 + v7);
      memcpy(v13, (const void *)(v5[14] + 52), v8);
      result = memcpy(&v13[v8], (const void *)(v5[15] + 52), v9);
      *a2 = v11;
      *a3 = v10;
    }
  }
  return result;
}

_QWORD *__introspection_dispatch_thread_get_item_info(_QWORD *result, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  uint64_t *v3;

  *a2 = 0;
  *a3 = 0;
  v3 = &qword_C028;
  while (1)
  {
    v3 = (uint64_t *)*v3;
    if (!v3)
      break;
    if ((_QWORD *)v3[3] == result)
    {
      result = (_QWORD *)v3[14];
      if (result)
        return __introspection_dispatch_queue_item_get_info(result, a2, a3);
      return result;
    }
  }
  return result;
}

uint64_t active_work_item()
{
  return *((_QWORD *)current_thread_info() + 14);
}

unsigned int *current_thread_info()
{
  unsigned int *result;

  result = (unsigned int *)pthread_getspecific(thread_info_key);
  if (!result)
    return add_thread_info_to_list();
  return result;
}

void *dispatch_queue_label()
{
  void *result;

  result = (void *)dispatch_queue_get_label_ptr();
  if (!result)
    return &unk_66B2;
  return result;
}

uint64_t dispatch_queue_serialnum(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int16 *)(dispatch_queue_offsets + 12);
  if (v1 == 8)
    return *(_QWORD *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  if (v1 == 4)
    return *(unsigned int *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  return 0;
}

unsigned int *add_thread_info_to_list()
{
  unsigned int *entry_from_free_list;
  _opaque_pthread_t *v1;
  thread_inspect_t v2;
  kern_return_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  void *v7;
  const void *v8;
  FILE *v9;
  pid_t v10;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[2];
  uint64_t v14;
  uint64_t v15;
  __int128 __src;
  __int128 v17;
  _OWORD v18[4];
  __int128 v19;
  uint64_t v20;

  entry_from_free_list = (unsigned int *)pthread_getspecific(thread_info_key);
  if (!entry_from_free_list)
  {
    v20 = 0;
    v19 = 0u;
    v17 = 0u;
    memset(v18, 0, sizeof(v18));
    __src = 0u;
    v1 = pthread_self();
    *(_QWORD *)&v18[0] = v1;
    BYTE8(v18[0]) = 0;
    pthread_getname_np(v1, (char *)v18 + 8, 0x40uLL);
    *(_QWORD *)thread_info_out = 0;
    v14 = 0;
    v15 = 0;
    thread_info_outCnt = 6;
    v2 = pthread_mach_thread_np(v1);
    v3 = thread_info(v2, 4u, thread_info_out, &thread_info_outCnt);
    v4 = *(_QWORD *)thread_info_out;
    if (v3)
      v4 = 0;
    *((_QWORD *)&v17 + 1) = v4;
    *((_QWORD *)&v19 + 1) = 0;
    v20 = 0;
    entry_from_free_list = get_entry_from_free_list((uint64_t)&thread_lists, &__src, 1);
    v5 = entry_from_free_list + 5;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    if (debug_printing)
    {
      v7 = pthread_getspecific(thread_info_key);
      if (v7)
      {
        v8 = v7;
        v9 = __stderrp;
        v10 = getpid();
        fprintf(v9, "pid %d add_thread_info_to_list() called for thread %p;  thread_info should be NULL but is %p\n",
          v10,
          v1,
          v8);
      }
    }
    pthread_setspecific(thread_info_key, entry_from_free_list);
    if (debug_trace_threads)
      print_thread_summary((uint64_t)entry_from_free_list, "thread added to list: ", (const char *)&unk_66B2);
  }
  return entry_from_free_list;
}

unsigned int *get_entry_from_free_list(uint64_t a1, void *__src, int a3)
{
  unsigned int *v6;
  unint64_t v7;
  vm_size_t v8;
  vm_size_t v9;
  mach_vm_address_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  unsigned int **v15;
  mach_vm_address_t address;

  if (a3)
    os_unfair_lock_lock_with_options(a1 + 24, 0x10000);
  v6 = *(unsigned int **)(a1 + 80);
  if (!v6)
  {
    address = 0;
    v7 = *(_QWORD *)(a1 + 8);
    v8 = (vm_page_size + (v7 << 7) - 1) & -(uint64_t)vm_page_size;
    if (mach_vm_allocate(mach_task_self_, &address, v8, 167772161))
      get_entry_from_free_list_cold_1();
    v9 = v8 / v7;
    *(_QWORD *)(a1 + 16) += v8;
    v10 = address;
    *(_DWORD *)(a1 + 96) += v8 / v7;
    if ((v8 / v7))
    {
      v11 = *(_QWORD *)(a1 + 8);
      v12 = *(_QWORD **)(a1 + 88);
      do
      {
        *(_DWORD *)(v10 + 16) = 0;
        *(_QWORD *)v10 = 0;
        *(_QWORD *)(v10 + 8) = v12;
        *v12 = v10;
        v12 = (_QWORD *)v10;
        *(_QWORD *)(a1 + 88) = v10;
        v10 += v11;
        LODWORD(v9) = v9 - 1;
      }
      while ((_DWORD)v9);
    }
    v6 = *(unsigned int **)(a1 + 80);
  }
  v13 = *(_QWORD *)v6;
  v14 = (_QWORD *)*((_QWORD *)v6 + 1);
  if (*(_QWORD *)v6)
  {
    *(_QWORD *)(v13 + 8) = v14;
    v14 = (_QWORD *)*((_QWORD *)v6 + 1);
  }
  else
  {
    *(_QWORD *)(a1 + 88) = v14;
  }
  *v14 = v13;
  --*(_DWORD *)(a1 + 96);
  memcpy(v6, __src, *(_QWORD *)(a1 + 8));
  v6[4] = 1;
  atomic_store(0, v6 + 5);
  v15 = *(unsigned int ***)(a1 + 40);
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = v15;
  *v15 = v6;
  *(_QWORD *)(a1 + 40) = v6;
  ++*(_DWORD *)(a1 + 48);
  if (a3)
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  return v6;
}

size_t __library_initializer()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  FILE *v3;
  const char *v4;
  size_t v5;
  kern_return_t v7;
  void *dli_saddr;
  mach_vm_address_t v9;
  char *v10;
  int v11;
  Dl_info v12;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  int info[4];
  __int128 v16;
  int v17;
  mach_vm_size_t size;
  mach_vm_address_t address;

  v0 = dlopen("/usr/lib/system/introspection/libdispatch.dylib", 16);
  if (v0)
  {
    v1 = v0;
    v2 = dlsym(v0, "dispatch_introspection_versions");
    if (v2 && v2[1] > 1uLL)
    {
      gcd_hook_install_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_introspection_hooks_install");
      if (gcd_hook_install_ptr)
      {
        dispatch_get_current_queue_ptr = (uint64_t (*)(_QWORD))dlsym(v1, "dispatch_get_current_queue");
        dispatch_queue_get_label_ptr = (uint64_t (*)(_QWORD))dlsym(v1, "dispatch_queue_get_label");
        dispatch_queue_offsets = (uint64_t)dlsym(v1, "dispatch_queue_offsets");
        size = 0;
        address = (mach_vm_address_t)dispatch_get_current_queue_ptr;
        v17 = 0;
        *(_OWORD *)info = 0u;
        v16 = 0u;
        object_name = 0;
        infoCnt = 9;
        v7 = mach_vm_region(mach_task_self_, &address, &size, 9, info, &infoCnt, &object_name);
        dli_saddr = 0;
        if (!v7)
        {
          v9 = address;
          v10 = (char *)(address + size - 1);
          if ((unint64_t)v10 >= address)
          {
            do
            {
              memset(&v12, 0, sizeof(v12));
              if (dladdr(v10, &v12))
              {
                if (!v12.dli_sname)
                  break;
                v11 = strcmp(v12.dli_sname, "_dispatch_queue_override_invoke_owning");
                dli_saddr = v12.dli_saddr;
                if (!v11)
                  goto LABEL_18;
                v10 = (char *)v12.dli_saddr - 2;
              }
              else
              {
                --v10;
              }
            }
            while ((unint64_t)v10 >= v9);
          }
          dli_saddr = 0;
        }
LABEL_18:
        _dispatch_queue_override_invoke_owning_ptr = (uint64_t)dli_saddr;
        pthread_atfork((void (*)(void))fork_prepare_handler, fork_parent_process_handler, fork_child_process_handler);
        enable_hooks = 1;
        dispatch_introspection_hooks = (uint64_t (*)(_QWORD))gcd_queue_create_hook;
        off_C1A8 = (uint64_t (*)(_QWORD))gcd_queue_dispose_hook;
        off_C1B0 = (uint64_t (*)(_QWORD, _QWORD))gcd_queue_item_enqueue_hook;
        off_C1B8 = (uint64_t (*)(_QWORD, _QWORD))gcd_queue_item_dequeue_hook;
        off_C1C0 = (uint64_t (*)(_QWORD))gcd_queue_item_complete_hook;
        gcd_hook_install_ptr();
        previous_pthread_hook = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))pthread_introspection_hook_install((pthread_introspection_hook_t)pthread_introspection_hook);
        if (debug_printing)
          initialize_debug_printing();
        pthread_key_create((pthread_key_t *)&thread_info_key, (void (__cdecl *)(void *))thread_terminating);
        resetDyldInsertLibraries("libBacktraceRecording.dylib");
        backtrace_uniquing_table = (uint64_t)create_backtrace_uniquing_table(0x4000u, 4);
        return dlclose(v1);
      }
      fwrite("dlsym did not find dispatch_introspection_hooks_install() in /usr/lib/system/introspection/libdispatch.dylib\n", 0x6DuLL, 1uLL, __stderrp);
      v3 = __stderrp;
      v4 = "Process must be launched with DYLD_LIBRARY_PATH=/usr/lib/system/introspection to get libdispatch introspection\n";
      v5 = 111;
    }
    else
    {
      v3 = __stderrp;
      v4 = "Need a more recent version of /usr/lib/system/introspection/libdispatch.dylib -- missing suppport for the que"
           "ue_item_complete hook function.\n";
      v5 = 141;
    }
    fwrite(v4, v5, 1uLL, v3);
    return dlclose(v1);
  }
  return fwrite("Process must be launched with DYLD_LIBRARY_PATH=/usr/lib/system/introspection to get libdispatch introspection\n", 0x6FuLL, 1uLL, __stderrp);
}

uint64_t fork_prepare_handler()
{
  uint64_t result;

  os_unfair_lock_lock_with_options(&dword_C020, 0x10000);
  os_unfair_lock_lock_with_options(&dword_C088, 0x10000);
  result = os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000);
  enable_hooks = 0;
  return result;
}

void fork_parent_process_handler()
{
  enable_hooks = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
}

void fork_child_process_handler()
{
  enable_hooks = 0;
  dword_C020 = 0;
  dword_C088 = 0;
  dword_C0F0 = 0;
}

unsigned int *pthread_introspection_hook(unsigned int *result, unsigned int *a2, char *a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int *v8;
  FILE *v9;
  pid_t v10;

  v7 = (uint64_t)result;
  if (previous_pthread_hook)
    result = (unsigned int *)previous_pthread_hook(result, a2, a3, a4);
  if (enable_hooks == 1)
  {
    if (debug_printing)
      result = (unsigned int *)print_pthread_event(v7, a2, a3, a4);
    switch((_DWORD)v7)
    {
      case 4:
        result = (unsigned int *)pthread_self();
        if (result == a2)
          return (unsigned int *)pthread_getspecific(thread_info_key);
        break;
      case 3:
        result = (unsigned int *)pthread_getspecific(thread_info_key);
        if (result)
        {
          v8 = result;
          if (debug_trace_threads)
          {
            v9 = __stderrp;
            v10 = getpid();
            fprintf(v9, "pid %d PTHREAD_INTROSPECTION_THREAD_TERMINATE event received for thread %p;  thread_info would normally be"
              " NULL but is %p  thread_id %llu\n",
              v10,
              a2,
              v8,
              *((_QWORD *)v8 + 3));
          }
          thread_terminating((uint64_t)v8);
          return (unsigned int *)pthread_setspecific(thread_info_key, 0);
        }
        break;
      case 2:
        return add_thread_info_to_list();
    }
  }
  return result;
}

void thread_terminating(uint64_t a1)
{
  int v2;
  unsigned int v3;
  char __str[264];

  os_unfair_lock_lock_with_options(&dword_C020, 0x10000);
  move_entry_to_completed_list((uint64_t)&thread_lists, (uint64_t *)a1);
  v2 = decrement_entry_refcount((uint64_t)&thread_lists, (uint64_t *)a1);
  if (debug_trace_threads)
  {
    if (v2)
    {
      strcpy(__str, "  removed from list");
      print_thread_summary(a1, "thread terminating ", __str);
    }
    else
    {
      v3 = atomic_load((unsigned int *)(a1 + 20));
      snprintf(__str, 0x100uLL, "  NOT removed from list - refcount %d", v3);
      print_thread_summary(a1, "thread terminating ", __str);
      if (dword_C050 > thread_terminating_max_remaining)
      {
        thread_terminating_max_remaining = dword_C050;
        fprintf(__stderrp, "    %u threads completed but still referenced:\n", dword_C050);
        print_list(0, &qword_C040, (uint64_t)&__block_literal_global_58);
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
}

unsigned int *gcd_queue_create_hook(unsigned int *result)
{
  uint64_t v1;
  char *v2;

  v1 = (uint64_t)result;
  if (dispatch_introspection_hooks)
    result = (unsigned int *)dispatch_introspection_hooks(result);
  if (enable_hooks == 1)
  {
    if (debug_printing)
      print_gcd_queue_create_dispose((uint64_t)"created", v1);
    v2 = *(char **)(v1 + 16);
    if (!v2)
      return add_queue_info_to_list(*(_QWORD *)v1, *(_QWORD *)(v1 + 24), v2, 1);
    result = (unsigned int *)strcmp(*(const char **)(v1 + 16), "source");
    if ((_DWORD)result)
      return add_queue_info_to_list(*(_QWORD *)v1, *(_QWORD *)(v1 + 24), v2, 1);
  }
  return result;
}

void gcd_queue_dispose_hook(uint64_t a1)
{
  int **v2;
  int v3;
  unsigned int v4;
  _QWORD v5[2];
  BOOL (*v6)(uint64_t, uint64_t);
  void *v7;
  uint64_t v8;
  char __str[264];

  if (off_C1A8)
    off_C1A8(a1);
  if (enable_hooks == 1)
  {
    if (debug_printing)
      print_gcd_queue_create_dispose((uint64_t)"disposed", a1);
    os_unfair_lock_lock_with_options(&dword_C088, 0x10000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v6 = __gcd_queue_dispose_hook_block_invoke;
    v7 = &__block_descriptor_tmp;
    v8 = a1;
    v2 = &off_C090;
    while (1)
    {
      v2 = (int **)*v2;
      if (!v2)
        break;
      if (((unsigned int (*)(_QWORD *, int **))v6)(v5, v2))
      {
        move_entry_to_completed_list((uint64_t)&queue_lists, (uint64_t *)v2);
        v3 = decrement_entry_refcount((uint64_t)&queue_lists, (uint64_t *)v2);
        if (debug_trace_queues)
        {
          if (v3)
          {
            strcpy(__str, "  removed from list");
            print_queue_summary((uint64_t)v2, "queue disposed: ", __str);
          }
          else
          {
            v4 = atomic_load((unsigned int *)v2 + 5);
            snprintf(__str, 0x100uLL, "  NOT removed from list - refcount %d", v4);
            print_queue_summary((uint64_t)v2, "queue disposed: ", __str);
            if (dword_C0B8 > gcd_queue_dispose_hook_max_remaining)
            {
              gcd_queue_dispose_hook_max_remaining = dword_C0B8;
              fprintf(__stderrp, "    %u queues completed but still referenced:\n", dword_C0B8);
              print_list(0, &qword_C0A8, (uint64_t)&__block_literal_global);
            }
          }
        }
        break;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  }
}

void gcd_queue_item_enqueue_hook(const void *a1, uint64_t a2)
{
  int **v4;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t current_queue_ptr;
  unsigned int *queue_info;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  int v18;
  uint64_t v19;
  int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  uint64_t v36;
  __int128 __src;
  _BYTE v38[80];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _QWORD v43[2];
  BOOL (*v44)(uint64_t, uint64_t);
  void *v45;
  uint64_t v46;
  char __str[1024];
  void *v48[2];
  _BYTE v49[4088];

  if (off_C1B0)
    off_C1B0(a1, a2);
  if (enable_hooks == 1)
  {
    if (is_interesting_event((uint64_t)a1, a2))
    {
      os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 0x40000000;
      v44 = __gcd_queue_item_enqueue_hook_block_invoke;
      v45 = &__block_descriptor_tmp_39;
      v46 = a2;
      v4 = &off_C0F8;
      do
      {
        v4 = (int **)*v4;
        v5 = v4 != 0;
      }
      while (v4 && !((unsigned int (*)(_QWORD *, int **))v44)(v43, v4));
      v6 = v4 == 0;
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    if (debug_printing)
      print_gcd_queue_item_enqueue_dequeue("enqueued", a1, (uint64_t *)a2, v6, v5);
    if (v6)
    {
      v7 = os_unfair_lock_lock_with_options(&dword_C088, 0x10000);
      current_queue_ptr = dispatch_get_current_queue_ptr(v7);
      queue_info = (unsigned int *)*((_QWORD *)current_thread_info() + 13);
      if (!queue_info || *((_QWORD *)queue_info + 3) != current_queue_ptr)
        queue_info = find_or_create_queue_info(current_queue_ptr, 0);
      v10 = queue_info + 5;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      v12 = *(_QWORD *)(a2 + 16);
      v13 = queue_info;
      if (v12 != current_queue_ptr)
        v13 = find_or_create_queue_info(v12, 0);
      v14 = v13 + 5;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 + 1, v14));
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
      memset(&v38[16], 0, 64);
      v41 = 0u;
      v39 = 0u;
      v40 = 0u;
      __src = 0u;
      *(_OWORD *)v38 = 0u;
      v16 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)&v38[8] = *(_OWORD *)a2;
      *(_OWORD *)&v38[24] = v16;
      v17 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)&v38[40] = *(_OWORD *)(a2 + 32);
      v42 = 0;
      *(_OWORD *)&v38[56] = v17;
      if (*((_BYTE *)queue_info + 40) && (*((_BYTE *)v13 + 40) || *((_BYTE *)v13 + 41))
        || *((_BYTE *)queue_info + 41) && *((_BYTE *)v13 + 40))
      {
        v38[74] = 1;
      }
      memset(v49, 0, 496);
      *(_OWORD *)v48 = 0u;
      v18 = backtrace(v48, 512);
      v19 = v18 - 1;
      if ((unint64_t)v48[v19] >= vm_page_size)
        LODWORD(v19) = v18;
      if ((int)v19 <= 2)
        LODWORD(v19) = 2;
      v20 = v19 - 2;
      v36 = 0;
      enter_ptrSized_stack_in_backtrace_uniquing_table(backtrace_uniquing_table, &v36, v49, (v19 - 2));
      *(_DWORD *)&v38[76] = v20;
      *(_QWORD *)&v39 = v36;
      *((_QWORD *)&v39 + 1) = current_thread_info();
      v21 = (unsigned int *)(*((_QWORD *)&v39 + 1) + 20);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 + 1, v21));
      *(_QWORD *)&v40 = queue_info;
      *((_QWORD *)&v40 + 1) = v13;
      v41 = 0uLL;
      LODWORD(v42) = 0;
      v23 = current_thread_info();
      v24 = *((_QWORD *)v23 + 14);
      if (v24)
      {
        v25 = 0;
        v26 = *((_QWORD *)v23 + 14);
        do
        {
          ++v25;
          v26 = *(_QWORD *)(v26 + 128);
        }
        while (v26);
        v27 = debug_maxlevels;
        if (debug_maxlevels)
          v28 = v25 > gcd_queue_item_enqueue_hook_max_levels;
        else
          v28 = 0;
        if (v28)
        {
          gcd_queue_item_enqueue_hook_max_levels = v25;
          print_logical_backtrace((const char *)&unk_66B2);
          v27 = debug_maxlevels;
        }
        if (v25 < 0x33 || v27)
        {
          *(_QWORD *)&v41 = v24;
          v30 = (unsigned int *)(v24 + 20);
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 + 1, v30));
        }
        else
        {
          v29 = 0;
          *(_QWORD *)&v41 = 0;
          do
          {
            v29 += *(_DWORD *)(v24 + 136) + *(_DWORD *)(v24 + 140) + 1;
            v24 = *(_QWORD *)(v24 + 128);
          }
          while (v24);
          HIDWORD(v41) = v29;
          if (debug_printing && (gcd_queue_item_enqueue_hook_printed & 1) == 0)
          {
            gcd_queue_item_enqueue_hook_printed = 1;
            fwrite("PLEASE FILE A BUG REPORT AGAINST libBacktraceRecording / X WITH THE FOLLOWING BACKTRACE OUTPUT\n", 0x5FuLL, 1uLL, __stderrp);
            snprintf(__str, 0x400uLL, "Cutting long chain of %u unique enqueuings (non-repeating, non-looping), %u total elided\n", v25, v29);
            print_logical_backtrace(__str);
          }
        }
      }
      v32 = get_entry_from_free_list((uint64_t)&work_item_lists, &__src, 1) + 5;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 + 1, v32));
      v34 = v13 + 12;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 + 1, v34));
      if (debug_printing)
      {
        if (dword_C108 > gcd_queue_item_enqueue_hook_max_enqueued)
        {
          gcd_queue_item_enqueue_hook_max_enqueued = dword_C108;
          locked_print_dispatch_info();
        }
      }
    }
  }
}

void gcd_queue_item_dequeue_hook(const void *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int **v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t current_queue_ptr;
  unsigned int *queue_info;
  unsigned int *v17;
  _QWORD v18[2];
  BOOL (*v19)(uint64_t, uint64_t);
  void *v20;
  uint64_t *v21;

  if (off_C1B8)
    off_C1B8(a1, a2);
  if (enable_hooks == 1)
  {
    if (is_interesting_event((uint64_t)a1, (uint64_t)a2))
    {
      v4 = *((_QWORD *)current_thread_info() + 14);
      if (v4)
      {
        v5 = *(_QWORD *)(v4 + 32);
        v6 = a2[1];
        v7 = v5 == v6;
        v8 = v5 != v6;
      }
      else
      {
        v7 = 0;
        v8 = 1;
      }
    }
    else
    {
      v4 = 0;
      v7 = 0;
      v8 = 0;
    }
    if (debug_printing)
      print_gcd_queue_item_enqueue_dequeue("dequeued", a1, a2, v8, v7);
    if (v8)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 0x40000000;
      v19 = __gcd_queue_item_dequeue_hook_block_invoke;
      v20 = &__block_descriptor_tmp_46;
      v21 = a2;
      os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000);
      v9 = &off_C0F8;
      while (1)
      {
        v9 = (int **)*v9;
        if (!v9)
          break;
        if ((((uint64_t (*)(_QWORD *, int **))v19)(v18, v9) & 1) != 0)
        {
          move_entry_to_completed_list((uint64_t)&work_item_lists, (uint64_t *)v9);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
          if (v4)
          {
            if (debug_printing)
              print_gcd_item_conflict(v9, (_QWORD *)v4);
            gcd_queue_item_complete_hook(*(const void **)(v4 + 32));
          }
          *((_DWORD *)v9 + 4) = 2;
          v11 = (unsigned int *)(v9[15] + 12);
          do
            v12 = __ldaxr(v11);
          while (__stlxr(v12 - 1, v11));
          v13 = (unsigned int *)(v9[15] + 11);
          do
            v14 = __ldaxr(v13);
          while (__stlxr(v14 + 1, v13));
          current_queue_ptr = dispatch_get_current_queue_ptr(v10);
          queue_info = (unsigned int *)v9[15];
          if (*((_QWORD *)queue_info + 3) != current_queue_ptr)
            queue_info = find_or_create_queue_info(current_queue_ptr, 1);
          v17 = current_thread_info();
          *((_QWORD *)v17 + 13) = queue_info;
          *((_QWORD *)v17 + 14) = v9;
          collapse_enqueuing_recursion((uint64_t)v9);
          return;
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      if (showEnqueueDequeue)
        fprintf(__stderrp, "LOGICAL ERROR!! dequeued continuation %p that was not enqueued\n", (const void *)a2[1]);
    }
  }
}

void gcd_queue_item_complete_hook(const void *a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int *v5;
  int v6;

  if (off_C1C0)
    off_C1C0(a1);
  if (enable_hooks == 1)
  {
    v2 = *((_QWORD *)current_thread_info() + 14);
    if (v2)
    {
      if ((unint64_t)(*(_QWORD *)(v2 + 24) - 17) <= 1)
      {
        if (debug_printing)
          print_gcd_queue_item_complete(a1, v2);
        v3 = (unsigned int *)(*(_QWORD *)(v2 + 120) + 44);
        do
          v4 = __ldaxr(v3);
        while (__stlxr(v4 - 1, v3));
        v5 = current_thread_info();
        *((_QWORD *)v5 + 13) = 0;
        *((_QWORD *)v5 + 14) = 0;
        *(_DWORD *)(v2 + 16) = 3;
        v6 = atomic_load((unsigned int *)(v2 + 20));
        if (v6 >= 2)
        {
          if (*(_BYTE *)(v2 + 89))
            collapse_enqueuing_recursion(v2);
        }
        os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000);
        decrement_work_item_refcount(v2);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      }
    }
  }
}

unsigned int *add_queue_info_to_list(uint64_t a1, unint64_t a2, char *__s1, int a4)
{
  size_t v6;
  size_t v7;
  unsigned int *entry_from_free_list;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _OWORD v17[8];
  uint64_t v18;

  v18 = 0;
  memset(v17, 0, sizeof(v17));
  v14 = 0;
  v13 = 0u;
  v15 = a1;
  v16 = a2;
  atomic_store(0, (unsigned int *)&v16 + 3);
  atomic_store(0, (unsigned int *)v17);
  if (*(unsigned __int16 *)dispatch_queue_offsets <= 4u)
  {
    if (is_root_dispatch_queue_prefix_length)
      v6 = 22;
    else
      v6 = 0;
    if ((is_root_dispatch_queue_prefix_length & 1) == 0)
    {
      is_root_dispatch_queue_prefix_length = 1;
      v6 = 22;
    }
    if (!__s1)
    {
      WORD4(v16) = 0;
LABEL_19:
      BYTE4(v17[0]) = 0;
      goto LABEL_20;
    }
    BYTE9(v16) = strncmp(__s1, "com.apple.root.", v6) == 0;
    BYTE8(v16) = 0;
  }
  else
  {
    BYTE9(v16) = *(_QWORD *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 26)) == 0;
    BYTE8(v16) = 0;
    if (!__s1)
      goto LABEL_19;
  }
  __strlcpy_chk((char *)v17 + 4, __s1, 128, 128);
  if (add_queue_info_to_list_prefix_length)
    v7 = 22;
  else
    v7 = 0;
  if ((add_queue_info_to_list_prefix_length & 1) == 0)
  {
    add_queue_info_to_list_prefix_length = 1;
    v7 = 22;
  }
  if (!strncmp((const char *)v17 + 4, "com.apple.libdispatch-", v7))
    BYTE8(v16) = 1;
LABEL_20:
  entry_from_free_list = get_entry_from_free_list((uint64_t)&queue_lists, &v13, a4);
  v9 = entry_from_free_list;
  v10 = entry_from_free_list + 5;
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  if (debug_trace_queues)
    print_queue_summary((uint64_t)entry_from_free_list, "queue added to list: ", (const char *)&unk_66B2);
  return v9;
}

BOOL __gcd_queue_dispose_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24) == **(_QWORD **)(a1 + 32);
}

uint64_t move_entry_to_completed_list(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *a2;
  v3 = (_QWORD *)a2[1];
  if (*a2)
  {
    *(_QWORD *)(v2 + 8) = v3;
    v3 = (_QWORD *)a2[1];
  }
  else
  {
    *(_QWORD *)(result + 40) = v3;
  }
  *v3 = v2;
  --*(_DWORD *)(result + 48);
  *((_DWORD *)a2 + 4) = 3;
  v4 = *(_QWORD **)(result + 64);
  *a2 = 0;
  a2[1] = (uint64_t)v4;
  *v4 = a2;
  *(_QWORD *)(result + 64) = a2;
  ++*(_DWORD *)(result + 72);
  return result;
}

uint64_t decrement_entry_refcount(uint64_t a1, uint64_t *a2)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v2 = (unsigned int *)a2 + 5;
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 - 1, v2));
  if (v3 != 1 || *((_DWORD *)a2 + 4) != 3)
    return 0;
  v4 = *a2;
  v5 = (_QWORD *)a2[1];
  if (*a2)
  {
    *(_QWORD *)(v4 + 8) = v5;
    v5 = (_QWORD *)a2[1];
  }
  else
  {
    *(_QWORD *)(a1 + 64) = v5;
  }
  *v5 = v4;
  v8 = *(_QWORD *)(a1 + 80);
  v7 = a1 + 80;
  --*(_DWORD *)(v7 - 8);
  *((_DWORD *)a2 + 4) = 0;
  *a2 = v8;
  v9 = (_QWORD *)(v8 + 8);
  if (v8)
    v10 = v9;
  else
    v10 = (_QWORD *)(v7 + 8);
  *v10 = a2;
  *(_QWORD *)v7 = a2;
  a2[1] = v7;
  ++*(_DWORD *)(v7 + 16);
  return 1;
}

void __gcd_queue_dispose_hook_block_invoke_2(id a1, generic_introspection_info_s *a2)
{
  print_queue_summary((uint64_t)a2, "    ", (const char *)&unk_66B2);
}

uint64_t is_interesting_event(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  const char *v6;
  const char *label_ptr;
  const char *v8;

  if ((unint64_t)(*(_QWORD *)a2 - 17) > 1 || (*(_BYTE *)(a2 + 56) & 2) != 0)
    return 0;
  result = 0;
  if ((*(_BYTE *)(a2 + 56) & 4) != 0 || *(_QWORD *)(a2 + 48))
    return result;
  v5 = libdispatchManagerQueue;
  if (!libdispatchManagerQueue)
  {
    label_ptr = (const char *)dispatch_queue_get_label_ptr(a1);
    if (!label_ptr)
      label_ptr = (const char *)&unk_66B2;
    result = strcmp(label_ptr, "com.apple.libdispatch-manager");
    if (!(_DWORD)result)
    {
      libdispatchManagerQueue = a1;
      return result;
    }
    v8 = (const char *)dispatch_queue_get_label_ptr(*(_QWORD *)(a2 + 16));
    if (!v8)
      v8 = (const char *)&unk_66B2;
    if (!strcmp(v8, "com.apple.libdispatch-manager"))
    {
      v5 = *(_QWORD *)(a2 + 16);
      libdispatchManagerQueue = v5;
    }
    else
    {
      v5 = libdispatchManagerQueue;
    }
  }
  if (v5 == a1
    || *(_QWORD *)(a2 + 16) == v5
    || *(_QWORD *)a2 == 18
    && _dispatch_queue_override_invoke_owning_ptr
    && *(_QWORD *)(a2 + 32) == _dispatch_queue_override_invoke_owning_ptr)
  {
    return 0;
  }
  v6 = (const char *)dispatch_queue_get_label_ptr(a1);
  if (!v6)
    v6 = (const char *)&unk_66B2;
  return strcmp(v6, "source") != 0;
}

BOOL __gcd_queue_item_enqueue_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

unsigned int *find_or_create_queue_info(uint64_t a1, int a2)
{
  int v4;
  unint64_t v5;
  unsigned int *v6;
  uint64_t label_ptr;
  char *v9;
  _QWORD v10[2];
  BOOL (*v11)(uint64_t, uint64_t);
  void *v12;
  unint64_t v13;

  if (a2)
    os_unfair_lock_lock_with_options(&dword_C088, 0x10000);
  v4 = *(unsigned __int16 *)(dispatch_queue_offsets + 12);
  if (v4 == 8)
  {
    v5 = *(_QWORD *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  else if (v4 == 4)
  {
    v5 = *(unsigned int *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  else
  {
    v5 = 0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v11 = __find_or_create_queue_info_block_invoke;
  v12 = &__block_descriptor_tmp_44;
  v13 = v5;
  v6 = (unsigned int *)&off_C090;
  while (1)
  {
    v6 = *(unsigned int **)v6;
    if (!v6)
      break;
    if ((((uint64_t (*)(_QWORD *, unsigned int *))v11)(v10, v6) & 1) != 0)
    {
      if (!a2)
        return v6;
      goto LABEL_12;
    }
  }
  label_ptr = dispatch_queue_get_label_ptr(a1);
  if (label_ptr)
    v9 = (char *)label_ptr;
  else
    v9 = (char *)&unk_66B2;
  v6 = add_queue_info_to_list(a1, v5, v9, 0);
  if (a2)
LABEL_12:
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  return v6;
}

BOOL __find_or_create_queue_info_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32) == *(_QWORD *)(a1 + 32);
}

BOOL __gcd_queue_item_dequeue_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

void collapse_enqueuing_recursion(uint64_t a1)
{
  uint64_t v1;
  int v3;
  int i;
  const char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  char __str[128];

  *(_BYTE *)(a1 + 89) = 0;
  v1 = *(_QWORD *)(a1 + 128);
  if (v1)
  {
    v3 = 0;
    for (i = 1; ; ++i)
    {
      if (*(_DWORD *)(v1 + 16) != 3 && !*(_BYTE *)(v1 + 90))
      {
        *(_BYTE *)(a1 + 89) = 1;
        return;
      }
      v3 += *(_DWORD *)(v1 + 140) + *(_DWORD *)(v1 + 136) + 1;
      if (i == 1)
      {
        if (*(_BYTE *)(v1 + 90))
          break;
      }
      if (*(_QWORD *)(a1 + 56) == *(_QWORD *)(v1 + 56) && *(_QWORD *)(a1 + 96) == *(_QWORD *)(v1 + 96))
        break;
      v1 = *(_QWORD *)(v1 + 128);
      if (!v1)
        return;
    }
    os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000);
    if (debug_recursion)
    {
      fputc(10, __stderrp);
      if (*(_BYTE *)(v1 + 90))
        v5 = "INTERNAL ITEM";
      else
        v5 = (const char *)&unk_66B2;
      snprintf(__str, 0x80uLL, "RECURSION COLLAPSING -- WILL REPARENT %u LEVELS  %s\n", i, v5);
      print_logical_backtrace(__str);
    }
    if (i == 1 && !*(_BYTE *)(v1 + 90))
    {
      v6 = *(_DWORD *)(v1 + 136) + 1;
      v3 -= v6;
      *(_DWORD *)(a1 + 136) += v6;
    }
    *(_DWORD *)(a1 + 140) += v3;
    v7 = *(_QWORD *)(a1 + 128);
    v8 = *(_QWORD *)(v1 + 128);
    *(_QWORD *)(a1 + 128) = v8;
    if (v8)
    {
      v9 = (unsigned int *)(v8 + 20);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }
    decrement_work_item_refcount(v7);
    if (debug_recursion)
    {
      *(_BYTE *)(a1 + 88) = 0;
      snprintf(__str, 0x80uLL, "RECURSION COLLAPSING -- DID REPARENT %u LEVELS\n", i);
      print_logical_backtrace(__str);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
  }
}

void decrement_work_item_refcount(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  int v3;
  BOOL v4;
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t v8;

  if (a1)
  {
    v1 = a1;
    do
    {
      if (!decrement_entry_refcount((uint64_t)&work_item_lists, (uint64_t *)v1))
        break;
      remove_stack_from_backtrace_uniquing_table(backtrace_uniquing_table, *(_QWORD *)(v1 + 96));
      os_unfair_lock_lock_with_options(&dword_C020, 0x10000);
      v2 = *(uint64_t **)(v1 + 104);
      v3 = decrement_entry_refcount((uint64_t)&thread_lists, v2);
      if (debug_trace_threads)
        v4 = v3 == 0;
      else
        v4 = 1;
      if (!v4)
        print_thread_summary((uint64_t)v2, "thread became unreferenced, moved to free list: ", (const char *)&unk_66B2);
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
      os_unfair_lock_lock_with_options(&dword_C088, 0x10000);
      v5 = *(uint64_t **)(v1 + 112);
      if (v5)
      {
        v6 = decrement_entry_refcount((uint64_t)&queue_lists, v5);
        if (debug_trace_queues)
        {
          if (v6)
            print_queue_summary(*(_QWORD *)(v1 + 112), "queue became unreferenced, moved to free list: ", (const char *)&unk_66B2);
        }
      }
      v7 = decrement_entry_refcount((uint64_t)&queue_lists, *(uint64_t **)(v1 + 120));
      if (debug_trace_queues)
      {
        if (v7)
          print_queue_summary(*(_QWORD *)(v1 + 120), "queue became unreferenced, moved to free list: ", (const char *)&unk_66B2);
      }
      v8 = *(_QWORD *)(v1 + 128);
      *(_QWORD *)(v1 + 128) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
      v1 = v8;
    }
    while (v8);
  }
}

void __thread_terminating_block_invoke(id a1, generic_introspection_info_s *a2)
{
  print_thread_summary((uint64_t)a2, "    ", (const char *)&unk_66B2);
}

char *resetDyldInsertLibraries(const char *a1)
{
  char *result;
  const char *v3;
  char *v4;
  size_t v5;
  int v6;
  char *v7;
  size_t v8;
  int i;
  size_t v10;
  const char *v11;
  BOOL v12;
  _BOOL8 v13;
  const char *v14;
  char *v15;
  const char *v16;
  uint64_t v17;

  result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    v3 = result;
    strlen(result);
    v4 = (char *)&v17 - ((__chkstk_darwin() + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v4, v5);
    v6 = *(unsigned __int8 *)v3;
    if (!*v3)
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    v7 = v4;
    do
    {
      v8 = 0;
      for (i = v6; i; i = v3[++v8])
      {
        if (i == 58)
          break;
      }
      if (v8)
      {
        v10 = v8;
        while (v3[v10] != 47)
        {
          if (!--v10)
            goto LABEL_11;
        }
        v11 = &v3[v10];
        v6 = 47;
      }
      else
      {
LABEL_11:
        v11 = v3;
      }
      v12 = v6 == 47;
      v13 = v6 == 47;
      if (v12)
        v14 = v11 + 1;
      else
        v14 = v11;
      if (&v3[v8] != v14 && strncmp(v14, a1, v3 - v11 - v13 + v8))
      {
        v15 = v4;
        if (v7 != v4)
        {
          *v7 = 58;
          v15 = v7 + 1;
        }
        v7 = stpncpy(v15, v3, v8);
        i = v3[v8];
      }
      if (i == 58)
        v16 = v3 + 1;
      else
        v16 = v3;
      v3 = &v16[v8];
      v6 = v16[v8];
    }
    while (v6);
    if (v7 > v4)
    {
      *v7 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v4, 1);
    }
    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }
  return result;
}

uint64_t print_thread_summary(uint64_t a1, const char *a2, const char *a3)
{
  int v6;
  unsigned int v7;
  FILE *v8;
  pid_t v9;
  const char *v10;
  const char *v11;
  char __str[256];

  __str[0] = 0;
  v6 = atomic_load((unsigned int *)(a1 + 20));
  if (v6 >= 1)
  {
    v7 = atomic_load((unsigned int *)(a1 + 20));
    snprintf(__str, 0x100uLL, " refcount %d", v7);
  }
  v8 = __stderrp;
  v9 = getpid();
  v10 = (const char *)&unk_66B2;
  if (a2)
    v11 = a2;
  else
    v11 = (const char *)&unk_66B2;
  if (a3)
    v10 = a3;
  return fprintf(v8, "pid %d %sthread %p thread_id %llu;  thread_info %p  %s%s%s\n",
           v9,
           v11,
           *(const void **)(a1 + 32),
           *(_QWORD *)(a1 + 24),
           (const void *)a1,
           (const char *)(a1 + 40),
           __str,
           v10);
}

uint64_t print_queue_summary(uint64_t a1, const char *a2, const char *a3)
{
  int v6;
  unsigned int v7;
  const char *v8;
  const char *v9;
  char __str[256];

  __str[0] = 0;
  v6 = atomic_load((unsigned int *)(a1 + 20));
  if (v6 >= 1)
  {
    v7 = atomic_load((unsigned int *)(a1 + 20));
    snprintf(__str, 0x100uLL, " refcount %d", v7);
  }
  v8 = (const char *)&unk_66B2;
  if (a2)
    v9 = a2;
  else
    v9 = (const char *)&unk_66B2;
  if (a3)
    v8 = a3;
  return fprintf(__stderrp, "%squeue_info %p  queue %p serialnum %llu %s%s%s\n", v9, (const void *)a1, *(const void **)(a1 + 24), *(_QWORD *)(a1 + 32), (const char *)(a1 + 52), __str, v8);
}

uint64_t print_logical_backtrace(const char *a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  char *v11;
  unsigned int v12;
  uint64_t v13;
  float v14;
  size_t v15;
  unsigned int v16;
  FILE **v17;
  char *v18;
  unsigned int v19;
  _opaque_pthread_t *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  pthread_t v25;
  unsigned int v26;
  int v27;
  FILE **v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const void *v32;
  int v33;
  const char *dli_sname;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  const void *v38;
  const char *v39;
  const void *v40;
  const char *v41;
  unsigned int v42;
  Dl_info v43;
  char __str[64];
  char v45[64];

  result = active_work_item();
  if (!result)
    return result;
  v3 = result;
  if ((unint64_t)(*(_QWORD *)(result + 24) - 17) > 1
    || (showAll & 1) == 0 && *(_QWORD *)(result + 40) == libdispatchManagerQueue)
  {
    return result;
  }
  if (*(_BYTE *)(result + 88))
    return result;
  v4 = &__introspection_dispatch_queue_info_version;
  pthread_setspecific(allow_malloc_logging_key, 0);
  v5 = backtrace_contains_function("_os_trace", (void *)print_logical_backtrace_address_of_os_trace_function);
  if (v5)
  {
    print_logical_backtrace_address_of_os_trace_function = (uint64_t)v5;
    return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
  }
  LODWORD(v6) = 0;
  v7 = 0;
  *(_BYTE *)(v3 + 88) = 1;
  v8 = v3;
  do
  {
    v8 = *(_QWORD *)(v8 + 128);
    ++v7;
    v6 = (v6 + 0x8000);
  }
  while (v8);
  do
    v9 = __ldxr((unsigned int *)&print_logical_backtrace_logical_backtrace_count);
  while (__stxr(v9 + 1, (unsigned int *)&print_logical_backtrace_logical_backtrace_count));
  do
    v10 = __ldxr(&print_logical_backtrace_total_enqueuing_levels);
  while (__stxr(v7 + v10, &print_logical_backtrace_total_enqueuing_levels));
  v11 = (char *)malloc_type_malloc(v6, 0xF06D5922uLL);
  v12 = atomic_load((unsigned int *)&print_logical_backtrace_logical_backtrace_count);
  v13 = atomic_load(&print_logical_backtrace_total_enqueuing_levels);
  v14 = (float)v13;
  v15 = v6 - 1;
  LODWORD(v13) = atomic_load((unsigned int *)&print_logical_backtrace_logical_backtrace_count);
  v16 = snprintf(v11, v15, "logical backtrace %d  depth %d  average depth %.1f\n", v12, v7, (float)(v14 / (float)(int)v13));
  v17 = &__stderrp;
  if ((v16 & 0x80000000) != 0 || v15 <= v16)
  {
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v16);
    v18 = v11;
  }
  else
  {
    v18 = &v11[v16];
    v15 -= v16;
  }
  if ((int)v7 - 1 >= print_logical_backtrace_max_levels)
  {
    print_logical_backtrace_max_levels = v7;
    v19 = snprintf(v18, v15, "NEW MAX ENQUEUING LEVEL: %d\n", v7);
    if ((v19 & 0x80000000) != 0 || v15 <= v19)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v19);
    }
    else
    {
      v18 += v19;
      v15 -= v19;
    }
  }
  v45[0] = 0;
  v20 = pthread_self();
  pthread_getname_np(v20, v45, 0x40uLL);
  v21 = (const char *)dispatch_queue_label();
  if (v21)
    v22 = v21;
  else
    v22 = (const char *)&unk_66B2;
  v23 = *(_QWORD *)(v3 + 24);
  if (v23 <= 65)
  {
    if (v23 == 17)
    {
      v24 = "block";
      goto LABEL_37;
    }
    if (v23 == 18)
    {
      v24 = "function";
      goto LABEL_37;
    }
  }
  else
  {
    switch(v23)
    {
      case 66:
        v24 = "source";
        goto LABEL_37;
      case 256:
        v24 = "object";
        goto LABEL_37;
      case 257:
        v24 = "queue";
        goto LABEL_37;
    }
  }
  v24 = "unknown-type";
LABEL_37:
  v25 = pthread_self();
  v26 = snprintf(v18, v15, "%s  %s on pthread %p %s  queue %p %s\n", a1, v24, v25, v45, *(const void **)(v3 + 40), v22);
  if ((v26 & 0x80000000) != 0
    || v15 <= v26
    || (v18 += v26, v15 -= v26, v26 = get_and_print_backtrace(v18, v15, 3, 1), (v26 & 0x80000000) != 0)
    || v15 <= v26)
  {
LABEL_70:
    fprintf(*v17, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v26);
  }
  else
  {
    v18 += v26;
    v15 -= v26;
    v27 = 1;
    while (1)
    {
      v28 = v17;
      __str[0] = 0;
      snprintf(__str, 0x40uLL, "  (LEVEL %d)", v27);
      v29 = (const char *)&unk_66B2;
      if (v27 == 1)
        v30 = (const char *)&unk_66B2;
      else
        v30 = "----\n";
      v31 = *(int *)(v3 + 16);
      if (v31 <= 3)
        v29 = off_8478[v31];
      v32 = *(const void **)(v3 + 56);
      memset(&v43, 0, sizeof(v43));
      v33 = dladdr(v32, &v43);
      dli_sname = v43.dli_sname;
      if (!v33)
        dli_sname = 0;
      if (!dli_sname)
        dli_sname = (const char *)&unk_66B2;
      v35 = atomic_load((unsigned int *)(v3 + 20));
      v37 = *(_QWORD *)(v3 + 112);
      v36 = *(_QWORD *)(v3 + 120);
      v38 = *(const void **)(v36 + 24);
      v39 = (const char *)(v36 + 52);
      LODWORD(v36) = atomic_load((unsigned int *)(v36 + 20));
      v40 = *(const void **)(v37 + 24);
      v41 = (const char *)(v37 + 52);
      LODWORD(v37) = atomic_load((unsigned int *)(v37 + 20));
      v42 = snprintf(v18, v15, "%sITEM_INFO %p %s block/function %p %s refcount %d  %s\n    TARGET QUEUE %p %s refcount %d\n      FROM QUEUE %p %s refcount %d\n", v30, (const void *)v3, v29, v32, dli_sname, v35, __str, v38, v39, v36, v40, v41, v37);
      if ((v42 & 0x80000000) != 0 || v15 <= v42)
        break;
      v18 += v42;
      v15 -= v42;
      v17 = v28;
      if (*(_DWORD *)(v3 + 136))
      {
        v26 = snprintf(v18, v15, "    repeated_enqueuings_count: %u\n", *(_DWORD *)(v3 + 136));
        v4 = (_QWORD *)&__introspection_dispatch_queue_info_version;
        if ((v26 & 0x80000000) != 0 || v15 <= v26)
          goto LABEL_70;
        v18 += v26;
        v15 -= v26;
      }
      else
      {
        v4 = (_QWORD *)&__introspection_dispatch_queue_info_version;
      }
      if (*(_DWORD *)(v3 + 140))
      {
        v26 = snprintf(v18, v15, "    elided_enqueuings_count: %u\n", *(_DWORD *)(v3 + 140));
        if ((v26 & 0x80000000) != 0 || v15 <= v26)
          goto LABEL_70;
        v18 += v26;
        v15 -= v26;
      }
      if (showAll == 1)
      {
        v26 = print_queue_item(v18, v15, v3 + 24, (const char *)(*(_QWORD *)(v3 + 120) + 52));
        if ((v26 & 0x80000000) != 0 || v15 <= v26)
          goto LABEL_70;
        v18 += v26;
        v15 -= v26;
      }
      v26 = print_item_backtrace(v18, v15, v3);
      if ((v26 & 0x80000000) != 0 || v15 <= v26)
        goto LABEL_70;
      v18 += v26;
      v15 -= v26;
      v3 = *(_QWORD *)(v3 + 128);
      ++v27;
      if (!v3)
        goto LABEL_71;
    }
    v17 = v28;
    fprintf(*v28, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v42);
    v4 = (_QWORD *)&__introspection_dispatch_queue_info_version;
  }
LABEL_71:
  snprintf(v18, v15 + 1, "\n");
  fputs(v11, *v17);
  free(v11);
  return pthread_setspecific(v4[71], (char *)&dword_0 + 1);
}

void *backtrace_contains_function(const char *a1, void *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  void **i;
  char **v8;
  char **v9;
  uint64_t v10;
  void **v11;
  char __str[1024];
  void *v14[2];
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  *(_OWORD *)v14 = 0u;
  v4 = backtrace(v14, 512);
  v5 = v4;
  if (a2)
  {
    if (v4 >= 1)
    {
      v6 = v4;
      for (i = v14; *i != a2; ++i)
      {
        if (!--v6)
          return 0;
      }
      return a2;
    }
    return 0;
  }
  snprintf(__str, 0x400uLL, " %s + ", a1);
  v8 = backtrace_symbols(v14, v5);
  if (v5 < 1)
    return 0;
  v9 = v8;
  v10 = v5;
  v11 = v14;
  while (!strstr(*v9, __str))
  {
    ++v11;
    ++v9;
    if (!--v10)
      return 0;
  }
  return *v11;
}

uint64_t get_and_print_backtrace(char *a1, size_t a2, int a3, char a4)
{
  int v8;
  void *v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)v10 = 0u;
  v11 = 0u;
  v8 = backtrace(v10, 512);
  if (v8 <= a3)
    return snprintf(a1, a2, "NO BACKTRACE (%d frames after skipping %d)\n", v8 - a3, a3);
  else
    return print_backtrace(a1, a2, &v10[a3], v8 - a3, a4);
}

uint64_t print_queue_item(char *__str, size_t __size, uint64_t a3, const char *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  size_t v20;
  unsigned int v21;
  const void *v22;
  uint64_t v23;
  const char *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  int v28;
  const char *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  int v33;
  const char *dli_sname;
  const void *v35;
  const char *v36;
  int v37;
  const char *v38;
  uint64_t v39;
  char *v40;
  size_t v41;
  unsigned int v42;
  FILE *v44;
  const void *v45;
  uint64_t v46;
  const void *v47;
  int v48;
  const char *v49;
  uint64_t v50;
  char *v51;
  size_t v52;
  unsigned int v53;
  char *v54;
  size_t v55;
  unsigned int v56;
  size_t v57;
  char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  unsigned int v62;
  const void *v63;
  Dl_info v64;

  v8 = *(_QWORD *)a3;
  if (*(uint64_t *)a3 <= 65)
  {
    if (v8 == 17)
    {
      v30 = *(const void **)(a3 + 8);
      v31 = *(const void **)(a3 + 16);
      v32 = *(const void **)(a3 + 24);
      memset(&v64, 0, sizeof(v64));
      v33 = dladdr(v32, &v64);
      dli_sname = v64.dli_sname;
      if (!v33)
        dli_sname = 0;
      v35 = *(const void **)(a3 + 32);
      if (dli_sname)
        v36 = dli_sname;
      else
        v36 = (const char *)&unk_66B2;
      memset(&v64, 0, sizeof(v64));
      v37 = dladdr(v35, &v64);
      v38 = v64.dli_sname;
      if (!v37)
        v38 = 0;
      if (!v38)
        v38 = (const char *)&unk_66B2;
      v39 = snprintf(__str, __size, "    BLOCK continuation %p\n    target_queue %p %s\n    block %p %s\n    block_invoke %p %s\n", v30, v31, a4, v32, v36, v35, v38);
      v10 = v39;
      if ((v39 & 0x80000000) != 0 || __size <= v39)
      {
        v44 = __stderrp;
LABEL_54:
        fprintf(v44, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n");
        return v10;
      }
      v40 = &__str[v39];
      v41 = __size - v39;
      if (*(_QWORD *)(a3 + 40))
      {
        v42 = snprintf(v40, v41, "    group %p\n", *(const void **)(a3 + 40));
        v10 = v42 + v10;
        if ((v42 & 0x80000000) != 0)
          goto LABEL_90;
      }
      else
      {
        v42 = 0;
      }
      if (v41 > v42)
      {
        v54 = &v40[v42];
        v55 = v41 - v42;
        if (*(_QWORD *)(a3 + 48))
        {
          v56 = snprintf(v54, v55, "    waiter %p\n", *(const void **)(a3 + 48));
          v10 = v56 + v10;
          if ((v56 & 0x80000000) != 0)
            goto LABEL_90;
        }
        else
        {
          v56 = 0;
        }
        if (v55 > v56)
        {
          v57 = v55 - v56;
          if ((*(_BYTE *)(a3 + 56) & 7) != 0)
          {
            v58 = &v54[v56];
            v59 = "BARRIER   ";
            if ((*(_BYTE *)(a3 + 56) & 1) == 0)
              v59 = (const char *)&unk_66B2;
            v60 = "SYNC   ";
            if ((*(_BYTE *)(a3 + 56) & 2) == 0)
              v60 = (const char *)&unk_66B2;
            if ((*(_BYTE *)(a3 + 56) & 4) != 0)
              v61 = "APPLY   ";
            else
              v61 = (const char *)&unk_66B2;
LABEL_86:
            v62 = snprintf(v58, v57, "    %s%s%s\n", v59, v60, v61);
            v10 = v62 + v10;
            if ((v62 & 0x80000000) != 0)
              goto LABEL_90;
            goto LABEL_89;
          }
LABEL_88:
          v62 = 0;
LABEL_89:
          if (v57 > v62)
            return v10;
        }
      }
    }
    else
    {
      if (v8 != 18)
        return snprintf(__str, __size, "    unknown dispatch introspection item!!!\n");
      v12 = *(const void **)(a3 + 8);
      v13 = *(const void **)(a3 + 16);
      v15 = *(const void **)(a3 + 24);
      v14 = *(const void **)(a3 + 32);
      memset(&v64, 0, sizeof(v64));
      v16 = dladdr(v14, &v64);
      v17 = v64.dli_sname;
      if (!v16)
        v17 = 0;
      if (!v17)
        v17 = (const char *)&unk_66B2;
      v18 = snprintf(__str, __size, "    FUNCTION continuation %p\n    target_queue %p %s\n    context %p\n    function %p %s\n", v12, v13, a4, v15, v14, v17);
      v10 = v18;
      if ((v18 & 0x80000000) != 0 || __size <= v18)
        goto LABEL_53;
      v19 = &__str[v18];
      v20 = __size - v18;
      if (*(_QWORD *)(a3 + 40))
      {
        v21 = snprintf(v19, v20, "    group %p\n", *(const void **)(a3 + 40));
        v10 = v21 + v10;
        if ((v21 & 0x80000000) != 0)
          goto LABEL_90;
      }
      else
      {
        v21 = 0;
      }
      if (v20 > v21)
      {
        v51 = &v19[v21];
        v52 = v20 - v21;
        if (*(_QWORD *)(a3 + 48))
        {
          v53 = snprintf(v51, v52, "    waiter %p\n", *(const void **)(a3 + 48));
          v10 = v53 + v10;
          if ((v53 & 0x80000000) != 0)
            goto LABEL_90;
        }
        else
        {
          v53 = 0;
        }
        if (v52 > v53)
        {
          v57 = v52 - v53;
          if ((*(_BYTE *)(a3 + 56) & 7) != 0)
          {
            v58 = &v51[v53];
            v59 = "BARRIER   ";
            if ((*(_BYTE *)(a3 + 56) & 1) == 0)
              v59 = (const char *)&unk_66B2;
            v60 = "SYNC   ";
            if ((*(_BYTE *)(a3 + 56) & 2) == 0)
              v60 = (const char *)&unk_66B2;
            if ((*(_BYTE *)(a3 + 56) & 4) != 0)
              v61 = "APPLY   ";
            else
              v61 = (const char *)&unk_66B2;
            goto LABEL_86;
          }
          goto LABEL_88;
        }
      }
    }
LABEL_90:
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n");
    return v10;
  }
  if (v8 != 66)
  {
    if (v8 == 256)
    {
      v25 = *(const void **)(a3 + 8);
      v26 = *(const void **)(a3 + 16);
      v27 = *(const void **)(a3 + 24);
      memset(&v64, 0, sizeof(v64));
      v28 = dladdr(v27, &v64);
      v29 = v64.dli_sname;
      if (!v28)
        v29 = 0;
      if (!v29)
        v29 = (const char *)&unk_66B2;
      return snprintf(__str, __size, "    OBJECT %p\n    target_queue %p %s\n    type %p %s\n    kind %s\n", v25, v26, a4, v27, v29, *(const char **)(a3 + 32));
    }
    if (v8 == 257)
    {
      v9 = snprintf(__str, __size, "    QUEUE %p %s\n    target_queue %p %s\n    serialnum %lu\n    width %u\n    suspend_count %u\n", *(const void **)(a3 + 8), (const char *)&unk_66B2, *(const void **)(a3 + 16), a4, *(_QWORD *)(a3 + 32), *(_DWORD *)(a3 + 40), *(_DWORD *)(a3 + 44));
      v10 = v9;
      if ((v9 & 0x80000000) == 0 && __size > v9)
      {
        if ((*(_BYTE *)(a3 + 48) & 0x1F) != 0)
        {
          v11 = snprintf(&__str[v9], __size - v9, "    %s%s%s%s%s\n");
          return (v11 + v10);
        }
        return v10;
      }
      goto LABEL_53;
    }
    return snprintf(__str, __size, "    unknown dispatch introspection item!!!\n");
  }
  v22 = *(const void **)(a3 + 8);
  v23 = *(_QWORD *)(a3 + 24);
  v63 = *(const void **)(a3 + 16);
  if ((unint64_t)(v23 + 22) > 0x28)
    v24 = "unknown type";
  else
    v24 = off_8310[v23 + 22];
  v46 = *(_QWORD *)(a3 + 32);
  v45 = *(const void **)(a3 + 40);
  v47 = *(const void **)(a3 + 48);
  memset(&v64, 0, sizeof(v64));
  v48 = dladdr(v47, &v64);
  v49 = v64.dli_sname;
  if (!v48)
    v49 = 0;
  if (!v49)
    v49 = (const char *)&unk_66B2;
  v50 = snprintf(__str, __size, "    SOURCE %p\n    target_queue %p %s\n    type (kevent filter) %ld  %s\n    handle %lu\n    context %p\n    handler %p %s\n    suspend_count %u\n", v22, v63, a4, v23, v24, v46, v45, v47, v49, *(_DWORD *)(a3 + 56));
  v10 = v50;
  if ((v50 & 0x80000000) != 0 || __size <= v50)
  {
LABEL_53:
    v44 = __stderrp;
    goto LABEL_54;
  }
  if ((*(_BYTE *)(a3 + 60) & 0xF) != 0)
  {
    v11 = snprintf(&__str[v50], __size - v50, "    %s%s%s%s\n");
    return (v11 + v10);
  }
  return v10;
}

uint64_t print_item_backtrace(char *a1, size_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  int v7;
  _OWORD v9[256];

  memset(v9, 0, 512);
  v5 = *(_DWORD *)(a3 + 92);
  if (v5 >= 0x200)
    v6 = 512;
  else
    v6 = v5;
  v7 = ptrSized_stack_frames_for_uniqued_stack(backtrace_uniquing_table, *(_QWORD *)(a3 + 96), v9, v6);
  return print_backtrace(a1, a2, (void **)v9, v7, 1);
}

uint64_t print_queue_item_and_current_backtrace(char *__str, size_t __size, uint64_t a3, const char *a4, int a5, char a6)
{
  uint64_t v11;
  uint64_t v12;

  if (!a4)
    a4 = (const char *)dispatch_queue_label();
  v11 = print_queue_item(__str, __size, a3, a4);
  v12 = v11;
  if ((v11 & 0x80000000) == 0 && __size > v11)
    return get_and_print_backtrace(&__str[v11], __size - v11, a5, a6)
         + v11;
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", __size, v11);
  return v12;
}

uint64_t print_gcd_queue_create_dispose(uint64_t result, uint64_t a2)
{
  const char *v3;
  const char *v4;
  const void *v5;
  pthread_t v6;
  unsigned int v7;
  char *v8;
  size_t v9;
  unsigned int v10;
  char __str[16384];

  if (showLogicalBacktraces == 1)
  {
    v3 = (const char *)result;
    if (*(_QWORD *)(a2 + 16))
      v4 = *(const char **)(a2 + 16);
    else
      v4 = (const char *)&unk_66B2;
    if ((showAll & 1) != 0)
    {
      pthread_setspecific(allow_malloc_logging_key, 0);
      v5 = *(const void **)a2;
      v6 = pthread_self();
      v7 = snprintf(__str, 0x3FFFuLL, "%s queue %p %s  (on pthread %p)\n", v3, v5, v4, v6);
      if (v7 >= 0x3FFF)
      {
        v9 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v7);
        v8 = __str;
      }
      else
      {
        v8 = &__str[v7];
        v9 = 0x3FFFLL - v7;
        v10 = get_and_print_backtrace(v8, v9, 3, 0);
        if ((v10 & 0x80000000) != 0 || v9 <= v10)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v9, v10);
        }
        else
        {
          v8 += v10;
          v9 -= v10;
        }
      }
      snprintf(v8, v9 + 1, "\n");
      fputs(__str, __stderrp);
      return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }
    else
    {
      result = active_work_item();
      if (result)
      {
        snprintf(__str, 0x4000uLL, "%s queue %p %s", v3, *(const void **)a2, v4);
        return print_logical_backtrace(__str);
      }
    }
  }
  return result;
}

const char *print_gcd_queue_item_enqueue_dequeue(const char *result, const void *a2, uint64_t *a3, int a4, int a5)
{
  const char *v9;
  char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  pthread_t v17;
  unsigned int v18;
  char *v19;
  size_t v20;
  uint64_t active;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;

  v9 = result;
  if ((showAll & 1) == 0 && (!showEnqueueDequeue || a4 == 0))
    return result;
  pthread_setspecific(allow_malloc_logging_key, 0);
  v11 = (char *)malloc_type_malloc(0x20000uLL, 0x2732A774uLL);
  v12 = "IGNORING ";
  if (a5)
    v12 = "IGNORING BECAUSE ALREADY HAPPENED ";
  if (a4)
    v13 = (const char *)&unk_66B2;
  else
    v13 = v12;
  v14 = *a3;
  if (*a3 <= 65)
  {
    if (v14 == 17)
    {
      v15 = "block";
      goto LABEL_25;
    }
    if (v14 == 18)
    {
      v15 = "function";
      goto LABEL_25;
    }
LABEL_24:
    v15 = "unknown-type";
    goto LABEL_25;
  }
  if (v14 == 66)
  {
    v15 = "source";
    goto LABEL_25;
  }
  if (v14 == 256)
  {
    v15 = "object";
    goto LABEL_25;
  }
  if (v14 != 257)
    goto LABEL_24;
  v15 = "queue";
LABEL_25:
  v16 = (const char *)dispatch_queue_label();
  v17 = pthread_self();
  v18 = snprintf(v11, 0x1FFFFuLL, "%s%s %s %p on queue %p %s  (on pthread %p)\n", v13, v9, v15, a3, a2, v16, v17);
  if (v18 >= 0x1FFFF)
  {
    v20 = 0x1FFFFLL;
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x1FFFFuLL, v18);
    v19 = v11;
  }
  else
  {
    v19 = &v11[v18];
    v20 = 0x1FFFFLL - v18;
    active = active_work_item();
    if (active)
    {
      v22 = active;
      if (*(_QWORD *)(active + 32) != a3[1]
        && ((showAll & 1) != 0 || *(_QWORD *)(active + 40) != libdispatchManagerQueue))
      {
        v23 = snprintf(v19, v20, "EVENT OCCURRED WHILE AN ASYNC OPERATION IS EXECUTING;  DETAILS OF THAT OPERATION:\n");
        if ((v23 & 0x80000000) != 0
          || v20 <= v23
          || (v19 += v23,
              v20 -= v23,
              v23 = print_queue_item(v19, v20, v22 + 24, (const char *)(*(_QWORD *)(v22 + 120) + 52)),
              (v23 & 0x80000000) != 0)
          || v20 <= v23
          || (v19 += v23, v20 -= v23, v23 = snprintf(v19, v20, "DETAILS FOR NEW EVENT:\n"), (v23 & 0x80000000) != 0)
          || v20 <= v23)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v20, v23);
        }
        else
        {
          v19 += v23;
          v20 -= v23;
        }
      }
    }
    v24 = print_queue_item_and_current_backtrace(v19, v20, (uint64_t)a3, 0, 4, 0);
    if ((v24 & 0x80000000) != 0 || v20 <= v24)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v20, v24);
    }
    else
    {
      v19 += v24;
      v20 -= v24;
    }
  }
  snprintf(v19, v20 + 1, "\n");
  fputs(v11, __stderrp);
  free(v11);
  return (const char *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
}

uint64_t print_gcd_item_conflict(_QWORD *a1, _QWORD *a2)
{
  _opaque_pthread_t *v4;
  pthread_t v5;
  unsigned int v6;
  char *v7;
  size_t v8;
  unsigned int v9;
  char v11[64];
  char __str[32768];

  v11[0] = 0;
  v4 = pthread_self();
  pthread_getname_np(v4, v11, 0x40uLL);
  v5 = pthread_self();
  v6 = snprintf(__str, 0x7FFFuLL, "LOGICAL ERROR! new work item %p conflicts with currently-running %p on pthread %p %s\n", a1, a2, v5, v11);
  if (v6 >= 0x7FFF)
  {
    v8 = 0x7FFFLL;
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x7FFFuLL, v6);
    v7 = __str;
  }
  else
  {
    v7 = &__str[v6];
    v8 = 0x7FFFLL - v6;
    v9 = snprintf(v7, v8, "NEW WORK ITEM %p:\n", a1);
    if ((v9 & 0x80000000) != 0)
      goto LABEL_16;
    if (v8 <= v9)
      goto LABEL_16;
    v7 += v9;
    v8 -= v9;
    v9 = print_queue_item(v7, v8, (uint64_t)(a1 + 3), (const char *)(a1[15] + 52));
    if ((v9 & 0x80000000) != 0)
      goto LABEL_16;
    if (v8 <= v9)
      goto LABEL_16;
    v7 += v9;
    v8 -= v9;
    v9 = print_item_backtrace(v7, v8, (uint64_t)a1);
    if ((v9 & 0x80000000) != 0)
      goto LABEL_16;
    if (v8 <= v9)
      goto LABEL_16;
    v7 += v9;
    v8 -= v9;
    v9 = snprintf(v7, v8, "PREVIOUS (CURRENTLY RUNNING) ITEM %p:\n", a2);
    if ((v9 & 0x80000000) != 0
      || v8 <= v9
      || (v7 += v9,
          v8 -= v9,
          v9 = print_queue_item(v7, v8, (uint64_t)(a2 + 3), (const char *)(a2[15] + 52)),
          (v9 & 0x80000000) != 0)
      || v8 <= v9
      || (v7 += v9, v8 -= v9, v9 = print_item_backtrace(v7, v8, (uint64_t)a2), (v9 & 0x80000000) != 0)
      || v8 <= v9)
    {
LABEL_16:
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v8, v9);
    }
    else
    {
      v7 += v9;
      v8 -= v9;
    }
  }
  snprintf(v7, v8 + 1, "\n");
  return fputs(__str, __stderrp);
}

uint64_t print_gcd_queue_item_complete(const void *a1, uint64_t a2)
{
  const void *v4;
  uint64_t v5;
  const char *v6;
  pthread_t v7;
  unsigned int v8;
  int v9;
  char *v10;
  size_t v11;
  unsigned int v12;
  const void *v13;
  const void *v14;
  pthread_t v15;
  unsigned int v16;
  unsigned int v17;
  char __str[16384];

  pthread_setspecific(allow_malloc_logging_key, 0);
  if (showLogicalBacktraces == 1)
  {
    v4 = *(const void **)(a2 + 32);
    if (v4 != a1)
    {
      v5 = *(int *)(a2 + 16);
      if (v5 > 3)
        v6 = (const char *)&unk_66B2;
      else
        v6 = off_8478[v5];
      v13 = *(const void **)(a2 + 48);
      v14 = *(const void **)(a2 + 56);
      v15 = pthread_self();
      v16 = snprintf(__str, 0x3FFFuLL, "LOGICAL ERROR!! irrelevant(?) continuation %p complete;  item_info %p  state %s, continuation %p, context "
              "%p function %p  NO MATCH (on pthread %p)\n",
              a1,
              (const void *)a2,
              v6,
              v4,
              v13,
              v14,
              v15);
      v9 = v16;
      if (v16 >= 0x3FFF)
      {
        v11 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v16);
        v10 = __str;
      }
      else
      {
        v10 = &__str[v16];
        v11 = 0x3FFFLL - v16;
        v17 = print_queue_item_and_current_backtrace(v10, v11, a2 + 24, (const char *)(*(_QWORD *)(a2 + 120) + 52), 0, 0);
        v9 = v17;
        if ((v17 & 0x80000000) != 0 || v11 <= v17)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v11, v17);
        }
        else
        {
          v10 += v17;
          v11 -= v17;
        }
      }
      if (*(_DWORD *)(a2 + 16) != 2)
        goto LABEL_22;
      v12 = snprintf(v10, v11, "    marking item_info %p as complete\n", (const void *)a2);
      goto LABEL_18;
    }
  }
  if (!showEnqueueDequeue)
    return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
  v7 = pthread_self();
  v8 = snprintf(__str, 0x3FFFuLL, "queue item %p complete;  completed_continuation %p  MATCHED, SO CLEARING  (on pthread %p)\n",
         (const void *)a2,
         a1,
         v7);
  v9 = v8;
  if (v8 < 0x3FFF)
  {
    v10 = &__str[v8];
    v11 = 0x3FFFLL - v8;
    v12 = get_and_print_backtrace(v10, v11, 2, 0);
LABEL_18:
    v9 = v12;
    if ((v12 & 0x80000000) != 0 || v11 <= v12)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v11, v12);
    }
    else
    {
      v10 += v12;
      v11 -= v12;
    }
    goto LABEL_22;
  }
  v11 = 0x3FFFLL;
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v8);
  v10 = __str;
LABEL_22:
  if (v9 >= 1)
  {
    snprintf(v10, v11 + 1, "\n");
    fputs(__str, __stderrp);
  }
  return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
}

uint64_t print_pthread_event(uint64_t result, const void *a2, char *a3, uint64_t a4)
{
  int v7;
  unsigned int v8;
  const char *v9;
  const char *v10;
  pthread_t v11;
  unsigned int v12;
  char *v13;
  size_t v14;
  int v15;
  unsigned int v16;
  char __str[16384];

  if (showLogicalBacktraces == 1)
  {
    v7 = result;
    if ((showAll & 1) != 0)
    {
      pthread_setspecific(allow_malloc_logging_key, 0);
      v8 = v7 - 1;
      if (v8 > 3)
        v9 = "pthread unknown event";
      else
        v9 = off_8458[v8];
      v11 = pthread_self();
      v12 = snprintf(__str, 0x3FFFuLL, "%s: pthread %p, stack %p-%p[%zx]  (on pthread %p)\n", v9, a2, a3, &a3[a4], a4, v11);
      if (v12 >= 0x3FFF)
      {
        v14 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v12);
        v13 = __str;
      }
      else
      {
        v13 = &__str[v12];
        v14 = 0x3FFFLL - v12;
        if (v8 > 3)
          v15 = 0;
        else
          v15 = dword_65C0[v8];
        v16 = get_and_print_backtrace(&__str[v12], v14, v15, 0);
        if ((v16 & 0x80000000) != 0 || v14 <= v16)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v14, v16);
        }
        else
        {
          v13 += v16;
          v14 -= v16;
        }
      }
      snprintf(v13, v14 + 1, "\n");
      fputs(__str, __stderrp);
      return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }
    else
    {
      result = (uint64_t)pthread_self();
      if ((const void *)result != a2)
      {
        result = active_work_item();
        if (result)
        {
          if ((v7 - 1) > 3)
            v10 = "pthread unknown event";
          else
            v10 = off_8458[v7 - 1];
          snprintf(__str, 0x4000uLL, "%s: pthread %p, stack %p-%p[%zx]", v10, a2, a3, &a3[a4], a4);
          return print_logical_backtrace(__str);
        }
      }
    }
  }
  return result;
}

uint64_t print_list(const char *a1, _QWORD **a2, uint64_t a3)
{
  _QWORD *v5;
  int v6;
  int v7;

  if (a1)
    fprintf(__stderrp, "%s:\n", a1);
  v5 = *a2;
  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = v6 + 1;
      fprintf(__stderrp, "%4u  ", v6);
      (*(void (**)(uint64_t, _QWORD *))(a3 + 16))(a3, v5);
      v5 = (_QWORD *)*v5;
      v6 = v7;
    }
    while (v5);
  }
  return fputc(10, __stderrp);
}

void locked_print_dispatch_info()
{
  if (exerciseAPI == 1 && os_unfair_lock_trylock((os_unfair_lock_t)&dword_C020))
  {
    if (os_unfair_lock_trylock((os_unfair_lock_t)&dword_C088))
    {
      if (os_unfair_lock_trylock((os_unfair_lock_t)&dword_C0F0))
      {
        print_dispatch_info();
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
  }
}

const char *initialize_debug_printing()
{
  const char *result;
  const char *v1;

  result = getenv("BacktraceRecordingOptions");
  if (result)
  {
    v1 = result;
    if (strcasestr(result, "api"))
      exerciseAPI = 1;
    if (strcasestr(v1, "logical"))
      showLogicalBacktraces = 1;
    if (strcasestr(v1, "all"))
      showAll = 1;
    if (strcasestr(v1, "nocompress"))
      nocompress = 1;
    if (strcasestr(v1, "enqueue"))
      showEnqueueDequeue = 1;
    if (strcasestr(v1, "threads"))
      debug_trace_threads = 1;
    if (strcasestr(v1, "queues"))
      debug_trace_queues = 1;
    if (strcasestr(v1, "recursion"))
      debug_recursion = 1;
    if (strcasestr(v1, "maxlevels"))
      debug_maxlevels = 1;
    result = strcasestr(v1, "none");
    if (result)
      debug_printing = 0;
    if (showAll == 1)
      showEnqueueDequeue = 1;
  }
  if (showLogicalBacktraces == 1)
  {
    pthread_key_create((pthread_key_t *)&allow_malloc_logging_key, 0);
    result = (const char *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    previous_malloc_logger = (uint64_t (*)(_QWORD))malloc_logger;
    malloc_logger = my_malloc_logger;
  }
  return result;
}

void *my_malloc_logger(void *result)
{
  int v1;
  void *v2;
  int v3;
  int v4;
  char __str[128];

  v1 = (int)result;
  if (previous_malloc_logger)
    result = (void *)previous_malloc_logger(result);
  if (v1 == 10)
  {
    result = pthread_getspecific(allow_malloc_logging_key);
    if (result)
    {
      pthread_setspecific(allow_malloc_logging_key, 0);
      if ((my_malloc_logger_finished_setlocale & 1) != 0)
      {
LABEL_6:
        snprintf(__str, 0x80uLL, "malloc_logger event type %u", 10);
        print_logical_backtrace(__str);
        return (void *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
      }
      v2 = backtrace_contains_function("setlocale", (void *)my_malloc_logger_address_of_setlocale_function);
      if (!v2)
      {
        v3 = my_malloc_logger_malloc_count;
        v4 = ++my_malloc_logger_malloc_count;
        if (v3 >= 1000)
        {
          fprintf(__stderrp, "setting finished_setlocale, malloc_count %d\n", v4);
          my_malloc_logger_finished_setlocale = 1;
        }
        goto LABEL_6;
      }
      if ((my_malloc_logger_printed & 1) == 0)
        my_malloc_logger_printed = 1;
      my_malloc_logger_address_of_setlocale_function = (uint64_t)v2;
      return (void *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }
  }
  return result;
}

uint64_t print_backtrace(char *__str, size_t __size, void **a3, int a4, char a5)
{
  size_t v5;
  char *v6;
  char v7;
  int v8;
  char **v9;
  uint64_t v10;
  char v11;
  int v12;
  int v14;
  uint64_t v15;
  unsigned int v16;

  v5 = __size;
  v6 = __str;
  if (a4 <= 0)
    return snprintf(__str, __size, "NO BACKTRACE (%d frames)\n", a4);
  v7 = a5 & ~nocompress;
  if ((unint64_t)a3[a4 - 1] >= 0x1000)
    v8 = a4;
  else
    v8 = a4 - 1;
  v9 = backtrace_symbols(a3, v8);
  v10 = (v8 - 3);
  v11 = v7 ^ 1;
  if (v8 < 3)
    v11 = 1;
  if ((v11 & 1) != 0)
  {
LABEL_12:
    v12 = v8;
  }
  else
  {
    v12 = v8 - 2;
    while (strstr(v9[v10], " libdispatch.dylib "))
    {
      --v12;
      if (v10-- <= 0)
        goto LABEL_12;
    }
  }
  if (v8 < 1)
  {
    v15 = 0;
    goto LABEL_36;
  }
  v14 = 0;
  v15 = 0;
  while (1)
  {
    if ((v7 & 1) != 0)
    {
      if (strstr(v9[v14], " libdispatch.dylib "))
      {
        v7 = 1;
        goto LABEL_31;
      }
      if (v14 >= 1)
        break;
    }
LABEL_22:
    v16 = snprintf(v6, v5, "%s\n", v9[v14]);
    if ((v16 & 0x80000000) != 0 || v5 <= v16)
      goto LABEL_35;
    v6 += v16;
    v5 -= v16;
    v15 = v16 + v15;
    if (v14 == v12)
    {
      if (v12 >= v8 - 2)
      {
        v7 = 0;
        v14 = v12;
      }
      else
      {
        v16 = snprintf(v6, v5, "...");
        if ((v16 & 0x80000000) != 0 || v5 <= v16)
          goto LABEL_35;
        v7 = 0;
        v6 += v16;
        v5 -= v16;
        v15 = v16 + v15;
        v14 = v8 - 2;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_31:
    if (++v14 >= v8)
      goto LABEL_36;
  }
  v16 = snprintf(v6, v5, "%s\n", v9[v14 - 1]);
  if ((v16 & 0x80000000) == 0 && v5 > v16)
  {
    v6 += v16;
    v5 -= v16;
    v15 = v16 + v15;
    goto LABEL_22;
  }
LABEL_35:
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v5, v16);
LABEL_36:
  free(v9);
  return v15;
}

_DWORD *create_backtrace_uniquing_table(unsigned int a1, int a2)
{
  _DWORD *v4;
  _DWORD *v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  vm_size_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  mach_vm_address_t address;

  v4 = malloc_type_calloc(1uLL, 0x108uLL, 0x1080040AD5D41FBuLL);
  v5 = v4;
  if ((a2 & 2) != 0)
    v6 = 24;
  else
    v6 = 16;
  v4[10] = v6;
  if (a1)
  {
    if (a1 <= 0x400)
      v7 = 1024;
    else
      v7 = a1;
    v8 = (v6 * v7);
    v9 = vm_page_size;
    v10 = (((v8 + vm_page_size - 1) & -(uint64_t)vm_page_size) / vm_page_size);
  }
  else
  {
    v9 = vm_page_size;
    v10 = 512;
  }
  *((_QWORD *)v4 + 1) = v10;
  *((_QWORD *)v4 + 2) = (v9 * v10 / v6) & 0xFFFFFFFFFFFFFFELL;
  *((_QWORD *)v4 + 3) = v9 * v10;
  address = 0;
  if (mach_vm_allocate(mach_task_self_, &address, v9 * v10, 167772161))
    create_backtrace_uniquing_table_cold_1();
  *(_QWORD *)v5 = address;
  *((_QWORD *)v5 + 4) = 0;
  v5[14] = ((a2 & 6) == 0) | a2;
  v5[11] = 10;
  v11 = *((_QWORD *)v5 + 2);
  if (v11 >= 0x401)
  {
    v12 = 10;
    do
    {
      v11 >>= 2;
      v12 += 3;
    }
    while (v11 > 0x400);
    v5[11] = v12;
  }
  pthread_rwlock_init((pthread_rwlock_t *)(v5 + 16), 0);
  return v5;
}

uint64_t enter_stack_in_backtrace_uniquing_table(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4)
{
  pthread_rwlock_t *v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  int v12;
  uint64_t v13;
  vm_size_t v14;
  vm_size_t v15;
  unint64_t v16;
  pthread_rwlock_t *v17;
  mach_vm_address_t v18;
  mach_vm_size_t v19;
  mach_vm_address_t v20;
  int v21;
  uint64_t i;
  uint64_t v23;
  mach_vm_address_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  mach_vm_address_t address[512];

  v32 = 0;
  v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  v9 = _enter_frames_in_table_while_locked(a1, &v32, a3, a4);
  pthread_rwlock_unlock(v8);
  if (v9)
  {
    result = 1;
  }
  else
  {
    v30 = a3;
    v31 = a4;
    while (1)
    {
      v11 = 4 * *(_QWORD *)(a1 + 8);
      v12 = *(_DWORD *)(a1 + 44);
      pthread_rwlock_wrlock(v8);
      v13 = *(_QWORD *)(a1 + 16);
      v14 = vm_page_size * v11;
      v15 = vm_page_size * v11 / *(unsigned int *)(a1 + 40);
      v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
      if (HIDWORD(v15))
      {
        fprintf(__stderrp, "can't expand backtrace uniquing table from %llu nodes to %llu nodes (exceeds maximum %u)\n", v13, v16, -1);
        goto LABEL_32;
      }
      v17 = v8;
      v18 = *(_QWORD *)a1;
      v19 = *(_QWORD *)(a1 + 24);
      address[0] = 0;
      if (mach_vm_allocate(mach_task_self_, address, vm_page_size * v11, 167772161))
        create_backtrace_uniquing_table_cold_1();
      v20 = address[0];
      if (!address[0])
        break;
      *(_QWORD *)a1 = address[0];
      *(_QWORD *)(a1 + 8) = v11;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = v14;
      *(_QWORD *)(a1 + 32) = v13;
      *(_DWORD *)(a1 + 44) = v12 + 3;
      v21 = *(_DWORD *)(a1 + 56);
      if ((v21 & 1) != 0)
      {
        *(_QWORD *)(a1 + 48) = 0;
      }
      else if ((v21 & 4) != 0)
      {
        if (mach_vm_copy(mach_task_self_, v18, v19, v20))
          printf("(BacktraceUniquing) expandUniquingTable(): VMCopyFailed");
      }
      else if ((v21 & 2) != 0)
      {
        *(_QWORD *)(a1 + 48) = 0;
        if (v13)
        {
          for (i = 0; i != v13; ++i)
          {
            v23 = *(unsigned int *)(a1 + 40);
            v24 = v18 + i * v23;
            v25 = *(_QWORD *)(v24 + 16);
            if (v25)
            {
              v26 = *(_DWORD *)(v24 + 8);
              if (v26 == -1)
              {
                v28 = 0;
              }
              else
              {
                v27 = 0;
                do
                {
                  address[v27] = *(_QWORD *)v24;
                  v28 = v27 + 1;
                  v24 = v18 + (v26 * v23);
                  v26 = *(_DWORD *)(v24 + 8);
                  ++v27;
                }
                while (v26 != -1);
              }
              address[v28] = *(_QWORD *)v24;
              v33 = 0;
              if (_enter_frames_in_table_while_locked(a1, &v33, (uint64_t)address, v28 + 1))
                *(_QWORD *)(*(_QWORD *)a1 + v33 * *(unsigned int *)(a1 + 40) + 16) = v25;
              else
                fwrite("unable to reinsert node when expanding backtrace uniquing table - bad hashing function?\n", 0x58uLL, 1uLL, __stderrp);
            }
          }
        }
      }
      if (mach_vm_deallocate(mach_task_self_, v18, v19))
        printf("(BacktraceUniquing) expandUniquingTable(): mach_vm_deallocate failed. [%p]\n", *(const void **)a1);
      v8 = v17;
      pthread_rwlock_unlock(v17);
      pthread_rwlock_wrlock(v17);
      v29 = _enter_frames_in_table_while_locked(a1, &v32, v30, v31);
      pthread_rwlock_unlock(v17);
      if (v29)
      {
        result = 1;
        goto LABEL_33;
      }
    }
    fprintf(__stderrp, "failed to expand uniquing table to %llu bytes\n", v14);
    v8 = v17;
LABEL_32:
    pthread_rwlock_unlock(v8);
    result = 0;
    v32 = -1;
  }
LABEL_33:
  *a2 = v32;
  return result;
}

uint64_t remove_stack_from_backtrace_uniquing_table(uint64_t a1, uint64_t a2)
{
  pthread_rwlock_t *v4;
  int v5;
  size_t v6;
  _DWORD *v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;

  v4 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  if ((_DWORD)a2 != -1)
  {
    v5 = a2;
    do
    {
      v6 = *(unsigned int *)(a1 + 40);
      v7 = (_DWORD *)(*(_QWORD *)a1 + (v6 * v5));
      v8 = v7[2];
      if (*(_QWORD *)v7)
        v9 = 0;
      else
        v9 = v8 == 0;
      if (v9)
        break;
      v10 = v7[3];
      if (v10 != -1)
      {
        v11 = v10 - 1;
        v7[3] = v11;
        if (!v11)
        {
          bzero(v7, v6);
          --*(_DWORD *)(a1 + 48);
          if (v5 == a2)
            --*(_DWORD *)(a1 + 52);
        }
      }
      v5 = v8;
    }
    while (v8 != -1);
  }
  return pthread_rwlock_unlock(v4);
}

uint64_t stack_frames_for_uniqued_stack(uint64_t a1, int a2, uint64_t a3, int a4)
{
  pthread_rwlock_t *v8;
  uint64_t v9;
  int v10;
  vm_size_t v11;
  uint64_t v12;
  int v14;

  v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 64));
  v9 = 0;
  if (a4 && a2 != -1)
  {
    v9 = 0;
    v10 = *(_DWORD *)(a1 + 40);
    v11 = vm_page_size;
    while (1)
    {
      if (v11 * *(_QWORD *)(a1 + 8) <= (v10 + v10 * a2))
      {
        fprintf(__stderrp, "(BacktraceUniquing): Invalid parent node %#x\n");
        goto LABEL_14;
      }
      v12 = *(_QWORD *)a1 + (v10 * a2);
      a2 = *(_DWORD *)(v12 + 8);
      if (!*(_QWORD *)v12 && a2 == 0)
        break;
      *(_QWORD *)(a3 + 8 * v9) = *(_QWORD *)v12;
      v14 = v9++;
      if (a4 - 1 == v14 || a2 == -1)
        goto LABEL_14;
    }
    fprintf(__stderrp, "(BacktraceUniquing): Invalid PC 0x%llx\n");
  }
LABEL_14:
  pthread_rwlock_unlock(v8);
  return v9;
}

uint64_t _enter_frames_in_table_while_locked(uint64_t a1, _QWORD *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  _DWORD *v18;
  int v19;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(int *)(a1 + 44);
  v7 = (v4 - v5) / ((2 * v6) | 1uLL);
  v8 = a4;
  v9 = -1;
  while (1)
  {
    v10 = v9;
    if ((int)v8 < 1)
      break;
    if ((_DWORD)v6)
    {
      --v8;
      v11 = *(_QWORD *)(a3 + 8 * v8);
      v9 = ((16 * v9) ^ (v11 >> 2)) % (v4 - v5 - 1) + v5;
      v12 = (v6 - 1) * v7 + 1;
      v13 = v6;
      while (1)
      {
        v14 = *(_QWORD *)a1 + *(_DWORD *)(a1 + 40) * v9;
        if (!*(_QWORD *)v14 && !*(_DWORD *)(v14 + 8))
          break;
        if (*(_QWORD *)v14 == v11 && *(_DWORD *)(v14 + 8) == v10)
        {
          v19 = *(_DWORD *)(v14 + 12);
          v18 = (_DWORD *)(v14 + 12);
          v17 = v19;
          if (v19 == -1)
            goto LABEL_19;
          goto LABEL_18;
        }
        v15 = v9 + v12;
        if (v4 <= v15)
          v16 = v5 - v4;
        else
          v16 = 0;
        v12 -= v7;
        v9 = v15 + v16;
        if (!--v13)
          return 0;
      }
      *(_QWORD *)v14 = v11;
      *(_DWORD *)(v14 + 8) = v10;
      *(_DWORD *)(v14 + 12) = 1;
      ++*(_DWORD *)(a1 + 48);
      if (v8)
        goto LABEL_19;
      v17 = *(_DWORD *)(a1 + 52);
      v18 = (_DWORD *)(a1 + 52);
LABEL_18:
      *v18 = v17 + 1;
LABEL_19:
      if (v13 >= 1)
        continue;
    }
    return 0;
  }
  *a2 = v9;
  return 1;
}

uint64_t print_dispatch_info()
{
  unint64_t v0;
  _opaque_pthread_t *v1;
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  thread_act_array_t v6;
  uint64_t pending_items;
  mach_vm_address_t v8;
  uint64_t v9;
  const void **v10;
  unint64_t v11;
  mach_vm_size_t size;
  mach_vm_address_t address;
  mach_msg_type_number_t act_listCnt[2];
  thread_act_array_t act_list;

  act_list = 0;
  act_listCnt[0] = 0;
  if (!task_threads(mach_task_self_, &act_list, act_listCnt))
  {
    if (act_listCnt[0])
    {
      v0 = 0;
      do
      {
        v1 = pthread_from_mach_thread_np(act_list[v0]);
        print_logical_backtrace_0(0, v1);
        ++v0;
      }
      while (v0 < act_listCnt[0]);
      if (act_listCnt[0])
      {
        v2 = 0;
        do
          mach_port_deallocate(mach_task_self_, act_list[v2++]);
        while (v2 < act_listCnt[0]);
        mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)act_list, 4 * act_listCnt[0]);
      }
    }
    fflush(__stdoutp);
  }
  *(_QWORD *)act_listCnt = 0;
  act_list = 0;
  result = __introspection_dispatch_get_queues(3, (mach_vm_address_t *)&act_list, (mach_vm_size_t *)act_listCnt);
  if (result)
  {
    v4 = result;
    puts("--------------------------------------------------------------------------------");
    printf("NUMBER OF QUEUES WITH PENDING ITEMS:  %llu\n", v4);
    putchar(10);
    v5 = 0;
    v6 = act_list;
    do
    {
      size = 0;
      address = 0;
      pending_items = __introspection_dispatch_queue_get_pending_items(*((_QWORD *)v6 + 1), &address, (uint64_t *)&size);
      printf("QUEUE %p SERIALNUM %llu %s\n", *((const void **)v6 + 1), *((_QWORD *)v6 + 2), (const char *)v6 + 32);
      printf("number of pending items in list: %llu   recorded pending count: %d  running count: %d\n", pending_items, v6[7], v6[6]);
      if (address)
      {
        printf("pending items array version %u  pending items array entry size %u\n", *(_DWORD *)address, *(_DWORD *)(address + 4));
        v8 = address;
        if (pending_items)
        {
          v9 = 0;
          v10 = (const void **)(address + 8);
          do
          {
            printf("QUEUE %p PENDING ITEM %zu:  item_ref %p  function_or_block %p\n", *((const void **)v6 + 1), v9, *v10, v10[1]);
            v11 = (unint64_t)*v10;
            v10 += 2;
            print_logical_backtrace_0(v11, 0);
            ++v9;
          }
          while (pending_items != v9);
          v8 = address;
        }
        mach_vm_deallocate(mach_task_self_, v8, size);
      }
      v6 = (thread_act_array_t)((char *)v6 + *v6);
      ++v5;
    }
    while (v5 != v4);
    mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)act_list, *(mach_vm_size_t *)act_listCnt);
    return fflush(__stdoutp);
  }
  return result;
}

_QWORD *print_logical_backtrace_0(unint64_t a1, pthread_t a2)
{
  mach_vm_address_t v2;
  _QWORD *result;
  BOOL v5;
  int v6;
  const void *v7;
  int v8;
  const char *dli_sname;
  mach_vm_address_t v10;
  const char *v11;
  const char *v12;
  size_t v13;
  unint64_t v14;
  const void *v15;
  int v16;
  const char *v17;
  const void *v18;
  const char *v19;
  BOOL v20;
  const char *v21;
  __uint64_t v22;
  mach_vm_size_t v23;
  mach_vm_address_t v24;
  Dl_info v25;

  v2 = (mach_vm_address_t)a2;
  v23 = 0;
  v24 = 0;
  if (a2)
  {
    v22 = 0;
    pthread_threadid_np(a2, &v22);
    result = __introspection_dispatch_thread_get_item_info((_QWORD *)v22, &v24, &v23);
    if (!v24)
      return result;
    LOBYTE(v25.dli_fname) = 0;
    pthread_getname_np((pthread_t)v2, (char *)&v25, 0x40uLL);
    puts("================================================================================");
    printf("THREAD WITH ACTIVE ITEM:  ID %llu %s\n", v22, (const char *)&v25);
    v2 = v24;
  }
  v5 = a1 != 0;
  if (a1 | v2)
  {
    v6 = 0;
    do
    {
      if (v5)
      {
        __introspection_dispatch_queue_item_get_info((_QWORD *)a1, &v24, &v23);
        v2 = v24;
      }
      printf("  LEVEL %d:\n", v6);
      v7 = *(const void **)(v2 + 8);
      memset(&v25, 0, sizeof(v25));
      v8 = dladdr(v7, &v25);
      dli_sname = v25.dli_sname;
      if (!v8)
        dli_sname = 0;
      if (!dli_sname)
        dli_sname = (const char *)&unk_66B2;
      printf("    Target function/block %p %s\n", v7, dli_sname);
      v10 = v2 + (unsigned __int16)__introspection_dispatch_item_info_data_offset;
      v11 = (const char *)(v10 + 8 * *(unsigned int *)(v2 + 40));
      v12 = &v11[strlen(v11) + 1];
      v13 = strlen(v12);
      printf("    Target queue serialnum %llu %s\n", *(_QWORD *)(v2 + 32), &v12[v13 + 1]);
      printf("    Enqueuing thread id %llu %s\n", *(_QWORD *)(v2 + 16), v11);
      printf("    Enqueuing queue serialnum %llu %s\n", *(_QWORD *)(v2 + 24), v12);
      printf("    stop_id %u\n", *(_DWORD *)(v2 + 44));
      if (*(_DWORD *)(v2 + 48))
        printf("    repeated_enqueuings_count %u\n", *(_DWORD *)(v2 + 48));
      if (*(_DWORD *)(v2 + 52))
        printf("    elided_enqueuings_count %u\n", *(_DWORD *)(v2 + 52));
      if (*(_DWORD *)(v2 + 40))
      {
        v14 = 0;
        do
        {
          v15 = *(const void **)(v10 + 8 * v14);
          memset(&v25, 0, sizeof(v25));
          v16 = dladdr(v15, &v25);
          v17 = v25.dli_sname;
          if (!v16)
            v17 = 0;
          v18 = *(const void **)(v10 + 8 * v14);
          if (v17)
            v19 = v17;
          else
            v19 = (const char *)&unk_66B2;
          memset(&v25, 0, sizeof(v25));
          if (dladdr(v18, &v25))
            v20 = v25.dli_fname == 0;
          else
            v20 = 1;
          v21 = (const char *)&unk_66B2;
          if (!v20)
            v21 = strrchr((char *)v25.dli_fname, 47) + 1;
          printf("    %3d  %p %s (in %s)\n", v14++, v15, v19, v21);
        }
        while (v14 < *(unsigned int *)(v2 + 40));
      }
      a1 = *(_QWORD *)v2;
      ++v6;
      mach_vm_deallocate(mach_task_self_, v24, v23);
      v2 = 0;
      v24 = 0;
      v5 = 1;
    }
    while (a1);
  }
  return (_QWORD *)putchar(10);
}

void get_entry_from_free_list_cold_1()
{
  fputs("libBacktraceRecording.dylib:  allocate_free_list_pages() -- virtual memory exhausted!\n", __stderrp);
  abort();
}

void create_backtrace_uniquing_table_cold_1()
{
  printf("(BacktraceUniquing) allocate_pages(): virtual memory exhausted! (XRBacktraceRepository)");
  abort();
}
