@implementation PKTimeProfileEnd

void __PKTimeProfileEnd_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  objc_msgSend((id)qword_1ECF21CA0, "objectForKey:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = PKSecondsFromMachTimeInterval(v2 - objc_msgSend(v3, "unsignedLongLongValue"));
    v6 = v5;
    if (a1[5])
    {
      v7 = (void *)a1[6];
      if (!v7)
        v7 = (void *)a1[4];
      v8 = v7;
      v9 = a1[5];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v8;
        v15 = 2048;
        v16 = v6;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Time profile: %@: %g seconds", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Time profile: %g seconds"), *(_QWORD *)&v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[7] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend((id)qword_1ECF21CA0, "removeObjectForKey:", a1[4]);
  }

}

@end
