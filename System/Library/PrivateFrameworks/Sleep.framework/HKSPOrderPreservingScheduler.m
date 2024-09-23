@implementation HKSPOrderPreservingScheduler

uint64_t __56___HKSPOrderPreservingScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __40___HKSPOrderPreservingScheduler_suspend__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 1;
  return result;
}

uint64_t __39___HKSPOrderPreservingScheduler_resume__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

uint64_t __47___HKSPOrderPreservingScheduler__scheduleTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __60___HKSPOrderPreservingScheduler__scheduleNextTaskIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 9) && !*(_BYTE *)(v1 + 8))
  {
    objc_msgSend(*(id *)(v1 + 16), "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
}

uint64_t __55___HKSPOrderPreservingScheduler__actuallyScheduleTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __55___HKSPOrderPreservingScheduler__actuallyScheduleTask___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __47___HKSPOrderPreservingScheduler__taskDidFinish__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", 0);
}

@end
