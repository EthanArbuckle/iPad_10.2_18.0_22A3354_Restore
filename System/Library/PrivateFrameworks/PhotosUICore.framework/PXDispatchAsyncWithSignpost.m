@implementation PXDispatchAsyncWithSignpost

void __PXDispatchAsyncWithSignpost_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  const char *label;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = mach_absolute_time();
  v3 = *(_QWORD *)(a1 + 56);
  PXTimebaseConversionFactor();
  v5 = *(double *)(a1 + 64);
  if (v5 != 0.0)
  {
    v6 = v4 * (double)(uint64_t)(v2 - v3);
    if (v6 > v5)
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 136315906;
        v19 = label;
        v20 = 2112;
        v21 = v9;
        v22 = 2048;
        v23 = v6;
        v24 = 2048;
        v25 = v10;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_FAULT, "A block dispatched to queue %s with interval name %@ took %.2fs to finish running after being dispatched. Maximum acceptable interval is %.2fs.", buf, 0x2Au);
      }

    }
  }
  v11 = (void *)MEMORY[0x1E0D09910];
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *MEMORY[0x1E0D09708];
  v14 = *(_QWORD *)(a1 + 40);
  v16 = *MEMORY[0x1E0D09850];
  v17 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endSignpost:forEventName:withPayload:", v12, v13, v15);

}

@end
