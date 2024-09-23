@implementation FPSharedCache

+ (id)sharedCacheForDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  uint64_t shared_cache;
  uint64_t v4;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  FPSharedCache *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  id *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  shared_cache = dyld_process_snapshot_get_shared_cache();
  if (!shared_cache)
    return 0;
  v4 = shared_cache;
  if ((MEMORY[0x2199B3048]() & 1) != 0)
    return 0;
  v23[0] = 0;
  v23[1] = 0;
  dyld_shared_cache_copy_uuid();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v23);
  v7 = MEMORY[0x2199B3030](v4);
  v8 = MEMORY[0x2199B303C](v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "hash") ^ v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_253D9EB70);
  sub_21345E7D0();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (FPSharedCache *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_21345E814;
    v17[3] = &unk_24CFC9268;
    v17[4] = &v18;
    MEMORY[0x2199B3018](v4, v17);
    v12 = v19[3];
    if (v7 < v12)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    if (v12)
      v13 = v7 - v12;
    else
      v13 = 0;
    sub_21345E7D0();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [FPSharedCache alloc];
    v15 = v6;
    if (v11)
    {
      v22.receiver = v11;
      v22.super_class = (Class)FPSharedCache;
      v16 = objc_msgSendSuper2(&v22, sel_init);
      v11 = (FPSharedCache *)v16;
      if (v16)
      {
        objc_storeStrong(v16 + 2, v6);
        v11->_baseAddress = v7;
        v11->_mappedSize = v8;
        v11->_slide = v13;
        v11->_alignment = 4096;
      }
    }

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v9);
    _Block_object_dispose(&v18, 8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253D9EB70);

  return v11;
}

- (BOOL)containsAddress:(unint64_t)a3
{
  unint64_t baseAddress;

  baseAddress = self->_baseAddress;
  return baseAddress <= a3 && self->_mappedSize + baseAddress > a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)baseAddress
{
  return self->_baseAddress;
}

- (unint64_t)mappedSize
{
  return self->_mappedSize;
}

- (unint64_t)slide
{
  return self->_slide;
}

- (unsigned)alignment
{
  return self->_alignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
