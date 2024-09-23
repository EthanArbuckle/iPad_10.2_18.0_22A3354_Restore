@implementation OverallMemoryUsage

- (OverallMemoryUsage)init
{
  OverallMemoryUsage *v2;
  host_t v3;
  uint64_t v4;
  integer_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  size_t v16;
  int v17;
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)OverallMemoryUsage;
  v2 = -[OverallMemoryUsage init](&v29, sel_init);
  if (v2)
  {
    v3 = MEMORY[0x1DF0A4674]();
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    *(_OWORD *)host_info64_out = 0u;
    host_info64_outCnt = 38;
    if (host_statistics64(v3, 4, host_info64_out, &host_info64_outCnt))
    {

      v2 = 0;
    }
    else
    {
      v4 = host_info64_out[3];
      v5 = host_info64_out[0];
      v6 = HIDWORD(v24);
      v7 = v27;
      v8 = v28;
      v10 = DWORD2(v27);
      v9 = HIDWORD(v27);
      v17 = 0;
      v16 = 4;
      if (sysctlbyname("vm.pagesize", &v17, &v16, 0, 0))
      {
        v11 = v2;
        v2 = 0;
      }
      else
      {
        _wiredBytes = v17 * v4;
        _filebackedBytes = v17 * v10;
        _freeBytes = v17 * (unint64_t)(v5 - v6);
        _occupiedByCompressorBytes = v17 * v7;
        _storedInCompressorBytes = v8 * v17;
        _speculativeBytes = v17 * v6;
        _anonymousBytes = v17 * v9;
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = (void *)_sumMemoryAtEachPriority;
        _sumMemoryAtEachPriority = (uint64_t)v12;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _filebackedBytes + _freeBytes);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)_sumMemoryAtEachPriority, "setObject:forKeyedSubscript:", v14, &unk_1EA1BF9F0);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _wiredBytes);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)_sumMemoryAtEachPriority, "setObject:forKeyedSubscript:", v11, &unk_1EA1BFA08);
      }

    }
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v3);
  }
  return v2;
}

- (void)addProcessFootprint:(unint64_t)a3 withPriority:(int)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_sumMemoryAtEachPriority, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)_sumMemoryAtEachPriority, "objectForKeyedSubscript:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongValue");

    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v7 + a3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = a3;
  }
  objc_msgSend(v8, "numberWithUnsignedLongLong:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_sumMemoryAtEachPriority, "setObject:forKeyedSubscript:", v10, v11);

}

- (id)memoryUsageAtEachPriority
{
  return (id)_sumMemoryAtEachPriority;
}

+ (id)accumulateMemoryAcrossPrioritiesWithFootprints:(id)a3 withComparator:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v8, "sortedArrayUsingComparator:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 += objc_msgSend(v17, "unsignedLongValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v7;
}

- (id)memoryUsedAtOrAboveEachPriority
{
  return +[OverallMemoryUsage accumulateMemoryAcrossPrioritiesWithFootprints:withComparator:](OverallMemoryUsage, "accumulateMemoryAcrossPrioritiesWithFootprints:withComparator:", _sumMemoryAtEachPriority, &__block_literal_global_165);
}

uint64_t __53__OverallMemoryUsage_memoryUsedAtOrAboveEachPriority__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)memoryAvailableAtOrBelowEachPriority
{
  return +[OverallMemoryUsage accumulateMemoryAcrossPrioritiesWithFootprints:withComparator:](OverallMemoryUsage, "accumulateMemoryAcrossPrioritiesWithFootprints:withComparator:", _sumMemoryAtEachPriority, &__block_literal_global_167);
}

uint64_t __58__OverallMemoryUsage_memoryAvailableAtOrBelowEachPriority__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)systemMemoryStatsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("wired_down");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_wiredBytes >> 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("file_backed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_filebackedBytes >> 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("free");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_freeBytes >> 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = CFSTR("occupied_by_compressor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_occupiedByCompressorBytes >> 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v11[4] = CFSTR("stored_in_compressor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_storedInCompressorBytes >> 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v11[5] = CFSTR("speculative");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_speculativeBytes >> 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = CFSTR("anonymous");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)_anonymousBytes >> 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
