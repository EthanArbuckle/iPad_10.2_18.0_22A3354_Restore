@implementation UIHIDEventSynchronizer

uint64_t __57___UIHIDEventSynchronizer__processInitialDigitizerEvent___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __47___UIHIDEventSynchronizer__logPerformanceData___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

void __50___UIHIDEventSynchronizer__processDigitizerEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", IOHIDEventGetIntegerValue());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "pathId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v9);

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }

}

@end
