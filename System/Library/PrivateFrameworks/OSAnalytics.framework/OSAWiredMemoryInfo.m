@implementation OSAWiredMemoryInfo

- (OSAWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8
{
  OSAWiredMemoryInfo *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OSAWiredMemoryInfo;
  result = -[OSAWiredMemoryInfo init](&v15, sel_init);
  if (result)
  {
    result->zone_names = a3;
    result->zone_names_count = a4;
    result->zone_info = a5;
    result->zone_info_count = a6;
    result->wired_info = a7;
    result->wired_info_count = a8;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  self->zone_names = 0;
  self->zone_names_count = 0;
  self->zone_info = 0;
  self->zone_info_count = 0;
  self->wired_info = 0;
  self->wired_info_count = 0;
  v2.receiver = self;
  v2.super_class = (Class)OSAWiredMemoryInfo;
  -[OSAWiredMemoryInfo dealloc](&v2, sel_dealloc);
}

- (id)zoneInfo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  mach_zone_info_data *v16;
  uint64_t mzi_cur_size;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->zone_names_count);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->zone_names_count)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &self->zone_names[v5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_count);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("count"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_max_size);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("max_size"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_elem_size);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("elem_size"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_alloc_size);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("alloc_size"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_sum_size);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("sum_size"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_exhaustible);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("exhaustible"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->zone_info[v4].mzi_collectable);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("collectable"));

      v16 = &self->zone_info[v4];
      mzi_cur_size = v16->mzi_cur_size;
      if (!mzi_cur_size)
        mzi_cur_size = v16->mzi_elem_size * v16->mzi_count;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mzi_cur_size);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("size"));

      objc_msgSend(v3, "addObject:", v7);
      ++v6;
      ++v5;
      ++v4;
    }
    while (v6 < self->zone_names_count);
  }
  return v3;
}

- (id)vmRegionInfo
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  mach_memory_info *wired_info;
  uint64_t v25;
  void *v26;
  uint64_t name;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->wired_info_count);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)OSKextCopyLoadedKextInfo();
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = objc_msgSend(v4, "count");
  v7 = v5;
  v8 = 0x1E0C99000uLL;
  objc_msgSend(v7, "dictionaryWithCapacity:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __34__OSAWiredMemoryInfo_vmRegionInfo__block_invoke;
  v36[3] = &unk_1E4DEE730;
  v10 = v9;
  v37 = v10;
  v35 = v4;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v36);
  CSSymbolicatorCreateWithMachKernel();
  if (self->wired_info_count)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      objc_msgSend(*(id *)(v8 + 3592), "dictionaryWithCapacity:", 11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].flags);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("flags"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].site);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("site"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].size);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("size"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].free);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("free"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].largest);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("largest"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].collectable_bytes);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("collectable_bytes"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].mapped);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("mapped"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v11].peak);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("peak"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->wired_info[v11].tag);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("tag"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->wired_info[v11].zone);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("zone"));

      wired_info = self->wired_info;
      if ((wired_info[v11].flags & 0x400) != 0)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        name = (uint64_t)wired_info[v11].name;
      }
      else
      {
        switch(wired_info[v11].flags)
        {
          case 0u:
            -[OSAWiredMemoryInfo getTagNameForSite:](self, "getTagNameForSite:", wired_info[v11].site);
            v25 = objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          case 1u:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", wired_info[v11].site);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v29);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
              goto LABEL_9;
            goto LABEL_10;
          case 2u:
            if ((CSIsNull() & 1) != 0)
              goto LABEL_10;
            CSSymbolicatorGetSymbolWithAddressAtTime();
            if ((CSIsNull() & 1) != 0)
              goto LABEL_10;
            v34 = v10;
            v30 = v8;
            v31 = v3;
            v32 = (void *)MEMORY[0x1E0CB3940];
            name = CSSymbolGetName();
            v26 = v32;
            v3 = v31;
            v8 = v30;
            v10 = v34;
            break;
          case 3u:
            -[OSAWiredMemoryInfo getCounterNameForSite:](self, "getCounterNameForSite:", wired_info[v11].site);
            v25 = objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          default:
            goto LABEL_10;
        }
      }
      objc_msgSend(v26, "stringWithUTF8String:", name);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v28 = (void *)v25;
      if (v25)
      {
LABEL_9:
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("name"));
        objc_msgSend(v3, "addObject:", v13);

      }
LABEL_10:

      ++v12;
      ++v11;
    }
    while (v12 < self->wired_info_count);
  }
  if ((CSIsNull() & 1) == 0)
    CSRelease();

  return v3;
}

void __34__OSAWiredMemoryInfo_vmRegionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OSBundleLoadTag"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)getTagNameForSite:(unint64_t)a3
{
  __CFString *v4;

  if (objc_msgSend(&unk_1E4DFEF48, "count") <= a3)
  {
    if (a3 == 255)
    {
      v4 = CFSTR("VM_KERN_MEMORY_ANY");
    }
    else if (a3 == 256)
    {
      v4 = CFSTR("VM_KERN_MEMORY_COUNT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VM_KERN_MEMORY_%lld"), a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(&unk_1E4DFEF60, "objectAtIndexedSubscript:", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)getCounterNameForSite:(unint64_t)a3
{
  if (objc_msgSend(&unk_1E4DFEF78, "count") <= a3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VM_KERN_COUNT_%lld"), a3);
  else
    objc_msgSend(&unk_1E4DFEF90, "objectAtIndexedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
