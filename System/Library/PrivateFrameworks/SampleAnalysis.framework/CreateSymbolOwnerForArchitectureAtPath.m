@implementation CreateSymbolOwnerForArchitectureAtPath

uint64_t __CreateSymbolOwnerForArchitectureAtPath_block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t SymbolOwner;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t SymbolOwnerCountAtTime;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    result = CSIsNull();
    if ((result & 1) == 0)
    {
      result = CSRelease();
      v3 = *(_QWORD *)(a1[6] + 8);
      *(_QWORD *)(v3 + 32) = 0;
      *(_QWORD *)(v3 + 40) = 0;
    }
  }
  else
  {
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
    v5 = *(_QWORD *)(a1[6] + 8);
    *(_QWORD *)(v5 + 32) = SymbolOwner;
    *(_QWORD *)(v5 + 40) = v6;
    if ((CSIsNull() & 1) != 0)
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v11 = a1[4];
        v12 = 138412546;
        v13 = v11;
        v14 = 2048;
        SymbolOwnerCountAtTime = CSSymbolicatorGetSymbolOwnerCountAtTime();
        _os_log_fault_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_FAULT, "No symbol owner at %@: %zu exist", (uint8_t *)&v12, 0x16u);
      }

      result = (uint64_t)__error();
      *(_DWORD *)result = v7;
    }
    else
    {
      result = CSRetain();
      v9 = *(_QWORD *)(a1[6] + 8);
      *(_QWORD *)(v9 + 32) = result;
      *(_QWORD *)(v9 + 40) = v10;
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  return result;
}

@end
