@implementation UIUpdateCycleNotifyIdle

void ___UIUpdateCycleNotifyIdle_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  double v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  v3 = a1[4];
  v4 = v2 - v3;
  if (v2 - v3 > a1[5])
  {
    v5 = qword_1ECD79B10;
    if (!qword_1ECD79B10)
    {
      v5 = __UILogCategoryGetNode("UpdateCycleIdleScheduler", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&qword_1ECD79B10);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_signpost_enabled(v6))
    {
      v7 = (double)(unint64_t)a1[6];
      *(_DWORD *)buf = 134217984;
      v34 = (double)v4 / v7;
      _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkipNotify", "After scheduling, elapsed=%.2f", buf, 0xCu);
    }
    _MergedGlobals_13_2 = 0;
    return;
  }
  v8 = a1[6];
  v9 = a1[7];
  _isNotifyingIdleObservers = 1;
  v10 = mach_absolute_time();
  v11 = qword_1ECD79AE8;
  if (!qword_1ECD79AE8)
  {
    v11 = __UILogCategoryGetNode("UpdateCycleIdleScheduler", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&qword_1ECD79AE8);
  }
  v12 = *(NSObject **)(v11 + 8);
  v13 = (double)v8;
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134217984;
    v34 = (double)(v10 - v3) / (double)v8;
    _os_signpost_emit_with_name_impl(&dword_185066000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NotifyIdleObservers", "elapsedAtStart=%.2f", buf, 0xCu);
  }
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1ECD76640, (uint64_t)CFSTR("IdleSchedulerMaximumFractionToContinue"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))
  {
    if (_UIUpdateCycleEnabled())
      v14 = 0.8;
    else
      v14 = 0.6;
  }
  else
  {
    v14 = *(double *)&qword_1ECD76648;
  }
  v15 = (id)qword_1ECD79AE0;
  v16 = qword_1ECD79AF0;
  if (!objc_msgSend(v15, "count"))
  {
    v25 = 0;
    v18 = 0;
    goto LABEL_30;
  }
  v32 = v3;
  v17 = 0;
  v18 = 0;
  v19 = v16 + 1;
  while (1)
  {
    v20 = (v19 + v17) % (unint64_t)objc_msgSend(v15, "count", v32);
    objc_msgSend(v15, "pointerAtIndex:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_23;
    v22 = (void *)v21;
    if (!v18)
      _UIQOSProcessingBegin("IdleObservers", 0, v10, v9);
    objc_msgSend(v22, "_updateCycleIdleUntil:", v9);
    ++v18;
    qword_1ECD79AF0 = v20;
    v23 = mach_absolute_time();
    if (v23 > v9)
      break;
    v24 = v23 - v10;

    if (v24 > (unint64_t)(v13 * v14))
      goto LABEL_27;
LABEL_23:
    if (++v17 >= (unint64_t)objc_msgSend(v15, "count"))
    {
      v25 = 0;
      v3 = v32;
      goto LABEL_30;
    }
  }

LABEL_27:
  v3 = v32;
  v26 = _UIInternalPreferenceUsesDefault((int *)&unk_1ECD76650, (uint64_t)CFSTR("IdleSchedulerMinimumFramesBetweenNotify"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v27 = *(double *)&qword_1ECD76658;
  if (v26)
    v27 = 2.0;
  qword_1ECD79AF8 = (unint64_t)(v13 * v27 + (double)v32);
  v25 = 1;
LABEL_30:
  _isNotifyingIdleObservers = 0;
  v28 = qword_1ECD79B00;
  if (!qword_1ECD79B00)
  {
    v28 = __UILogCategoryGetNode("UpdateCycleIdleScheduler", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v28, (unint64_t *)&qword_1ECD79B00);
  }
  v29 = *(NSObject **)(v28 + 8);
  if (os_signpost_enabled(v29))
  {
    v30 = v29;
    v31 = mach_absolute_time();
    *(_DWORD *)buf = 134218496;
    v34 = (double)(v31 - v3) / v13;
    v35 = 2048;
    v36 = v18;
    v37 = 2048;
    v38 = v25;
    _os_signpost_emit_with_name_impl(&dword_185066000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NotifyIdleObservers", "elapsedAtEnd=%.2f, notifiedObservers=%ld, didPerformSignificantWork=%ld", buf, 0x20u);

  }
  if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
  {
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", &__block_literal_global_299);
    if (!v18)
      goto LABEL_40;
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_299);
    if (!v18)
      goto LABEL_40;
  }
  _UIQOSProcessingEnd();
  if (_UIUpdateCycleEnabled())
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
LABEL_40:

}

@end
