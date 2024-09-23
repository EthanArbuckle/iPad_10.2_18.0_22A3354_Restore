@implementation PFVideoExportRangeCoordinator

- (PFVideoExportRangeCoordinator)init
{
  PFVideoExportRangeCoordinator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *rangeCoordinatorStateQueue;
  uint64_t v6;
  NSMutableArray *waitingCallers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFVideoExportRangeCoordinator;
  v2 = -[PFVideoExportRangeCoordinator init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.pfvideoexport.range-coordinator", v3);
    rangeCoordinatorStateQueue = v2->_rangeCoordinatorStateQueue;
    v2->_rangeCoordinatorStateQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    waitingCallers = v2->_waitingCallers;
    v2->_waitingCallers = (NSMutableArray *)v6;

    v2->_availableRange.location = 0;
    v2->_availableRange.length = 0;
  }
  return v2;
}

- (void)updateAvailableRange:(_NSRange)a3
{
  NSObject *rangeCoordinatorStateQueue;
  _QWORD block[5];
  _NSRange v5;

  rangeCoordinatorStateQueue = self->_rangeCoordinatorStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke;
  block[3] = &unk_1E45A43C0;
  block[4] = self;
  v5 = a3;
  dispatch_sync(rangeCoordinatorStateQueue, block);
}

- (BOOL)waitForAvailabilityOfRange:(_NSRange)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  NSObject *rangeCoordinatorStateQueue;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  BOOL v15;
  __uint64_t v16;
  __uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  char v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD block[7];
  _NSRange v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  NSUInteger v44;
  __int16 v45;
  double v46;
  uint64_t v47;
  NSRange v48;
  NSRange v49;
  NSRange v50;
  NSRange v51;

  length = a3.length;
  location = a3.location;
  v47 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__10165;
  v39 = __Block_byref_object_dispose__10166;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  rangeCoordinatorStateQueue = self->_rangeCoordinatorStateQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke;
  block[3] = &unk_1E45A43E8;
  v30 = a3;
  block[4] = self;
  block[5] = &v31;
  block[6] = &v35;
  dispatch_sync(rangeCoordinatorStateQueue, block);
  if (!*((_BYTE *)v32 + 24))
  {
    if (v36[5])
    {
      v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      objc_msgSend((id)v36[5], "waitWithTimeout:", a4);
      v17 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      v18 = self->_rangeCoordinatorStateQueue;
      v28[0] = v11;
      v28[1] = 3221225472;
      v28[2] = __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke_222;
      v28[3] = &unk_1E45A4B68;
      v28[4] = self;
      v28[5] = &v35;
      dispatch_sync(v18, v28);
      if (objc_msgSend((id)v36[5], "cancelled"))
      {
        v19 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v49.location = location;
          v49.length = length;
          NSStringFromRange(v49);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v25;
          v43 = 2048;
          *(double *)&v44 = (double)(v17 - v16) / 1000000000.0;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Request for range %{public}@ cancelled after %.3fs", buf, 0x16u);

        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 5, 0);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
LABEL_22:
        v15 = 0;
        goto LABEL_23;
      }
      v21 = objc_msgSend((id)v36[5], "requestedRangeIsAvailable");
      v22 = MEMORY[0x1E0C81028];
      if ((v21 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v51.location = location;
          v51.length = length;
          NSStringFromRange(v51);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v27;
          v43 = 2048;
          v44 = location + length;
          v45 = 2048;
          v46 = (double)(v17 - v16) / 1000000000.0;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video export range coordinator: request for range %{public}@ (= file size %lu) timed out after %.3fs", buf, 0x20u);

        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 4, 0);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v50.location = location;
        v50.length = length;
        NSStringFromRange(v50);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        v43 = 2048;
        *(double *)&v44 = (double)(v17 - v16) / 1000000000.0;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Video export range coordinator: request for range %{public}@ unblocked after %.3fs, range available", buf, 0x16u);

      }
    }
    v15 = 1;
    goto LABEL_23;
  }
  v12 = MEMORY[0x1E0C81028];
  v13 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v48.location = location;
    v48.length = length;
    NSStringFromRange(v48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v24;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Request for range %{public}@ rejected in cancelled state", buf, 0xCu);

  }
  if (!a5)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFVideoExportErrorDomain"), 5, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = 0;
  *a5 = v14;
LABEL_23:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v15;
}

- (void)cancel
{
  NSObject *rangeCoordinatorStateQueue;
  _QWORD block[5];

  rangeCoordinatorStateQueue = self->_rangeCoordinatorStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PFVideoExportRangeCoordinator_cancel__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_sync(rangeCoordinatorStateQueue, block);
}

- (_NSRange)availableRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_availableRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setAvailableRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_availableRange, &v3, 16, 1, 0);
}

- (NSMutableArray)waitingCallers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWaitingCallers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)rangeCoordinatorStateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRangeCoordinatorStateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeCoordinatorStateQueue, 0);
  objc_storeStrong((id *)&self->_waitingCallers, 0);
}

uint64_t __39__PFVideoExportRangeCoordinator_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enumerateObjectsUsingBlock:", &__block_literal_global_10163);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
}

void __39__PFVideoExportRangeCoordinator_cancel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setCancelled:", 1);
  objc_msgSend(v2, "resume");

}

uint64_t __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke(uint64_t a1)
{
  NSRange v2;
  uint64_t result;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  NSRange v20;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = NSIntersectionRange(*(NSRange *)(a1 + 56), *(NSRange *)(*(_QWORD *)(a1 + 32) + 32));
  result = objc_msgSend(*(id *)(a1 + 32), "cancelled");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    if (v4 != v2.location || v5 != v2.length)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v20.location = v4;
        v20.length = v5;
        NSStringFromRange(v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromRange(*(NSRange *)(*(_QWORD *)(a1 + 32) + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromRange(v2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543874;
        v14 = v10;
        v15 = 2114;
        v16 = v11;
        v17 = 2114;
        v18 = v12;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Video export range coordinator range unavailable: requested range %{public}@, available range %{public}@, intersection %{public}@", (uint8_t *)&v13, 0x20u);

        v4 = *(_QWORD *)(a1 + 56);
        v5 = *(_QWORD *)(a1 + 64);
      }
      +[PFVideoExportRangeWaitingCaller waitingCallerWithRequestedRange:](PFVideoExportRangeWaitingCaller, "waitingCallerWithRequestedRange:", v4, v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
  }
  return result;
}

uint64_t __74__PFVideoExportRangeCoordinator_waitForAvailabilityOfRange_timeout_error___block_invoke_222(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setAvailableRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10165;
  v9 = __Block_byref_object_dispose__10166;
  v10 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke_216;
  v3[3] = &unk_1E45A4398;
  v4 = *(_OWORD *)(a1 + 40);
  v3[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);
  if (v6[5])
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsAtIndexes:");
  _Block_object_dispose(&v5, 8);

}

void __54__PFVideoExportRangeCoordinator_updateAvailableRange___block_invoke_216(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "canResumeForRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    if (v7)
    {
      v8 = v7;
      v9 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addIndex:", a3);
    objc_msgSend(v5, "setRequestedRangeIsAvailable:", 1);
    objc_msgSend(v5, "resume");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      NSStringFromRange(*(NSRange *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v12;
      v16 = 2048;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Range coordinator added range %{public}@ (= file size %lu bytes), unblocked waiting caller %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

@end
