@implementation WBSMemoryFootprintMallocZone

- (WBSMemoryFootprintMallocZone)initWithMallocZone:(_malloc_zone_t *)a3
{
  WBSMemoryFootprintMallocZone *v4;
  WBSMemoryFootprintMallocZone *v5;
  const char *zone_name;
  uint64_t v7;
  NSString *name;
  WBSMemoryFootprintMallocZone *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSMemoryFootprintMallocZone;
  v4 = -[WBSMemoryFootprintMallocZone init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_addr = (unint64_t)a3;
    zone_name = malloc_get_zone_name(a3);
    if (zone_name)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", zone_name);
      v7 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v7;

    }
    malloc_zone_statistics(a3, &v5->_statistics);
    v9 = v5;
  }

  return v5;
}

- (WBSMemoryFootprintMallocZone)initWithCoder:(id)a3
{
  id v4;
  WBSMemoryFootprintMallocZone *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  _OWORD *v9;
  __int128 v10;
  WBSMemoryFootprintMallocZone *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSMemoryFootprintMallocZone;
  v5 = -[WBSMemoryFootprintMallocZone init](&v13, sel_init);
  if (v5)
  {
    v5->_addr = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("addr"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stats"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x20)
    {
      v9 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      v10 = v9[1];
      *(_OWORD *)&v5->_statistics.blocks_in_use = *v9;
      *(_OWORD *)&v5->_statistics.max_size_in_use = v10;
    }
    v11 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t addr;
  id v5;
  id v6;

  addr = self->_addr;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", addr, CFSTR("addr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_statistics, 32);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("stats"));

}

- (unint64_t)sizeInUse
{
  return self->_statistics.size_in_use;
}

- (unint64_t)sizeAllocated
{
  return self->_statistics.size_allocated;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_addr);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("addr"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_statistics.blocks_in_use);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("blocks_in_use"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_statistics.max_size_in_use);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("max_size_in_use"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_statistics.size_allocated);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("size_allocated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_statistics.size_in_use);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("size_in_use"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
