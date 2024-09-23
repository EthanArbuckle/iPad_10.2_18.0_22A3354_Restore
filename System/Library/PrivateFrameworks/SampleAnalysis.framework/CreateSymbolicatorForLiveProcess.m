@implementation CreateSymbolicatorForLiveProcess

void __CreateSymbolicatorForLiveProcess_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)qword_1ED1DD8C8;
  qword_1ED1DD8C8 = (uint64_t)v0;

}

void __CreateSymbolicatorForLiveProcess_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = mach_absolute_time();
  v3 = SASecondsFromMachTimeUsingLiveTimebase(v2);
  v4 = CSSymbolicatorCreateWithPidFlagsAndNotification();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v6;
  if ((CSIsNull() & 1) == 0)
  {
    v7 = mach_absolute_time();
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SASecondsFromMachTimeUsingLiveTimebase(v7) - v3;
  }
}

@end
