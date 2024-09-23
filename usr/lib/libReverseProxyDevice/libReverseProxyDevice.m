uint64_t RPSocket::set_client(uint64_t a1, uint64_t a2, const void *a3)
{
  const void *v5;
  const void *v6;
  CFTypeRef v7;

  if (a2)
    v5 = a3;
  else
    v5 = 0;
  RPSocket::suspend((RPSocket *)a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  *(_QWORD *)(a1 + 24) = a2;
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
  if (v5)
    v7 = CFRetain(v5);
  else
    v7 = 0;
  *(_QWORD *)(a1 + 32) = v7;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  return RPSocket::resume((RPSocket *)a1);
}

uint64_t RPSocket::suspend(RPSocket *this)
{
  pthread_mutex_t *v2;
  int v3;

  v2 = (pthread_mutex_t *)((char *)this + 136);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  v3 = *((_DWORD *)this + 54) - 1;
  *((_DWORD *)this + 54) = v3;
  if (!v3)
    (*(void (**)(RPSocket *))(*(_QWORD *)this + 16))(this);
  return pthread_mutex_unlock(v2);
}

uint64_t RPSocket::resume(RPSocket *this)
{
  pthread_mutex_t *v2;
  int v3;

  v2 = (pthread_mutex_t *)((char *)this + 136);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  v3 = *((_DWORD *)this + 54);
  *((_DWORD *)this + 54) = v3 + 1;
  if (!v3)
    (*(void (**)(RPSocket *))(*(_QWORD *)this + 24))(this);
  return pthread_mutex_unlock(v2);
}

uint64_t BlockInvoker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t RPSocketInvalidate(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const void *v3;

  if (result)
  {
    v1 = result;
    (*(void (**)(_QWORD))(**(_QWORD **)(result + 16) + 32))(*(_QWORD *)(result + 16));
    v2 = *(_QWORD *)(v1 + 16);
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 136));
    *(_BYTE *)(v2 + 200) = 1;
    *(_QWORD *)(v2 + 24) = 0;
    v3 = *(const void **)(v2 + 32);
    if (v3)
      CFRelease(v3);
    *(_QWORD *)(v2 + 32) = 0;
    return pthread_mutex_unlock((pthread_mutex_t *)(v2 + 136));
  }
  return result;
}

uint64_t RPSocketReadBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  int *v13;
  char *v14;
  CFStringRef v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
    return 1;
  v3 = a3;
  while (1)
  {
    v6 = (***(uint64_t (****)(_QWORD, uint64_t, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 16), a2, v3);
    v8 = *(_QWORD *)(a1 + 16);
    if (v6 == -1)
      break;
    v9 = *(unint64_t **)(v8 + 232);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + v6, v9));
    if (!v6)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
      if (v17)
        goto LABEL_20;
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      v17 = getDefaultLogCtx_ctx;
      if (getDefaultLogCtx_ctx)
      {
LABEL_20:
        if (*(int *)(v17 + 16) >= 3)
          LogMsg(3u, v17, (uint64_t)"RPSocket.cpp", 516, (uint64_t)"RPSocketReadBuffer", 0, CFSTR("EOF on %@\n"), v7, a1);
      }
      return 0;
    }
    a2 += v6;
    v3 -= v6;
    if (!v3)
      return 1;
  }
  v12 = *(_QWORD *)(v8 + 40);
  if (v12)
    goto LABEL_14;
  if (getDefaultLogCtx_once != -1)
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  v12 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_14:
    if (*(int *)(v12 + 16) >= 3)
    {
      v13 = __error();
      v14 = strerror(*v13);
      v15 = CFStringCreateWithCString(0, v14, 0x8000100u);
      LogMsg(3u, v12, (uint64_t)"RPSocket.cpp", 520, (uint64_t)"RPSocketReadBuffer", v15, CFSTR("read error on %@"), v16, a1);
    }
  }
  return 0;
}

uint64_t RPSocketWrite(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v11;

  if (!a3)
    return 1;
  v3 = a3;
  while (1)
  {
    v6 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), a2, v3);
    if (v6 < 0)
      break;
    a2 += v6;
    v3 -= v6;
    v8 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 232) + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + v6, v8));
    if (!v3)
      return 1;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
  if (v11)
    goto LABEL_13;
  if (getDefaultLogCtx_once != -1)
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  v11 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_13:
    if (*(int *)(v11 + 16) >= 3)
      LogMsg(3u, v11, (uint64_t)"RPSocket.cpp", 602, (uint64_t)"RPSocketWrite", 0, CFSTR("failed to write %zu bytes to %@\n"), v7, v3);
  }
  return 0;
}

uint64_t RPSocketWriteDictionary(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;
  uint64_t v10;
  const __CFData *v11;
  CFIndex Length;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const UInt8 *BytePtr;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFErrorRef error;
  int v26;

  error = 0;
  if (a2)
  {
    v9 = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    v11 = v9;
    if (v9 && !error)
    {
      Length = CFDataGetLength(v9);
      v14 = Length;
      if (Length < 0x80000000)
      {
        v26 = Length;
        if ((RPSocketWrite(a1, (uint64_t)&v26, 4) & 1) != 0)
        {
          BytePtr = CFDataGetBytePtr(v11);
          if ((RPSocketWrite(a1, (uint64_t)BytePtr, v14) & 1) != 0)
          {
            v17 = 1;
LABEL_42:
            CFRelease(v11);
            goto LABEL_43;
          }
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
          if (v23)
            goto LABEL_39;
          if (getDefaultLogCtx_once != -1)
            dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
          v23 = getDefaultLogCtx_ctx;
          if (getDefaultLogCtx_ctx)
          {
LABEL_39:
            if (*(int *)(v23 + 16) >= 3)
              LogMsg(3u, v23, (uint64_t)"RPSocket.cpp", 652, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("failed to write length to %@\n"), v21, a1);
          }
        }
        else
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
          if (v22)
            goto LABEL_33;
          if (getDefaultLogCtx_once != -1)
            dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
          v22 = getDefaultLogCtx_ctx;
          if (getDefaultLogCtx_ctx)
          {
LABEL_33:
            if (*(int *)(v22 + 16) >= 3)
              LogMsg(3u, v22, (uint64_t)"RPSocket.cpp", 647, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("failed to write length to %@\n"), v19, a1);
          }
        }
      }
      else
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
        if (v15)
          goto LABEL_9;
        if (getDefaultLogCtx_once != -1)
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        v15 = getDefaultLogCtx_ctx;
        if (getDefaultLogCtx_ctx)
        {
LABEL_9:
          if (*(int *)(v15 + 16) >= 3)
            LogMsg(3u, v15, (uint64_t)"RPSocket.cpp", 642, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("data too big for %@: %lu\n"), v13, a1);
        }
      }
      v17 = 0;
      goto LABEL_42;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
    if (v18)
      goto LABEL_22;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v18 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_22:
      if (*(int *)(v18 + 16) >= 3)
        LogMsg(3u, v18, (uint64_t)"RPSocket.cpp", 636, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("failed to serialize dictionary to %@: %@\n"), v10, a1);
    }
    v17 = 0;
    if (v11)
      goto LABEL_42;
  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
    if (v16)
      goto LABEL_15;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v16 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_15:
      if (*(int *)(v16 + 16) >= 3)
        LogMsg(3u, v16, (uint64_t)"RPSocket.cpp", 630, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("no dictionary to send to %@\n"), a8, a1);
    }
    v17 = 0;
  }
LABEL_43:
  if (error)
    CFRelease(error);
  return v17;
}

uint64_t RPCreateSocketForFD(int a1, int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t CFObject;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  char *v10;
  CFStringRef v11;
  uint64_t v12;
  const sockaddr *v13;
  const char *v14;
  uint64_t v15;
  int *v16;
  char *v17;
  CFStringRef v18;
  uint64_t v19;
  const sockaddr *v20;
  const char *v21;
  uint64_t v22;
  int *v23;
  char *v24;
  CFStringRef v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uintptr_t v30;
  NSObject *global_queue;
  NSObject *v32;
  uint64_t v34;
  socklen_t v35;
  socklen_t v36;
  int v37;
  sockaddr v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  char v46[1025];
  char v47[1025];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = operator new();
  *(_QWORD *)v4 = &unk_24C35B7C0;
  *(_BYTE *)(v4 + 200) = 0;
  *(_QWORD *)(v4 + 208) = 0;
  *(_DWORD *)(v4 + 216) = 0;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  v5 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  *(_QWORD *)(v4 + 224) = 0;
  *(_QWORD *)(v4 + 232) = v5;
  pthread_mutex_init((pthread_mutex_t *)(v4 + 136), 0);
  pthread_mutex_init((pthread_mutex_t *)(v4 + 64), 0);
  CFObject = __CreateCFObject((dispatch_once_t *)&RPSocket::RPSocket(void)::__reg, 24);
  *(_QWORD *)(v4 + 8) = CFObject;
  if (CFObject)
  {
    *(_QWORD *)(CFObject + 16) = v4;
  }
  else
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"RPSocket.cpp", 130, (uint64_t)"RPSocket", 0, CFSTR("could not allocate socket\n"), v7, v34);
  }
  *(_QWORD *)v4 = &off_24C35B730;
  *(_QWORD *)(v4 + 376) = 0;
  *(_OWORD *)(v4 + 248) = 0u;
  *(_OWORD *)(v4 + 264) = 0u;
  *(_OWORD *)(v4 + 280) = 0u;
  *(_OWORD *)(v4 + 296) = 0u;
  *(_OWORD *)(v4 + 312) = 0u;
  *(_OWORD *)(v4 + 328) = 0u;
  *(_OWORD *)(v4 + 344) = 0u;
  *(_OWORD *)(v4 + 360) = 0u;
  *(_DWORD *)(v4 + 240) = a1;
  *(_QWORD *)(v4 + 248) = dispatch_queue_create("com.apple.PurpleReverseProxy.FDQueue", 0);
  v37 = 1;
  if (setsockopt(*(_DWORD *)(v4 + 240), 0xFFFF, 4130, &v37, 4u) == -1)
  {
    v8 = *(_QWORD *)(v4 + 40);
    if (v8)
      goto LABEL_8;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v8 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_8:
      if (*(int *)(v8 + 16) >= 3)
      {
        v9 = __error();
        v10 = strerror(*v9);
        v11 = CFStringCreateWithCString(0, v10, 0x8000100u);
        LogMsg(3u, v8, (uint64_t)"RPSocket.cpp", 922, (uint64_t)"RPSocket_fd", v11, CFSTR("setsockopt for %@"), v12, *(_QWORD *)(v4 + 8));
      }
    }
  }
  bzero(v47, 0x401uLL);
  bzero(v46, 0x401uLL);
  v36 = 128;
  if (getsockname(a1, (sockaddr *)(v4 + 256), &v36))
  {
    v15 = *(_QWORD *)(v4 + 40);
    if (v15)
      goto LABEL_15;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v15 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_15:
      if (*(int *)(v15 + 16) >= 3)
      {
        v16 = __error();
        v17 = strerror(*v16);
        v18 = CFStringCreateWithCString(0, v17, 0x8000100u);
        LogMsg(3u, v15, (uint64_t)"RPSocket.cpp", 933, (uint64_t)"RPSocket_fd", v18, CFSTR("getsockname for %@"), v19, *(_QWORD *)(v4 + 8));
      }
    }
  }
  rps_sockaddr_to_string((uint64_t)v47, (sockaddr *)(v4 + 256), v13, v14);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = (sockaddr)0;
  v39 = 0u;
  v35 = 128;
  if (getpeername(a1, &v38, &v35))
  {
    v22 = *(_QWORD *)(v4 + 40);
    if (v22)
      goto LABEL_22;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v22 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_22:
      if (*(int *)(v22 + 16) >= 3)
      {
        v23 = __error();
        v24 = strerror(*v23);
        v25 = CFStringCreateWithCString(0, v24, 0x8000100u);
        LogMsg(3u, v22, (uint64_t)"RPSocket.cpp", 943, (uint64_t)"RPSocket_fd", v25, CFSTR("getpeername for %@"), v26, *(_QWORD *)(v4 + 8));
      }
    }
  }
  rps_sockaddr_to_string((uint64_t)v46, &v38, v20, v21);
  if (a2 == 2)
  {
    v29 = *(_QWORD *)(v4 + 40);
    if (v29)
      goto LABEL_41;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v29 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_41:
      if (*(int *)(v29 + 16) >= 5)
        LogMsg(5u, v29, (uint64_t)"RPSocket.cpp", 956, (uint64_t)"RPSocket_fd", 0, CFSTR("%@: accepted %s <- %s"), v27, *(_QWORD *)(v4 + 8));
    }
  }
  else if (a2 == 3)
  {
    v28 = *(_QWORD *)(v4 + 40);
    if (v28)
      goto LABEL_30;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v28 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_30:
      if (*(int *)(v28 + 16) >= 5)
        LogMsg(5u, v28, (uint64_t)"RPSocket.cpp", 959, (uint64_t)"RPSocket_fd", 0, CFSTR("%@: connected to %s as %s"), v27, *(_QWORD *)(v4 + 8));
    }
  }
  CFRetain(*(CFTypeRef *)(v4 + 8));
  v30 = *(int *)(v4 + 240);
  global_queue = dispatch_get_global_queue(0, 0);
  v32 = dispatch_source_create(MEMORY[0x24BDACA00], v30, 0, global_queue);
  *(_QWORD *)(v4 + 384) = v32;
  dispatch_set_context(v32, (void *)v4);
  dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v4 + 384), (dispatch_function_t)RPSocket_fd::cancel_handler);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 384), (dispatch_function_t)RPSocket_fd::event_handler);
  return *(_QWORD *)(v4 + 8);
}

void sub_20AA6DD7C(_Unwind_Exception *a1)
{
  RPSocket *v1;

  RPSocket::~RPSocket(v1);
  MEMORY[0x20BD2AD1C](v1, 0x10F1C40CCF46882);
  _Unwind_Resume(a1);
}

uint64_t rps_sockaddr_to_string(uint64_t result, sockaddr *a2, const sockaddr *a3, const char *a4)
{
  uint64_t v5;
  int sa_family;
  uint64_t v7;
  int v8;
  int v9;
  socklen_t sa_len;
  unsigned int v11;
  char v12[2];
  char v13[1025];
  uint64_t v14;

  v5 = result;
  v14 = *MEMORY[0x24BDAC8D0];
  sa_family = a2->sa_family;
  if (sa_family != 30 && sa_family != 1 && !a2->sa_family)
  {
    *(_WORD *)(result + 8) = 62;
    v7 = *(_QWORD *)"<unknown>";
LABEL_21:
    *(_QWORD *)v5 = v7;
    return result;
  }
  if (sa_family == 30)
    v8 = 28;
  else
    v8 = 0;
  if (sa_family == 2)
    v9 = 16;
  else
    v9 = v8;
  if (a2->sa_len)
    sa_len = a2->sa_len;
  else
    sa_len = v9;
  result = getnameinfo(a2, sa_len, v13, 0x401u, v12, 0x20u, 10);
  if ((_DWORD)result)
  {
    if (a2->sa_family == 1)
    {
      v11 = a2->sa_len - 2;
      if (v11 >= 0x68)
        v11 = 104;
      if (v11)
        return snprintf((char *)v5, 0x401uLL, "%s%.*s%s");
    }
    *(_WORD *)(v5 + 8) = 62;
    v7 = *(_QWORD *)"<unknown>";
    goto LABEL_21;
  }
  if (!v12[0] || *(unsigned __int16 *)v12 == 48)
    v12[0] = 0;
  return snprintf((char *)v5, 0x401uLL, "%s%s%s%s%s");
}

void RPSocket_fd::cancel_handler(RPSocket_fd *this, void *a2)
{
  RPSocket::signal(this, 8);
  dispatch_sync_f(*((dispatch_queue_t *)this + 31), this, (dispatch_function_t)RPSocket_fd::close_fd);
  CFRelease(*((CFTypeRef *)this + 1));
}

void RPSocket_fd::event_handler(RPSocket_fd *this, void *a2)
{
  RPSocket::signal(this, 2);
}

void RPSocket::~RPSocket(RPSocket *this)
{
  const void *v2;
  const void *v3;
  const void *v4;
  NSObject *v5;
  void *v6;
  void *v7;

  *(_QWORD *)this = &unk_24C35B7C0;
  v2 = (const void *)*((_QWORD *)this + 4);
  if (v2)
    CFRelease(v2);
  v3 = (const void *)*((_QWORD *)this + 5);
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  if (v4)
    CFRelease(v4);
  v5 = *((_QWORD *)this + 6);
  if (v5)
    dispatch_release(v5);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 136));
  pthread_mutex_destroy((pthread_mutex_t *)this + 1);
  v6 = (void *)*((_QWORD *)this + 29);
  if (v6)
    free(v6);
  v7 = (void *)*((_QWORD *)this + 28);
  if (v7)
    free(v7);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t RPSocket::accept(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::get_port(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::copy_error(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::copy_entitlements(RPSocket *this)
{
  return 0;
}

void RPSocket::signal(RPSocket *this, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  void (*v6)(CFTypeRef, uint64_t, const void *);
  const void *v7;
  NSObject *v8;
  CFTypeRef v9;
  uint64_t v10;
  uint64_t context;
  CFTypeRef cf;
  uint64_t v13;
  CFTypeRef v14;

  v4 = (pthread_mutex_t *)((char *)this + 136);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  v6 = (void (*)(CFTypeRef, uint64_t, const void *))*((_QWORD *)this + 3);
  if (v6)
  {
    v7 = (const void *)*((_QWORD *)this + 4);
    context = *((_QWORD *)this + 3);
    v14 = v7;
    v8 = *((_QWORD *)this + 6);
    if (v7)
      CFRetain(v7);
    if (v8)
      dispatch_retain(v8);
    v9 = (CFTypeRef)*((_QWORD *)this + 1);
    cf = v9;
    v13 = a2;
    CFRetain(v9);
    pthread_mutex_unlock(v4);
    if (v8)
    {
      dispatch_sync_f(v8, &context, (dispatch_function_t)RPSocket::invoke_cb);
      dispatch_release(v8);
      v9 = cf;
    }
    else
    {
      v6(v9, a2, v7);
    }
    CFRelease(v9);
    if (v14)
      CFRelease(v14);
  }
  else
  {
    v10 = *((_QWORD *)this + 5);
    if (v10)
      goto LABEL_12;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v10 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_12:
      if (*(int *)(v10 + 16) >= 3)
        LogMsg(3u, v10, (uint64_t)"RPSocket.cpp", 228, (uint64_t)"signal", 0, CFSTR("No client callback, missing event %d for socket %p\n"), v5, a2);
    }
    pthread_mutex_unlock(v4);
  }
}

uint64_t RPSocket::invoke_cb(RPSocket *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))this)(*((_QWORD *)this + 1), *((_QWORD *)this + 2), *((_QWORD *)this + 3));
}

uint64_t RPSocket_fd::close_fd(RPSocket_fd *this, void *a2)
{
  return (*(uint64_t (**)(RPSocket_fd *))(*(_QWORD *)this + 120))(this);
}

ssize_t RPSocket_fd::read(RPSocket_fd *this, void *a2, size_t a3)
{
  return read(*((_DWORD *)this + 60), a2, a3);
}

ssize_t RPSocket_fd::write(RPSocket_fd *this, const void *a2, size_t a3)
{
  return write(*((_DWORD *)this + 60), a2, a3);
}

void RPSocket_fd::pause(dispatch_object_t *this)
{
  dispatch_suspend(this[48]);
}

void RPSocket_fd::unpause(dispatch_object_t *this)
{
  dispatch_resume(this[48]);
}

void RPSocket_fd::invalidate(dispatch_queue_t *this)
{
  dispatch_sync_f(this[31], this, (dispatch_function_t)RPSocket_fd::shutdown_fd);
  dispatch_source_cancel(this[48]);
}

CFStringRef RPSocket_fd::copy_type_description(RPSocket_fd *this)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("fd=%d"), *((unsigned int *)this + 60));
}

uint64_t RPSocket_fd::accept(RPSocket_fd *this, unint64_t a2)
{
  uintptr_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v11;
  int *v12;
  char *v13;
  CFStringRef v14;
  uint64_t v15;
  char *v16;
  const char *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  char *v23;
  uint64_t v24;
  int *v25;
  char *v26;
  CFStringRef v27;
  uint64_t v28;
  uint64_t v29;
  timespec timeout;
  kevent eventlist;

  if (!a2)
    goto LABEL_5;
  v4 = *((int *)this + 60);
  v5 = kqueue();
  if (v5 == -1)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v11 = getDefaultLogCtx_ctx;
    if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3)
      return 0;
    v12 = __error();
    v13 = strerror(*v12);
    v14 = CFStringCreateWithCString(0, v13, 0x8000100u);
    v16 = "Utilities.c";
    v17 = "WaitSocket";
    v18 = CFSTR("kqueue");
    v19 = v11;
    v20 = 206;
    goto LABEL_18;
  }
  v6 = v5;
  timeout.tv_sec = (int)(a2 / 0x3B9ACA00);
  timeout.tv_nsec = a2 % 0x3B9ACA00;
  eventlist.ident = v4;
  *(_DWORD *)&eventlist.filter = 1179647;
  memset(&eventlist.fflags, 0, 20);
  v7 = kevent(v5, &eventlist, 1, &eventlist, 1, &timeout);
  if (v7 == -1)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v24 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v25 = __error();
      v26 = strerror(*v25);
      v27 = CFStringCreateWithCString(0, v26, 0x8000100u);
      LogMsg(3u, v24, (uint64_t)"Utilities.c", 216, (uint64_t)"WaitSocket", v27, CFSTR("kevent"), v28, v29);
    }
    close(v6);
    return 0;
  }
  v8 = v7;
  close(v6);
  if (v8 >= 1)
  {
LABEL_5:
    v9 = accept(*((_DWORD *)this + 60), 0, 0);
    if (v9 != -1)
      return RPCreateSocketForFD(v9, 2);
    v21 = *((_QWORD *)this + 5);
    if (v21)
      goto LABEL_16;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v21 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_16:
      if (*(int *)(v21 + 16) >= 3)
      {
        v22 = __error();
        v23 = strerror(*v22);
        v14 = CFStringCreateWithCString(0, v23, 0x8000100u);
        v16 = "RPSocket.cpp";
        v29 = *((_QWORD *)this + 1);
        v17 = "accept";
        v18 = CFSTR("accept for %@");
        v19 = v21;
        v20 = 1050;
LABEL_18:
        LogMsg(3u, v19, (uint64_t)v16, v20, (uint64_t)v17, v14, v18, v15, v29);
      }
    }
  }
  return 0;
}

uint64_t RPSocket_fd::get_port(RPSocket_fd *this)
{
  int v1;

  v1 = *((unsigned __int8 *)this + 257);
  if (v1 == 30 || v1 == 2)
    return bswap32(*((unsigned __int16 *)this + 129)) >> 16;
  else
    return 0;
}

const void *RPSocket_fd::copy_entitlements(RPSocket_fd *this)
{
  int v1;
  uint64_t v2;
  int *v3;
  char *v4;
  CFStringRef v5;
  uint64_t v6;
  uint64_t v7;
  UInt8 *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  const void *v16;
  unsigned int v18;
  CFIndex v19;
  const __CFData *v20;
  const __CFData *v21;
  CFPropertyListRef v22;
  CFTypeID v23;
  uint64_t v24;
  socklen_t v25;
  unsigned int v26;
  uint64_t v27;

  v1 = *((_DWORD *)this + 60);
  v25 = 4;
  if (copyEntitlementsForSocketPeer_sleep_once != -1)
    dispatch_once(&copyEntitlementsForSocketPeer_sleep_once, &__block_literal_global_50);
  v26 = 0;
  usleep(1000 * copyEntitlementsForSocketPeer_sleep_delay);
  if (getsockopt(v1, 6, 516, &v26, &v25))
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v2 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v3 = __error();
      v4 = strerror(*v3);
      v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
      LogMsg(3u, v2, (uint64_t)"Utilities.c", 298, (uint64_t)"copyEntitlementsForSocketPeer", v5, CFSTR("getsockopt"), v6, v24);
    }
    return 0;
  }
  v7 = v26;
  v27 = 0;
  if (!csops())
    return 0;
  if (*__error() != 34)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v13 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v14 = __error();
      strerror(*v14);
      LogMsg(3u, v13, (uint64_t)"Utilities.c", 244, (uint64_t)"copyEntitlementsForPid", 0, CFSTR("csops1(%d): %s\n"), v15, v7);
    }
    return 0;
  }
  v8 = (UInt8 *)malloc_type_calloc(1uLL, bswap32(HIDWORD(v27)), 0x59FBFC9DuLL);
  if (csops())
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v10 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v11 = __error();
      strerror(*v11);
      LogMsg(3u, v10, (uint64_t)"Utilities.c", 252, (uint64_t)"copyEntitlementsForPid", 0, CFSTR("csops2(%d): %s\n"), v12, v7);
    }
    if (!v8)
      return 0;
    goto LABEL_18;
  }
  if (*(_DWORD *)v8 != 1903288058)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 257, (uint64_t)"copyEntitlementsForPid", 0, CFSTR("bad magic 0x%08x\n"), v9, *(unsigned int *)v8);
    goto LABEL_18;
  }
  v18 = bswap32(*((_DWORD *)v8 + 1));
  if (v18 < 9
    || (v19 = v18 - 8,
        *((_DWORD *)v8 + 1) = v19,
        (v20 = CFDataCreateWithBytesNoCopy(0, v8 + 8, v19, (CFAllocatorRef)*MEMORY[0x24BDBD258])) == 0))
  {
LABEL_18:
    free(v8);
    return 0;
  }
  v21 = v20;
  v22 = CFPropertyListCreateWithData(0, v20, 0, 0, 0);
  v16 = v22;
  if (v22)
  {
    v23 = CFGetTypeID(v22);
    if (v23 != CFDictionaryGetTypeID())
    {
      CFRelease(v16);
      v16 = 0;
    }
  }
  free(v8);
  CFRelease(v21);
  return v16;
}

void RPSocket_fd::~RPSocket_fd(dispatch_source_t *this)
{
  RPSocket_fd::~RPSocket_fd(this);
  JUMPOUT(0x20BD2AD1CLL);
}

{
  *this = (dispatch_source_t)&off_24C35B730;
  dispatch_source_cancel(this[48]);
  dispatch_release(this[48]);
  dispatch_release(this[31]);
  RPSocket::~RPSocket((RPSocket *)this);
}

uint64_t RPSocket_fd::shutdownFD(RPSocket_fd *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 60);
  if ((_DWORD)result != -1)
    return shutdown(result, 2);
  return result;
}

uint64_t RPSocket_fd::closeFD(RPSocket_fd *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 60);
  if ((_DWORD)result != -1)
    result = close(result);
  *((_DWORD *)this + 60) = -1;
  return result;
}

uint64_t RPSocket_fd::shutdown_fd(RPSocket_fd *this, void *a2)
{
  return (*(uint64_t (**)(RPSocket_fd *))(*(_QWORD *)this + 112))(this);
}

uint64_t FinalizeRPSocket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(v9 + 40);
  if (v10)
    goto LABEL_5;
  if (getDefaultLogCtx_once != -1)
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  v10 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5)
      LogMsg(5u, v10, (uint64_t)"RPSocket.cpp", 368, (uint64_t)"FinalizeRPSocket", 0, CFSTR("Closed %@ after reading %lld bytes and writing %lld bytes\n"), a8, a1);
  }
  if (*(_QWORD *)(v9 + 208))
  {
    v11 = *(_QWORD *)(v9 + 40);
    if (v11)
      goto LABEL_12;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v11 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_12:
      if (*(int *)(v11 + 16) >= 5)
        LogMsg(5u, v11, (uint64_t)"RPSocket.cpp", 371, (uint64_t)"FinalizeRPSocket", 0, CFSTR("Ending os transaction for %@\n"), a8, a1);
    }
    os_release(*(void **)(v9 + 208));
    *(_QWORD *)(v9 + 208) = 0;
  }
  result = *(_QWORD *)(a1 + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 88))(result);
  return result;
}

CFStringRef RPSocketCopyDescription(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  const void *v4;
  CFStringRef v5;
  CFStringRef v6;

  v1 = *(_QWORD *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 136));
  v2 = *(const void **)(v1 + 16);
  if (v2)
    CFRetain(*(CFTypeRef *)(v1 + 16));
  pthread_mutex_unlock((pthread_mutex_t *)(v1 + 136));
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 40))(v1);
  v4 = (const void *)v3;
  if (v3)
    v5 = CFStringCreateWithFormat(0, 0, CFSTR("<RPSocket %p: %@ %@>"), *(_QWORD *)(v1 + 8), v2, v3);
  else
    v5 = CFStringCreateWithFormat(0, 0, CFSTR("<RPSocket %p: %@>"), *(_QWORD *)(v1 + 8), v2);
  v6 = v5;
  if (v2)
    CFRelease(v2);
  if (v4)
    CFRelease(v4);
  return v6;
}

uint64_t RPCreateSocketForHost(unsigned int a1)
{
  int v2;
  int v3;
  uint64_t v4;
  int *v5;
  char *v6;
  CFStringRef v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  char *v11;
  CFStringRef v12;
  uint64_t v13;
  sockaddr v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v15.sa_data[6] = 0;
  v2 = socket(2, 1, 0);
  if (v2 == -1)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v9 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v10 = __error();
      v11 = strerror(*v10);
      v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
      LogMsg(3u, v9, (uint64_t)"RPSocket.cpp", 1704, (uint64_t)"RPCreateSocketForHost", v12, CFSTR("socket(port=%d)"), v13, a1);
    }
    return 0;
  }
  v3 = v2;
  *(_WORD *)&v15.sa_len = 528;
  *(_WORD *)v15.sa_data = __rev16(a1);
  *(_DWORD *)&v15.sa_data[2] = 16777343;
  if (connect(v2, &v15, 0x10u))
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v4 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
      if (*(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      {
        v5 = __error();
        v6 = strerror(*v5);
        v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
        LogMsg(3u, v4, (uint64_t)"RPSocket.cpp", 1716, (uint64_t)"RPCreateSocketForHost", v7, CFSTR("connect(port=%d)"), v8, a1);
      }
    }
    close(v3);
    return 0;
  }
  return RPCreateSocketForFD(v3, 3);
}

void FinalizeLogCtx(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 24);
  if (v1)
    CFRelease(v1);
}

CFStringRef LogCtxCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<LogCtxRef: %p>"), a1);
}

uint64_t InitLog(uint64_t *a1)
{
  uint64_t (*v2)(int, int, char *);
  int v3;
  uint64_t result;

  if (isatty(2))
  {
    logHandle = *MEMORY[0x24BDAC8D8];
    v2 = LogToFileHandle;
  }
  else
  {
    v2 = 0;
  }
  if (isRestoreOS())
  {
    v3 = open("/dev/console", 131073);
    logHandle = (uint64_t)fdopen(v3, "w");
    v2 = LogToFileHandle;
  }
  result = __CreateCFObject((dispatch_once_t *)&createLogCtx___reg, 40);
  *(_DWORD *)(result + 16) = 5;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = v2;
  *a1 = result;
  loggerReady = 1;
  return result;
}

uint64_t LogToFileHandle(int a1, int a2, char *a3)
{
  uint64_t result;

  if (logHandle)
    return fputs(a3, (FILE *)logHandle);
  return result;
}

void LogMsg(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  const char *v16;
  __CFArray *Mutable;
  CFStringRef v18;
  uint64_t v19;
  int v20;
  CFStringRef v21;
  CFStringRef v22;
  CFStringRef v23;
  const __CFString *v24;
  const __CFString *v25;
  const char *v26;
  CFIndex Length;
  CFIndex v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, const char *);
  size_t v33;
  int v34;
  CFStringRef v35;
  CFStringRef cf;
  CFTypeRef v37;
  tm v38;
  time_t v39;
  va_list arguments;
  char cStr[100];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v16 = getprogname();
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  arguments = (va_list)&a9;
  if (*(_QWORD *)(a2 + 32))
  {
    v39 = time(0);
    memset(&v38, 0, sizeof(v38));
    localtime_r(&v39, &v38);
    if (strftime(cStr, 0x63uLL, "%b %d %H:%M:%S ", &v38)
      && (v18 = CFStringCreateWithCString(0, cStr, 0x8000100u)) != 0)
    {
      cf = v18;
      CFArrayAppendValue(Mutable, v18);
    }
    else
    {
      cf = 0;
    }
    v19 = getpid();
    if (a1 >= 7)
      v20 = 7;
    else
      v20 = a1;
    v21 = CFStringCreateWithFormat(0, 0, CFSTR("%s[%d] <%s>: "), v16, v19, LevelString_levelName[v20]);
    if (v21)
      CFArrayAppendValue(Mutable, v21);
  }
  else
  {
    cf = 0;
    v21 = 0;
  }
  v22 = CFStringCreateWithFormat(0, 0, CFSTR("%s:%d(%s): "), a3, a4, a5);
  if (v22)
    CFArrayAppendValue(Mutable, v22);
  v23 = CFStringCreateWithFormatAndArguments(0, 0, a7, arguments);
  if (v23)
    CFArrayAppendValue(Mutable, v23);
  if (a6)
  {
    CFArrayAppendValue(Mutable, CFSTR(": "));
    CFArrayAppendValue(Mutable, a6);
  }
  v35 = v21;
  v37 = a6;
  v24 = CFStringCreateByCombiningStrings(0, Mutable, &stru_24C35BD20);
  v25 = v24;
  v26 = "failed to convert string\n";
  if (v24)
  {
    Length = CFStringGetLength(v24);
    v28 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 2;
    v29 = (char *)malloc_type_malloc(v28, 0x8D7FBDB6uLL);
    if (CFStringGetCString(v25, v29, v28, 0x8000100u))
      v26 = v29;
  }
  else
  {
    v29 = 0;
  }
  if (a1 >= 7)
    v30 = 7;
  else
    v30 = a1;
  v31 = a2;
  v32 = *(void (**)(uint64_t, _QWORD, const char *))(a2 + 32);
  if (v32)
  {
    v33 = strlen(v26);
    if (v26[v33 - 1] != 10)
    {
      *(_WORD *)&v26[v33] = 10;
      v32 = *(void (**)(uint64_t, _QWORD, const char *))(v31 + 32);
    }
    v32(v30, *(_QWORD *)(v31 + 24), v26);
  }
  else
  {
    if (a1 >= 5)
      v34 = 5;
    else
      v34 = a1;
    asl_log(0, 0, v34, "%s", v26);
  }
  if (v29)
    free(v29);
  if (cf)
    CFRelease(cf);
  if (v35)
    CFRelease(v35);
  if (v22)
    CFRelease(v22);
  if (v23)
    CFRelease(v23);
  if (v25)
    CFRelease(v25);
  if (Mutable)
    CFRelease(Mutable);
  if (v37)
    CFRelease(v37);
}

uint64_t __CreateCFObject(dispatch_once_t *context, uint64_t a2)
{
  dispatch_once_t *v4;
  dispatch_once_t v5;
  size_t v6;
  uint64_t Instance;
  uint64_t v8;

  v5 = context[16];
  v4 = context + 16;
  if (v5 != -1)
    dispatch_once_f(v4, context, (dispatch_function_t)RegisterClass);
  v6 = a2 - 16;
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (Instance)
    bzero((void *)(Instance + 16), v6);
  return v8;
}

uint64_t RegisterClass(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[1];
  a1[5] = *a1;
  a1[8] = v2;
  a1[12] = a1[2];
  result = _CFRuntimeRegisterClass();
  a1[3] = result;
  return result;
}

__CFDictionary *createCommandDictionaryWithArgs(const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  __CFDictionary *Mutable;
  uint64_t v12;
  const void *v13;
  const void **v14;
  const void **v15;
  const void **v17;
  const void **v18;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("Command"), a1);
  v17 = (const void **)&a10;
  v13 = key;
  if (key)
  {
    while (1)
    {
      v14 = v17;
      v18 = v17 + 1;
      if (!*v14)
        break;
      CFDictionarySetValue(Mutable, v13, *v14);
      v15 = v18;
      v17 = v18 + 1;
      v13 = *v15;
      if (!*v15)
        return Mutable;
    }
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 119, (uint64_t)"createCommandDictionaryWithArgs", 0, CFSTR("no value for key %@"), v12, (uint64_t)v13);
  }
  return Mutable;
}

void setDictionaryIntValue(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void __copyEntitlementsForSocketPeer_block_invoke()
{
  CFPropertyListRef v0;
  CFTypeID v1;

  v0 = CFPreferencesCopyAppValue(CFSTR("ClientListenerDelay"), CFSTR("com.apple.PurpleReverseProxy"));
  if (v0
    || (v0 = CFPreferencesCopyValue(CFSTR("ClientListenerDelay"), CFSTR("com.apple.PurpleReverseProxy"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570])) != 0)
  {
    v1 = CFGetTypeID(v0);
    if (v1 == CFNumberGetTypeID())
      CFNumberGetValue((CFNumberRef)v0, kCFNumberSInt32Type, &copyEntitlementsForSocketPeer_sleep_delay);
    CFRelease(v0);
  }
}

uint64_t isRestoreOS()
{
  const __CFString *v0;
  uint64_t v1;
  const void *v2;
  CFComparisonResult v3;
  uint64_t v4;
  _BOOL8 v5;
  CFComparisonResult v6;
  const __CFDictionary *v7;
  uint64_t v8;
  const void *Value;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  size_t v19;
  char __s1[16];
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
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
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
  *(_OWORD *)__s1 = 0u;
  v21 = 0u;
  v19 = 256;
  v0 = (const __CFString *)MGCopyAnswerWithError();
  if (v0)
  {
    v2 = v0;
    v3 = CFStringCompare(v0, CFSTR("Restore"), 0);
    v5 = v3 == kCFCompareEqualTo;
    if (loggerReady == 1)
    {
      v6 = v3;
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 5)
        LogMsg(5u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 372, (uint64_t)"isRestoreOS", 0, CFSTR("Asking MobileGestalt for ReleaseType, isRestoreOS: %d\n"), v4, v6 == kCFCompareEqualTo);
    }
    goto LABEL_17;
  }
  if (loggerReady == 1)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 376, (uint64_t)"isRestoreOS", 0, CFSTR("Asking for kMGQReleaseType failed: %d\n"), v1, 0);
  }
  v7 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v7)
  {
    if (loggerReady != 1)
      goto LABEL_38;
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 318, (uint64_t)"isRestoreOSSystemVersion", 0, CFSTR("CFCopySystemVersionDictionary failed\n"), v8, v17);
LABEL_32:
    if (loggerReady == 1)
    {
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
        LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 383, (uint64_t)"isRestoreOS", 0, CFSTR("Checking SystemVersion failed: %d\n"), v8, 0xFFFFFFFFLL);
    }
LABEL_38:
    v18 = sysctlbyname("kern.bootargs", __s1, &v19, 0, 0);
    if (v18)
    {
      if (loggerReady != 1)
        return 0;
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      v13 = getDefaultLogCtx_ctx;
      if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3)
        return 0;
      v17 = v18;
      v14 = CFSTR("Calling sysctlbyname for kern.bootargs failed: %d\n");
      v15 = 3;
      v16 = 392;
    }
    else
    {
      if (strstr(__s1, "rd=md0"))
        return 1;
      if (loggerReady != 1)
        return 0;
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      v13 = getDefaultLogCtx_ctx;
      if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 5)
        return 0;
      v14 = CFSTR("Did not find rd=md0 in bootargs, assuming not RestoreOS\n");
      v15 = 5;
      v16 = 390;
    }
    LogMsg(v15, v13, (uint64_t)"Utilities.c", v16, (uint64_t)"isRestoreOS", 0, v14, v12, v17);
    return 0;
  }
  v2 = v7;
  Value = CFDictionaryGetValue(v7, CFSTR("ReleaseType"));
  if (!Value)
  {
    if (loggerReady == 1)
    {
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
        LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 325, (uint64_t)"isRestoreOSSystemVersion", 0, CFSTR("CFDictionaryGetValue for ReleaseType failed\n"), v10, v17);
    }
    CFRelease(v2);
    goto LABEL_32;
  }
  v5 = CFEqual(Value, CFSTR("Restore")) != 0;
LABEL_17:
  CFRelease(v2);
  return v5;
}

__CFDictionary *_RPCopyProxyDictionaryWithOptions(const __CFURL *a1, int a2, CFTypeRef cf, int a4, int a5, int a6, int a7, uint64_t a8)
{
  CFTypeID v11;
  _BOOL4 v12;
  CFStringRef v13;
  __CFError *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  __CFDictionary *CommandDictionaryWithArgs;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFIndex v29;
  __CFData *Mutable;
  __CFData *v31;
  UInt8 *MutableBytePtr;
  uint64_t v33;
  CFPropertyListRef v34;
  uint64_t v35;
  const void *v36;
  CFTypeID v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  char v50;
  __CFDictionary *v51;
  uint64_t v52;
  void *key;
  uint64_t v55;
  __CFError *v56;
  int v57;
  CFErrorRef block[6];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;

  v12 = !cf
     || (v11 = CFGetTypeID(cf), v11 != CFDictionaryGetTypeID())
     || CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("TestReachability")) != (const void *)*MEMORY[0x24BDBD268];
  if (a1)
    v13 = CFURLCopyHostName(a1);
  else
    v13 = 0;
  if (v13)
    v14 = (__CFError *)v13;
  else
    v14 = (__CFError *)CFSTR("www.apple.com");
  if (!v12)
    goto LABEL_19;
  if (networkIsReachable_once != -1)
    dispatch_once(&networkIsReachable_once, &__block_literal_global_79);
  if ((networkIsReachable_performReachabilityTest & 1) == 0)
    goto LABEL_19;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2000000000;
  v62 = 0;
  block[0] = (CFErrorRef)MEMORY[0x24BDAC760];
  block[1] = (CFErrorRef)0x40000000;
  block[2] = (CFErrorRef)__networkIsReachable_block_invoke_2;
  block[3] = (CFErrorRef)&unk_24C35B920;
  block[4] = (CFErrorRef)&v59;
  block[5] = v14;
  dispatch_sync((dispatch_queue_t)networkIsReachable_reachableDictQueue, block);
  v15 = v60[3];
  if (!v15
    || (v57 = 0, !networkIsReachable_SCNetworkReachabilityGetFlags_func(v15, &v57))
    || (v16 = v57, (v57 & 2) == 0))
  {
    _Block_object_dispose(&v59, 8);
    goto LABEL_19;
  }
  if ((v57 & 4) == 0)
  {
    _Block_object_dispose(&v59, 8);
LABEL_130:
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 223, (uint64_t)"_RPCopyProxyDictionaryWithOptions", 0, CFSTR("%@ is reachable, assuming we don't need a proxy dictionary\n"), a8, (uint64_t)v14);
    goto LABEL_122;
  }
  _Block_object_dispose(&v59, 8);
  if ((v16 & 0x28) != 0 && (v16 & 0x10) == 0)
    goto LABEL_130;
LABEL_19:
  if (a2)
    v17 = 1081;
  else
    v17 = 1080;
  CommandDictionaryWithArgs = createCommandDictionaryWithArgs(CFSTR("Ping"), a2, (int)cf, a4, a5, a6, a7, a8, 0, v55);
  v20 = 0;
  do
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 5)
      LogMsg(5u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 58, (uint64_t)"sendPingMessage", 0, CFSTR("attampting sendProxyControlMessage\n"), v18, (uint64_t)key);
    v21 = RPCreateSocketForHost((unsigned __int16)v17);
    if (v21)
    {
      v22 = (_QWORD *)v21;
      LOWORD(v57) = -17494;
      RPSocket::resume(*(RPSocket **)(v21 + 16));
      if ((RPSocketWrite((uint64_t)v22, (uint64_t)&v57, 2) & 1) == 0)
      {
        if (getDefaultLogCtx_once != -1)
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        v39 = getDefaultLogCtx_ctx;
        if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3)
          goto LABEL_90;
        v40 = 29;
        v41 = CFSTR("RPSocketWrite failed\n");
        goto LABEL_89;
      }
      if ((RPSocketWriteDictionary((uint64_t)v22, CommandDictionaryWithArgs, v23, v24, v25, v26, v27, v28) & 1) == 0)
      {
        if (getDefaultLogCtx_once != -1)
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        v39 = getDefaultLogCtx_ctx;
        if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3)
          goto LABEL_90;
        v40 = 34;
        v41 = CFSTR("RPSocketWriteDictionary failed\n");
        goto LABEL_89;
      }
      block[0] = 0;
      LODWORD(v59) = -1;
      if (!RPSocketReadBuffer((uint64_t)v22, (uint64_t)&v59, 4) || (_DWORD)v59 == -1)
      {
        v42 = *(_QWORD *)(v22[2] + 40);
        if (v42)
          goto LABEL_54;
        if (getDefaultLogCtx_once != -1)
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        v42 = getDefaultLogCtx_ctx;
        if (getDefaultLogCtx_ctx)
        {
LABEL_54:
          if (*(int *)(v42 + 16) >= 3)
            LogMsg(3u, v42, (uint64_t)"RPSocket.cpp", 561, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("failed to read length from %@\n"), v28, (uint64_t)v22);
        }
      }
      else
      {
        v29 = (int)v59;
        Mutable = CFDataCreateMutable(0, (int)v59);
        if (Mutable)
        {
          v31 = Mutable;
          CFDataSetLength(Mutable, v29);
          MutableBytePtr = CFDataGetMutableBytePtr(v31);
          if ((RPSocketReadBuffer((uint64_t)v22, (uint64_t)MutableBytePtr, v29) & 1) != 0)
          {
            v34 = CFPropertyListCreateWithData(0, v31, 2uLL, 0, block);
            v36 = v34;
            if (!v34 || block[0])
            {
              v45 = *(_QWORD *)(v22[2] + 40);
              if (v45)
                goto LABEL_72;
              if (getDefaultLogCtx_once != -1)
                dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
              v45 = getDefaultLogCtx_ctx;
              if (getDefaultLogCtx_ctx)
              {
LABEL_72:
                if (*(int *)(v45 + 16) >= 3)
                  LogMsg(3u, v45, (uint64_t)"RPSocket.cpp", 579, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("failed to deserialize dictionary from %@: %@\n"), v35, (uint64_t)v22);
              }
              CFRelease(v31);
              if (v36)
                goto LABEL_91;
              goto LABEL_84;
            }
            v56 = v14;
            v37 = CFGetTypeID(v34);
            if (v37 == CFDictionaryGetTypeID())
            {
              CFRelease(v31);
              v14 = v56;
LABEL_91:
              RPSocketInvalidate((uint64_t)v22);
              CFRelease(v22);
              goto LABEL_92;
            }
            v46 = *(_QWORD *)(v22[2] + 40);
            if (v46)
              goto LABEL_80;
            if (getDefaultLogCtx_once != -1)
              dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
            v46 = getDefaultLogCtx_ctx;
            if (getDefaultLogCtx_ctx)
            {
LABEL_80:
              if (*(int *)(v46 + 16) >= 3)
                LogMsg(3u, v46, (uint64_t)"RPSocket.cpp", 584, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("plist from %@ was not a dictionary\n"), v38, (uint64_t)v22);
            }
            CFRelease(v36);
            v14 = v56;
          }
          else
          {
            v44 = *(_QWORD *)(v22[2] + 40);
            if (v44)
              goto LABEL_66;
            if (getDefaultLogCtx_once != -1)
              dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
            v44 = getDefaultLogCtx_ctx;
            if (getDefaultLogCtx_ctx)
            {
LABEL_66:
              if (*(int *)(v44 + 16) >= 3)
                LogMsg(3u, v44, (uint64_t)"RPSocket.cpp", 573, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("RPSocketReadBuffer failed from %@\n"), v33, (uint64_t)v22);
            }
          }
          CFRelease(v31);
        }
        else
        {
          v43 = *(_QWORD *)(v22[2] + 40);
          if (v43)
            goto LABEL_60;
          if (getDefaultLogCtx_once != -1)
            dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
          v43 = getDefaultLogCtx_ctx;
          if (getDefaultLogCtx_ctx)
          {
LABEL_60:
            if (*(int *)(v43 + 16) >= 3)
              LogMsg(3u, v43, (uint64_t)"RPSocket.cpp", 567, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("CFDataCreateMutable failed for len %d for %@\n"), v28, v29);
          }
        }
      }
LABEL_84:
      if (getDefaultLogCtx_once != -1)
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      v39 = getDefaultLogCtx_ctx;
      if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3)
        goto LABEL_90;
      v40 = 40;
      v41 = CFSTR("RPSocketReadDictionary failed\n");
LABEL_89:
      LogMsg(3u, v39, (uint64_t)"ReverseProxyDevice.c", v40, (uint64_t)"sendProxyControlMessage", 0, v41, v28, (uint64_t)key);
LABEL_90:
      v36 = 0;
      goto LABEL_91;
    }
    v36 = 0;
LABEL_92:
    if (v20 > 1)
      break;
    ++v20;
  }
  while (!v36);
  if (!v36)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v47 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v48 = CFSTR("sendProxyControlMessage failed\n");
      v49 = 63;
LABEL_106:
      LogMsg(3u, v47, (uint64_t)"ReverseProxyDevice.c", v49, (uint64_t)"sendPingMessage", 0, v48, v18, (uint64_t)key);
    }
LABEL_107:
    v50 = 0;
    if (!CommandDictionaryWithArgs)
      goto LABEL_109;
LABEL_108:
    CFRelease(CommandDictionaryWithArgs);
    goto LABEL_109;
  }
  if (CFDictionaryGetValue((CFDictionaryRef)v36, CFSTR("Pong")) != (const void *)*MEMORY[0x24BDBD270])
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    v47 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      v48 = CFSTR("Unexpected ping response\n");
      v49 = 68;
      goto LABEL_106;
    }
    goto LABEL_107;
  }
  v50 = 1;
  if (CommandDictionaryWithArgs)
    goto LABEL_108;
LABEL_109:
  if (v36)
    CFRelease(v36);
  if ((v50 & 1) == 0)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 83, (uint64_t)"copyProxyDictionaryForURL", 0, CFSTR("Failed to ping host proxy service, returning NULL proxy dictionary\n"), v18, (uint64_t)key);
LABEL_122:
    v51 = 0;
    goto LABEL_123;
  }
  v51 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v51, (const void *)*MEMORY[0x24BDBD5C0], CFSTR("127.0.0.1"));
  setDictionaryIntValue(v51, (const void *)*MEMORY[0x24BDBD5C8], v17);
  if (getDefaultLogCtx_once != -1)
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 5)
    LogMsg(5u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 90, (uint64_t)"copyProxyDictionaryForURL", 0, CFSTR("Returning 'socks://127.0.0.1:%d/' for '%@'\n"), v52, v17);
LABEL_123:
  CFRelease(v14);
  return v51;
}

void __networkIsReachable_block_invoke_2(uint64_t a1)
{
  CFIndex Length;
  CFIndex v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, dispatch_queue_global_t);
  uint64_t v9;
  dispatch_queue_global_t global_queue;
  _QWORD v11[5];

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)networkIsReachable_reachableDict, *(const void **)(a1 + 40));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    Length = CFStringGetLength(*(CFStringRef *)(a1 + 40));
    v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v4 = (char *)malloc_type_malloc(v3, 0x6E438B87uLL);
    if (v4)
    {
      v5 = v4;
      if (CFStringGetCString(*(CFStringRef *)(a1 + 40), v4, v3, 0x8000100u))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = networkIsReachable_SCNetworkReachabilityCreateWithName_func(0, v5);
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (v6)
        {
          v7 = *(_QWORD *)(a1 + 40);
          v11[0] = 0;
          v11[1] = v7;
          v11[2] = MEMORY[0x24BDBC2A8];
          v11[3] = MEMORY[0x24BDBC298];
          v11[4] = 0;
          networkIsReachable_SCNetworkReachabilitySetCallback_func(v6, reachabilityCB, v11);
          v8 = (void (*)(uint64_t, dispatch_queue_global_t))networkIsReachable_SCNetworkReachabilitySetDispatchQueue_func;
          v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          global_queue = dispatch_get_global_queue(0, 0);
          v8(v9, global_queue);
          CFDictionarySetValue((CFMutableDictionaryRef)networkIsReachable_reachableDict, *(const void **)(a1 + 40), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
          CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        }
      }
      free(v5);
    }
  }
}

void reachabilityCB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (getDefaultLogCtx_once != -1)
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  if (getDefaultLogCtx_ctx)
  {
    if (*(int *)(getDefaultLogCtx_ctx + 16) >= 7)
      LogMsg(7u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 122, (uint64_t)"reachabilityCB", 0, CFSTR("%@ reachable? %s\n"), a8, a3);
  }
}

uint64_t __networkIsReachable_block_invoke()
{
  uint64_t result;
  void *v1;

  result = isRestoreOS();
  if ((result & 1) == 0)
  {
    result = (uint64_t)dlopen("/System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration", 1);
    if (result)
    {
      v1 = (void *)result;
      networkIsReachable_SCNetworkReachabilityCreateWithName_func = dlsym((void *)result, "SCNetworkReachabilityCreateWithName");
      networkIsReachable_SCNetworkReachabilitySetCallback_func = dlsym(v1, "SCNetworkReachabilitySetCallback");
      networkIsReachable_SCNetworkReachabilitySetDispatchQueue_func = dlsym(v1, "SCNetworkReachabilitySetDispatchQueue");
      result = (uint64_t)dlsym(v1, "SCNetworkReachabilityGetFlags");
      networkIsReachable_SCNetworkReachabilityGetFlags_func = (_UNKNOWN *)result;
      if (networkIsReachable_SCNetworkReachabilityCreateWithName_func)
      {
        if (networkIsReachable_SCNetworkReachabilitySetCallback_func
          && networkIsReachable_SCNetworkReachabilitySetDispatchQueue_func)
        {
          if (result)
          {
            networkIsReachable_reachableDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            result = (uint64_t)dispatch_queue_create("reachableDictQueue", 0);
            networkIsReachable_reachableDictQueue = result;
            networkIsReachable_performReachabilityTest = 1;
          }
        }
      }
    }
  }
  return result;
}

__CFDictionary *RPCopyProxyDictionary(const __CFURL *a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  v2 = isRestoreOS();
  return _RPCopyProxyDictionaryWithOptions(a1, v2, 0, v3, v4, v5, v6, v7);
}

__CFDictionary *RPCopyProxyDictionaryWithOptions(const __CFURL *a1, const void *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v4 = isRestoreOS();
  return _RPCopyProxyDictionaryWithOptions(a1, v4, a2, v5, v6, v7, v8, v9);
}

_QWORD *_RPRegisterForAvailability(int a1, const void *a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  __CFDictionary *CommandDictionaryWithArgs;
  _QWORD *v11;
  void *v12;
  uint64_t v14;

  if (!a2)
    return 0;
  CommandDictionaryWithArgs = createCommandDictionaryWithArgs(CFSTR("RegisterNotify"), (int)a2, a3, a4, a5, a6, a7, a8, 0, v14);
  v11 = _RPRegistrationConnectAndSendMessage(a1, CommandDictionaryWithArgs);
  if (v11)
  {
    v12 = _Block_copy(a2);
    RPSocket::set_client(v11[2], (uint64_t)_RPRegistrationCallback, v12);
    _Block_release(v12);
  }
  if (CommandDictionaryWithArgs)
    CFRelease(CommandDictionaryWithArgs);
  return v11;
}

const void *_RPRegistrationConnectAndSendMessage(int a1, const void *a2)
{
  unsigned int v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
    v3 = 1084;
  else
    v3 = 1083;
  v4 = RPCreateSocketForHost(v3);
  v5 = (const void *)v4;
  if (v4)
  {
    RPSocket::resume(*(RPSocket **)(v4 + 16));
    if ((RPSocketWriteDictionary((uint64_t)v5, a2, v6, v7, v8, v9, v10, v11) & 1) == 0)
    {
      RPSocketInvalidate((uint64_t)v5);
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t _RPRegistrationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int v13;

  if (a2 != 2)
  {
    if (getDefaultLogCtx_once != -1)
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 268, (uint64_t)"_RPRegistrationCallback", 0, CFSTR("unexpected event %lu\n"), a8, a2);
    goto LABEL_13;
  }
  v13 = -1;
  if (!RPSocketReadBuffer(a1, (uint64_t)&v13, 4) || v13 == -1)
  {
LABEL_13:
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3);
    return RPSocketInvalidate(a1);
  }
  if (v13)
    v10 = 1;
  else
    v10 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v10);
}

_QWORD *RPRegisterForAvailability(const void *a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v2 = isRestoreOS();
  return _RPRegisterForAvailability(v2, a1, v3, v4, v5, v6, v7, v8);
}

uint64_t RPRegistrationResume(uint64_t a1)
{
  return RPSocket::resume(*(RPSocket **)(a1 + 16));
}

void _RPSetLogLevel(int a1, int a2, int a3, int a4, int a5, int a6, int a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *CommandDictionaryWithArgs;
  uint64_t *v13;
  uint64_t *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  char *v20;
  _QWORD aBlock[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = 0;
  if (getDefaultLogCtx_once != -1)
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  v10 = getDefaultLogCtx_ctx;
  if (a2 >= 7)
    LODWORD(v11) = 7;
  else
    LODWORD(v11) = a2;
  if (a2 < 0)
    LODWORD(v11) = 0;
  if (a2 == -1)
    v11 = 5;
  else
    v11 = v11;
  *(_DWORD *)(getDefaultLogCtx_ctx + 16) = v11;
  if (v11 >= 3)
  {
    v20 = LevelString_levelName[v11];
    LogMsg(3u, v10, (uint64_t)"Logging.c", 111, (uint64_t)"SetDefaultLogLevel", 0, CFSTR("set default log level to %d (%s)\n"), a8, v11);
  }
  CommandDictionaryWithArgs = createCommandDictionaryWithArgs(CFSTR("SetLogLevel"), v10, a3, a4, a5, a6, a7, a8, 0, (uint64_t)v20);
  setDictionaryIntValue(CommandDictionaryWithArgs, CFSTR("Level"), a2);
  v13 = (uint64_t *)_RPRegistrationConnectAndSendMessage(a1, CommandDictionaryWithArgs);
  if (v13)
  {
    v14 = v13;
    v15 = dispatch_queue_create("com.apple.PurpleReverseProxy.SetLogLevel", 0);
    v16 = dispatch_semaphore_create(0);
    v23[3] = (uint64_t)v16;
    v17 = v14[2];
    RPSocket::suspend((RPSocket *)v17);
    pthread_mutex_lock((pthread_mutex_t *)(v17 + 136));
    v18 = *(NSObject **)(v17 + 48);
    if (v18)
      dispatch_release(v18);
    if (v15)
    {
      *(_QWORD *)(v17 + 48) = v15;
      dispatch_retain(v15);
    }
    else
    {
      *(_QWORD *)(v17 + 48) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v17 + 136));
    RPSocket::resume((RPSocket *)v17);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___RPSetLogLevel_block_invoke;
    aBlock[3] = &unk_24C35B8B8;
    aBlock[4] = &v22;
    v19 = _Block_copy(aBlock);
    RPSocket::set_client(v14[2], (uint64_t)BlockInvoker, v19);
    _Block_release(v19);
    RPSocket::resume((RPSocket *)v14[2]);
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    RPSocketInvalidate((uint64_t)v14);
    CFRelease(v14);
    if (CommandDictionaryWithArgs)
      goto LABEL_22;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    if (CommandDictionaryWithArgs)
LABEL_22:
      CFRelease(CommandDictionaryWithArgs);
  }
  if (v16)
    dispatch_release(v16);
  if (v15)
    dispatch_release(v15);
  _Block_object_dispose(&v22, 8);
}

void RPSetLogLevel(int a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  v2 = isRestoreOS();
  _RPSetLogLevel(v2, a1, v3, v4, v5, v6, v7, v8);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x24BDBC518](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7A0](anURL);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
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

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24C35B488();
}

uint64_t operator new()
{
  return off_24C35B490();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x24BDAD1C0](client, msg, *(_QWORD *)&level, format);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t csops()
{
  return MEMORY[0x24BDADC00]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFA8](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x24BDAE6A0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x24BDAE968](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x24BDAE998]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x24BDAFDB0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

