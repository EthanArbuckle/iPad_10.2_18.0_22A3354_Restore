@implementation PPCalendarInternPool

- (PPCalendarInternPool)init
{
  PPCalendarInternPool *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *poolLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPCalendarInternPool;
  v2 = -[PPCalendarInternPool init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    poolLock = v2->_poolLock;
    v2->_poolLock = (_PASLock *)v5;

  }
  return v2;
}

- (void)clearPool
{
  -[_PASLock runWithLockAcquired:](self->_poolLock, "runWithLockAcquired:", &__block_literal_global_604);
}

- (id)internedCalendarWithEKCalendar:(id)a3
{
  id v4;
  _PASLock *poolLock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__554;
  v16 = __Block_byref_object_dispose__555;
  v17 = 0;
  poolLock = self->_poolLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PPCalendarInternPool_internedCalendarWithEKCalendar___block_invoke;
  v9[3] = &unk_1E2269FA0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](poolLock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolLock, 0);
}

void __55__PPCalendarInternPool_internedCalendarWithEKCalendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CGColorSpace *v18;
  CGColor *CopyByMatchingToColorSpace;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  PPCalendar *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "calendarIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("unknown-calendar");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("unknown-source");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR(":"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByAppendingString:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v18, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(*(id *)(a1 + 32), "CGColor"), 0);
    CGColorSpaceRelease(v18);
    objc_msgSend(*(id *)(a1 + 32), "title");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &stru_1E226D4B0;
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    v24 = -[PPCalendar initWithCalendarIdentifier:title:color:]([PPCalendar alloc], "initWithCalendarIdentifier:title:color:", v7, v23, CopyByMatchingToColorSpace);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    CGColorRelease(CopyByMatchingToColorSpace);
    if ((unint64_t)objc_msgSend(v3, "count") > 0xFF)
    {
      pp_events_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = 134217984;
        v29 = 256;
        _os_log_debug_impl(&dword_18BE3A000, v27, OS_LOG_TYPE_DEBUG, "Interned PPCalendars reached max count: %tu", (uint8_t *)&v28, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14);
    }
  }

}

uint64_t __33__PPCalendarInternPool_clearPool__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

@end
