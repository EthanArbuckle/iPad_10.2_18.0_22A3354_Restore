uint64_t photosPreferenceChanged(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a2, sel_photosPreferencesChanged, 0);
    return objc_msgSend(a2, "photosPreferencesChanged");
  }
  return result;
}

uint64_t FigJPEGIOSurfacePoolGetTypeID()
{
  MEMORY[0x1BCCC665C](&FigJPEGIOSurfacePoolGetTypeID_registerOnce, iosp_registerIOSurfaceMemPool);
  return sIOSurfacePoolID;
}

uint64_t iosp_registerIOSurfaceMemPool()
{
  uint64_t result;

  sIOSurfacePoolClass = 0;
  *(_QWORD *)algn_1EF2346E8 = "FigIOSurfaceMemPool";
  qword_1EF2346F0 = (uint64_t)iosp_init;
  unk_1EF2346F8 = 0;
  qword_1EF234700 = (uint64_t)iosp_finalize;
  unk_1EF234708 = 0;
  qword_1EF234710 = 0;
  unk_1EF234718 = 0;
  qword_1EF234720 = (uint64_t)iosp_copyDebugDesc;
  result = _CFRuntimeRegisterClass();
  sIOSurfacePoolID = result;
  return result;
}

double iosp_init(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t iosp_finalize(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFDictionary *v7;
  const void *v8;
  uint64_t result;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
  {
    dispatch_source_cancel(v2);
    if (*(_BYTE *)(a1 + 180))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 72));
      *(_BYTE *)(a1 + 180) = 0;
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
  }
  v3 = *(NSObject **)(a1 + 80);
  if (v3)
    dispatch_release(v3);
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v5 = 0;
      v6 = 0;
      do
      {
        iosp_poolDestroySubPool(0, (uint64_t *)(*(_QWORD *)(a1 + 32) + v5));
        ++v6;
        v5 += 80;
      }
      while (*(_QWORD *)(a1 + 56) > v6);
      v4 = *(void **)(a1 + 32);
    }
    free(v4);
  }
  v7 = *(const __CFDictionary **)(a1 + 40);
  if (v7)
  {
    CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)iosp_poolDestroySubPool, 0);
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  v8 = *(const void **)(a1 + 184);
  if (v8)
    CFRelease(v8);
  free(*(void **)(a1 + 48));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return FigSimpleMutexDestroy();
  return result;
}

CFMutableStringRef iosp_copyDebugDesc(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  unint64_t v4;
  const __CFDictionary *v5;
  double v6;
  __int128 context;
  __int128 v9;
  CFMutableStringRef Mutable;

  context = 0u;
  v9 = 0u;
  v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<FigJPEGIOSurfacePool %p> {\n  Subpools:\n\n"), a1);
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 56))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      iosp_poolCollectStats(0, (int64x2_t *)(*(_QWORD *)(a1 + 32) + v3), (uint64_t)&context);
      ++v4;
      v3 += 80;
    }
    while (*(_QWORD *)(a1 + 56) > v4);
  }
  v5 = *(const __CFDictionary **)(a1 + 40);
  if (v5)
    CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)iosp_poolCollectStats, &context);
  if (*((_QWORD *)&context + 1))
    v6 = (double)*((unint64_t *)&context + 1)
       * 100.0
       / (double)(unint64_t)(v9 + *((_QWORD *)&context + 1));
  else
    v6 = 0.0;
  CFStringAppendFormat(Mutable, 0, CFSTR("  Subpool count:         %d\n  Total size:            %d bytes\n  Total IOSurface count: %d\n  Deep cleanup count:    %d\n  One-shot allocations:  %d\n  Allocations:           %d\n  Total hits:            %d\n  Total misses:          %d\n  Total deletes:         %d\n  Hit ratio:             %.2f%%\n}"), (_QWORD)context, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(unsigned int *)(a1 + 176), (_QWORD)v9 + *((_QWORD *)&context + 1), *((_QWORD *)&context + 1), v9, *(_QWORD *)&v6);
  return Mutable;
}

int64x2_t iosp_poolCollectStats(uint64_t a1, int64x2_t *a2, uint64_t a3)
{
  __CFString *v6;
  int v7;
  const char *v8;
  int64x2_t result;

  CFStringAppendFormat(*(CFMutableStringRef *)(a3 + 32), 0, CFSTR("    subpool: %d\n"), *(_QWORD *)a3);
  v6 = *(__CFString **)(a3 + 32);
  if (a1)
  {
    v7 = a2[4].i32[2];
    if (v7 <= 1111970368)
    {
      switch(v7)
      {
        case 32:
          v8 = "ARGB";
          goto LABEL_20;
        case 875704422:
          v8 = "420f";
          goto LABEL_20;
        case 875704438:
          v8 = "420v";
          goto LABEL_20;
      }
    }
    else if (v7 > 2037741157)
    {
      if (v7 == 2037741158)
      {
        v8 = "yuvf";
        goto LABEL_20;
      }
      if (v7 == 2037741171)
      {
        v8 = "yuvs";
        goto LABEL_20;
      }
    }
    else
    {
      if (v7 == 1111970369)
      {
        v8 = "BGRA";
        goto LABEL_20;
      }
      if (v7 == 1999843442)
      {
        v8 = "w30r";
LABEL_20:
        CFStringAppendFormat(v6, 0, CFSTR("    image:   %d x %d, (%d x %d padded), %s\n"), a2[3].u32[2], a2[3].u32[3], a2[4].u32[0], a2[4].u32[1], v8);
        goto LABEL_21;
      }
    }
    v8 = "unknown";
    goto LABEL_20;
  }
  CFStringAppendFormat(v6, 0, CFSTR("    size:    %d\n"), a2[1].i64[0]);
LABEL_21:
  CFStringAppendFormat(*(CFMutableStringRef *)(a3 + 32), 0, CFSTR("    count:   %d\n    hits:    %d\n    misses:  %d\n    deletes: %d\n\n"), a2[1].i64[1], a2[2].i64[0], a2[2].i64[1], a2[3].i64[0]);
  ++*(_QWORD *)a3;
  result = vaddq_s64(*(int64x2_t *)(a3 + 8), a2[2]);
  *(int64x2_t *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 24) += a2[3].i64[0];
  return result;
}

void iosp_poolDestroySubPool(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  if (*a2)
  {
    do
    {
      v5 = *(_QWORD *)(v4 + 32);
      CFRelease(*(CFTypeRef *)v4);
      free((void *)v4);
      v4 = v5;
    }
    while (v5);
  }
  if (a1)
    free(a2);
}

uint64_t FigJPEGIOSurfaceMemoryPoolCreate(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t Instance;
  uint64_t v6;
  size_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  NSObject *global_queue;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t result;

  fig_note_initialize_category_with_default_work();
  MEMORY[0x1BCCC665C](&FigJPEGIOSurfacePoolGetTypeID_registerOnce, iosp_registerIOSurfaceMemPool);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 4294954510;
  v6 = Instance;
  *(_OWORD *)(Instance + 104) = xmmword_1B98D5990;
  *(_OWORD *)(Instance + 120) = xmmword_1B98D59A0;
  *(int64x2_t *)(Instance + 136) = vdupq_n_s64(0xCuLL);
  *(_QWORD *)(Instance + 88) = 1000000000;
  *(_QWORD *)(Instance + 184) = 0;
  iosp_poolSetOptions((_QWORD *)Instance, a2);
  if (*(_QWORD *)(v6 + 48))
  {
    v7 = *(_QWORD *)(v6 + 56);
    goto LABEL_6;
  }
  v8 = malloc_type_malloc(0x58uLL, 0x1000040931E79F6uLL);
  *(_QWORD *)(v6 + 48) = v8;
  if (v8)
  {
    v8[2] = xmmword_1B98D5CE8;
    v8[3] = unk_1B98D5CF8;
    v8[4] = xmmword_1B98D5D08;
    *v8 = kMemSubPoolDefaultBuffSizes;
    v8[1] = unk_1B98D5CD8;
    *((_QWORD *)v8 + 10) = 10485760;
    v7 = 11;
    *(_QWORD *)(v6 + 56) = 11;
LABEL_6:
    v9 = malloc_type_calloc(v7, 0x50uLL, 0x10A004002207240uLL);
    *(_QWORD *)(v6 + 32) = v9;
    if (v9)
    {
      v10 = FigSimpleMutexCreate();
      *(_QWORD *)(v6 + 64) = v10;
      if (v10)
      {
        *(_QWORD *)(v6 + 16) = 0;
        *(_QWORD *)(v6 + 24) = v6 + 16;
        v11 = *(_QWORD *)(v6 + 56);
        if (v11)
        {
          v12 = *(_QWORD **)(v6 + 32);
          v13 = *(uint64_t **)(v6 + 48);
          do
          {
            *v12 = 0;
            v12[1] = v12;
            v14 = *v13++;
            v12[2] = v14;
            v12 += 10;
            --v11;
          }
          while (v11);
        }
        v15 = dispatch_semaphore_create(0);
        *(_QWORD *)(v6 + 80) = v15;
        if (v15)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
          *(_QWORD *)(v6 + 72) = v17;
          if (v17)
          {
            dispatch_set_context(v17, (void *)v6);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v6 + 72), (dispatch_function_t)iosp_poolDeepCleanup);
            v18 = *(NSObject **)(v6 + 72);
            v19 = dispatch_time(0, *(_QWORD *)(v6 + 88));
            dispatch_source_set_timer(v18, v19, *(_QWORD *)(v6 + 88), *(_QWORD *)(v6 + 88) / 0xAuLL);
            dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v6 + 72), (dispatch_function_t)iosp_poolCleanupTimerCanceled);
            v20 = FigNanosecondsToHostTime();
            result = 0;
            *(_QWORD *)(v6 + 88) = v20;
            *(_BYTE *)(v6 + 180) = 1;
            *a3 = v6;
            return result;
          }
        }
      }
    }
  }
  CFRelease((CFTypeRef)v6);
  return 4294954510;
}

_QWORD *iosp_poolSetOptions(_QWORD *result, const __CFDictionary *a2)
{
  _QWORD *v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  const __CFData *Value;
  const __CFData *v12;
  CFTypeID TypeID;
  size_t Length;
  void *v15;
  void *v16;
  const UInt8 *BytePtr;
  int v18;

  v18 = 0;
  if (a2)
  {
    v3 = result;
    if (iosp_getIntValue(a2, CFSTR("HighWaterBytes"), &v18))
    {
      v4 = v18;
      if (!v18)
        v4 = 0x7FFFFFFF;
      v3[13] = v4;
    }
    if (iosp_getIntValue(a2, CFSTR("LowWaterBytes"), &v18))
    {
      v5 = v18;
      if (!v18)
        v5 = 0x7FFFFFFF;
      v3[14] = v5;
    }
    if (iosp_getIntValue(a2, CFSTR("MinBytes"), &v18))
    {
      LODWORD(v6) = v18;
      if (!v18)
        LODWORD(v6) = 0x7FFFFFFF;
      v6 = (int)v6;
    }
    else
    {
      v6 = v3[14];
    }
    v3[15] = v6;
    if (iosp_getIntValue(a2, CFSTR("HighWaterBufferCount"), &v18))
    {
      v7 = v18;
      if (!v18)
        v7 = 0x7FFFFFFF;
      v3[16] = v7;
    }
    if (iosp_getIntValue(a2, CFSTR("LowWaterBufferCount"), &v18))
    {
      v8 = v18;
      if (!v18)
        v8 = 0x7FFFFFFF;
      v3[17] = v8;
    }
    if (iosp_getIntValue(a2, CFSTR("MinCount"), &v18))
    {
      LODWORD(v9) = v18;
      if (!v18)
        LODWORD(v9) = 0x7FFFFFFF;
      v9 = (int)v9;
    }
    else
    {
      v9 = v3[17];
    }
    v3[18] = v9;
    if (iosp_getIntValue(a2, CFSTR("IdleTimeout"), &v18))
    {
      if (v18)
        v10 = 1000000 * v18;
      else
        v10 = -1;
      v3[11] = v10;
    }
    Value = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("SizeTable"));
    if (Value)
    {
      v12 = Value;
      TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v12))
      {
        Length = CFDataGetLength(v12);
        v15 = malloc_type_malloc(Length, 0x8C85384CuLL);
        v3[6] = v15;
        if (v15)
        {
          v16 = v15;
          BytePtr = CFDataGetBytePtr(v12);
          memcpy(v16, BytePtr, Length);
          v3[7] = Length >> 2;
        }
      }
    }
    result = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CBBF90]);
    if (result)
    {
      result = CFRetain(result);
      v3[23] = result;
    }
  }
  return result;
}

uint64_t iosp_poolDeepCleanup(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  if ((unint64_t)(MEMORY[0x1BCCC65FC](v2) - *(_QWORD *)(a1 + 96)) > *(_QWORD *)(a1 + 88))
  {
    if (dword_1EF2346D0 >= 2)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    iosp_poolCleanup((_QWORD *)a1, *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 144));
    ++*(_QWORD *)(a1 + 168);
    if (!*(_BYTE *)(a1 + 180))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 72));
      *(_BYTE *)(a1 + 180) = 1;
    }
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
}

intptr_t iosp_poolCleanupTimerCanceled(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
}

void iosp_poolCleanup(_QWORD *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  uint64_t v17;
  unint64_t v18;

  v18 = a3;
  v3 = a2;
  if (a1[19] <= a2)
  {
    v5 = a1[20];
    if (v5 <= a3)
      return;
  }
  else
  {
    if (a1[14] < a2)
      v3 = a1[14];
    v5 = a1[20];
  }
  if (v5 > a3)
  {
    v6 = a3;
    if (a1[17] < a3)
      v6 = a1[17];
    v18 = v6;
  }
  v7 = a1[2];
  if (v7)
  {
    do
    {
      v8 = *(_QWORD *)(v7 + 48);
      if (!IOSurfaceIsInUse(*(IOSurfaceRef *)v7))
      {
        v9 = *(_QWORD *)(v7 + 48);
        v10 = *(_QWORD **)(v7 + 56);
        if (v9)
        {
          *(_QWORD *)(v9 + 56) = v10;
          v10 = *(_QWORD **)(v7 + 56);
        }
        else
        {
          a1[3] = v10;
        }
        *v10 = v9;
        v11 = *(_QWORD *)(v7 + 32);
        v12 = *(_QWORD **)(v7 + 40);
        if (v11)
        {
          *(_QWORD *)(v11 + 40) = v12;
          v12 = *(_QWORD **)(v7 + 40);
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(v7 + 24) + 8) = v12;
        }
        *v12 = v11;
        if (dword_1EF2346D0 >= 2)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CFRelease(*(CFTypeRef *)v7);
        v14 = *(int64x2_t *)(a1 + 19);
        v15.i64[1] = -1;
        v15.i64[0] = *(_QWORD *)(v7 + 8);
        v15.i64[0] = vsubq_s64(v14, v15).u64[0];
        v16.i64[0] = -1;
        v16.i64[1] = -1;
        v15.i64[1] = vaddq_s64(v14, v16).i64[1];
        *(int64x2_t *)(a1 + 19) = v15;
        v17 = *(_QWORD *)(v7 + 24);
        --*(_QWORD *)(v17 + 24);
        ++*(_QWORD *)(v17 + 48);
        free((void *)v7);
        if (a1[19] <= v3 && a1[20] <= v18)
          break;
      }
      v7 = v8;
    }
    while (v8);
  }
}

uint64_t iosp_getIntValue(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID TypeID;

  result = (uint64_t)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v5 = (const __CFNumber *)result;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v5))
    {
      CFNumberGetValue(v5, kCFNumberIntType, a3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t FigJPEGIOSurfaceMemoryPoolCreateIOSurface(uint64_t a1, unint64_t a2, IOSurfaceRef *a3)
{
  uint64_t v3;
  unint64_t *v6;
  unint64_t v7;
  uint64_t result;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    return 4294954516;
  v6 = *(unint64_t **)(a1 + 48);
  if (*v6 >= a2)
  {
    v7 = 0;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56) - 1;
    if (v6[v7] < a2)
      goto LABEL_4;
    if (v7 >= 2)
    {
      v16 = 0;
      do
      {
        if (v6[(v16 + v7) >> 1] >= a2)
          v7 = (v16 + v7) >> 1;
        else
          v16 = (v16 + v7) >> 1;
      }
      while (v7 - v16 > 1);
      if ((v7 & 0x8000000000000000) != 0)
      {
LABEL_4:
        result = iosp_createMemIOSurface(a2, a3);
        if (!(_DWORD)result)
        {
          IOSurfaceIncrementUseCount(*a3);
          FigAtomicIncrement32();
          return 0;
        }
        return result;
      }
    }
  }
  v9 = (uint64_t *)(v3 + 80 * v7);
  v10 = pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  *(_QWORD *)(a1 + 96) = MEMORY[0x1BCCC65FC](v10);
  if (*(_BYTE *)(a1 + 180))
  {
    dispatch_resume(*(dispatch_object_t *)(a1 + 72));
    *(_BYTE *)(a1 + 180) = 0;
  }
  iosp_poolCleanup((_QWORD *)a1, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 128));
  v11 = *v9;
  if (*v9)
  {
    while (IOSurfaceIsInUse(*(IOSurfaceRef *)v11))
    {
      v11 = *(_QWORD *)(v11 + 32);
      if (!v11)
        goto LABEL_12;
    }
    iosp_poolUpdateBuffPosition(a1, v3 + 80 * v7, v11);
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    result = 0;
    *a3 = *(IOSurfaceRef *)v11;
  }
  else
  {
LABEL_12:
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    v12 = v3 + 80 * v7;
    v14 = *(_QWORD *)(v12 + 16);
    v13 = (uint64_t *)(v12 + 16);
    result = iosp_createMemIOSurface(v14, a3);
    if (!(_DWORD)result)
    {
      IOSurfaceIncrementUseCount(*a3);
      result = (uint64_t)malloc_type_malloc(0x40uLL, 0x10A0040CA53F77BuLL);
      if (result)
      {
        v15 = *v13;
        *(_QWORD *)result = *a3;
        *(_QWORD *)(result + 8) = v15;
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v9;
        iosp_poolInsertNewBuff(a1, (_QWORD *)(v3 + 80 * v7), result);
        return 0;
      }
    }
  }
  return result;
}

uint64_t iosp_createMemIOSurface(int a1, IOSurfaceRef *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  IOSurfaceRef v7;
  uint64_t v8;

  if (dword_1EF2346D0 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 4294954510;
  v6 = Mutable;
  iosp_setIntValue(Mutable, (const void *)*MEMORY[0x1E0CBBF10], 1024);
  iosp_setIntValue(v6, (const void *)*MEMORY[0x1E0CBC070], 1246774599);
  iosp_setIntValue(v6, (const void *)*MEMORY[0x1E0CBBEE0], a1);
  v7 = IOSurfaceCreate(v6);
  if (v7)
  {
    v8 = 0;
    *a2 = v7;
  }
  else
  {
    v8 = 4294954510;
  }
  CFRelease(v6);
  return v8;
}

CFTypeRef iosp_poolUpdateBuffPosition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  CFTypeRef result;

  v5 = *(_QWORD *)(a3 + 32);
  v6 = *(_QWORD **)(a3 + 40);
  if (v5)
  {
    *(_QWORD *)(v5 + 40) = v6;
    v6 = *(_QWORD **)(a3 + 40);
  }
  else
  {
    *(_QWORD *)(a2 + 8) = v6;
  }
  *v6 = v5;
  v7 = *(_QWORD **)(a2 + 8);
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 40) = v7;
  *v7 = a3;
  *(_QWORD *)(a2 + 8) = a3 + 32;
  v8 = *(_QWORD *)(a3 + 48);
  v9 = *(_QWORD **)(a3 + 56);
  if (v8)
  {
    *(_QWORD *)(v8 + 56) = v9;
    v9 = *(_QWORD **)(a3 + 56);
  }
  else
  {
    *(_QWORD *)(a1 + 24) = v9;
  }
  *v9 = v8;
  v10 = *(_QWORD **)(a1 + 24);
  *(_QWORD *)(a3 + 48) = 0;
  *(_QWORD *)(a3 + 56) = v10;
  *v10 = a3;
  *(_QWORD *)(a1 + 24) = a3 + 48;
  IOSurfaceIncrementUseCount(*(IOSurfaceRef *)a3);
  result = CFRetain(*(CFTypeRef *)a3);
  ++*(_QWORD *)(a2 + 32);
  return result;
}

uint64_t iosp_poolInsertNewBuff(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int64x2_t v8;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  CFRetain(*(CFTypeRef *)a3);
  *(_QWORD *)(a3 + 32) = 0;
  v6 = (_QWORD *)a2[1];
  *(_QWORD *)(a3 + 40) = v6;
  *v6 = a3;
  a2[1] = a3 + 32;
  *(_QWORD *)(a3 + 48) = 0;
  v7 = *(_QWORD **)(a1 + 24);
  *(_QWORD *)(a3 + 56) = v7;
  *v7 = a3;
  *(_QWORD *)(a1 + 24) = a3 + 48;
  v8 = vdupq_n_s64(1uLL);
  v8.i64[0] = *(_QWORD *)(a3 + 8);
  *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), v8);
  ++a2[3];
  ++a2[5];
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
}

void iosp_setIntValue(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t FigJPEGIOSurfaceImagePoolCreate(const __CFAllocator *a1, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t Instance;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  unint64_t v10;
  CFMutableDictionaryRef Mutable;
  uint64_t v12;
  dispatch_semaphore_t v13;
  NSObject *global_queue;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t result;

  fig_note_initialize_category_with_default_work();
  MEMORY[0x1BCCC665C](&FigJPEGIOSurfacePoolGetTypeID_registerOnce, iosp_registerIOSurfaceMemPool);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 4294954510;
  v7 = Instance;
  *(_OWORD *)(Instance + 104) = xmmword_1B98D59B0;
  *(_OWORD *)(Instance + 120) = xmmword_1B98D59C0;
  *(int64x2_t *)(Instance + 136) = vdupq_n_s64(0xC0uLL);
  *(_QWORD *)(Instance + 88) = 1000000000;
  *(_QWORD *)(Instance + 184) = 0;
  iosp_poolSetOptions((_QWORD *)Instance, a2);
  v8 = *(_QWORD *)(v7 + 48);
  if (v8)
  {
    if (!*(_QWORD *)(v7 + 56))
      goto LABEL_9;
    goto LABEL_7;
  }
  v9 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  *(_QWORD *)(v7 + 48) = v9;
  if (v9)
  {
    v9[2] = xmmword_1B98D5D40;
    v9[3] = unk_1B98D5D50;
    v9[4] = xmmword_1B98D5D60;
    v9[5] = unk_1B98D5D70;
    *v9 = kImgSubPoolDefaultDimensions;
    v9[1] = unk_1B98D5D30;
    *(_QWORD *)(v7 + 56) = 12;
    v8 = *(_QWORD *)(v7 + 48);
LABEL_7:
    v10 = 0;
    do
    {
      *(_QWORD *)(v8 + 8 * v10) = (*(_QWORD *)(v8 + 8 * v10) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      ++v10;
    }
    while (*(_QWORD *)(v7 + 56) > v10);
LABEL_9:
    Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], 0);
    *(_QWORD *)(v7 + 40) = Mutable;
    if (Mutable)
    {
      v12 = FigSimpleMutexCreate();
      *(_QWORD *)(v7 + 64) = v12;
      if (v12)
      {
        *(_QWORD *)(v7 + 16) = 0;
        *(_QWORD *)(v7 + 24) = v7 + 16;
        v13 = dispatch_semaphore_create(0);
        *(_QWORD *)(v7 + 80) = v13;
        if (v13)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
          *(_QWORD *)(v7 + 72) = v15;
          if (v15)
          {
            dispatch_set_context(v15, (void *)v7);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v7 + 72), (dispatch_function_t)iosp_poolDeepCleanup);
            v16 = *(NSObject **)(v7 + 72);
            v17 = dispatch_time(0, *(_QWORD *)(v7 + 88));
            dispatch_source_set_timer(v16, v17, *(_QWORD *)(v7 + 88), *(_QWORD *)(v7 + 88) / 0xAuLL);
            dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v7 + 72), (dispatch_function_t)iosp_poolCleanupTimerCanceled);
            v18 = FigNanosecondsToHostTime();
            result = 0;
            *(_QWORD *)(v7 + 88) = v18;
            *(_BYTE *)(v7 + 180) = 1;
            *a3 = v7;
            return result;
          }
        }
      }
    }
  }
  CFRelease((CFTypeRef)v7);
  return 4294954510;
}

uint64_t FigJPEGIOSurfaceImagePoolCreateIOSurface(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, unint64_t a6, unint64_t a7, int a8, unint64_t a9, IOSurfaceRef *a10)
{
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  const __CFAllocator *v33;
  CFDataRef v34;
  CFDataRef v35;
  uint64_t *Value;
  char *v37;
  uint64_t v38;
  uint64_t i;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t result;
  _QWORD *v44;
  __IOSurface *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  UInt8 bytes[16];
  int v50;

  v18 = iosp_bytesPerPixel(a2);
  if (!*(_QWORD *)(a1 + 40))
    return 4294954516;
  v19 = 1;
  if ((a2 & 0xFFFFFFEF) == 0x34323066)
    v19 = 2;
  if (a6)
    v20 = a6;
  else
    v20 = v19;
  if (a7)
    v19 = a7;
  if ((a2 & 0xFFFFFFEF) == 0x34323066 && ((v19 | v20) & 1) != 0)
    return FigSignalErrorAt3();
  v48 = v18;
  if (a9)
    v21 = a9;
  else
    v21 = 16;
  v22 = *(unint64_t **)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 56) - 1;
  v24 = v22[v23];
  v25 = (a3 + v20 - 1) & -(uint64_t)v20;
  v26 = (a4 + v19 - 1) & -(uint64_t)v19;
  if (v25 > v24 || v26 > v24)
    goto LABEL_67;
  LODWORD(v20) = (a3 + v20 - 1) & -(int)v20;
  LODWORD(v19) = (a4 + v19 - 1) & -(int)v19;
  if (!(a8 | a5))
  {
    v19 = *v22;
    if (*v22 >= v25)
    {
      v28 = 0;
    }
    else
    {
      v28 = *(_QWORD *)(a1 + 56) - 1;
      if (v23 >= 2)
      {
        v29 = 0;
        v28 = *(_QWORD *)(a1 + 56) - 1;
        do
        {
          if (v22[(v29 + v28) >> 1] >= v25)
            v28 = (v29 + v28) >> 1;
          else
            v29 = (v29 + v28) >> 1;
        }
        while (v28 - v29 > 1);
        if (v28 < 0)
          goto LABEL_67;
      }
    }
    v20 = v22[v28];
    if (v19 < v26)
    {
      v19 = v22[v23];
      if (v19 < v26)
        goto LABEL_67;
      if (v23 >= 2)
      {
        v30 = 0;
        do
        {
          if (v22[(v30 + v23) >> 1] >= v26)
            v23 = (v30 + v23) >> 1;
          else
            v30 = (v30 + v23) >> 1;
        }
        while (v23 - v30 > 1);
        if ((v23 & 0x8000000000000000) != 0)
          goto LABEL_67;
        v19 = v22[v23];
      }
    }
  }
  v31 = a5 ? a4 : v19;
  v32 = a5 ? a3 : v20;
  *(_DWORD *)bytes = v32;
  *(_DWORD *)&bytes[4] = v31;
  *(_DWORD *)&bytes[8] = v20;
  *(_DWORD *)&bytes[12] = v19;
  v50 = a2;
  v33 = CFGetAllocator((CFTypeRef)a1);
  v34 = CFDataCreate(v33, bytes, 20);
  if (!v34)
    goto LABEL_67;
  v35 = v34;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  Value = (uint64_t *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v35);
  if (!Value)
  {
    v37 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x10A004002207240uLL);
    Value = (uint64_t *)v37;
    if (v37)
    {
      *(_QWORD *)v37 = 0;
      *((_QWORD *)v37 + 1) = v37;
      *(_OWORD *)(v37 + 56) = *(_OWORD *)bytes;
      *((_DWORD *)v37 + 18) = v50;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), v35, v37);
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  CFRelease(v35);
  if (!Value)
  {
LABEL_67:
    v46 = v48 * v25;
    if (!a8)
    {
      if (v46 % v21)
        v47 = v21 - v46 % v21;
      else
        LODWORD(v47) = 0;
      LODWORD(v46) = v47 + v46;
    }
    result = iosp_createImgIOSurface(a2, a3, a4, v46, v26, *(const void **)(a1 + 184), a10);
    if (!(_DWORD)result)
    {
      IOSurfaceIncrementUseCount(*a10);
      FigAtomicIncrement32();
      return 0;
    }
    return result;
  }
  v38 = pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  *(_QWORD *)(a1 + 96) = MEMORY[0x1BCCC65FC](v38);
  if (*(_BYTE *)(a1 + 180))
  {
    dispatch_resume(*(dispatch_object_t *)(a1 + 72));
    *(_BYTE *)(a1 + 180) = 0;
  }
  iosp_poolCleanup((_QWORD *)a1, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 128));
  for (i = *Value; i; i = *(_QWORD *)(i + 32))
  {
    if (!IOSurfaceIsInUse(*(IOSurfaceRef *)i))
    {
      v40 = *(_QWORD *)(i + 16);
      if (a8)
      {
        if (v40 == v48 * *(unsigned int *)(*(_QWORD *)(i + 24) + 64))
          goto LABEL_76;
      }
      else if (!(v40 % v21))
      {
LABEL_76:
        iosp_poolUpdateBuffPosition(a1, (uint64_t)Value, i);
        pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
        result = 0;
        *a10 = *(IOSurfaceRef *)i;
        return result;
      }
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  v41 = v48 * *((unsigned int *)Value + 16);
  if (!a8)
  {
    if (v41 % v21)
      v42 = v21 - v41 % v21;
    else
      v42 = 0;
    v41 += v42;
  }
  result = iosp_createImgIOSurface(a2, *((unsigned int *)Value + 14), *((unsigned int *)Value + 15), v41, *((unsigned int *)Value + 17), *(const void **)(a1 + 184), a10);
  if (!(_DWORD)result)
  {
    IOSurfaceIncrementUseCount(*a10);
    result = (uint64_t)malloc_type_malloc(0x40uLL, 0x10A0040CA53F77BuLL);
    if (result)
    {
      v44 = (_QWORD *)result;
      v45 = *a10;
      *v44 = *a10;
      v44[3] = Value;
      v44[1] = IOSurfaceGetAllocSize(v45);
      v44[2] = v41;
      iosp_poolInsertNewBuff(a1, Value, (uint64_t)v44);
      return 0;
    }
  }
  return result;
}

uint64_t iosp_bytesPerPixel(int a1)
{
  uint64_t result;
  int v3;

  result = 4;
  if (a1 > 1278555700)
  {
    if (a1 > 2037741157)
    {
      if (a1 != 2037741171 && a1 != 2037741158)
        return 1;
    }
    else if (a1 != 1278555701)
    {
      v3 = 1999843442;
      goto LABEL_10;
    }
    return 2;
  }
  if (a1 > 875704437)
  {
    if (a1 == 875704438)
      return 1;
    v3 = 1111970369;
LABEL_10:
    if (a1 == v3)
      return result;
    return 1;
  }
  if (a1 != 32)
    return 1;
  return result;
}

uint64_t iosp_createImgIOSurface(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, const void *a6, IOSurfaceRef *a7)
{
  IOSurfaceRef *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v19;
  int v20;
  __CFDictionary *v21;
  __CFDictionary *v22;
  const void *v23;
  int v24;
  const void *v25;
  __CFDictionary *v26;
  int v27;
  __CFDictionary *Mutable;
  IOSurfaceRef v29;
  const __CFAllocator *v31;
  __CFDictionary *v32;
  uint64_t v33;
  CFMutableArrayRef v34;
  __CFArray *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  const void *v38;
  uint64_t v39;
  int v40;
  const void *v41;
  __CFDictionary *v42;
  __CFDictionary *v43;
  int v44;
  IOSurfaceRef v45;
  uint64_t v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  IOSurfaceRef *v51;
  const void *v52;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a2;
  if (dword_1EF2346D0 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v12 = a2;
    v9 = a5;
    v8 = a6;
    v7 = a7;
  }
  v19 = 4294954516;
  if (a1 > 1278555700)
  {
    if (a1 > 2037741157)
    {
      if (a1 != 2037741158 && a1 != 2037741171)
        return v19;
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
      {
        v22 = Mutable;
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBC040], CFSTR("PurpleGfxMem"));
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBF10], 1024);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC1E0], v12);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC008], a3);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC070], a1);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBF08], a4);
        v25 = (const void *)*MEMORY[0x1E0CBBEE0];
        v26 = v22;
        v27 = v9 * a4;
LABEL_20:
        iosp_setIntValue(v26, v25, v27);
        v29 = IOSurfaceCreate(v22);
        if (v29)
        {
          *v7 = v29;
          CFRelease(v22);
LABEL_22:
          if (*v7)
            IOSurfaceSetValue(*v7, (CFStringRef)*MEMORY[0x1E0CBBF90], v8);
          return 0;
        }
        goto LABEL_35;
      }
      return 4294954510;
    }
    if (a1 == 1278555701)
    {
LABEL_14:
      v21 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (v21)
      {
        v22 = v21;
        iosp_setIntValue(v21, (const void *)*MEMORY[0x1E0CBBF10], 1024);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC1E0], v12);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC008], a3);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC070], a1);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBF08], a4);
        v23 = (const void *)*MEMORY[0x1E0CBBF00];
        v24 = iosp_bytesPerPixel(a1);
        iosp_setIntValue(v22, v23, v24);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBEE0], v9 * a4);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC058], 0);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBFC0], 1);
        v25 = (const void *)*MEMORY[0x1E0CBBFB8];
        v26 = v22;
        v27 = 1;
        goto LABEL_20;
      }
      return 4294954510;
    }
    v20 = 1999843442;
LABEL_13:
    if (a1 != v20)
      return v19;
    goto LABEL_14;
  }
  if (a1 > 875704437)
  {
    if (a1 == 875704438)
      goto LABEL_26;
    v20 = 1111970369;
    goto LABEL_13;
  }
  if (a1 == 32)
    goto LABEL_14;
  if (a1 != 875704422)
    return v19;
LABEL_26:
  v31 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v32 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v32)
    return 4294954510;
  v22 = v32;
  CFDictionarySetValue(v32, (const void *)*MEMORY[0x1E0CBC040], CFSTR("PurpleGfxMem"));
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBF10], 1024);
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC1E0], v12);
  v33 = a3;
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC008], a3);
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBC070], a1);
  v34 = CFArrayCreateMutable(v31, 2, MEMORY[0x1E0C9B378]);
  if (!v34)
  {
LABEL_35:
    CFRelease(v22);
    return 4294954510;
  }
  v35 = v34;
  v36 = CFDictionaryCreateMutable(v31, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v36)
  {
    v37 = v36;
    v51 = v7;
    v52 = v8;
    v49 = (const void *)*MEMORY[0x1E0CBC178];
    iosp_setIntValue(v36, (const void *)*MEMORY[0x1E0CBC178], v12);
    v50 = (const void *)*MEMORY[0x1E0CBC140];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E0CBC140], v33);
    v48 = (const void *)*MEMORY[0x1E0CBC090];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E0CBC090], 1);
    v47 = (const void *)*MEMORY[0x1E0CBC160];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E0CBC160], 0);
    v38 = (const void *)*MEMORY[0x1E0CBC098];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E0CBC098], a4);
    v39 = v12;
    v40 = v9 * a4;
    v46 = v9;
    v41 = (const void *)*MEMORY[0x1E0CBC168];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E0CBC168], v40);
    CFArrayAppendValue(v35, v37);
    CFRelease(v37);
    v42 = CFDictionaryCreateMutable(v31, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v42)
    {
      v43 = v42;
      iosp_setIntValue(v42, v49, (unint64_t)(v39 + 1) >> 1);
      iosp_setIntValue(v43, v50, (unint64_t)(v33 + 1) >> 1);
      iosp_setIntValue(v43, v48, 2);
      iosp_setIntValue(v43, v47, v40);
      iosp_setIntValue(v43, v38, a4);
      v44 = ((unint64_t)(v46 + 1) >> 1) * a4;
      iosp_setIntValue(v43, v41, v44);
      CFArrayAppendValue(v35, v43);
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x1E0CBC158], v35);
      iosp_setIntValue(v22, (const void *)*MEMORY[0x1E0CBBEE0], v44 + v40);
      v45 = IOSurfaceCreate(v22);
      if (v45)
      {
        v19 = 0;
        v7 = v51;
        v8 = v52;
        *v51 = v45;
      }
      else
      {
        v19 = 4294954510;
        v7 = v51;
        v8 = v52;
      }
      CFRelease(v22);
    }
    else
    {
      v19 = 4294954510;
      v43 = v22;
      v7 = v51;
      v8 = v52;
    }
  }
  else
  {
    v19 = 4294954510;
    v43 = v22;
  }
  CFRelease(v43);
  CFRelease(v35);
  if (!(_DWORD)v19)
    goto LABEL_22;
  return v19;
}

uint64_t FigJPEGIOSurfacePoolFlush(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  iosp_poolCleanup((_QWORD *)a1, 0, 0);
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
}

void sub_1B98A094C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CGFloat operator||(double a1, double a2, double a3, double a4, float a5, double a6, double a7)
{
  CGRect v8;
  CGRect v9;

  v8.size.width = a3 * a5;
  v8.size.height = a4 * a5;
  v8.origin.x = a6 - v8.size.width * 0.5;
  v8.origin.y = a7 - v8.size.height * 0.5;
  v9 = CGRectIntegral(v8);
  return v9.size.width;
}

__CFString *StringFromExpandableViewState(unsigned int a1)
{
  if (a1 > 7)
    return 0;
  else
    return off_1E70B5BF8[a1];
}

uint64_t MetaStateFromState(int a1)
{
  if ((a1 - 1) > 6)
    return 0;
  else
    return dword_1B98D5D80[a1 - 1];
}

uint64_t PLTransformForImageOrientationAndSize@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v4;
  __int128 v5;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 1:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_12;
    case 2:
      *(_OWORD *)(a2 + 8) = xmmword_1B98D59E0;
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
      goto LABEL_9;
    case 3:
      *(_OWORD *)(a2 + 8) = xmmword_1B98D59D0;
      goto LABEL_7;
    case 4:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0x3FF0000000000000;
LABEL_7:
      *(double *)(a2 + 32) = a3;
      break;
    case 5:
      *(_QWORD *)a2 = 0x3FF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0xBFF0000000000000;
LABEL_9:
      *(double *)(a2 + 40) = a4;
      break;
    case 6:
      __asm { FMOV            V0.2D, #1.0; jumptable 00000001B98AA258 case 6 }
      *(_OWORD *)(a2 + 8) = _Q0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 24) = 0;
      break;
    case 7:
      __asm { FMOV            V2.2D, #-1.0; jumptable 00000001B98AA258 case 7 }
      *(_OWORD *)(a2 + 8) = _Q2;
LABEL_12:
      *(double *)(a2 + 32) = a3;
      *(double *)(a2 + 40) = a4;
      break;
    default:
      v4 = MEMORY[0x1E0C9BAA8];
      v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

uint64_t NewUIImageFromCachedImage(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  CGImage *v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, "imageOrientation");
  v3 = objc_msgSend(a1, "CGImage");
  if (v3)
    return objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:imageOrientation:", v3, v2);
  result = objc_msgSend(a1, "ioSurface");
  if (result)
  {
    v5 = (CGImage *)PLCreateCGImageFromIOSurface();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:imageOrientation:", v5, v2);
    CGImageRelease(v5);
    return v6;
  }
  return result;
}

uint64_t _PLIncrementSharedCountForAssets(void *a1)
{
  void *v2;
  _QWORD v4[5];

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "firstObject"), "photoLibrary");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___PLIncrementSharedCountForAssets_block_invoke;
  v4[3] = &unk_1E70B6370;
  v4[4] = a1;
  return objc_msgSend(v2, "performChanges:completionHandler:", v4, 0);
}

uint64_t _PLIncrementSharedCountForAsset(void *a1)
{
  uint64_t result;
  void *v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "pl_PHAssetFromPhotoLibrary:", PLNavigationControllerInterfacePhotoLibrary(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "photoLibrary"), "pathManager"), "libraryURL")));
  if (result)
  {
    v5[0] = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "firstObject"), "photoLibrary");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___PLIncrementSharedCountForAssets_block_invoke;
    v4[3] = &unk_1E70B6370;
    v4[4] = v2;
    return objc_msgSend(v3, "performChanges:completionHandler:", v4, 0);
  }
  return result;
}

uint64_t PLNavigationControllerInterfacePhotoLibrary(uint64_t a1)
{
  void *v3;
  uint64_t v4;
  _QWORD block[5];

  if (!objc_msgSend(MEMORY[0x1E0CD16F8], "isMultiLibraryModeEnabled"))
    return objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PLNavigationControllerInterfacePhotoLibrary_block_invoke;
  block[3] = &unk_1E70B6370;
  block[4] = a1;
  if (PLNavigationControllerInterfacePhotoLibrary_onceToken != -1)
    dispatch_once(&PLNavigationControllerInterfacePhotoLibrary_onceToken, block);
  if ((objc_msgSend((id)PLNavigationControllerInterfacePhotoLibrary_sPhotoLibraryURL, "isEqual:", a1) & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHPhotoLibrary *PLNavigationControllerInterfacePhotoLibrary(NSURL *)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PLNavigationControllerInterface.m"), 175, CFSTR("Requested URL %@ does not match previous URL %@"), a1, PLNavigationControllerInterfacePhotoLibrary_sPhotoLibraryURL);
  }
  return PLNavigationControllerInterfacePhotoLibrary_sPhotoLibrary;
}

void PLNotifyImagePickerOfImageAvailability(void *a1, void *a2, void *a3, void *a4, int a5)
{
  id InfoForImage;

  InfoForImage = __CreateInfoForImage(a1, a2, a3, a4, a5);
  if (a3)
    _PLIncrementSharedCountForAsset(a3);
  objc_msgSend(a1, "_imagePickerDidCompleteWithInfo:", InfoForImage);

}

id __CreateInfoForImage(void *a1, void *a2, void *a3, void *a4, int a5)
{
  char v10;
  uint64_t v11;

  v10 = objc_msgSend(a1, "_imagePickerSavingOptions");
  v11 = objc_msgSend(a1, "sourceType");
  return __CreateInfoForImageWithProperties(v11, objc_msgSend(a1, "showsCameraControls"), v10, objc_msgSend((id)objc_msgSend(a1, "_valueForProperty:", *MEMORY[0x1E0CEC058]), "BOOLValue"), a2, a3, a4, a5);
}

id __CreateInfoForImageWithProperties(uint64_t a1, int a2, char a3, int a4, void *a5, void *a6, void *a7, int a8)
{
  BOOL v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  BOOL v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ImageDataFromJPEGDataAndOrientation;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  unint64_t v54;
  _QWORD v55[2];
  void (*v56)(uint64_t, uint64_t, void *);
  void *v57;
  id v58;
  uint64_t *v59;
  uint64_t *v60;
  BOOL v61;
  BOOL v62;
  BOOL v63;
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;

  v54 = a1 & 0xFFFFFFFFFFFFFFFDLL;
  v15 = (a1 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a6)
  {
    v17 = objc_msgSend((id)objc_msgSend(a6, "pl_PHAssetFromPhotoLibrary:", PLNavigationControllerInterfacePhotoLibrary(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "photoLibrary"), "pathManager"), "libraryURL"))), "localIdentifier");
    if (v17)
      objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x1E0CEC050]);
  }
  if (a1 == 1)
    a8 &= a2 & a4;
  v52 = *MEMORY[0x1E0CEB6B0];
  v18 = objc_msgSend(a7, "objectForKey:");
  v19 = (id *)MEMORY[0x1E0CEC520];
  if (v18)
    v19 = (id *)MEMORY[0x1E0CEC540];
  v20 = objc_msgSend(*v19, "identifier");
  objc_msgSend(v16, "setObject:forKey:", v20, *MEMORY[0x1E0CEB6C0]);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v64 = 0;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v56 = ____CreateInfoForImageWithProperties_block_invoke;
  v57 = &unk_1E70B5D10;
  v61 = (a3 & 2) != 0;
  v62 = v15;
  v58 = v16;
  v59 = &v69;
  v63 = (a3 & 4) != 0;
  v60 = &v65;
  if (a7 && a8)
  {
    v21 = (void *)objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0D74F50]);
    if (v21)
    {
      v22 = (void *)NewUIImageFromCachedImage(v21);
      if (v22)
      {
        v23 = objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0D74F60]);
        if (v23)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v23);
          if (v24)
          {
            objc_msgSend(v16, "setObject:forKey:", v24, *MEMORY[0x1E0CEC038]);

          }
        }
        if ((a3 & 4) == 0)
        {
          if ((a3 & 2) == 0)
          {
            v25 = 0;
            v26 = a6;
            goto LABEL_63;
          }
          v26 = a6;
          goto LABEL_60;
        }
        v36 = objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0D74F70]);
        if (v36)
        {
          objc_msgSend(a5, "_imageOrientation");
          ImageDataFromJPEGDataAndOrientation = CreateImageDataFromJPEGDataAndOrientation();
          v38 = (void *)ImageDataFromJPEGDataAndOrientation;
          if (ImageDataFromJPEGDataAndOrientation)
            v39 = ImageDataFromJPEGDataAndOrientation;
          else
            v39 = v36;
          objc_msgSend(v16, "setObject:forKey:", v39, *MEMORY[0x1E0CEC048]);

          *((_BYTE *)v66 + 24) = 1;
          v26 = a6;
          if ((a3 & 2) != 0)
          {
LABEL_60:
            if (!v54)
            {
              v25 = 0;
              a6 = 0;
              if (v26)
              {
LABEL_73:
                v40 = (void *)objc_msgSend(MEMORY[0x1E0D715A0], "sharedAssetsSaver");
                v41 = objc_msgSend(v26, "objectID");
                v42 = objc_msgSend(v40, "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", v41, objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID"), 1, v54 == 0, 0, 0, &v64, 0);
                ((void (*)(_QWORD *, uint64_t, id, _QWORD))v56)(v55, v42, v64, 0);
                a6 = v26;
              }
LABEL_74:
              v43 = (void *)objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0D74F48]);
              v44 = objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CEC048]);
              if (v43)
              {
                if (!(v44 | v25))
                  goto LABEL_80;
                if (v44)
                  PLImageSizeFromImageData();
                else
                  objc_msgSend((id)v25, "size");
                objc_msgSend((id)objc_msgSend(a5, "image"), "size");
                objc_msgSend(v43, "CGRectValue");
                PLScaledCropRect();
                v43 = (void *)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
                if (v43)
LABEL_80:
                  objc_msgSend(v16, "setObject:forKey:", v43, *MEMORY[0x1E0CEB698]);
              }
              objc_msgSend(v16, "setObject:forKey:", v22, *MEMORY[0x1E0CEB6A0]);
              goto LABEL_82;
            }
LABEL_61:
            v25 = objc_msgSend(a5, "_newOriginalImageForPickerFromCachedData");
            if (v25)
            {
              objc_msgSend(v16, "setObject:forKey:", v25, *MEMORY[0x1E0CEB6D0]);
              *((_BYTE *)v70 + 24) = 1;

            }
LABEL_63:
            if (!v26)
            {
              a6 = 0;
              goto LABEL_74;
            }
            if (!v54 || (a3 & 4) != 0 && !*((_BYTE *)v66 + 24))
              goto LABEL_73;
            if ((a3 & 2) == 0)
            {
              a6 = v26;
              goto LABEL_74;
            }
            a6 = v26;
            if (!*((_BYTE *)v70 + 24))
              goto LABEL_73;
            goto LABEL_74;
          }
        }
        else
        {
          v26 = (void *)objc_msgSend((id)objc_msgSend(a5, "photo"), "pl_managedAsset");
          if ((a3 & 2) != 0)
            goto LABEL_60;
        }
        v25 = 0;
        if (!v54 || *((_BYTE *)v66 + 24))
          goto LABEL_63;
        goto LABEL_61;
      }
    }
    else
    {
      v22 = 0;
    }
LABEL_82:

    goto LABEL_83;
  }
  if (a5)
  {
    v27 = 0;
    if (v54)
    {
      if ((a3 & 2) != 0)
      {
        v27 = (void *)objc_msgSend(a5, "_newOriginalImageForPickerFromCachedData");
        if (v27)
        {
          objc_msgSend(v16, "setObject:forKey:", v27, *MEMORY[0x1E0CEB6D0]);

          *((_BYTE *)v70 + 24) = 1;
        }
      }
    }
    v28 = 0;
    if (v54 && (a3 & 4) != 0)
    {
      if (!objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0D74F70]))
      {
        a6 = (void *)objc_msgSend((id)objc_msgSend(a5, "photo"), "pl_managedAsset");
        v28 = 0;
        if (!a6)
          goto LABEL_83;
LABEL_28:
        v30 = (a3 & 2) == 0 || v27 != 0;
        v32 = (a3 & 4) == 0 || v28 != 0;
        if (!v54 || !v30 || !v32)
          goto LABEL_45;
        goto LABEL_83;
      }
      objc_msgSend(a5, "_imageOrientation");
      v28 = (void *)CreateImageDataFromJPEGDataAndOrientation();
      objc_msgSend(v16, "setObject:forKey:", v28, *MEMORY[0x1E0CEC048]);

      *((_BYTE *)v66 + 24) = 1;
    }
    if (!a6)
      goto LABEL_83;
    goto LABEL_28;
  }
  if (a6)
  {
LABEL_45:
    v33 = (void *)objc_msgSend(MEMORY[0x1E0D715A0], "sharedAssetsSaver");
    v34 = objc_msgSend(a6, "objectID");
    v35 = objc_msgSend(v33, "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", v34, objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID"), 1, v54 == 0, 0, 0, &v64, 0);
    ((void (*)(_QWORD *, uint64_t, id, _QWORD))v56)(v55, v35, v64, 0);
  }
LABEL_83:
  v45 = objc_msgSend(a6, "fileExtension");
  if (objc_msgSend(v64, "UTI"))
  {
    v46 = (void *)objc_msgSend(MEMORY[0x1E0D71880], "preferredFileExtensionForType:", objc_msgSend(v64, "UTI"));
    if (objc_msgSend(v46, "compare:options:", v45, 1))
      v45 = (uint64_t)v46;
  }
  if (a6)
  {
    v47 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary"), "assetURLForPhoto:extension:", a6, v45);
    if (v47)
      objc_msgSend(v16, "setObject:forKey:", v47, *MEMORY[0x1E0CEB6E0]);
  }
  v48 = objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0D74F68]);
  if (v48)
    objc_msgSend(v16, "setObject:forKey:", v48, *MEMORY[0x1E0CEB6B8]);
  v49 = *MEMORY[0x1E0CEC040];
  v50 = objc_msgSend(a7, "objectForKey:", *MEMORY[0x1E0CEC040]);
  if (v50)
    objc_msgSend(v16, "setObject:forKey:", v50, v49);
  if (v18)
    objc_msgSend(v16, "setObject:forKey:", v18, v52);
  _AddDebugInfo((uint64_t)v16, a3, a6);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  return v16;
}

void sub_1B98AE40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t CreateImageDataFromJPEGDataAndOrientation()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t EXIFJPEGData;

  v0 = PLExifOrientationFromImageOrientation();
  v1 = objc_alloc(MEMORY[0x1E0C99D80]);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v0);
  v3 = (void *)objc_msgSend(v1, "initWithObjectsAndKeys:", v2, *MEMORY[0x1E0CBCFF0], 0);
  EXIFJPEGData = CGImageCreateEXIFJPEGData();

  return EXIFJPEGData;
}

uint64_t _AddDebugInfo(uint64_t result, char a2, void *a3)
{
  void *v3;
  uint64_t v4;

  if ((a2 & 8) != 0)
  {
    v3 = (void *)result;
    v4 = 0;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "photoLibrary"), "assetsdClient"), "debugClient"), "debugSidecarFileURLsForAsset:debugSidecarFileURLs:error:", a3, &v4, 0);
    return objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_UIImagePickerDebugSidecarFileURLs"));
  }
  return result;
}

void PLNotifyImagePickerOfVideoAvailability(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id InfoForVideo;

  InfoForVideo = __CreateInfoForVideo(a1, a2, a3, a4);
  if (a3)
    _PLIncrementSharedCountForAsset(a3);
  objc_msgSend(a1, "_imagePickerDidCompleteWithInfo:", InfoForVideo);

}

void *__CreateInfoForVideo(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = objc_msgSend(a1, "_imagePickerSavingOptions");
  if (a3)
    v8 = objc_msgSend((id)objc_msgSend(a3, "photoLibrary"), "assetURLForPhoto:", a3);
  else
    v8 = 0;
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  v10 = objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v11 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E0CEB6C0], 0);
  if (a3)
  {
    v12 = objc_msgSend((id)objc_msgSend(a3, "pl_PHAssetFromPhotoLibrary:", PLNavigationControllerInterfacePhotoLibrary(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "photoLibrary"), "pathManager"), "libraryURL"))), "localIdentifier");
    if (v12)
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("_UIImagePickerControllerPHAssetLocalIdentifier"));
  }
  if (a2)
    objc_msgSend(v11, "setObject:forKey:", a2, *MEMORY[0x1E0CEB6C8]);
  if (v8)
    objc_msgSend(v11, "setObject:forKey:", v8, *MEMORY[0x1E0CEB6E0]);
  if (a4)
    objc_msgSend(v11, "addEntriesFromDictionary:", a4);
  _AddDebugInfo((uint64_t)v11, v7, a3);
  return v11;
}

uint64_t PLNotifyImagePickerOfMultipleMediaAvailability(void *a1, void *a2, void *a3, int a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *InfoForVideo;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(a2);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "pl_managedAsset");
        if (objc_msgSend(v13, "isVideo"))
        {
          v14 = objc_msgSend(v13, "pathForVideoFile");
          if (v14)
            v15 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
          else
            v15 = 0;
          InfoForVideo = __CreateInfoForVideo(a1, v15, v13, 0);
        }
        else
        {
          InfoForVideo = __CreateInfoForImage(a1, 0, v13, a3, a4);
        }
        v17 = InfoForVideo;
        if (v8)
          objc_msgSend(v8, "addObject:", InfoForVideo);

      }
      v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }
  v18 = (void *)objc_msgSend((id)objc_msgSend(a2, "firstObject"), "photoLibrary");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = ___PLIncrementSharedCountForAssets_block_invoke;
  v24[3] = &unk_1E70B6370;
  v24[4] = a2;
  objc_msgSend(v18, "performChanges:completionHandler:", v24, 0);
  return objc_msgSend(a1, "_imagePickerDidCompleteWithInfoArray:", v8);
}

void PLNotifyImagePickerOfMediaAvailability(void *a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(a3, "isVideo"))
  {
    v10 = objc_msgSend(a3, "pathForVideoFile");
    if (v10)
      v11 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
    else
      v11 = 0;
    PLNotifyImagePickerOfVideoAvailability(a1, v11, a3, 0);
  }
  else
  {
    PLNotifyImagePickerOfImageAvailability(a1, a2, a3, a4, a5);
  }
}

id PLPhotoPickerDictionaryFromVideo(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *Log;
  os_signpost_id_t v7;
  void *InfoForVideo;
  uint8_t v10[16];
  uint8_t buf[16];

  Log = PLPhotoPickerGetLog();
  v7 = os_signpost_id_generate(Log);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CreateVideoDictionary", (const char *)&unk_1B98D8ED2, buf, 2u);
  }
  InfoForVideo = __CreateInfoForVideo(0, a1, a2, a3);
  if (a2)
    _PLIncrementSharedCountForAsset(a2);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_END, v7, "CreateVideoDictionary", (const char *)&unk_1B98D8ED2, v10, 2u);
  }

  return InfoForVideo;
}

id PLPhotoPickerDictionaryFromImage(void *a1, void *a2, void *a3, void *a4, int a5)
{
  NSObject *Log;
  os_signpost_id_t v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id InfoForImageWithProperties;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[16];
  uint8_t buf[16];

  Log = PLPhotoPickerGetLog();
  v10 = os_signpost_id_generate(Log);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CreateImageDictionary", (const char *)&unk_1B98D8ED2, buf, 2u);
  }
  v11 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("_UIImagePickerSavingOptions"));
  if (!v11)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), CFSTR("PLNavigationControllerInterface.m"), 566, CFSTR("PLPhotoPickerDictionaryFromImage - UIImagePickerSavingOptions may not be nil"));
  }
  v12 = objc_msgSend(v11, "integerValue");
  v13 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("_UIImagePickerControllerSourceType"));
  if (!v13)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), CFSTR("PLNavigationControllerInterface.m"), 570, CFSTR("PLPhotoPickerDictionaryFromImage - UIImagePickerControllerSourceType may not be nil"));
  }
  v14 = objc_msgSend(v13, "integerValue");
  v15 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CEC058]);
  if (!v15)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), CFSTR("PLNavigationControllerInterface.m"), 574, CFSTR("PLPhotoPickerDictionaryFromImage - _UIImagePickerControllerReviewCapturedItem may not be nil"));
  }
  v16 = objc_msgSend(v15, "integerValue");
  v17 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CEC060]);
  if (!v17)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), CFSTR("PLNavigationControllerInterface.m"), 578, CFSTR("PLPhotoPickerDictionaryFromImage - _UIImagePickerControllerShowCameraControls may not be nil"));
  }
  InfoForImageWithProperties = __CreateInfoForImageWithProperties(v14, objc_msgSend(v17, "integerValue") != 0, v12, v16 != 0, a2, a3, a4, a5);
  if (a3)
    _PLIncrementSharedCountForAsset(a3);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_END, v10, "CreateImageDictionary", (const char *)&unk_1B98D8ED2, v25, 2u);
  }

  return InfoForImageWithProperties;
}

id PLPhotoPickerDictionaryFromMedia(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  NSObject *Log;
  os_signpost_id_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t v18[16];
  uint8_t buf[16];

  Log = PLPhotoPickerGetLog();
  v13 = os_signpost_id_generate(Log);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateMediaDictionary", (const char *)&unk_1B98D8ED2, buf, 2u);
  }
  if (objc_msgSend(a3, "isVideo"))
  {
    v14 = objc_msgSend(a3, "pathForVideoFile");
    if (v14)
      v14 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
    v15 = PLPhotoPickerDictionaryFromVideo(v14, a3, 0);
  }
  else
  {
    v15 = PLPhotoPickerDictionaryFromImage(a1, a2, a3, a4, a5);
  }
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_END, v13, "CreateMediaDictionary", (const char *)&unk_1B98D8ED2, v18, 2u);
  }

  if (objc_msgSend(a6, "count"))
  {
    v16 = (id)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v16, "addEntriesFromDictionary:", a6);
  }
  return v16;
}

void *PLPhotoPickerDictionariesFromMultipleMediaItems(void *a1, void *a2, void *a3, int a4, void *a5)
{
  NSObject *Log;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  os_signpost_id_t spid;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  __int128 buf;
  uint64_t (*v27)(uint64_t);
  void *v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  Log = PLPhotoPickerGetLog();
  v11 = os_signpost_id_generate(Log);
  v20 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    LODWORD(buf) = 134349056;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(a2, "count");
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CreateMultipleMediaDictionary", "%{public}ld", (uint8_t *)&buf, 0xCu);
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count", v11));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(a2);
        objc_msgSend(v12, "addObject:", PLPhotoPickerDictionaryFromMedia(a1, 0, (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16++), "pl_managedAsset"), a3, a4, a5));
      }
      while (v14 != v16);
      v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }
  v17 = (void *)objc_msgSend((id)objc_msgSend(a2, "firstObject"), "photoLibrary");
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v27 = ___PLIncrementSharedCountForAssets_block_invoke;
  v28 = &unk_1E70B6370;
  v29 = a2;
  objc_msgSend(v17, "performChanges:completionHandler:", &buf, 0);
  if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9897000, Log, OS_SIGNPOST_INTERVAL_END, spid, "CreateMultipleMediaDictionary", (const char *)&unk_1B98D8ED2, (uint8_t *)&buf, 2u);
  }

  return v12;
}

void sub_1B98B3EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B98B4C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __ShouldZoomToFill(uint64_t a1, double a2, double a3)
{
  _BOOL4 v6;

  v6 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (objc_msgSend((id)a1, "_clientIsWallpaper"))
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
      && (PLIsTallScreen() & 1) == 0)
    {
      return *(_BYTE *)(a1 + 1128) != 0;
    }
    return 1;
  }
  if (!*(_QWORD *)(a1 + 1136))
    return *(char *)(a1 + 1337) >= 0;
  return vabdd_f64(1.0, a2 / a3) < dbl_1B98D59F0[v6];
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t result;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr;
  v9 = getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr;
  if (!getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_block_invoke;
    v5[3] = &unk_1E70B61D8;
    v5[4] = &v6;
    __getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_block_invoke(v5);
    v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
    return v2(a1);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(Boolean)"), CFSTR("PLPhotosApplication.m"), 68, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_1B98B6AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!MediaRemoteLibraryCore_frameworkLibrary)
    MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)MediaRemoteLibraryCore_frameworkLibrary;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    a1 = (_QWORD *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaRemoteLibrary(void)"), CFSTR("PLPhotosApplication.m"), 67, CFSTR("%s"), 0);
    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "MRMediaRemoteSetNowPlayingApplicationOverrideEnabled");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

uint64_t myUncaughtExceptionHandler(void *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(a1, "userInfo");
  result = objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB3388]);
  if (result)
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary"), "handlePossibleCoreDataError:", result);
  if (originalUncaughtExceptionHandler)
    return originalUncaughtExceptionHandler(a1);
  return result;
}

uint64_t pl_appPhotoLibrary()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_opt_class();
  if (!v0)
    return objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v1 = (void *)v0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  result = objc_msgSend(v1, "px_deprecated_appPhotoLibrary");
  if (!result)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
    result = objc_msgSend(v1, "px_systemPhotoLibrary");
    if (!result)
      return objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  }
  return result;
}

void sub_1B98B9834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2386(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__2387(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke"), CFSTR("PLPublishingAgent.m"), 40, CFSTR("Unable to find class %s"), "MCProfileConnection");
    __break(1u);
  }
  return result;
}

void *ManagedConfigurationLibrary()
{
  void *v0;
  void *v2;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)"), CFSTR("PLPublishingAgent.m"), 39, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_1B98BAA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2558(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__2559(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1B98BDE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B98BF3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

IOSurfaceRef createDecodeSurfaceFromPool(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  int v4;
  int v5;
  FILE **v6;
  IOSurfaceRef v8;

  v8 = 0;
  v4 = FigJPEGIOSurfaceImagePoolCreateIOSurface(a1, a2, a3, a4, 1, 0x10uLL, 0x10uLL, 1, 0, &v8);
  if (v4 && gPLTiledLayerTrace)
  {
    v5 = v4;
    v6 = (FILE **)MEMORY[0x1E0C80C10];
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "Error in %s: ", "createDecodeSurfaceFromPool");
    fprintf(*v6, "FigJPEGIOSurfaceImagePoolCreateIOSurface: error: %d", v5);
    fputc(10, *v6);
  }
  return v8;
}

void *AccelerateLibrary()
{
  void *v0;
  void *v2;

  if (!AccelerateLibraryCore_frameworkLibrary)
    AccelerateLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)AccelerateLibraryCore_frameworkLibrary;
  if (!AccelerateLibraryCore_frameworkLibrary)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccelerateLibrary(void)"), CFSTR("PLTiledLayer.m"), 77, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

uint64_t getMTLTextureDescriptorClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__2897;
  v7 = __Block_byref_object_dispose__2898;
  v0 = getMTLTextureDescriptorClass_softClass;
  v8 = getMTLTextureDescriptorClass_softClass;
  if (!getMTLTextureDescriptorClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getMTLTextureDescriptorClass_block_invoke;
    v2[3] = &unk_1E70B61D8;
    v2[4] = &v3;
    __getMTLTextureDescriptorClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B98C06A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2897(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__2898(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getMTLTextureDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  MetalLibrary();
  result = objc_getClass("MTLTextureDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    getMTLTextureDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTLTextureDescriptorClass(void)_block_invoke"), CFSTR("PLTiledLayer.m"), 71, CFSTR("Unable to find class %s"), "MTLTextureDescriptor");
    __break(1u);
  }
  return result;
}

void *MetalLibrary()
{
  void *v0;
  void *v2;

  if (!MetalLibraryCore_frameworkLibrary)
    MetalLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)MetalLibraryCore_frameworkLibrary;
  if (!MetalLibraryCore_frameworkLibrary)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MetalLibrary(void)"), CFSTR("PLTiledLayer.m"), 70, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

BOOL getShowTilePreferences()
{
  const __CFString *v0;
  const __CFString *v1;
  CFTypeID v2;
  BOOL v3;
  _BOOL8 v4;
  CFTypeID v5;
  CFTypeID v7;
  int valuePtr;

  v0 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("ajtiledlayer_show_tiles"), CFSTR("com.apple.coremedia"));
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      v3 = CFStringGetIntValue(v1) == 0;
    }
    else
    {
      v5 = CFGetTypeID(v1);
      if (v5 != CFNumberGetTypeID())
      {
        v7 = CFGetTypeID(v1);
        v4 = v7 == CFBooleanGetTypeID() && v1 == (const __CFString *)*MEMORY[0x1E0C9AE50];
        goto LABEL_10;
      }
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, &valuePtr);
      v3 = valuePtr == 0;
    }
    v4 = !v3;
LABEL_10:
    CFRelease(v1);
    return v4;
  }
  return 0;
}

void *at_malloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xC28E03B4uLL);
}

void at_free(void *a1)
{
  if (a1)
    free(a1);
}

Class __getMPSImageConversionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;

  if (!MetalPerformanceShadersLibraryCore_frameworkLibrary)
    MetalPerformanceShadersLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MetalPerformanceShadersLibraryCore_frameworkLibrary)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MetalPerformanceShadersLibrary(void)"), CFSTR("PLTiledLayer.m"), 74, CFSTR("%s"), 0);
    goto LABEL_8;
  }
  result = objc_getClass("MPSImageConversion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMPSImageConversionClass(void)_block_invoke"), CFSTR("PLTiledLayer.m"), 75, CFSTR("Unable to find class %s"), "MPSImageConversion");
LABEL_8:
    __break(1u);
  }
  getMPSImageConversionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t PL_ColorSyncProfileCreate(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getColorSyncProfileCreateSymbolLoc_ptr;
  v9 = getColorSyncProfileCreateSymbolLoc_ptr;
  if (!getColorSyncProfileCreateSymbolLoc_ptr)
  {
    v3 = ColorSyncLibrary();
    v2 = dlsym(v3, "ColorSyncProfileCreate");
    v7[3] = (uint64_t)v2;
    getColorSyncProfileCreateSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
    return ((uint64_t (*)(uint64_t, _QWORD))v2)(a1, 0);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ColorSyncProfileRef PL_ColorSyncProfileCreate(CFDataRef, CFErrorRef *)"), CFSTR("PLTiledLayer.m"), 83, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_1B98C0CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncProfile()
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkColorSyncProfileSymbolLoc_ptr;
  v7 = getkColorSyncProfileSymbolLoc_ptr;
  if (!getkColorSyncProfileSymbolLoc_ptr)
  {
    v1 = ColorSyncLibrary();
    v0 = dlsym(v1, "kColorSyncProfile");
    v5[3] = (uint64_t)v0;
    getkColorSyncProfileSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *(_QWORD *)v0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncProfile(void)"), CFSTR("PLTiledLayer.m"), 91, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_1B98C0DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncRenderingIntent()
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkColorSyncRenderingIntentSymbolLoc_ptr;
  v7 = getkColorSyncRenderingIntentSymbolLoc_ptr;
  if (!getkColorSyncRenderingIntentSymbolLoc_ptr)
  {
    v1 = ColorSyncLibrary();
    v0 = dlsym(v1, "kColorSyncRenderingIntent");
    v5[3] = (uint64_t)v0;
    getkColorSyncRenderingIntentSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *(_QWORD *)v0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncRenderingIntent(void)"), CFSTR("PLTiledLayer.m"), 89, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_1B98C0E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncRenderingIntentPerceptual()
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr;
  v7 = getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr;
  if (!getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr)
  {
    v1 = ColorSyncLibrary();
    v0 = dlsym(v1, "kColorSyncRenderingIntentPerceptual");
    v5[3] = (uint64_t)v0;
    getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *(_QWORD *)v0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncRenderingIntentPerceptual(void)"), CFSTR("PLTiledLayer.m"), 90, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_1B98C0F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncTransformTag()
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkColorSyncTransformTagSymbolLoc_ptr;
  v7 = getkColorSyncTransformTagSymbolLoc_ptr;
  if (!getkColorSyncTransformTagSymbolLoc_ptr)
  {
    v1 = ColorSyncLibrary();
    v0 = dlsym(v1, "kColorSyncTransformTag");
    v5[3] = (uint64_t)v0;
    getkColorSyncTransformTagSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *(_QWORD *)v0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkColorSyncTransformTag(void)"), CFSTR("PLTiledLayer.m"), 85, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

void sub_1B98C1060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *ColorSyncLibrary()
{
  void *v0;
  void *v2;

  if (!ColorSyncLibraryCore_frameworkLibrary)
    ColorSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ColorSyncLibraryCore_frameworkLibrary;
  if (!ColorSyncLibraryCore_frameworkLibrary)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ColorSyncLibrary(void)"), CFSTR("PLTiledLayer.m"), 81, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_1B98C4C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B98C51E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t AVAssetExportPresetForRemakerMode(int a1)
{
  uint64_t *v1;
  uint64_t result;

  switch(a1)
  {
    case 0:
    case 2:
      v1 = (uint64_t *)MEMORY[0x1E0C89E78];
      goto LABEL_11;
    case 1:
      v1 = (uint64_t *)MEMORY[0x1E0C89E98];
      goto LABEL_11;
    case 3:
      v1 = (uint64_t *)MEMORY[0x1E0C89E70];
      goto LABEL_11;
    case 4:
      v1 = (uint64_t *)MEMORY[0x1E0C89EB8];
      goto LABEL_11;
    case 5:
      v1 = (uint64_t *)MEMORY[0x1E0C89EC0];
      goto LABEL_11;
    case 6:
      v1 = (uint64_t *)MEMORY[0x1E0C89E10];
      goto LABEL_11;
    case 7:
      v1 = (uint64_t *)MEMORY[0x1E0C89E80];
      goto LABEL_11;
    case 8:
      v1 = (uint64_t *)MEMORY[0x1E0C89E68];
LABEL_11:
      result = *v1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t PLVideoRemakerModeForAVAssetExportPreset(const void *a1)
{
  void *value;

  pl_dispatch_once();
  LODWORD(value) = 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)PLVideoRemakerModeForAVAssetExportPreset___map, a1, (const void **)&value))
  {
    return value;
  }
  else
  {
    return 7;
  }
}

void sub_1B98C8590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B98CCFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B98CE09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__3970(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__3971(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t _SetBundlePropertiesOnPropertiesDictionary(void *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (objc_msgSend(v2, "length"))
    objc_msgSend(a1, "setObject:forKey:", v2, *MEMORY[0x1E0D74CC8]);
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "localizedInfoDictionary"), "objectForKey:", *MEMORY[0x1E0C9AAC8]);
  result = objc_msgSend(v3, "length");
  if (result)
    return objc_msgSend(a1, "setObject:forKey:", v3, *MEMORY[0x1E0D74CC0]);
  return result;
}

uint64_t PLSaveImageToCameraRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)pl_appPhotoLibrary(), "legacySaveImageToCameraRoll:completionTarget:completionSelector:contextInfo:", a1, a2, a3, a4);
}

uint64_t PLSaveImageDataToCameraRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)pl_appPhotoLibrary(), "legacySaveImageDataToCameraRoll:completionTarget:completionSelector:contextInfo:", a1, a2, a3, a4);
}

uint64_t PLSaveImageToCameraRollWithTypeAndExtension(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend((id)pl_appPhotoLibrary(), "legacySaveScreenshotToCameraRoll:completionTarget:completionSelector:contextInfo:", a1, a4, a5, a6);
}

uint64_t PLSaveVideoToCameraRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)pl_appPhotoLibrary(), "legacySaveVideoToCameraRoll:completionTarget:completionSelector:contextInfo:", a1, a2, a3, a4);
}

uint64_t PLCanSaveVideoToCameraRoll(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D719A8], "canSaveVideoToLibrary:", a1);
}

void PLCleanupForStoreDemoMode()
{
  id v0;
  NSObject *Log;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v0 = objc_alloc_init(MEMORY[0x1E0D73268]);
  Log = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "Requesting cleanupForStoreDemoMode", buf, 2u);
  }
  v2 = (void *)objc_msgSend(v0, "demoClient");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PLCleanupForStoreDemoMode_block_invoke;
  v4[3] = &unk_1E70B6618;
  v4[4] = v0;
  objc_msgSend(v2, "cleanupForStoreDemoModeWithCompletion:", v4);
  v3 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9897000, v3, OS_LOG_TYPE_DEBUG, "Sent cleanupForStoreDemoMode", buf, 2u);
  }
}

CGFloat PLIntegralRect(CGFloat a1, CGFloat a2, double a3, double a4)
{
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MidX;
  CGFloat v12;
  CGFloat rect;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect = *MEMORY[0x1E0C9D648];
  v9 = round(a3);
  v10 = round(a4);
  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v15.origin.x = rect;
  v15.origin.y = v8;
  v15.size.width = v9;
  v15.size.height = v10;
  v12 = round(MidX + CGRectGetWidth(v15) * -0.5);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  CGRectGetMidY(v16);
  v17.origin.x = v12;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  CGRectGetHeight(v17);
  return v12;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1E0C9BC50](options, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1E0C9BD98](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFC0](c, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEOClip(CGContextRef c)
{
  MEMORY[0x1E0C9C1E8](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1E0C9C240]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x1E0C9C448](c, gray, alpha);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C610](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1E0CBC2C8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CBD0](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D4A0](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

uint64_t FigAtomicIncrement32()
{
  return MEMORY[0x1E0C9F7C8]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x1E0CA0AE0]();
}

uint64_t FigNanosecondsToHostTime()
{
  return MEMORY[0x1E0CA0EF8]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x1E0CA1558]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1E0CA1570]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1E0CA1578]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1E0CA1580]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1E0CA1590]();
}

uint64_t FigThreadGetMaxLogicalCoreCount()
{
  return MEMORY[0x1E0CA17E8]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1E0CA1810]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBB18](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CBBB68](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB90](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBBA0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x1E0CBBD00](buffer);
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBD18](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MPTVOutCapabledAndPreferred()
{
  return MEMORY[0x1E0CC22C0]();
}

uint64_t MPTVOutScreen()
{
  return MEMORY[0x1E0CC22C8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSUncaughtExceptionHandler *NSGetUncaughtExceptionHandler(void)
{
  return (NSUncaughtExceptionHandler *)MEMORY[0x1E0CB2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void NSSetUncaughtExceptionHandler(NSUncaughtExceptionHandler *a1)
{
  MEMORY[0x1E0CB3198](a1);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x1E0D71140]();
}

uint64_t PHFullScreenSizeForScreen()
{
  return MEMORY[0x1E0CD1BD8]();
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x1E0D73498]();
}

uint64_t PLCreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0D73D68]();
}

uint64_t PLCreateCGImageFromIOSurfaceBackedUIImage()
{
  return MEMORY[0x1E0D73D70]();
}

uint64_t PLCreateCroppedImageFromImage()
{
  return MEMORY[0x1E0D73D78]();
}

uint64_t PLCreateImageFromDataWithFormat()
{
  return MEMORY[0x1E0D71D68]();
}

uint64_t PLDebugEnableCoreDataMultithreadedAsserts()
{
  return MEMORY[0x1E0D73E08]();
}

uint64_t PLDeviceOrientationFromImageOrientation()
{
  return MEMORY[0x1E0D73E30]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1E0D73E98]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageData()
{
  return MEMORY[0x1E0D71E00]();
}

uint64_t PLGetPhotoLibraryClient()
{
  return MEMORY[0x1E0D71E10]();
}

uint64_t PLHasInternalUI()
{
  return MEMORY[0x1E0D740B0]();
}

uint64_t PLImageOrientationFromDeviceOrientation()
{
  return MEMORY[0x1E0D740D0]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1E0D740D8]();
}

uint64_t PLImageSizeFromImageData()
{
  return MEMORY[0x1E0D71E38]();
}

uint64_t PLIsAssetsd()
{
  return MEMORY[0x1E0D74138]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1E0D74148]();
}

uint64_t PLIsTallScreen()
{
  return MEMORY[0x1E0D742B0]();
}

uint64_t PLLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74330]();
}

uint64_t PLOrientationTransformImageSize()
{
  return MEMORY[0x1E0D72030]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x1E0D74440]();
}

uint64_t PLPhotoLibraryFrameworkBundle()
{
  return MEMORY[0x1E0D74450]();
}

uint64_t PLPhotoPickerGetLog()
{
  return MEMORY[0x1E0D74470]();
}

uint64_t PLPhotoSharingGetLog()
{
  return MEMORY[0x1E0D74478]();
}

uint64_t PLPhysicalScreenScale()
{
  return MEMORY[0x1E0D744E8]();
}

uint64_t PLPreviewImageAndDurationForVideoAtPath()
{
  return MEMORY[0x1E0D724B0]();
}

uint64_t PLRunningFromPhotosApplication()
{
  return MEMORY[0x1E0D72570]();
}

uint64_t PLSAggregateDictionaryAddValueForScalarKey()
{
  return MEMORY[0x1E0D72578]();
}

uint64_t PLScaledCropRect()
{
  return MEMORY[0x1E0D72A68]();
}

uint64_t PLSetShouldCacheIOSurfaces()
{
  return MEMORY[0x1E0D72DE8]();
}

uint64_t PLSetShouldLogImageDecodeTime()
{
  return MEMORY[0x1E0D72DF0]();
}

uint64_t PLStoreDemoModeGetLog()
{
  return MEMORY[0x1E0D747D0]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0CEB468]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0CEB628]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

uint64_t UIImagePickerEnsureViewIsInsidePopover()
{
  return MEMORY[0x1E0CEB6F8]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0CEBA80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0CEBA88]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0CEBA98]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0CEBAA8]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0CEBAD8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x1E0CEBBF8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIAccessibilityZoomTouchEnabled()
{
  return MEMORY[0x1E0CEBEB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _signal_nobind()
{
  return MEMORY[0x1E0C811B0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t applejpeg_decode_build_index_table()
{
  return MEMORY[0x1E0CFCF78]();
}

uint64_t applejpeg_decode_clone_session()
{
  return MEMORY[0x1E0CFCF88]();
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1E0CFCF90]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1E0CFCF98]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1E0CFCFB0]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1E0CFCFF0]();
}

uint64_t applejpeg_decode_open_mem()
{
  return MEMORY[0x1E0CFD008]();
}

uint64_t applejpeg_decode_options_init()
{
  return MEMORY[0x1E0CFD010]();
}

uint64_t applejpeg_decode_set_options()
{
  return MEMORY[0x1E0CFD070]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F50](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1E0CA1F60]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1E0CA1F68]();
}

uint64_t fig_note_initialize_category_with_default_work()
{
  return MEMORY[0x1E0CA1F80]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t imageDataFromImageWithFormat()
{
  return MEMORY[0x1E0D72F10]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t pl_dispatch_after()
{
  return MEMORY[0x1E0D74FE0]();
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1E0D74FE8]();
}

uint64_t pl_dispatch_once()
{
  return MEMORY[0x1E0D75010]();
}

uint64_t pl_dispatch_source_set_event_handler()
{
  return MEMORY[0x1E0D75028]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1E0D75030]();
}

uint64_t pl_notify_register_dispatch()
{
  return MEMORY[0x1E0D75040]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

void srandomdev(void)
{
  MEMORY[0x1E0C85490]();
}

