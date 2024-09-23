@implementation NSDateFormatter

void __94__NSDateFormatter_HKSPSleep__hksp_timeStringFromDate_designatorString_designatorIsBeforeTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0C99728]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasPrefix:", CFSTR("a")))
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringWithRange:", a3, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v11 + 32) = a3;
    *(_QWORD *)(v11 + 40) = a4;
  }

}

@end
