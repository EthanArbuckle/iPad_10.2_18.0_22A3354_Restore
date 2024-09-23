@implementation WBSMemoryFootprint

+ (id)new
{
  return 0;
}

- (WBSMemoryFootprint)init
{

  return 0;
}

- (WBSMemoryFootprint)initWithError:(id *)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  mach_msg_type_number_t task_info_outCnt;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSMemoryFootprint;
  v3 = -[WBSMemoryFootprint init](&v10, sel_init, a3);
  if (v3)
  {
    task_info_outCnt = 93;
    task_info(*MEMORY[0x1E0C83DA0], 0x16u, (task_info_t)v3 + 2, &task_info_outCnt);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    malloc_get_all_zones();
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)*((_QWORD *)v3 + 48);
    *((_QWORD *)v3 + 48) = v5;

    v7 = v3;
  }

  return (WBSMemoryFootprint *)v3;
}

- (WBSMemoryFootprint)initWithCoder:(id)a3
{
  id v4;
  WBSMemoryFootprint *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *zones;
  void *v11;
  WBSMemoryFootprint *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSMemoryFootprint;
  v5 = -[WBSMemoryFootprint init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("zones"));
    v9 = objc_claimAutoreleasedReturnValue();
    zones = v5->_zones;
    v5->_zones = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vmInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x174)
      memcpy(&v5->_vmInfo, (const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes"), 0x174uLL);
    v12 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *zones;
  id v5;
  id v6;

  zones = self->_zones;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zones, CFSTR("zones"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_vmInfo, 372);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("vmInfo"));

}

- (unint64_t)residentSize
{
  return self->_vmInfo.resident_size;
}

- (unint64_t)dirtySize
{
  return self->_vmInfo.internal;
}

- (WBSMemoryFootprintMallocZone)defaultMallocZone
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_zones;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "name", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DefaultMallocZone"));

        if ((v9 & 1) != 0)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return (WBSMemoryFootprintMallocZone *)v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("zones");
  -[NSArray safari_mapObjectsUsingBlock:](self->_zones, "safari_mapObjectsUsingBlock:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("vm_info");
  v12[0] = CFSTR("internal_size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_vmInfo.internal);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("internal_size_peak");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_vmInfo.internal_peak);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("resident_size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_vmInfo.resident_size);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("resident_size_peak");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_vmInfo.resident_size_peak);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("virtual_size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_vmInfo.virtual_size);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __46__WBSMemoryFootprint_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSArray)zones
{
  return self->_zones;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
}

@end
