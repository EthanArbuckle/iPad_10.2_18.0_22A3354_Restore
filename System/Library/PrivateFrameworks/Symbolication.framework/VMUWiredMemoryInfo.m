@implementation VMUWiredMemoryInfo

- (VMUWiredMemoryInfo)init
{
  VMUWiredMemoryInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUWiredMemoryInfo;
  result = -[VMUWiredMemoryInfo init](&v3, sel_init);
  if (result)
  {
    result->zone_names = 0;
    result->zone_names_count = 0;
    result->zone_info = 0;
    result->zone_info_count = 0;
    result->wired_info = 0;
    result->wired_info_count = 0;
    result->ownsMachInfo = 1;
  }
  return result;
}

- (VMUWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8
{
  VMUWiredMemoryInfo *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VMUWiredMemoryInfo;
  result = -[VMUWiredMemoryInfo init](&v15, sel_init);
  if (result)
  {
    result->zone_names = a3;
    result->zone_names_count = a4;
    result->zone_info = a5;
    result->zone_info_count = a6;
    result->wired_info = a7;
    result->wired_info_count = a8;
    result->ownsMachInfo = 0;
  }
  return result;
}

- (void)resetMachInfo
{
  vm_map_t *v3;

  if (self->ownsMachInfo)
  {
    v3 = (vm_map_t *)MEMORY[0x1E0C83DA0];
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)self->zone_names, 8 * self->zone_names_count);
    mach_vm_deallocate(*v3, (mach_vm_address_t)self->zone_info, 8 * self->zone_info_count);
    mach_vm_deallocate(*v3, (mach_vm_address_t)self->wired_info, 8 * self->wired_info_count);
  }
  self->zone_names = 0;
  self->zone_names_count = 0;
  self->zone_info = 0;
  self->zone_info_count = 0;
  self->wired_info = 0;
  self->wired_info_count = 0;
  self->ownsMachInfo = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[VMUWiredMemoryInfo resetMachInfo](self, "resetMachInfo");
  v3.receiver = self;
  v3.super_class = (Class)VMUWiredMemoryInfo;
  -[VMUWiredMemoryInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)sample
{
  VMUWiredMemoryInfo *v2;
  mach_zone_name **p_zone_names;
  mach_port_t v4;
  kern_return_t v5;
  int v6;
  _BOOL4 v7;

  v2 = self;
  p_zone_names = &self->zone_names;
  if (self->zone_names || self->zone_info || self->wired_info)
    self = (VMUWiredMemoryInfo *)-[VMUWiredMemoryInfo resetMachInfo](self, "resetMachInfo");
  v4 = MEMORY[0x1A85A9218](self, a2);
  v5 = mach_memory_info(v4, p_zone_names, &v2->zone_names_count, &v2->zone_info, &v2->zone_info_count, &v2->wired_info, &v2->wired_info_count);
  v2->ownsMachInfo = 1;
  if (v5)
  {
    v6 = v5;
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VMUWiredMemoryInfo sample].cold.2(v6);
LABEL_12:
      LOBYTE(v7) = 0;
    }
  }
  else if (v2->zone_names_count == v2->zone_info_count)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    -[VMUWiredMemoryInfo resetMachInfo](v2, "resetMachInfo");
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VMUWiredMemoryInfo sample].cold.1();
      goto LABEL_12;
    }
  }
  return v7;
}

- (id)zoneInfo
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  mach_zone_info_data *v12;
  uint64_t mzi_cur_size;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->zone_names_count);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (self->zone_names_count)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0x1E0CB3000uLL;
    do
    {
      v22[0] = CFSTR("name");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &self->zone_names[v4]);
      v7 = objc_claimAutoreleasedReturnValue();
      v23[0] = v7;
      v22[1] = CFSTR("count");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_count);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v20;
      v22[2] = CFSTR("max_size");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_max_size);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v19;
      v22[3] = CFSTR("elem_size");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_elem_size);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v18;
      v22[4] = CFSTR("alloc_size");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_alloc_size);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[4] = v8;
      v22[5] = CFSTR("sum_size");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_sum_size);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[5] = v9;
      v22[6] = CFSTR("exhaustible");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_exhaustible);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[6] = v10;
      v22[7] = CFSTR("collectable");
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", self->zone_info[v3].mzi_collectable);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[7] = v11;
      v22[8] = CFSTR("size");
      v12 = &self->zone_info[v3];
      mzi_cur_size = v12->mzi_cur_size;
      v21 = (void *)v7;
      if (!mzi_cur_size)
        mzi_cur_size = v12->mzi_elem_size * v12->mzi_count;
      objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedLongLong:", mzi_cur_size);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[8] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addObject:", v15);
      ++v5;
      ++v4;
      ++v3;
      v6 = 0x1E0CB3000;
    }
    while (v5 < self->zone_names_count);
  }
  return v17;
}

- (id)vmRegionInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  mach_memory_info *wired_info;
  uint64_t v8;
  void *v9;
  uint64_t name;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[11];
  _QWORD v32[13];

  v32[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->wired_info_count);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)OSKextCopyLoadedKextInfo();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __34__VMUWiredMemoryInfo_vmRegionInfo__block_invoke;
  v29[3] = &unk_1E4E029D0;
  v21 = v3;
  v22 = v4;
  v30 = v22;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v29);
  CSSymbolicatorCreateWithMachKernel();
  if (self->wired_info_count)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      wired_info = self->wired_info;
      if ((wired_info[v5].flags & 0x400) != 0)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        name = (uint64_t)wired_info[v5].name;
      }
      else
      {
        switch(wired_info[v5].flags)
        {
          case 0u:
            -[VMUWiredMemoryInfo getTagNameForSite:](self, "getTagNameForSite:", wired_info[v5].site);
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          case 1u:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", wired_info[v5].site);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v18);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
              goto LABEL_9;
            goto LABEL_10;
          case 2u:
            if ((CSIsNull() & 1) != 0)
              goto LABEL_10;
            CSSymbolicatorGetSymbolWithAddressAtTime();
            if ((CSIsNull() & 1) != 0)
              goto LABEL_10;
            v19 = (void *)MEMORY[0x1E0CB3940];
            name = CSSymbolGetName();
            v9 = v19;
            break;
          case 3u:
            -[VMUWiredMemoryInfo getCounterNameForSite:](self, "getCounterNameForSite:", wired_info[v5].site);
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          default:
            goto LABEL_10;
        }
      }
      objc_msgSend(v9, "stringWithUTF8String:", name);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = (void *)v8;
      if (v8)
      {
LABEL_9:
        v31[0] = CFSTR("flags");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].flags);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v28;
        v31[1] = CFSTR("site");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].site);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v27;
        v31[2] = CFSTR("size");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].size);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v26;
        v31[3] = CFSTR("free");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].free);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v25;
        v31[4] = CFSTR("largest");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].largest);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32[4] = v24;
        v31[5] = CFSTR("collectable_bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].collectable_bytes);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32[5] = v12;
        v31[6] = CFSTR("mapped");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].mapped);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32[6] = v13;
        v31[7] = CFSTR("peak");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->wired_info[v5].peak);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[7] = v14;
        v31[8] = CFSTR("tag");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->wired_info[v5].tag);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32[8] = v15;
        v31[9] = CFSTR("zone");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->wired_info[v5].zone);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[10] = CFSTR("name");
        v32[9] = v16;
        v32[10] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "addObject:", v17);
      }
LABEL_10:
      ++v6;
      ++v5;
    }
    while (v6 < self->wired_info_count);
  }
  if ((CSIsNull() & 1) == 0)
    CSRelease();

  return v23;
}

void __34__VMUWiredMemoryInfo_vmRegionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
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

  if (objc_msgSend(&unk_1E4E20700, "count") <= a3)
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
    objc_msgSend(&unk_1E4E20718, "objectAtIndexedSubscript:", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)getCounterNameForSite:(unint64_t)a3
{
  if (objc_msgSend(&unk_1E4E20730, "count") <= a3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VM_KERN_COUNT_%lld"), a3);
  else
    objc_msgSend(&unk_1E4E20748, "objectAtIndexedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sample
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Insufficient permissions to call mach_memory_info: error code %d\n", (uint8_t *)v1, 8u);
}

@end
