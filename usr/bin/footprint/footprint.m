void sub_100005684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000569C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000056AC(uint64_t a1)
{

}

void sub_1000056B4(uint64_t a1, void *a2, _BYTE *a3)
{
  char *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  _BOOL4 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  FPImage *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  _BYTE *v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  _DWORD v41[3];
  uint64_t v42;
  int v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[20];

  v5 = a2;
  if ((objc_msgSend(v5, "isKernelPageTableMemory") & 1) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = objc_msgSend(v5, "address");
    v9 = v6
      && (v8 = *(_QWORD *)(v6 + 24), v8 <= (unint64_t)v7)
      && *(_QWORD *)(v6 + 32) + v8 > (unint64_t)v7;
    memset(v46, 0, sizeof(v46));
    v45 = 0u;
    v44 = 0u;
    v41[0] = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_prot];
    v41[1] = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_maxProt];
    v41[2] = 0;
    v42 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_offset];
    v43 = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_user_tag];
    if (v9)
    {
      LODWORD(v44) = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_resident_size];
      DWORD1(v44) = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_shared_now_private_size];
      DWORD2(v44) = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_swapped_out_size];
      v11 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_dirty_size];
    }
    else
    {
      v10 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_resident_size];
      LODWORD(v44) = v10 / (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pageSize");
      v12 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_shared_now_private_size];
      DWORD1(v44) = v12 / (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pageSize");
      v13 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_swapped_out_size];
      DWORD2(v44) = v13 / (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pageSize");
      v14 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_dirty_size];
      v11 = v14 / (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pageSize");
    }
    HIDWORD(v44) = v11;
    LODWORD(v45) = *(unsigned __int16 *)&v5[OBJC_IVAR___VMUVMRegion_ref_count];
    WORD2(v45) = 0;
    BYTE6(v45) = v5[OBJC_IVAR___VMUVMRegion_external_pager];
    BYTE7(v45) = v5[OBJC_IVAR___VMUVMRegion_share_mode];
    *((_QWORD *)&v45 + 1) = v5[OBJC_IVAR___VMUVMRegion_is_submap] & 1;
    v15 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_object_id];
    *(_DWORD *)v46 = v15;
    *(_WORD *)&v46[4] = (v5[OBJC_IVAR___VMUVMRegion_is_wired] & 0x10) != 0;
    v16 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_reusable_size];
    if (!v9)
    {
      v17 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pageSize");
      v15 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_object_id];
      v16 /= v17;
    }
    *(_DWORD *)&v46[8] = v16;
    *(_QWORD *)&v46[12] = v15;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v18 = objc_alloc_init(FPImage);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
    sub_10000DE40(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v21);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v22 && *(_BYTE *)(v22 + 8))
    {
      v23 = objc_msgSend(v5, "address");
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v24)
        *(_QWORD *)(v24 + 16) = v23;
      v25 = objc_msgSend(v5, "length");
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v27)
        *(_QWORD *)(v27 + 24) = v25;
      if (v9 && (v28 = *(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) != 0 && v28[8] == 4)
      {
        objc_setProperty_nonatomic_copy(v28, v26, CFSTR("dyld shared cache"), 40);
      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
        v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v31)
          objc_setProperty_nonatomic_copy(v31, v29, v30, 40);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = 0;

    }
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("commpage (reserved)")) & 1) != 0
      || (objc_msgSend(v21, "isEqualToString:", CFSTR("GPU Carveout (reserved)")) & 1) != 0
      || *(int *)&v5[OBJC_IVAR___VMUVMRegion_user_tag] <= -2)
    {
      v34 = v21;
      v35 = 1;
    }
    else
    {
      v34 = 0;
      v35 = 0;
    }
    if (v5[OBJC_IVAR___VMUVMRegion_external_pager])
      v36 = 1;
    else
      v36 = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_user_tag] == 88;
    v37 = *(_QWORD *)(a1 + 40);
    v38 = objc_msgSend(v5, "address");
    v39 = objc_msgSend(v5, "length");
    if (v36)
      v40 = *(_QWORD *)&v5[OBJC_IVAR___VMUVMRegion_path];
    else
      v40 = 0;
    *a3 = (*(uint64_t (**)(uint64_t, id, id, _DWORD *, _QWORD, uint64_t, id, uint64_t))(v37 + 16))(v37, v38, v39, v41, *(unsigned int *)&v5[OBJC_IVAR___VMUVMRegion_purgeable], v40, v34, v35);

  }
}

int64x2_t *sub_100005D70(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  int64x2_t *v9;
  int64x2_t *v10;
  FPRangeList *v11;
  void *v12;

  if (result)
  {
    v9 = result;
    v10 = (int64x2_t *)result[6].i64[1];
    if (!v10)
    {
      v11 = objc_alloc_init(FPRangeList);
      v12 = (void *)v9[6].i64[1];
      v9[6].i64[1] = (uint64_t)v11;

      v10 = (int64x2_t *)v9[6].i64[1];
    }
    return sub_10000D97C(v10, a2, a3, a5, a4);
  }
  return result;
}

__CFString *sub_100005DE8(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  objc_opt_self(a1);
  if ((a2 & 0xFFFFFFF0) == 0xF0)
  {
    if (qword_1000348D0 != -1)
      dispatch_once(&qword_1000348D0, &stru_100029098);
    v3 = (__CFString *)*((id *)&unk_1000348C8 + (a2 - 240) + 4);
    goto LABEL_5;
  }
  if (a2 > 0xFF)
  {
    if ((_DWORD)a2 == -1)
    {
      v3 = CFSTR("Owned physical footprint (unmapped)");
      return v3;
    }
  }
  else
  {
    v4 = off_100028848[a2];
    if (v4)
    {
      v3 = v4;
      return v3;
    }
    v5 = VMURegionTypeDescriptionForTagShareProtAndPager(a2, 0, 0, 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
    if (!-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("Memory Tag")))
    {
LABEL_5:
      if (v3)
        return v3;
      goto LABEL_14;
    }

  }
LABEL_14:
  v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tag %d"), a2));
  v7 = (void *)v6;
  v8 = CFSTR("unknown");
  if (v6)
    v8 = (__CFString *)v6;
  v3 = v8;

  return v3;
}

void sub_100005F10(id a1)
{
  uint64_t i;
  id v2;
  char *v3;
  void *v4;

  for (i = 0; i != 16; ++i)
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("app-specific tag %d"), i + 1);
    v3 = (char *)&unk_1000348C8 + 8 * i;
    v4 = (void *)*((_QWORD *)v3 + 4);
    *((_QWORD *)v3 + 4) = v2;

  }
}

id sub_100005F8C(uint64_t a1, unint64_t a2)
{
  id v3;

  objc_opt_self(a1);
  if (a2 > 5)
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("VM ledger tag %llu"), a2);
  else
    v3 = qword_100029048[a2];
  return v3;
}

BOOL sub_100006064(uint64_t a1, unint64_t a2)
{
  unsigned int v2;
  BOOL v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!a1 || *(_DWORD *)(a1 + 12) == -1 || (*(_BYTE *)(a1 + 8) & 2) != 0)
    return 0;
  v2 = *(unsigned __int8 *)(a1 + 10);
  v3 = v2 > 6;
  v4 = (1 << v2) & 0x4C;
  v5 = v3 || v4 == 0;
  if (!v5 || *(unsigned __int8 *)(a1 + 9) - 5 > 0xFFFFFFFC)
    return 0;
  v6 = 0;
  if ((*(_BYTE *)(a1 + 8) & 8) == 0)
  {
    v8 = *(_QWORD *)(a1 + 88);
    if (v8 > a2)
    {
      v9 = *(_QWORD *)(a1 + 16);
      if (v9 != v8)
      {
        v10 = *(_QWORD *)(a1 + 24);
        if (v10 != v8)
        {
          v11 = *(_QWORD *)(a1 + 32);
          if (v11 != v8)
          {
            v12 = *(_QWORD *)(a1 + 40);
            if (v12 != v8)
              return (v10 | v9 | v11 | v12) != 0;
          }
        }
      }
      return 0;
    }
  }
  return v6;
}

BOOL sub_100006114(_BOOL8 result)
{
  int v1;

  if (result)
  {
    if ((*(_BYTE *)(result + 8) & 2) == 0)
      return 0;
    v1 = *(unsigned __int8 *)(result + 9);
    if (v1 == 2 || v1 == 4)
      return 0;
    else
      return *(_QWORD *)(result + 16) || *(_QWORD *)(result + 24) != 0;
  }
  return result;
}

void sub_1000064AC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  v2 = (void *)qword_1000348D8;
  qword_1000348D8 = v1;

}

id *sub_1000064D8(uint64_t a1, uint64_t a2)
{
  uint64_t shared_cache;
  uint64_t v4;
  id v6;
  unint64_t base_address;
  void *mapped_size;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  objc_opt_self(a1);
  shared_cache = dyld_process_snapshot_get_shared_cache(a2);
  if (!shared_cache)
    return (id *)0;
  v4 = shared_cache;
  if ((dyld_shared_cache_is_mapped_private() & 1) != 0)
    return (id *)0;
  v25[0] = 0;
  v25[1] = 0;
  dyld_shared_cache_copy_uuid(v4, v25);
  v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v25);
  base_address = dyld_shared_cache_get_base_address(v4);
  mapped_size = (void *)dyld_shared_cache_get_mapped_size(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v6, "hash") ^ base_address));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100034970);
  v10 = sub_100006710();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));

  if (!v12)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006754;
    v20[3] = &unk_100029108;
    v20[4] = &v21;
    dyld_shared_cache_for_each_file(v4, v20);
    v15 = v22[3];
    if (base_address < v15)
    {
      v19 = _os_assert_log(0, v13, v14);
      _os_crash(v19);
      __break(1u);
    }
    if (v15)
      v16 = (void *)(base_address - v15);
    else
      v16 = 0;
    v17 = sub_100006710();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v12 = sub_1000067EC((id *)[FPSharedCache alloc], v6, (void *)base_address, mapped_size, v16);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, v9);

    _Block_object_dispose(&v21, 8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100034970);

  return v12;
}

void sub_1000066E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006710()
{
  void *v0;
  id v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)qword_100034968;
  if (!qword_100034968)
  {
    v1 = objc_alloc_init((Class)NSMutableDictionary);
    v2 = (void *)qword_100034968;
    qword_100034968 = (uint64_t)v1;

    v0 = (void *)qword_100034968;
  }
  return v0;
}

uint64_t sub_100006754(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(*(_QWORD *)(v2 + 8) + 24))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000067BC;
    v3[3] = &unk_1000290E0;
    v3[4] = v2;
    return dyld_shared_cache_for_file(a2, v3);
  }
  return result;
}

uint64_t sub_1000067BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = dyld_shared_cache_get_base_address(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id *sub_1000067EC(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id *v11;
  objc_super v13;

  v10 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)FPSharedCache;
    v11 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      a1[3] = a3;
      a1[4] = a4;
      a1[5] = a5;
      *((_DWORD *)a1 + 2) = 4096;
    }
  }

  return a1;
}

void sub_1000068FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v8 = v5;
  if (!a1)
    goto LABEL_4;
  if (v5)
  {
    sub_100006970(a1, v10, (uint64_t)objc_msgSend(v5, "pageSize"), v5);
LABEL_4:

    return;
  }
  v9 = _os_assert_log(0, v6, v7);
  _os_crash(v9);
  __break(1u);
}

void sub_100006970(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  FPRangeList *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unsigned __int8 *v23;

  v23 = a2;
  v9 = a4;
  if (!a1)
  {
LABEL_19:

    return;
  }
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 16), "addObject:", v23);
    v10 = v23;
    if (v23 && *((_QWORD *)v23 + 12))
    {
      if (v9)
      {
        objc_opt_self(FPFootprint);
        v10 = v23;
        if (!byte_100038A08)
        {
          if (*(_QWORD *)(a1 + 64)
            || (v23[8] & 2) == 0
            && ((v17 = v23[10], v17 > 6) || ((1 << v17) & 0x4C) == 0)
            && v23[9] - 5 <= 0xFFFFFFFC)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "pid")));
            v12 = *(void **)(a1 + 64);
            if (!v12)
            {
              v13 = objc_alloc_init((Class)NSMutableDictionary);
              v14 = *(void **)(a1 + 64);
              *(_QWORD *)(a1 + 64) = v13;

              v12 = *(void **)(a1 + 64);
            }
            v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));
            if (!v15)
            {
              v16 = *(void **)(a1 + 64);
              v15 = objc_alloc_init((Class)NSMutableArray);
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v11);
            }
            objc_msgSend(v15, "addObject:", v23);

            v10 = v23;
          }
        }
      }
      v18 = *(_QWORD *)(a1 + 72);
      if (!v18)
      {
        v19 = objc_alloc_init(FPRangeList);
        v20 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v19;

        v10 = v23;
        v18 = *(_QWORD *)(a1 + 72);
      }
      sub_10000DC8C(v18, v10, a3);
      v21 = (void *)*((_QWORD *)v23 + 13);
      *((_QWORD *)v23 + 13) = 0;

    }
    goto LABEL_19;
  }
  v22 = _os_assert_log(0, v7, v8);
  _os_crash(v22);
  __break(1u);
}

void sub_100006BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *j;
  void *v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *k;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *m;
  _DWORD *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  int64x2_t v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];

  if (!a1)
    return;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v40 = _os_assert_log(0, a2, a3);
    _os_crash(v40);
    __break(1u);
  }
  v4 = a2;
  v64 = 0u;
  v65 = 0u;
  v63 = 0u;
  sub_10000DD94(*(_QWORD *)(a1 + 72), &v63);
  if (v4)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v5 = *(id *)(a1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)(a1 + 24) += objc_msgSend(v10, "dirtySize");
          *(_QWORD *)(a1 + 32) += objc_msgSend(v10, "swappedSize");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v7);
    }
LABEL_34:

    goto LABEL_35;
  }
  *(int64x2_t *)(a1 + 24) = v63;
  if (*(_QWORD *)(a1 + 64) && sub_100011E4C())
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "objectEnumerator"));
    v42 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(_QWORD *)v56 != v41)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
          if (v14)
          {
            v15 = v14;
            v16 = 0;
            v17 = 0;
            v18 = *(_QWORD *)v52;
            do
            {
              for (k = 0; k != v15; k = (char *)k + 1)
              {
                if (*(_QWORD *)v52 != v18)
                  objc_enumerationMutation(v13);
                v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k);
                v17 += (unint64_t)objc_msgSend(v20, "dirtySize");
                v16 += (unint64_t)objc_msgSend(v20, "swappedSize");
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
            }
            while (v15);

            if (v17 > *(_QWORD *)(a1 + 24))
              *(_QWORD *)(a1 + 24) = v17;
            if (v16 > *(_QWORD *)(a1 + 32))
              *(_QWORD *)(a1 + 32) = v16;
          }
          else
          {

          }
        }
        v42 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v42);
      LOBYTE(v4) = 0;
    }
    goto LABEL_34;
  }
LABEL_35:
  *(_OWORD *)(a1 + 40) = v64;
  *(_QWORD *)(a1 + 56) = v65;
  v21 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;

  if ((v4 & 1) == 0 && (unint64_t)objc_msgSend(*(id *)(a1 + 64), "count") >= 2)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "objectEnumerator"));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v48;
LABEL_39:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v26);
        if ((unint64_t)objc_msgSend(v27, "count") > 1)
          goto LABEL_52;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
        if (objc_msgSend(v28, "dirtySize") != *(id *)(a1 + 24)
          || objc_msgSend(v28, "swappedSize") != *(id *)(a1 + 32)
          || objc_msgSend(v28, "cleanSize") != *(id *)(a1 + 40)
          || objc_msgSend(v28, "reclaimableSize") != *(id *)(a1 + 48)
          || objc_msgSend(v28, "wiredSize") != *(id *)(a1 + 56))
        {

          goto LABEL_52;
        }

        if (v24 == (id)++v26)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
          if (v24)
            goto LABEL_39;
          break;
        }
      }
    }

    *(_BYTE *)(a1 + 8) |= 2u;
  }
  v22 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;
LABEL_52:

  if ((v4 & 1) == 0 && objc_msgSend((id)a1, "containsFakeRegion"))
  {
    v29 = sub_100007158(a1);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)v30;
    if (!v30 || *(_DWORD *)(v30 + 12) != -1)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v32 = *(id *)(a1 + 16);
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v66, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v44;
        do
        {
          for (m = 0; m != v34; m = (char *)m + 1)
          {
            if (*(_QWORD *)v44 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_DWORD **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)m);
            if (v37)
            {
              if (v37[3] == -1)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
                objc_msgSend(v37, "setName:", v38);

                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "detailedName"));
                objc_msgSend(v37, "setDetailedName:", v39);

              }
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v66, 16);
        }
        while (v34);
      }

    }
  }
  *(_BYTE *)(a1 + 8) |= 1u;
}

id sub_100007158(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!a1)
    return 0;
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 16), "firstObject"));
  v3 = (void *)v2;
  if (v2 && (*(_BYTE *)(v2 + 8) & 2) != 0)
  {
    v4 = 1;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 12) != -1)
  {
    v4 = 0;
LABEL_7:
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(id *)(a1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
          if (v4)
          {
            if (!v10 || (*(_BYTE *)(v10 + 8) & 4) == 0)
              goto LABEL_22;
          }
          else if (!v10 || *(_DWORD *)(v10 + 12) != -1)
          {
LABEL_22:
            v11 = (id)v10;

            goto LABEL_23;
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  v11 = v3;
LABEL_23:

  return v11;
}

uint64_t sub_100007C24(int a1, _OWORD *buffer)
{
  uint64_t result;

  if (proc_pidinfo(a1, 3, 0, buffer, 136) == 136)
    return 1;
  if (a1)
    return 0;
  *((_QWORD *)buffer + 16) = 0;
  buffer[4] = xmmword_1000215B0;
  buffer[5] = unk_1000215C0;
  buffer[6] = xmmword_1000215D0;
  buffer[7] = unk_1000215E0;
  *buffer = xmmword_100021570;
  buffer[1] = unk_100021580;
  result = 1;
  buffer[2] = xmmword_100021590;
  buffer[3] = unk_1000215A0;
  return result;
}

__CFString *sub_100007D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  __CFString *v7;

  objc_opt_self(a1);
  v3 = a2 + 64;
  if (*(_BYTE *)(a2 + 64))
  {
    v4 = 32;
  }
  else
  {
    v6 = *(unsigned __int8 *)(a2 + 48);
    v5 = a2 + 48;
    if (!v6)
    {
      v7 = CFSTR("Unknown");
      return v7;
    }
    v4 = 16;
    v3 = v5;
  }
  v7 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%.*s"), v4, v3);
  return v7;
}

void *sub_10000806C(_QWORD *a1)
{
  int v2;
  int v3;
  char *v4;
  unsigned int v5;
  unsigned int v6;
  _OWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  unsigned int v13;
  void *v14;

  *a1 = 0;
  v2 = proc_listallpids(0, 0);
  if (v2 < 0)
    return 0;
  v3 = 4 * (v2 + 20);
  v4 = (char *)malloc_type_malloc(4 * (v2 + 20), 0x100004052888210uLL);
  v5 = proc_listallpids(v4, v3);
  if ((v5 & 0x80000000) != 0)
  {
    v14 = v4;
LABEL_11:
    free(v14);
    return 0;
  }
  v6 = v5;
  v7 = malloc_type_malloc(136 * v5, 0x11B869D5uLL);
  v8 = v7;
  if (!v6)
  {
    free(v4);
LABEL_10:
    v14 = v8;
    goto LABEL_11;
  }
  v9 = 0;
  LODWORD(v10) = 0;
  v11 = 4 * v6;
  v12 = v7;
  do
  {
    v13 = sub_100007C24(*(_DWORD *)&v4[v9], v12);
    v12 = (_OWORD *)((char *)v12 + 136 * v13);
    v10 = v10 + v13;
    v9 += 4;
  }
  while (v11 != v9);
  free(v4);
  if (!(_DWORD)v10)
    goto LABEL_10;
  *a1 = v10;
  return v8;
}

uint64_t sub_100008B3C(uint64_t a1, void *a2)
{
  void (**v3)(id, _DWORD *, unint64_t);
  _DWORD *v4;
  unint64_t v5;
  mach_vm_address_t v6;
  mach_vm_size_t v8;
  mach_vm_address_t kcd_addr_begin;

  v3 = a2;
  if (!(_DWORD)a1)
    goto LABEL_12;
  v8 = 0;
  kcd_addr_begin = 0;
  if (task_map_corpse_info_64(mach_task_self_, a1, &kcd_addr_begin, &v8))
  {
LABEL_11:
    a1 = 0;
    goto LABEL_12;
  }
  v4 = (_DWORD *)kcd_addr_begin;
  v5 = v8 + kcd_addr_begin;
  v6 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v8 + kcd_addr_begin
    || v6 + *(unsigned int *)(kcd_addr_begin + 4) > v5
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    vm_deallocate(mach_task_self_, kcd_addr_begin, v8);
    goto LABEL_11;
  }
  do
  {
    if (v6 + v4[1] > v5)
      break;
    if (*v4 == -242132755)
      break;
    v3[2](v3, v4, v5);
    v4 = (_DWORD *)(v6 + v4[1]);
    v6 = (mach_vm_address_t)(v4 + 4);
  }
  while ((unint64_t)(v4 + 4) <= v5);
  vm_deallocate(mach_task_self_, kcd_addr_begin, v8);
  a1 = 1;
LABEL_12:

  return a1;
}

void sub_10000954C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1000097B8(id *a1, void *a2)
{
  id v3;
  int *v4;
  void *v5;
  FILE *v6;
  id v7;
  const char *v8;
  id v9;
  char __strerrbuf[256];

  if (a1)
  {
    v3 = a2;
    v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %s"), v3, __strerrbuf));

    v6 = __stderrp;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "displayString")));
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = objc_retainAutorelease(v5);
    fprintf(v6, "%s: %s\n", v8, (const char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(a1[5], "addObject:", v9);
  }
}

void sub_100009BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100009BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v45;
  uint64_t v46;

  if (a3)
  {
    v7 = 0;
    v41 = a3 - 1;
    v42 = a5 - 1;
    do
    {
      v8 = !(v7 | a4) && !*(_BYTE *)(a1 + 80) && *(_BYTE *)(a1 + 81) != 0;
      v9 = 0;
      if (v42 == a4 && v41 == v7)
        v9 = *(_BYTE *)(a1 + 82) != 0;
      v10 = *(_DWORD *)(a2 + 4 * v7);
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(id *)(a1 + 32);
      if (v8)
      {
        if (v14)
        {
          v15 = v14[10];
          v16 = v14[11];
          v17 = v15 & -(uint64_t)v11;
        }
        else
        {
          v17 = 0;
          v15 = 0;
          v16 = 0;
        }
        v11 = v11 - v15 + v17;
        if (v16 < v11)
          goto LABEL_21;
      }
      else if (v9)
      {
        if (v14)
        {
          v19 = v14[10];
          v18 = v14[11];
          v20 = v19 == -1 ? -1 : v18 + v19;
          v21 = (v11 + v20 - 1) & -(uint64_t)v11;
        }
        else
        {
          v21 = 0;
          v20 = 0;
          v18 = 0;
        }
        v11 = v11 - v21 + v20;
        if (v18 < v11)
        {
LABEL_21:
          if (v14)
            v11 = v14[11];
          else
            v11 = 0;
        }
      }
      v22 = (v10 & 0x81) == 1 || (v10 & 8) != 0;
      if (v22)
      {
        v23 = (_QWORD *)(v12 + 24);
LABEL_30:
        *v23 += v11;
        goto LABEL_31;
      }
      if ((v10 & 0x10) != 0)
      {
        v23 = (_QWORD *)(v13 + 24);
        goto LABEL_30;
      }
LABEL_31:

      if (v8)
      {
        v26 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 168);
        if (v26)
        {
          v27 = *(_QWORD *)(a1 + 32);
          if (v27)
            v27 = *(_QWORD *)(v27 + 80);
          v28 = v26[10];
          if (v28 != -1)
            v28 += v26[11];
          if (v27 != v28)
          {
            v40 = _os_assert_log(0, v24, v25);
            _os_crash(v40);
            __break(1u);
            return;
          }
          v45 = 0;
          v46 = 0;
          v29 = *(_QWORD *)(a1 + 64);
          v30 = v26;
          v31 = v26[10];
          v32 = v30[11];
          if (v31 == -1)
            v33 = -1;
          else
            v33 = v32 + v31;
          v34 = v29 - ((v29 + v33 - 1) & -v29) + v33;
          if (v32 < v34)
            v34 = v30[11];
          if (v22)
          {
            v35 = (unint64_t *)&v46;
            goto LABEL_49;
          }
          if ((v10 & 0x10) != 0)
          {
            v35 = (unint64_t *)&v45;
LABEL_49:
            *v35 = v34;
            v36 = v45;
            v37 = v46;
          }
          else
          {
            v36 = 0;
            v37 = 0;
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setDirtySize:", (char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "dirtySize") + v37);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setSwappedSize:", (char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "swappedSize") + v36);
          v38 = *(_QWORD *)(a1 + 40);
          v39 = *(void **)(v38 + 168);
          *(_QWORD *)(v38 + 168) = 0;

        }
      }
      if (v9)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152) = *(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 64);
        *(_DWORD *)(*(_QWORD *)(a1 + 40) + 160) = v10;
      }
      ++v7;
    }
    while (a3 != v7);
  }
}

uint64_t sub_100009EC8(void *a1, mach_vm_offset_t a2, unint64_t a3, void *a4)
{
  void (**v7)(id, char *, mach_vm_size_t, _QWORD, unint64_t);
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_vm_size_t v17;
  id v18;
  mach_error_t v19;
  uint64_t v21;
  _BYTE *v22;
  mach_vm_size_t dispositions_count;

  v7 = a4;
  if (a1)
  {
    v8 = objc_msgSend(a1, "pageSize");
    if (a3 >= 0x1000)
      v9 = 4096;
    else
      v9 = a3;
    v10 = a3 + 4095;
    if (a3 + 4095 >= 0x1000)
    {
      v12 = v8;
      v21 = (uint64_t)&v21;
      v22 = a1;
      v13 = 0;
      v14 = v10 >> 12;
      if (v10 >> 12 <= 1)
        v15 = 1;
      else
        v15 = v10 >> 12;
      v16 = (_QWORD)v8 << 12;
      while (1)
      {
        v17 = a3 >= v9 ? v9 : a3;
        dispositions_count = v17;
        v18 = v12;
        v19 = mach_vm_page_range_query(*((_DWORD *)v22 + 24), a2, v17 * (_QWORD)v12, (mach_vm_address_t)&v21 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), &dispositions_count);
        if (v19)
          break;
        v7[2](v7, (char *)&v21 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count, v13++, v14);
        a2 += v16;
        a3 -= 4096;
        v12 = v18;
        if (v15 == v13)
        {
          v11 = 1;
          goto LABEL_18;
        }
      }
      sub_10000A484(v22, v19, CFSTR("mach_vm_page_range_query"));
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

void sub_10000A484(_BYTE *a1, mach_error_t a2, void *a3)
{
  id v5;
  const char *v6;
  int v7;
  BOOL v8;
  BOOL v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  const char *v13;
  NSString *v14;
  void *v15;
  int *v16;
  FILE *v17;
  id v18;
  _OWORD buffer[4];

  v5 = a3;
  if (a1 && !a1[176])
  {
    a1[176] = 1;
    v6 = "";
    if (objc_msgSend(a1, "_isAlive"))
    {
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo((int)objc_msgSend(a1, "pid"), 13, 1uLL, buffer, 64) == 64)
        v7 = 0;
      else
        v7 = *__error();
      v10 = v7 == 0;
      v11 = HIDWORD(buffer[0]) == 5;
      v8 = v10 && v11;
      v12 = !v10 || !v11;
      v13 = " (zombie)";
      if (v12)
        v13 = "";
      v9 = v7 == 3;
      if (v7 == 3)
        v6 = " (process exited)";
      else
        v6 = v13;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %s%s"), v5, mach_error_string(a2), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = &OBJC_IVAR___FPProcess__warnings;
    if (!v8 && !v9)
    {
      v17 = __stderrp;
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "displayString")));
      fprintf(v17, "%s: bailing out due to error: %s\n", (const char *)objc_msgSend(v18, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));

      v16 = &OBJC_IVAR___FPProcess__errors;
    }
    objc_msgSend(*(id *)&a1[*v16], "addObject:", v15);

  }
}

void sub_10000A7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

int64x2_t *sub_10000A80C(int64x2_t *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  int64x2_t *v8;
  unint64_t i;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (a5 - 1 == a4)
    v5 = a3 + 1;
  else
    v5 = a3;
  if (v5)
  {
    v8 = result;
    for (i = 0; i != v5; ++i)
    {
      if (i >= a3)
      {
        v11 = 0;
      }
      else
      {
        v10 = *(_DWORD *)(a2 + 4 * i);
        if ((v10 & 0x10) != 0)
        {
          v11 = 2;
        }
        else if ((v8[4].i32[0] & v10) != 0)
        {
          v11 = 1;
        }
        else
        {
          v17 = (v8[4].i32[1] & v10) == 0;
          v12 = 4 * (v10 & 1);
          if (v17)
            v11 = v12;
          else
            v11 = 3;
        }
      }
      v13 = v8[2].i64[1];
      v14 = *(_QWORD *)(v13 + 8);
      v15 = *(_QWORD *)(v14 + 24);
      if (v15 != v11)
      {
        v16 = v8[3].i64[0];
        v17 = !v15 || *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40) == 0;
        if (!v17)
        {
          v22 = 0u;
          v23 = 0u;
          v21 = 0u;
          switch(*(_QWORD *)(*(_QWORD *)(v13 + 8) + 24))
          {
            case 0:
              _os_crash("Tried to add an empty subrange");
              __break(1u);
              JUMPOUT(0x10000A9E8);
            case 1:
              *(_QWORD *)&v21 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            case 2:
              *((_QWORD *)&v21 + 1) = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            case 3:
              *((_QWORD *)&v22 + 1) = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            case 4:
              *(_QWORD *)&v22 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
              break;
            default:
              break;
          }
          v18 = *(_QWORD *)(v16 + 8);
          if (v8[4].i8[8])
          {
            *(_QWORD *)&v23 = *(_QWORD *)(v18 + 40);
            v18 = *(_QWORD *)(v16 + 8);
          }
          result = sub_100005D70((int64x2_t *)v8[2].i64[0], *(_QWORD *)(v18 + 32), *(_QWORD *)(v18 + 40), (uint64_t *)&v21, v8[3].i64[1]);
          v19 = *(_QWORD *)(v8[3].i64[0] + 8);
          *(_QWORD *)(v19 + 32) += *(_QWORD *)(v19 + 40);
          *(_QWORD *)(v19 + 40) = 0;
          v14 = *(_QWORD *)(v8[2].i64[1] + 8);
        }
      }
      *(_QWORD *)(v14 + 24) = v11;
      if (*(_QWORD *)(*(_QWORD *)(v8[2].i64[1] + 8) + 24))
        v20 = 40;
      else
        v20 = 32;
      *(_QWORD *)(*(_QWORD *)(v8[3].i64[0] + 8) + v20) += v8[3].i64[1];
    }
  }
  return result;
}

uint64_t sub_10000AA00(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000AA10(uint64_t a1)
{

}

uint64_t sub_10000AA18(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7, int a8)
{
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  FPMemoryRegion *v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  int *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  unsigned __int8 *v37;
  unint64_t v38;
  uint64_t v39;
  FPMemoryRegion *v40;
  unint64_t v41;
  unint64_t start;
  BOOL v43;
  unint64_t v44;
  char v45;
  int v46;
  unsigned __int8 *v47;
  uint64_t v48;
  uint64_t v49;
  FPMemoryRegion *v50;
  FPMemoryRegion *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  id v63;
  id v64;
  int v65;
  void *v66;
  unint64_t v67;
  unsigned __int8 *v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  id v75;
  id v76;
  const __CFString *v77;
  __CFString *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unint64_t v85;
  int v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  char **v93;
  id v94;
  void *v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v102;
  char *v103;
  id v104;
  uint64_t v105;
  id v106;
  id v108;
  unint64_t v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  char *v115;
  char *v116;

  v14 = a6;
  v15 = a7;
  v16 = *(_QWORD *)(a1 + 80);
  v17 = a3 + a2;
  v18 = v16 < a3 + a2 && *(_QWORD *)(a1 + 88) + v16 > a2;
  v109 = a2;
  if (!v18)
  {
    v106 = v15;
    v19 = objc_alloc_init(FPMemoryRegion);
    v20 = (uint64_t)v19;
    if (v19)
    {
      v19->_start = a2;
      v19->_size = a3;
      v22 = (_QWORD *)(a4 + 68);
      v21 = *(_QWORD *)(a4 + 68);
      v23 = (int *)(a4 + 20);
      v19->_user_tag = *(_DWORD *)(a4 + 20);
      v19->_object_id = v21;
      v19->_share_mode = *(_BYTE *)(a4 + 47);
      v19->_offset = *(_QWORD *)(a4 + 12);
      LOBYTE(v21) = *((_BYTE *)v19 + 8);
      *((_BYTE *)v19 + 8) = v21 & 0xFD;
      *((_BYTE *)v19 + 8) = v21 & 0xFC | (*(_WORD *)(a4 + 60) != 0);
    }
    else
    {
      v23 = (int *)(a4 + 20);
      v22 = (_QWORD *)(a4 + 68);
    }
    if (a5 == 2)
    {
      -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", 0);
      v26 = (void *)v20;
      v25 = a3;
    }
    else
    {
      if (a5 != 1)
      {
        if (*(_BYTE *)(a4 + 46) || *(_BYTE *)(a1 + 97))
          v69 = *(_DWORD *)(a4 + 36);
        else
          v69 = *(_DWORD *)(a4 + 24) - *(_DWORD *)(a4 + 64);
        -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", (_QWORD)objc_msgSend(*(id *)(a1 + 32), "pageSize") * v69);
        objc_msgSend((id)v20, "setReclaimableSize:", (_QWORD)objc_msgSend(*(id *)(a1 + 32), "pageSize") * *(unsigned int *)(a4 + 64));
        objc_msgSend((id)v20, "setSwappedSize:", (_QWORD)objc_msgSend(*(id *)(a1 + 32), "pageSize") * *(unsigned int *)(a4 + 32));
        v70 = *(_DWORD *)(a4 + 24);
        v71 = *(_DWORD *)(a4 + 64) + v69;
        if (*(_BYTE *)(a1 + 97) && v70 < v71)
          v72 = 0;
        else
          v72 = (_QWORD)objc_msgSend(*(id *)(a1 + 32), "pageSize") * (v70 - v71);
        a2 = v109;
        objc_msgSend((id)v20, "setCleanSize:", v72);
        if (*v23 == -1)
        {
          if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
          {
LABEL_184:

            v27 = 0;
LABEL_185:
            v15 = v106;
            goto LABEL_186;
          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), (id)v20);
          if (v20 && !*v22)
            *(_QWORD *)(v20 + 96) = *(unsigned int *)(a4 + 56);
        }
LABEL_114:
        v73 = sub_10000DFA0(*(_QWORD *)(a1 + 48), a2, v17);
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (v20)
          *(_BYTE *)(v20 + 9) = 1;
        if (a8)
          objc_msgSend((id)v20, "setVerbose:", 1);
        if (v74)
        {
          v75 = *(id *)(v74 + 32);
          objc_msgSend((id)v20, "setName:", v75);

          v76 = *(id *)(v74 + 40);
          objc_msgSend((id)v20, "setDetailedName:", v76);

          if (v20)
            *(_BYTE *)(v20 + 9) = *(_BYTE *)(v74 + 8);
          goto LABEL_176;
        }
        if (v106)
        {
          objc_msgSend((id)v20, "setName:");
          goto LABEL_176;
        }
        if ((v14 || *(_BYTE *)(a4 + 46)) && *v23 != 88)
        {
          objc_msgSend((id)v20, "setName:", CFSTR("mapped file"));
          objc_msgSend((id)v20, "setDetailedName:", v14);
          goto LABEL_176;
        }
        if (a2 == 0xFC0000000 && a3 == 0x40000000)
        {
          v77 = CFSTR("commpage (reserved)");
LABEL_136:
          objc_msgSend((id)v20, "setName:", v77);
          objc_msgSend((id)v20, "setVerbose:", 1);
          goto LABEL_176;
        }
        if (a2 == 0x1000000000 && a3 == 0x6000000000)
        {
          v77 = CFSTR("GPU Carveout (reserved)");
          goto LABEL_136;
        }
        v78 = sub_100005DE8((uint64_t)FPMemoryRegion, *v23);
        v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
        objc_msgSend((id)v20, "setName:", v79);

        if (*(_BYTE *)(a1 + 98))
        {
          v80 = *v23;
          if (*v23 == 100 || v80 == 88)
          {
            if (v14)
            {
              objc_msgSend((id)v20, "setExtendedInfo:", v14);
            }
            else if (v80 != 100 || *(_BYTE *)(a1 + 99))
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extendedInfoForRegionType:at:extendedInfoProvider:"));
              objc_msgSend((id)v20, "setExtendedInfo:", v81);

            }
          }
        }
        if (!*(_BYTE *)(a1 + 100))
          goto LABEL_176;
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *v22));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", v82));
        v84 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
        if (v83)
        {
          objc_msgSend(v84, "removeObjectForKey:", v82);
          if (v20)
            *(_BYTE *)(v20 + 8) |= 8u;
          v115 = 0;
          v114 = 0;
          v112 = 0u;
          v113 = 0u;
          v111 = 0u;
          objc_msgSend(v83, "getBytes:length:", &v111, 56);
          v85 = v114;
          v86 = (v114 >> 4) & 3;
          if (v86 != 3 && v86)
          {
            v89 = 0;
            v116 = 0;
            v88 = (char *)*((_QWORD *)&v112 + 1);
            v87 = v112 - *((_QWORD *)&v112 + 1);
          }
          else
          {
            v87 = v113;
            v88 = (char *)(v112 - v113);
            v89 = *((_QWORD *)&v113 + 1);
            v116 = (char *)*((_QWORD *)&v113 + 1);
          }
          if ((v114 & 1) != 0)
          {
            v115 = &v88[v89];
            v93 = &v116;
            v88 = 0;
          }
          else
          {
            v93 = &v115;
          }
          *v93 = 0;
          v94 = sub_100005F8C((uint64_t)FPMemoryRegion, (v85 >> 1) & 7);
          v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
          if (v95)
          {
            v96 = objc_alloc((Class)NSString);
            v110 = v83;
            v97 = v87;
            v98 = v82;
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "name"));
            v100 = objc_msgSend(v96, "initWithFormat:", CFSTR("%@ (%@)"), v99, v95);
            objc_msgSend((id)v20, "setName:", v100);

            v82 = v98;
            v87 = v97;
            v83 = v110;
          }

          v92 = v115;
          v91 = v116;
        }
        else
        {
          if (v84 || a5 == 3 || *v23 == 87 || !*(_DWORD *)(a4 + 24))
            goto LABEL_175;
          objc_msgSend(0, "removeObjectForKey:", v82);
          if (v20)
            *(_BYTE *)(v20 + 8) |= 8u;
          v90 = (char *)objc_msgSend((id)v20, "dirtySize");
          v88 = &v90[(_QWORD)objc_msgSend((id)v20, "cleanSize")];
          v91 = (char *)objc_msgSend((id)v20, "swappedSize");
          v92 = 0;
          v87 = 0;
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += &v91[(_QWORD)v88];
        objc_msgSend((id)v20, "setDirtySize:", v88);
        objc_msgSend((id)v20, "setCleanSize:", v92);
        objc_msgSend((id)v20, "setSwappedSize:", v91);
        objc_msgSend((id)v20, "setReclaimableSize:", v87);
LABEL_175:

LABEL_176:
        if (*(_BYTE *)(a1 + 97)
          && !*(_BYTE *)(a1 + 101)
          && !*(_BYTE *)(a1 + 96)
          && sub_100006064(v20, (unint64_t)objc_msgSend(*(id *)(a1 + 32), "pageSize")))
        {
          objc_msgSend(*(id *)(a1 + 32), "_addSubrangesForRegion:purgeState:", v20, a5);
        }
        if (v20 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

        goto LABEL_184;
      }
      -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", 0);
      v24 = *(unsigned int *)(a4 + 24);
      v25 = (_QWORD)objc_msgSend(*(id *)(a1 + 32), "pageSize") * v24;
      a2 = v109;
      v26 = (void *)v20;
    }
    objc_msgSend(v26, "setReclaimableSize:", v25);
    objc_msgSend((id)v20, "setSwappedSize:", 0);
    objc_msgSend((id)v20, "setCleanSize:", 0);
    goto LABEL_114;
  }
  if (!*(_BYTE *)(a1 + 96))
  {
    v106 = v15;
    v28 = *(_QWORD **)(a1 + 32);
    v29 = *(void **)(a1 + 48);
    v30 = *(id *)(a1 + 40);
    v108 = v29;
    if (!v28)
    {

      v27 = 1;
      goto LABEL_185;
    }
    v31 = v28[3];
    if (v31)
      v32 = *(unsigned int *)(v31 + 8);
    else
      v32 = 0;
    v104 = v14;
    v33 = (char *)objc_msgSend(v28, "pageSize");
    v34 = (void *)v28[21];
    v28[21] = 0;

    v35 = sub_10000DFA0((uint64_t)v108, v109, v17);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (v17 <= v109)
    {
      v68 = 0;
LABEL_140:

      v27 = 0;
LABEL_141:
      v14 = v104;
      goto LABEL_185;
    }
    v37 = 0;
    v105 = v32 - 1;
    v102 = -v32;
    v103 = v33 - 1;
    v38 = v109;
    while (1)
    {
      v39 = v36;
      if (v36 && v38 >= *(_QWORD *)(v36 + 16))
        goto LABEL_60;
      v40 = objc_alloc_init(FPMemoryRegion);
      v36 = (uint64_t)v40;
      if (v40)
        v40->_start = v38;
      v41 = v17;
      if (v39)
      {
        if (*(_QWORD *)(v39 + 16) >= v17)
          v41 = v17;
        else
          v41 = *(_QWORD *)(v39 + 16);
      }
      if (v40)
      {
        start = v40->_start;
        v43 = v41 >= start;
        v44 = v41 - start;
        if (!v43)
          goto LABEL_187;
        v40->_size = v44;
        v40->_user_tag = *(_DWORD *)(a4 + 20);
        v40->_object_id = *(_QWORD *)(a4 + 68);
        v40->_share_mode = *(_BYTE *)(a4 + 47);
        v40->_offset = start - v109 + *(_QWORD *)(a4 + 12);
        *((_BYTE *)v40 + 8) |= 2u;
        -[FPMemoryRegion setName:](v40, "setName:", CFSTR("unused dyld shared cache area"));
        v45 = *(_BYTE *)(v36 + 8) | 4;
        *(_BYTE *)(v36 + 8) = v45;
        *(_BYTE *)(v36 + 8) = v45 & 0xFE | (*(_WORD *)(a4 + 60) != 0);
        if (!v37)
        {
LABEL_36:
          if (!v39)
          {
            if (!v36)
              goto LABEL_102;
            *(_BYTE *)(v36 + 9) = 0;
            goto LABEL_51;
          }
          goto LABEL_37;
        }
      }
      else
      {
        objc_msgSend(0, "setName:", CFSTR("unused dyld shared cache area"));
        if (!v37)
          goto LABEL_36;
      }
      v46 = v37[8];
      if (v46 == 2)
      {
        if (!v39)
        {
          v46 = 2;
          goto LABEL_43;
        }
      }
      else if (!v39 || v46 != 4)
      {
        goto LABEL_43;
      }
LABEL_37:
      v46 = *(unsigned __int8 *)(v39 + 8);
      if (v46 == 4 || v46 == 2)
      {
        if (v37)
          v47 = v37;
        else
          v47 = (unsigned __int8 *)v39;
        v46 = v47[8];
      }
LABEL_43:
      if (v36)
        *(_BYTE *)(v36 + 9) = v46;
      if (v46 != 2 && v46 != 4)
      {
        if (!v36)
        {
LABEL_102:
          v48 = 0;
          goto LABEL_53;
        }
LABEL_51:
        v48 = *(_QWORD *)(v36 + 80);
        if (v48 != -1)
          v48 += *(_QWORD *)(v36 + 88);
LABEL_53:
        if (((v48 | v38) & (unint64_t)v103) != 0
          && !objc_msgSend(v28, "_populateMemoryRegionWithPageQueries:regionInfo:", v36, a4))
        {
          goto LABEL_149;
        }
      }
      objc_msgSend(v30, "addObject:", v36);
      if (v36)
      {
        v49 = *(_QWORD *)(v36 + 80);
        if (v49 == -1)
        {

LABEL_139:
          v36 = v39;
          v68 = v37;
          goto LABEL_140;
        }
        v38 = *(_QWORD *)(v36 + 88) + v49;
      }
      else
      {
        v38 = 0;
      }

      if (!v39 || v38 >= v17)
        goto LABEL_139;
LABEL_60:
      v50 = objc_alloc_init(FPMemoryRegion);
      v51 = v50;
      if (v50)
      {
        v52 = *(_QWORD *)(v39 + 16);
        if (v52 <= v38)
          v52 = v38;
        v50->_start = v52;
        v53 = *(_QWORD *)(v39 + 24) + *(_QWORD *)(v39 + 16);
        if (v53 >= v17)
          v53 = v17;
        if (v53 < v52)
LABEL_187:
          __assert_rtn("-[FPMemoryRegion setEnd:]", "FPMemoryRegion.m", 185, "end >= self.start");
        v50->_size = v53 - v52;
        if (v52 == -1)
          v54 = -1;
        else
          v54 = v53;
      }
      else
      {
        v54 = 0;
      }
      v55 = sub_10000DFA0((uint64_t)v108, v54, v17);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      v36 = v56;
      if (v39 == v56)
      {
LABEL_74:
        if (!v51)
          goto LABEL_84;
        v59 = v51->_start;
        goto LABEL_83;
      }
      if (v51)
      {
        v57 = v51->_start;
        if (v56)
          goto LABEL_72;
      }
      else
      {
        v57 = 0;
        if (v56)
        {
LABEL_72:
          v58 = *(_QWORD *)(v56 + 16);
          goto LABEL_73;
        }
      }
      v58 = 0;
LABEL_73:
      if (((v58 | v57) & v105) != 0)
        goto LABEL_74;
      if (!v51)
        goto LABEL_84;
      v59 = v51->_start;
      if (v59 == -1)
        v60 = -1;
      else
        v60 = v51->_size + v59;
      v61 = (v60 + v105) & v102;
      v43 = v61 >= v59;
      v62 = v61 - v59;
      if (!v43)
        goto LABEL_187;
      v51->_size = v62;
LABEL_83:
      v51->_user_tag = *(_DWORD *)(a4 + 20);
      v51->_object_id = *(_QWORD *)(a4 + 68);
      v51->_share_mode = *(_BYTE *)(a4 + 47);
      v51->_offset = v59 - v109 + *(_QWORD *)(a4 + 12);
      *((_BYTE *)v51 + 8) |= 2u;
LABEL_84:
      v63 = *(id *)(v39 + 32);
      -[FPMemoryRegion setName:](v51, "setName:", v63);

      v64 = *(id *)(v39 + 40);
      -[FPMemoryRegion setDetailedName:](v51, "setDetailedName:", v64);

      v65 = *(unsigned __int8 *)(v39 + 8);
      if (v51)
      {
        v51->_segment = v65;
        *((_BYTE *)v51 + 8) = *((_BYTE *)v51 + 8) & 0xFE | (*(_WORD *)(a4 + 60) != 0);
      }
      if (v65 == 2 || v65 == 4)
      {
        v66 = (void *)v28[21];
        if (v66)
        {
          v28[21] = 0;

        }
      }
      else if ((objc_msgSend(v28, "_populateMemoryRegionWithPageQueries:regionInfo:", v51, a4) & 1) == 0)
      {

LABEL_149:
        v27 = 1;
        goto LABEL_141;
      }
      objc_msgSend(v30, "addObject:", v51);
      if (v51)
      {
        v67 = v51->_start;
        if (v67 == -1)
          v38 = -1;
        else
          v38 = v51->_size + v67;
      }
      else
      {
        v38 = 0;
      }
      v68 = (unsigned __int8 *)(id)v39;

      v37 = v68;
      if (v38 >= v17)
        goto LABEL_140;
    }
  }
  v27 = 0;
LABEL_186:

  return v27;
}

void sub_10000BAB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_10000BAE0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  FILE *v6;
  id v7;
  const char *v8;
  id v9;
  _QWORD v10[4];
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v4 = objc_autoreleasePoolPush();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10000AA00;
  v14[4] = sub_10000AA10;
  v15 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BC6C;
  v10[3] = &unk_1000291A8;
  v11 = *(_OWORD *)(a1 + 32);
  v12 = v14;
  v13 = a2;
  if ((dyld_image_for_each_segment_info(a2, v10) & 1) == 0
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to iterate over image segments")));
    v6 = __stderrp;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "displayString")));
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = objc_retainAutorelease(v5);
    fprintf(v6, "%s: %s\n", v8, (const char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
  _Block_object_dispose(v14, 8);

  objc_autoreleasePoolPop(v4);
}

void sub_10000BC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BC6C(_QWORD *a1, char *__s, unint64_t a3, unint64_t a4)
{
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t *v10;
  void *v11;
  __CFString *v12;
  id v13;
  const char *v14;
  __CFString *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  int v24;
  void *v25;
  const char *file_path;
  id v27;
  unsigned int v28;
  id v29;
  unint64_t v30;
  unint64_t *v31;
  void *v32;
  id v33;
  int v34;
  id v35;
  const char *v36;
  uint64_t v37;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  FPImage *v46;
  FPImage *v47;
  __CFString *v48;
  SEL v49;
  __CFString *v50;
  _BYTE v53[1025];

  if (a4)
  {
    v6 = (id)strlen(__s);
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (unint64_t *)((char *)&unk_100034978 + 8 * v7);
      v11 = (void *)atomic_load(v10);
      v12 = v11;

      if (v11)
      {
        v8 = v12;
      }
      else
      {
        if (!v9)
          v9 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", __s, v6, 4);
        while (1)
        {
          v8 = (__CFString *)__ldaxr(v10);
          if (v8)
            break;
          if (!__stlxr((unint64_t)v9, v10))
          {
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
            v8 = v9;
            goto LABEL_19;
          }
        }
        __clrex();
        v13 = v8;
      }
      if (-[__CFString length](v8, "length") == v6)
      {
        v14 = v53;
        if ((-[__CFString getCString:maxLength:encoding:](v8, "getCString:maxLength:encoding:", v53, 32, 4) & 1) == 0)v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
        if (!strncmp(v14, __s, (size_t)v6))
        {
          v8 = v8;

          v9 = v8;
          goto LABEL_20;
        }
      }
      ++v7;
    }
    while (v7 != 16);
    if (!v9)
    {
      v15 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", __s, v6, 4);
LABEL_19:
      v9 = v15;
    }
LABEL_20:
    v16 = a3;

    v17 = *(_QWORD *)(a1[4] + 24);
    if (v17 && (v18 = *(_QWORD *)(v17 + 24), v18 <= a3) && *(_QWORD *)(v17 + 32) + v18 > a3)
    {
      if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("__LINKEDIT")))
      {
        v19 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
        LOBYTE(v19) = objc_msgSend(v19, "containsObject:", v20);

        if ((v19 & 1) != 0)
        {
LABEL_64:

          return;
        }
        v21 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
        objc_msgSend(v21, "addObject:", v22);

        v23 = CFSTR("dyld shared cache");
LABEL_58:
        v46 = objc_alloc_init(FPImage);
        v47 = v46;
        if (v46)
        {
          v46->_start = v16;
          v46->_size = a4;
          if (v9)
            v48 = v9;
          else
            v48 = CFSTR("unknown");
          sub_10000DE40((uint64_t)v46, v48);
          objc_setProperty_nonatomic_copy(v47, v49, v23, 40);
        }
        else
        {
          if (v9)
            v50 = v9;
          else
            v50 = CFSTR("unknown");
          sub_10000DE40(0, v50);
        }
        objc_msgSend(*(id *)(a1[4] + 136), "addObject:", v47);

        goto LABEL_64;
      }
      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
    v25 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v25)
    {
      file_path = (const char *)dyld_image_get_file_path(a1[7]);
      if (file_path || (file_path = (const char *)dyld_image_get_installname(a1[7])) != 0)
      {
        if (v24)
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v30 = ((a3 >> 16) ^ (a3 >> 8) ^ (a3 >> 24) ^ a3) % 0x7FF;
          do
          {
            v31 = (unint64_t *)((char *)&unk_1000349F8 + 8 * v30);
            v32 = (void *)atomic_load(v31);
            v33 = v32;

            if (v32)
            {
              v27 = v33;
            }
            else
            {
              if (!v29)
                v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", file_path);
              while (1)
              {
                v27 = (id)__ldaxr(v31);
                if (v27)
                  break;
                if (!__stlxr((unint64_t)v29, v31))
                {
                  v34 = 1;
                  goto LABEL_40;
                }
              }
              v34 = 0;
              __clrex();
LABEL_40:
              if (v34)
              {
                v39 = (id)objc_claimAutoreleasedReturnValue(v29);
                v27 = v29;
                goto LABEL_54;
              }
              v35 = v27;
            }
            v36 = v53;
            if ((objc_msgSend(v27, "getCString:maxLength:encoding:", v53, 1025, 4) & 1) == 0)
              v36 = (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
            if (!strcmp(v36, file_path))
            {
              v27 = v27;

              v29 = v27;
              goto LABEL_55;
            }
            v37 = ((v30 + 1) * (unsigned __int128)0x20040080100201uLL) >> 64;
            v30 = v30 + 1 - 2047 * ((v37 + ((v30 + 1 - v37) >> 1)) >> 10);
          }
          while (v28++ < 0x11);
          if (v29)
            goto LABEL_55;
          v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", file_path);
LABEL_54:
          v29 = v39;
LABEL_55:
          v16 = a3;

          v45 = *(_QWORD *)(a1[6] + 8);
          v40 = *(id *)(v45 + 40);
          *(_QWORD *)(v45 + 40) = v29;
        }
        else
        {
          v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", file_path);
          v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByResolvingSymlinksInPath"));
          v42 = *(_QWORD *)(a1[6] + 8);
          v43 = *(void **)(v42 + 40);
          *(_QWORD *)(v42 + 40) = v41;

        }
      }
      else
      {
        v44 = *(_QWORD *)(a1[6] + 8);
        v40 = *(id *)(v44 + 40);
        *(_QWORD *)(v44 + 40) = CFSTR("unknown dylib");
      }

      v25 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    v23 = v25;
    goto LABEL_58;
  }
}

int64_t sub_10000C1A4(id a1, id a2, id a3)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    v6 = v4[2];
    if (v5)
    {
LABEL_3:
      v7 = v5[2];
      goto LABEL_4;
    }
  }
  else
  {
    v6 = 0;
    if (v5)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_4:
  if (v6 >= v7)
  {
    if (v4)
    {
      v9 = v4[2];
      if (v5)
      {
LABEL_8:
        v10 = v5[2];
LABEL_9:
        v8 = v9 > v10;
        goto LABEL_10;
      }
    }
    else
    {
      v9 = 0;
      if (v5)
        goto LABEL_8;
    }
    v10 = 0;
    goto LABEL_9;
  }
  v8 = -1;
LABEL_10:

  return v8;
}

char *__cdecl sub_10000C348(id a1, int64_t a2)
{
  char *v2;
  const char *v3;

  v2 = "-";
  v3 = "N";
  if ((_DWORD)a2 == 3)
    v3 = "Y";
  if ((_DWORD)a2 != 1)
    v2 = (char *)v3;
  if ((_DWORD)a2)
    return v2;
  else
    return 0;
}

__CFString *sub_10000D464(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  id v13;
  uint64_t v14;
  __CFString *v15;
  unint64_t v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t SymbolWithAddressAtTime;
  uint64_t Name;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v13 = a3;
  objc_opt_self(a1);
  v14 = *a2;
  if ((*a2 & 0x400) == 0
    || (v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2 + 12))) == 0)
  {
    switch((char)v14)
    {
      case 0:
        v16 = a2[1];
        if (v16 > 0xFF)
          goto LABEL_7;
        v15 = off_100029270[v16];
        if (v15)
          break;
        v16 = a2[1];
LABEL_7:
        v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VM_KERN_MEMORY_%llu"), v16, v27);
        goto LABEL_22;
      case 1:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a2[1]));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v18));

        if (!v19
          || (v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", kCFBundleIdentifierKey))) == 0)
        {
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unloaded kmod %llu"), a2[1]));
        }

        if (!v15)
          goto LABEL_28;
        break;
      case 2:
        v20 = a2[1];
        if (v20)
        {
          SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime(a4, a5, v20, 0x8000000000000000);
          Name = CSSymbolGetName(SymbolWithAddressAtTime);
          if (Name)
          {
            v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", Name));
            goto LABEL_23;
          }
        }
        if (a2[2])
        {
          v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("site 0x%qx"), a2[1], v27);
          goto LABEL_22;
        }
        v15 = 0;
        goto LABEL_29;
      case 3:
        v24 = a2[1];
        if (v24 <= 0xD)
        {
          v15 = *(&off_100029A70 + v24);
          break;
        }
        v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VM_KERN_COUNT_%llu"), a2[1], v27);
LABEL_22:
        v23 = objc_claimAutoreleasedReturnValue(v17);
LABEL_23:
        v15 = (__CFString *)v23;
        if (v23)
          break;
        goto LABEL_28;
      default:
        v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unknown site (0x%x, 0x%qx)"), v14, a2[1]);
        goto LABEL_22;
    }
  }
  if (a6)
  {
    if ((*a2 & 0x800) != 0 && *((unsigned __int16 *)a2 + 33) < a7)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%.*s]"), v15, 80, a6 + 80 * *((unsigned __int16 *)a2 + 33)));

      v15 = (__CFString *)v25;
      if (!v25)
LABEL_28:
        v15 = CFSTR("unknown");
    }
  }
LABEL_29:

  return v15;
}

int64x2_t *sub_10000D97C(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int64x2_t *v5;

  if (result)
  {
    v5 = result;
    result = sub_10000D9C4((int64x2_t *)result->i64[1], a2, a3, a4, *a5, a5[1], a5[2], a5[3], a5[4]);
    v5->i64[1] = (uint64_t)result;
  }
  return result;
}

int64x2_t *sub_10000D9C4(int64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int64x2_t *v17;
  int64x2_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64x2_t *v24;
  uint64_t *v25;
  int64x2_t *v26;
  int64x2_t *v27;
  int64x2_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v33;
  unint64_t v34;
  int64x2_t v35;
  uint64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int64x2_t v41;
  int8x16_t v42;
  int8x16_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;

  v17 = (int64x2_t *)malloc_type_malloc(0x40uLL, 0x1020040D3BB1902uLL);
  v18 = v17;
  if (!a1)
  {
    v17->i64[0] = a2;
    v17->i64[1] = a3;
    v17[1].i64[0] = a7;
    v17[1].i64[1] = a5;
    v17[2].i64[0] = a6;
    v17[2].i64[1] = a8;
    a1 = v17;
    v17[3].i64[0] = a9;
    v17[3].i64[1] = 0;
    return a1;
  }
  v19 = 0;
  v18->i64[0] = a2;
  v18->i64[1] = a3;
  v18[1].i64[0] = a7;
  v18[1].i64[1] = a5;
  v20 = a4 - 1;
  v21 = -a4;
  v18[2].i64[0] = a6;
  v18[2].i64[1] = a8;
  v22 = a2 & -a4;
  v23 = (a2 + a3 + a4 - 1) & -a4;
  v24 = a1;
  v18[3].i64[0] = a9;
  v18[3].i64[1] = 0;
  do
  {
    v25 = (uint64_t *)v24;
    if (((v24->i64[0] + v20 + v24->i64[1]) & (unint64_t)v21) >= v22)
    {
      v25 = v19;
      if ((v24->i64[0] & (unint64_t)v21) > v23)
      {
        v25 = v19;
        if (!v19)
          goto LABEL_12;
LABEL_7:
        v26 = (int64x2_t *)v25[7];
        if (v26 == v24)
        {
          v25[7] = (uint64_t)v18;
          v18[3].i64[1] = (uint64_t)v24;
          return a1;
        }
        v27 = a1;
        if (v26)
          goto LABEL_14;
        return v27;
      }
    }
    v24 = (int64x2_t *)v24[3].i64[1];
    v19 = v25;
  }
  while (v24);
  if (v25)
    goto LABEL_7;
LABEL_12:
  if (v24 == a1)
  {
    v18[3].i64[1] = (uint64_t)a1;
    return v18;
  }
  v18[3].i64[1] = a1[3].i64[1];
  v26 = a1;
  v27 = v18;
LABEL_14:
  if (v26 == v24)
    return v27;
  do
  {
    v28 = v26;
    v29 = v26->i64[0];
    v30 = v26->i64[0] & v21;
    v31 = v26->i64[1] + v26->i64[0];
    v32 = (v31 + v20) & v21;
    if (v22 > v30)
      v30 = v22;
    if (v23 < v32)
      v32 = v23;
    v33 = v32 >= v30;
    v34 = v32 - v30;
    if (!v33)
      v34 = 0;
    v35 = v26[1];
    v36 = (uint64x2_t)vdupq_n_s64(v34);
    v37 = v18[1];
    v38 = v18[2];
    v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v37, (uint64x2_t)v35), (int8x16_t)v37, (int8x16_t)v35);
    v40 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v35, v37), v36);
    v18[1] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v39), v40, v39);
    v41 = v26[2];
    v42 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v41, v38), v36);
    v43 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v41), (int8x16_t)v38, (int8x16_t)v41);
    v18[2] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v42, (uint64x2_t)v43), v42, v43);
    v44 = v18[3].u64[0];
    v45 = v26[3].u64[0];
    v46 = v26[3].i64[1];
    v33 = v45 + v44 >= v34;
    v47 = v45 + v44 - v34;
    if (!v33)
      v47 = 0;
    if (v44 <= v45)
      v44 = v26[3].u64[0];
    if (v47 <= v44)
      v47 = v44;
    if (v29 >= v18->i64[0])
      v29 = v18->i64[0];
    if (v18->i64[1] + v18->i64[0] > v31)
      v31 = v18->i64[1] + v18->i64[0];
    v18->i64[0] = v29;
    v18->i64[1] = v31 - v29;
    v18[3].i64[0] = v47;
    v18[3].i64[1] = v46;
    v26 = (int64x2_t *)v26[3].i64[1];
    free(v28);
    a1 = v18;
    if (v25)
    {
      v25[7] = (uint64_t)v18;
      a1 = v27;
    }
    if (!v26)
      break;
    v27 = a1;
  }
  while (v26 != v24);
  return a1;
}

void sub_10000DC14(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  int64x2_t *v6;
  uint64_t *i;
  _QWORD *v8;

  v5 = a2;
  if (a1)
  {
    v6 = *(int64x2_t **)(a1 + 8);
    v8 = v5;
    for (i = (uint64_t *)v5[1]; i; i = (uint64_t *)i[7])
      v6 = sub_10000D9C4(v6, *i, i[1], a3, i[3], i[4], i[2], i[5], i[6]);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = v8;
  }

}

void sub_10000DC8C(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  void *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;
  id *v12;

  v5 = a2;
  if (a1)
  {
    v12 = v5;
    if (v5)
    {
      v6 = v5[13];
      if (v6)
      {
        v7 = v6;
        sub_10000DC14(a1, v6, a3);
LABEL_7:

        v5 = v12;
        goto LABEL_8;
      }
      v8 = v12;
      v9 = (uint64_t)v12[9];
      v10 = (uint64_t)v12[11];
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }
    v11 = sub_10000D9C4(*(int64x2_t **)(a1 + 8), v9, v10, a3, (uint64_t)objc_msgSend(v8, "dirtySize"), (uint64_t)objc_msgSend(v12, "swappedSize"), (uint64_t)objc_msgSend(v12, "cleanSize"), (uint64_t)objc_msgSend(v12, "reclaimableSize"), (uint64_t)objc_msgSend(v12, "wiredSize"));
    v7 = 0;
    *(_QWORD *)(a1 + 8) = v11;
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t sub_10000DD94@<X0>(uint64_t result@<X0>, int64x2_t *a2@<X8>)
{
  int64x2_t v2;
  uint64_t v3;
  uint64_t v4;
  int64x2_t v5;

  v2 = 0uLL;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (result)
  {
    v3 = *(_QWORD *)(result + 8);
    if (v3)
    {
      v4 = 0;
      v5 = 0uLL;
      do
      {
        v4 += *(_QWORD *)(v3 + 16);
        v2 = vaddq_s64(*(int64x2_t *)(v3 + 24), v2);
        v5 = vaddq_s64(*(int64x2_t *)(v3 + 40), v5);
        v3 = *(_QWORD *)(v3 + 56);
      }
      while (v3);
      a2[1].i64[0] = v4;
      *a2 = v2;
      *(int64x2_t *)((char *)a2 + 24) = v5;
    }
  }
  return result;
}

void sub_10000DE40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  unsigned int v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "copy");
    v6 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v5;

    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("__TEXT")) & 1) != 0
      || (objc_msgSend(v9, "hasPrefix:", CFSTR("__OBJC_RO")) & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      if ((objc_msgSend(v9, "hasPrefix:", CFSTR("__LINKEDIT")) & 1) == 0)
      {
        v8 = objc_msgSend(v9, "hasPrefix:", CFSTR("__"));
        v4 = v9;
        if (!v8)
          goto LABEL_7;
        v7 = 3;
        goto LABEL_6;
      }
      v7 = 4;
    }
    v4 = v9;
LABEL_6:
    *(_BYTE *)(a1 + 8) = v7;
  }
LABEL_7:

}

id *sub_10000DF28(id *a1, void *a2)
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FPImageEnumerator;
    v5 = (id *)objc_msgSendSuper2(&v7, "init");
    a1 = v5;
    if (v5)
    {
      v5[2] = 0;
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

_QWORD *sub_10000DFA0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v12;

  if (a1)
  {
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 16);
      if (v6 >= (unint64_t)objc_msgSend(*(id *)(a1 + 8), "count"))
        break;
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 16)));
      v8 = v7;
      if (v7)
      {
        v9 = v7[2];
        v10 = v7[3] + v9;
        if (v9 <= a2 && v10 > a2)
        {
LABEL_16:
          v12 = v7;
LABEL_18:

          return v12;
        }
      }
      else
      {
        v10 = 0;
        v9 = 0;
      }
      if (v9 < a3 && v10 >= a3 || v9 >= a2 && v10 <= a3)
        goto LABEL_16;
      if (v9 >= a2)
      {
        v12 = 0;
        goto LABEL_18;
      }
      ++*(_QWORD *)(a1 + 16);

    }
  }
  v12 = 0;
  return v12;
}

NSMapTable *sub_10000E788(uint64_t a1, _QWORD *a2)
{
  NSMapTable *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  id v23;
  _QWORD *v24;
  id v25;
  NSNumber *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMapTable *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void **v36;
  NSErrorUserInfoKey *v37;
  void *v38;
  void *v39;
  void *v40;
  NSMapTable *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  NSMapTable *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NSMapTable *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  NSMapTable *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *k;
  id v71;
  void **p_cache;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  NSMapTable *v81;
  void *v82;
  unsigned __int8 v83;
  FILE *v84;
  uint64_t v85;
  kern_return_t corpse;
  FPCorpseProcess *v87;
  id v88;
  mach_error_t v89;
  id v90;
  const char *v91;
  unsigned int v92;
  char *v93;
  id v94;
  void *v95;
  NSMapTable *v96;
  NSArray *v97;
  void *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *i;
  uint64_t v103;
  void *v104;
  int v106;
  const char *v107;
  NSMapTable *v109;
  id v110;
  void *v111;
  NSMapTable *obj;
  id obja;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  id v134;
  stat v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  NSErrorUserInfoKey v144;
  void *v145;
  NSErrorUserInfoKey v146;
  const __CFString *v147;
  NSErrorUserInfoKey v148;
  void *v149;
  id v150;
  NSErrorUserInfoKey v151;
  void *v152;
  NSErrorUserInfoKey v153;
  void *v154;
  _BYTE v155[128];

  if (a2)
    *a2 = 0;
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
  v116 = a1;
  if (!v5)
  {
LABEL_19:

    v22 = -[NSMapTable count](v3, "count");
    v23 = *(id *)(a1 + 88);
    if (objc_msgSend(v23, "count") || objc_msgSend(*(id *)(a1 + 96), "count"))
    {

      v24 = a2;
    }
    else
    {
      v106 = *(unsigned __int8 *)(a1 + 9);

      v24 = a2;
      if (!v106 && !v22)
      {
        if (a2)
        {
          v146 = NSLocalizedDescriptionKey;
          v147 = CFSTR("Must specify at least one process or memgraph");
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
          v41 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 8, v35));
          goto LABEL_103;
        }
        v41 = 0;
        goto LABEL_104;
      }
    }
    if (*(_BYTE *)(a1 + 11))
      sub_100011EE8((uint64_t)FPFootprint, 1);
    v25 = objc_alloc_init((Class)NSMutableSet);
    if (*(_BYTE *)(a1 + 16))
    {
      v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      objc_msgSend(v25, "addObject:", v27);

    }
    v111 = v25;
    if (objc_msgSend(*(id *)(a1 + 104), "count"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 104), "allObjects"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess pidsForStringDescriptions:errors:](FPProcess, "pidsForStringDescriptions:errors:", v28, 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allKeys"));
      objc_msgSend(v25, "addObjectsFromArray:", v30);

    }
    if (*(_BYTE *)(a1 + 9))
    {
      v31 = objc_claimAutoreleasedReturnValue(+[FPProcess allProcessesExcludingPids:](FPProcess, "allProcessesExcludingPids:", v25));
      v32 = v3;
      v3 = (NSMapTable *)v31;
LABEL_88:

      if (*(_BYTE *)(a1 + 10))
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess removeIdleExitCleanProcessesFrom:](FPProcess, "removeIdleExitCleanProcessesFrom:", v3));
        v96 = (NSMapTable *)objc_msgSend(v95, "mutableCopy");

        v3 = v96;
      }
      if (*(_QWORD *)(a1 + 24))
      {
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v97 = NSAllMapTableKeys(v3);
        v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
        v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v117, v140, 16);
        if (v99)
        {
          v100 = v99;
          v101 = *(_QWORD *)v118;
          do
          {
            for (i = 0; i != v100; i = (char *)i + 1)
            {
              if (*(_QWORD *)v118 != v101)
                objc_enumerationMutation(v98);
              v103 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)i);
              v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v3, "objectForKey:", v103));
              if ((objc_opt_respondsToSelector(v104, "physFootprint") & 1) != 0
                && (unint64_t)objc_msgSend(v104, "physFootprint") < *(_QWORD *)(a1 + 24) << 20)
              {
                -[NSMapTable removeObjectForKey:](v3, "removeObjectForKey:", v103);
              }

            }
            v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v117, v140, 16);
          }
          while (v100);
        }

      }
      v3 = v3;
      v41 = v3;
      v35 = v111;
      goto LABEL_103;
    }
    v42 = *(void **)(a1 + 88);
    v43 = *(id *)(a1 + 96);
    v44 = v42;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allObjects"));
    v133 = 0;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess pidsForStringDescriptions:errors:](FPProcess, "pidsForStringDescriptions:errors:", v45, &v133));
    v47 = (NSMapTable *)v133;
    objc_msgSend(v44, "addEntriesFromDictionary:", v46);

    if (v24 && v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable componentsJoinedByString:](v47, "componentsJoinedByString:", CFSTR("\n")));
      v144 = NSLocalizedDescriptionKey;
      v145 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
      *v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 4, v49));

    }
    v50 = *(id *)(a1 + 88);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "allObjects"));
    objc_msgSend(v50, "removeObjectsForKeys:", v51);

    if (*(_BYTE *)(a1 + 8))
    {
      v52 = v47;
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "allKeys"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess childPidsForPids:](FPProcess, "childPidsForPids:", v53));

      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v55 = v54;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v130;
        do
        {
          for (j = 0; j != v57; j = (char *)j + 1)
          {
            if (*(_QWORD *)v130 != v58)
              objc_enumerationMutation(v55);
            v60 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)j);
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v61, v60);

          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
        }
        while (v57);
      }

      v47 = v52;
    }
    v109 = v47;
    if (*(_BYTE *)(a1 + 13))
    {
      v62 = objc_alloc((Class)NSMutableSet);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "allKeys"));
      v64 = objc_msgSend(v62, "initWithArray:", v63);

      objc_msgSend(v64, "unionSet:", v111);
      objc_msgSend(v64, "addObject:", &off_10002C120);
      v65 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[FPProcess allProcessesExcludingPids:](FPProcess, "allProcessesExcludingPids:", v64));
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      v128 = 0u;
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](v65, "objectEnumerator"));
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v125, v142, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v126;
        do
        {
          for (k = 0; k != v68; k = (char *)k + 1)
          {
            if (*(_QWORD *)v126 != v69)
              objc_enumerationMutation(v66);
            objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)k), "setHiddenFromDisplay:", 1);
          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v125, v142, 16);
        }
        while (v68);
      }

      v3 = v65;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    obja = *(id *)(a1 + 88);
    v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v121, v141, 16);
    p_cache = FPSharedCache.cache;
    if (!v71)
    {
LABEL_87:

      v32 = v109;
      goto LABEL_88;
    }
    v73 = v71;
    v115 = *(_QWORD *)v122;
LABEL_63:
    v74 = 0;
    while (1)
    {
      if (*(_QWORD *)v122 != v115)
        objc_enumerationMutation(obja);
      v75 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", v75));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 18, "processWithPid:", objc_msgSend(v75, "longValue")));
      v78 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v79 = objc_msgSend(v76, "isEqual:", v78);
      v80 = v79;
      if (!v77)
      {

        if ((v80 & 1) != 0)
        {
          objc_msgSend(v75, "longValue");
          warnx("Unable to analyze process with pid %ld (try as root?)");
        }
        else
        {
          objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
          objc_msgSend(v75, "longValue");
          warnx("Unable to analyze process %s [%ld] (try as root?)");
        }
        goto LABEL_79;
      }
      v81 = v3;
      if ((v79 & 1) == 0)
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "name"));
        v83 = objc_msgSend(v82, "isEqualToString:", v76);

        if ((v83 & 1) != 0)
          goto LABEL_71;
        v84 = __stderrp;
        v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "name")));
        p_cache = (void **)(FPSharedCache + 16);
        fprintf(v84, "Found process %s [%d] from partial name %s\n", (const char *)objc_msgSend(v78, "UTF8String"), objc_msgSend(v77, "pid"), (const char *)objc_msgSend(objc_retainAutorelease(v76), "UTF8String"));
      }

LABEL_71:
      if (!*(_BYTE *)(v116 + 14))
      {
        v3 = v81;
LABEL_76:
        a1 = v116;
        goto LABEL_77;
      }
      v85 = objc_opt_class(FPUserProcess);
      v3 = v81;
      if ((objc_opt_isKindOfClass(v77, v85) & 1) == 0)
        goto LABEL_76;
      v135.st_dev = 0;
      corpse = task_generate_corpse((task_read_t)objc_msgSend(v77, "task"), (mach_port_t *)&v135);
      a1 = v116;
      if (corpse)
      {
        v89 = corpse;
        v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "name")));
        v91 = (const char *)objc_msgSend(v90, "UTF8String");
        v92 = objc_msgSend(v77, "pid");
        v93 = mach_error_string(v89);
        v107 = v91;
        p_cache = (void **)(FPSharedCache + 16);
        warnx("Unable to fork a corpse of process %s [%d]: %s", v107, v92, v93);

        goto LABEL_78;
      }
      v87 = [FPCorpseProcess alloc];
      v88 = sub_1000119AC(v87, v135.st_dev);

      mach_port_deallocate(mach_task_self_, v135.st_dev);
      v77 = v88;
LABEL_77:
      -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v77, v75);
LABEL_78:

LABEL_79:
      if (v73 == (id)++v74)
      {
        v94 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v121, v141, 16);
        v73 = v94;
        if (!v94)
          goto LABEL_87;
        goto LABEL_63;
      }
    }
  }
  v6 = v5;
  v7 = *(_QWORD *)v137;
  v110 = v4;
  obj = v3;
  v114 = *(_QWORD *)v137;
LABEL_5:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v137 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v8);
    memset(&v135, 0, sizeof(v135));
    v10 = objc_retainAutorelease(v9);
    if (stat((const char *)objc_msgSend(v10, "UTF8String"), &v135))
      goto LABEL_17;
    v11 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
    v134 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FPMemgraphProcess processWithMemgraph:error:](FPMemgraphProcess, "processWithMemgraph:error:", v12, &v134));
    v14 = v134;

    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash")));
      -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v13, v15);

      if (*(_BYTE *)(a1 + 12))
      {
        v16 = *(_BYTE *)(a1 + 11) != 0;
        if (v16 != objc_msgSend(v13, "breakDownPhysFootprint"))
        {
          v33 = a2;
          v34 = v14;
          v35 = v11;
          if (a2)
          {
            v153 = NSLocalizedDescriptionKey;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Memgraph was gathered with an analysis mode that conflicts with other memgraphs or command line arguments: %@"), v10));
            v154 = v18;
            v36 = &v154;
            v37 = &v153;
LABEL_34:
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v37, 1));
            v35 = v11;
            *v33 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 6, v38));
LABEL_37:

            goto LABEL_38;
          }
          goto LABEL_39;
        }
      }
      if (*(_BYTE *)(a1 + 13))
      {
        v33 = a2;
        v34 = v14;
        v35 = v11;
        if (a2)
        {
          v151 = NSLocalizedDescriptionKey;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--unmapped is not compatible with memgraphs (%@).\nRemove the flag for best effort 'unmapped' analysis (which may be more than other tools such as vmmap(1) but less than footprint(1) analyzing a running process)."), v10));
          v152 = v18;
          v36 = &v152;
          v37 = &v151;
          goto LABEL_34;
        }
        goto LABEL_39;
      }
      *(_BYTE *)(a1 + 11) = objc_msgSend(v13, "breakDownPhysFootprint");
      *(_BYTE *)(a1 + 12) = 1;
      v4 = v11;
      goto LABEL_16;
    }
    v150 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v150, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess pidsForStringDescriptions:errors:](FPProcess, "pidsForStringDescriptions:errors:", v17, 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

    if (!v20)
      break;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v20));
    a1 = v116;
    objc_msgSend(*(id *)(v116 + 88), "setObject:forKeyedSubscript:", v21, v20);

    v4 = v110;
    v3 = obj;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 96), "removeObject:", v10);

    v7 = v114;
LABEL_17:
    if (v6 == (id)++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
      if (!v6)
        goto LABEL_19;
      goto LABEL_5;
    }
  }
  if (a2)
  {
    v148 = NSLocalizedDescriptionKey;
    v34 = v14;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error opening memgraph %@: %@"), v10, v38));
    v149 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
    *a2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 7, v40));

    v35 = v110;
    v3 = obj;
    goto LABEL_37;
  }
  v35 = v110;
  v3 = obj;
  v34 = v14;
LABEL_38:

LABEL_39:
  v41 = 0;
LABEL_103:

LABEL_104:
  return v41;
}

uint64_t start(int a1, char *const *a2)
{
  FPFootprintArgs *v4;
  int64x2_t *v5;
  int64x2_t *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  FPFootprintArgs *v44;
  const char *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int64x2_t *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  __CFString *v73;
  NSMapTable *v74;
  id *v76;
  id v77;
  _QWORD *v78;
  NSMapTable *v79;
  FPFootprintArgs *v80;
  id v81;
  BOOL v82;
  NSArray *v83;
  id v84;
  int64x2_t *v85;
  id *v86;
  NSObject *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  char *v94;
  uint64_t v95;
  char *j;
  void *v97;
  objc_class *v98;
  NSString *v99;
  id v100;
  dispatch_queue_attr_t v101;
  dispatch_queue_t v102;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  NSObject *v108;
  double *v109;
  NSObject *v110;
  NSObject *v111;
  _OWORD *v112;
  NSObject *v113;
  NSObject *v114;
  double v115;
  dispatch_time_t v116;
  dispatch_queue_global_t global_queue;
  NSObject *v118;
  double v119;
  double v120;
  NSObject *v121;
  unint64_t v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  uint64_t v127;
  void *i;
  void *v129;
  id v130;
  id v131;
  uint64_t v132;
  void *k;
  void *v134;
  char *const *v135;
  unsigned int v136;
  char *v137;
  id v138;
  void *v139;
  id v140;
  NSObject *v141;
  NSObject *v142;
  dispatch_semaphore_t v143;
  id *location;
  void *context;
  id contexta;
  int64x2_t *contextb;
  NSObject *contextc;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  FPFootprintArgs *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  char **v159;
  char *__endptr[5];
  id v161;
  objc_super v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint64_t v166;
  _BYTE v167[128];
  _QWORD v168[5];
  char v169;
  _QWORD v170[3];
  __uint64_t v171;
  void *v172;
  void **v173;
  uint64_t v174;
  unint64_t v175;
  _QWORD v176[3];
  char v177;
  _QWORD v178[5];
  id v179;
  _QWORD v180[5];
  id v181;
  NSErrorUserInfoKey v182;
  void *v183;
  NSErrorUserInfoKey v184;
  uint64_t v185;
  NSErrorUserInfoKey v186;
  const __CFString *v187;
  NSErrorUserInfoKey v188;
  const __CFString *v189;
  NSErrorUserInfoKey v190;
  void *v191;
  NSErrorUserInfoKey v192;
  void *v193;
  __int128 handler;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _QWORD *v198;
  _QWORD *v199;
  void **v200;
  _QWORD *v201;
  _QWORD *v202;
  char **v203;
  unint64_t v204;
  option v205;
  const char *v206;
  int v207;
  uint64_t v208;
  int v209;
  const char *v210;
  int v211;
  uint64_t v212;
  int v213;
  const char *v214;
  int v215;
  uint64_t v216;
  int v217;
  const char *v218;
  int v219;
  uint64_t v220;
  int v221;
  const char *v222;
  int v223;
  uint64_t v224;
  int v225;
  const char *v226;
  int v227;
  char *v228;
  int v229;
  const char *v230;
  int v231;
  uint64_t v232;
  int v233;
  const char *v234;
  int v235;
  uint64_t *v236;
  int v237;
  const char *v238;
  int v239;
  uint64_t v240;
  int v241;
  const char *v242;
  int v243;
  uint64_t v244;
  int v245;
  const char *v246;
  int v247;
  uint64_t v248;
  int v249;
  const char *v250;
  int v251;
  uint64_t v252;
  int v253;
  const char *v254;
  int v255;
  uint64_t v256;
  int v257;
  const char *v258;
  int v259;
  uint64_t v260;
  int v261;
  const char *v262;
  int v263;
  uint64_t v264;
  int v265;
  const char *v266;
  int v267;
  uint64_t v268;
  int v269;
  const char *v270;
  int v271;
  uint64_t v272;
  int v273;
  const char *v274;
  int v275;
  uint64_t v276;
  int v277;
  const char *v278;
  int v279;
  uint64_t v280;
  int v281;
  const char *v282;
  int v283;
  uint64_t v284;
  int v285;
  const char *v286;
  int v287;
  uint64_t v288;
  int v289;
  const char *v290;
  int v291;
  uint64_t v292;
  int v293;
  const char *v294;
  int v295;
  uint64_t v296;
  int v297;
  const char *v298;
  int v299;
  uint64_t v300;
  int v301;
  const char *v302;
  int v303;
  uint64_t v304;
  int v305;
  const char *v306;
  int v307;
  uint64_t v308;
  int v309;
  __int128 v310;
  __int128 v311;

  v149 = objc_alloc_init((Class)NSMutableArray);
  context = objc_autoreleasePoolPush();
  v4 = [FPFootprintArgs alloc];
  if (!v4)
    goto LABEL_64;
  v162.receiver = v4;
  v162.super_class = (Class)FPFootprintArgs;
  v5 = (int64x2_t *)objc_msgSendSuper2(&v162, "init");
  v6 = v5;
  if (!v5)
  {
    v4 = (FPFootprintArgs *)(id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 0, 0));
LABEL_64:
    v44 = v4;
    goto LABEL_98;
  }
  v5->i16[4] = 0;
  v5->i8[10] = 0;
  v5[2] = vdupq_n_s64(1uLL);
  v7 = (void *)v5[4].i64[1];
  v5[4].i64[1] = 0;

  v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)v6[5].i64[1];
  v6[5].i64[1] = v8;

  v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = (void *)v6[6].i64[0];
  v6[6].i64[0] = v10;

  v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = (void *)v6[6].i64[1];
  v6[6].i64[1] = v12;

  *(__int16 *)((char *)&v6->i16[5] + 1) = 1;
  v6[3].i64[0] = 0;
  objc_storeStrong((id *)&v6[4], CFSTR("Dirty"));
  v6[7].i64[0] = 0;
  *(__int16 *)((char *)&v6->i16[7] + 1) = 256;
  v6[3].i64[1] = 0;
  v166 = 0;
  v205.name = "all";
  v205.has_arg = 0;
  v205.flag = 0;
  v205.val = 97;
  v206 = "json";
  v207 = 1;
  v208 = 0;
  v209 = 106;
  v210 = "perfdata";
  v211 = 1;
  v212 = 0;
  v213 = 262;
  v214 = "help";
  v215 = 0;
  v216 = 0;
  v217 = 104;
  v218 = "targetChildren";
  v219 = 0;
  v220 = 0;
  v221 = 116;
  v222 = "";
  v223 = 1;
  v224 = 0;
  v225 = 112;
  v226 = "proc";
  v227 = 1;
  v228 = (char *)&v166 + 4;
  v229 = 1;
  v230 = "exclude";
  v231 = 1;
  v232 = 0;
  v233 = 120;
  v234 = "pid";
  v235 = 1;
  v236 = &v166;
  v237 = 1;
  v238 = "skip";
  v239 = 0;
  v240 = 0;
  v241 = 115;
  v242 = "minFootprint";
  v243 = 1;
  v244 = 0;
  v245 = 267;
  v246 = "forkCorpse";
  v247 = 0;
  v248 = 0;
  v249 = 265;
  v250 = "";
  v251 = 0;
  v252 = 0;
  v253 = 118;
  v254 = "format";
  v255 = 1;
  v256 = 0;
  v257 = 102;
  v258 = "sort";
  v259 = 1;
  v260 = 0;
  v261 = 260;
  v262 = "summary";
  v263 = 0;
  v264 = 0;
  v265 = 121;
  v266 = "physFootprint";
  v267 = 0;
  v268 = 0;
  v269 = 256;
  v270 = "vmObjectDirty";
  v271 = 0;
  v272 = 0;
  v273 = 257;
  v274 = "wide";
  v275 = 0;
  v276 = 0;
  v277 = 119;
  v278 = "swapped";
  v279 = 0;
  v280 = 0;
  v281 = 258;
  v282 = "wired";
  v283 = 0;
  v284 = 0;
  v285 = 259;
  v286 = "unmapped";
  v287 = 0;
  v288 = 0;
  v289 = 261;
  v290 = "sample";
  v291 = 1;
  v292 = 0;
  v293 = 263;
  v294 = "sample-duration";
  v295 = 1;
  v296 = 0;
  v297 = 264;
  v298 = "noCategories";
  v299 = 0;
  v300 = 0;
  v301 = 266;
  v302 = "layout";
  v303 = 1;
  v304 = 0;
  v305 = 108;
  v306 = "ioaccel";
  v307 = 0;
  v308 = 0;
  v309 = 268;
  v310 = 0u;
  v311 = 0u;
  optreset = 1;
  optind = 1;
  optarg = 0;
  while (2)
  {
    while (1)
    {
      v14 = getopt_long_only(a1, a2, "aj:htp:x:svf:yw", &v205, 0);
      v15 = v14;
      if (v14 <= 255)
        break;
      switch(v14)
      {
        case 256:
          warnx("WARNING: --physFootprint option is deprecated because it is the default mode");
          continue;
        case 257:
          *(__int16 *)((char *)&v6->i16[5] + 1) = 256;
          continue;
        case 258:
          v6[3].i64[0] |= 2uLL;
          continue;
        case 259:
          v6[3].i64[0] |= 1uLL;
          continue;
        case 260:
          v157 = 0u;
          v158 = 0u;
          v155 = 0u;
          v156 = 0u;
          v29 = sub_10001A2B8();
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v155, &handler, 16);
          if (!v31)
            goto LABEL_68;
          v32 = *(_QWORD *)v156;
LABEL_34:
          v33 = 0;
          while (1)
          {
            if (*(_QWORD *)v156 != v32)
              objc_enumerationMutation(v30);
            v34 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v155 + 1) + 8 * v33));
            v35 = (const char *)objc_msgSend(v34, "UTF8String");
            if (!strcasecmp(v35, optarg))
              break;
            if (v31 == (id)++v33)
            {
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v155, &handler, 16);
              if (!v31)
              {
LABEL_68:

                v49 = sub_10001A2B8();
                v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", ")));
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lowercaseString"));

                v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized argument '%s' to --sort.\nAccepted arguments: %@"), optarg, v52));
                v170[0] = NSLocalizedDescriptionKey;
                v172 = v53;
                v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v172, v170, 1));
                v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 3, v54));

                goto LABEL_92;
              }
              goto LABEL_34;
            }
          }
          objc_storeStrong((id *)&v6[4], v34);

          continue;
        case 261:
          v6->i8[13] = 1;
          continue;
        case 262:
          v37 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
          v38 = (void *)v6[5].i64[0];
          v6[5].i64[0] = v37;

          continue;
        case 263:
        case 264:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
          objc_msgSend(v16, "doubleValue");
          v18 = v17;

          if (v18 < 0.0 || ((*(_QWORD *)&v18 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
          {
            v45 = "duration";
            if (v15 == 263)
              v45 = "interval";
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid sampling %s '%s'"), v45, optarg));
            v192 = NSLocalizedDescriptionKey;
            v193 = v46;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1));
            v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 9, v47));

            goto LABEL_92;
          }
          if (v15 == 263)
            *(double *)v6[7].i64 = v18;
          else
            *(double *)&v6[7].i64[1] = v18;
          break;
        case 265:
          v6->i8[14] = 1;
          continue;
        case 266:
          v6->i8[15] = 1;
          continue;
        case 267:
          __endptr[0] = 0;
          v36 = strtoll(optarg, __endptr, 10);
          if (*__endptr[0] || v36 < 0 || optarg == __endptr[0])
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid non-negative number '%s' provided to --minFootprint."), optarg));
            v178[0] = NSLocalizedDescriptionKey;
            v180[0] = v59;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v180, v178, 1));
            v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 12, v60));

            goto LABEL_92;
          }
          v6[1].i64[1] = v36;
          continue;
        case 268:
          if (!sub_100015318((uint64_t)FPFootprint))
          {
            v186 = NSLocalizedDescriptionKey;
            v187 = CFSTR("--ioaccel is not available on this device");
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1));
            v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 5, v61));

            goto LABEL_92;
          }
          v6[2].i64[0] = 6;
          continue;
        default:
          goto LABEL_76;
      }
    }
    switch(v14)
    {
      case 'a':
        v6->i8[9] = 1;
        continue;
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'g':
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
      case 'r':
      case 'u':
        goto LABEL_76;
      case 'f':
        v21 = optarg;
        if (!optarg)
          goto LABEL_75;
        if (!strcmp("bytes", optarg))
        {
          v6[2].i64[1] = 0;
        }
        else if (!strcmp("formatted", v21))
        {
          v6[2].i64[1] = 1;
        }
        else
        {
          if (strcmp("pages", v21))
          {
LABEL_75:
            v176[0] = NSLocalizedDescriptionKey;
            v168[0] = CFSTR("Unrecognized argument to -f / --format.\nAccepted arguments: 'bytes', 'formatted', 'pages'.");
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v168, v176, 1));
            v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 2, v57));

            goto LABEL_92;
          }
          v6[2].i64[1] = 2;
        }
        continue;
      case 'h':
        v58 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 1, 0));
        goto LABEL_78;
      case 'j':
        v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
        v23 = (void *)v6[4].i64[1];
        v6[4].i64[1] = v22;

        continue;
      case 'l':
        v24 = optarg;
        if (!optarg)
          goto LABEL_69;
        if (!strcmp("v", optarg))
        {
          v6[3].i64[1] = 0;
        }
        else
        {
          if (strcmp("h", v24))
          {
LABEL_69:
            v188 = NSLocalizedDescriptionKey;
            v189 = CFSTR("Unrecognized argument to -l / --layout.\nAccepted arguments: 'v', 'h'.");
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1));
            v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 11, v55));

            goto LABEL_92;
          }
          v6[3].i64[1] = 1;
        }
        continue;
      case 'p':
        v25 = (void *)v6[6].i64[0];
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
        objc_msgSend(v25, "addObject:", v26);

        continue;
      case 's':
        v6->i8[10] = 1;
        continue;
      case 't':
        v6->i8[8] = 1;
        continue;
      case 'v':
        v6[2].i64[0] = 2;
        continue;
      case 'w':
        v6[3].i64[0] |= 7uLL;
        continue;
      case 'x':
        v27 = (void *)v6[6].i64[1];
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
        objc_msgSend(v27, "addObject:", v28);

        continue;
      case 'y':
        warnx("WARNING: -y/--summary options are deprecated because summary is the default mode");
        continue;
      default:
        if (!v14)
        {
          if (HIDWORD(v166))
          {
            v19 = (void *)v6[6].i64[0];
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", optarg));
            objc_msgSend(v19, "addObject:", v20);

            HIDWORD(v166) = 0;
          }
          else if ((_DWORD)v166)
          {
            __endptr[0] = 0;
            v39 = strtol(optarg, __endptr, 10);
            if (optarg == __endptr[0])
            {
              v190 = NSLocalizedDescriptionKey;
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%s' is not a valid integer for --pid.\n\nUse -p / --proc if you meant to specify a process name."), optarg));
              v191 = v67;
              v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1));
              v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 4, v68));

              goto LABEL_92;
            }
            v40 = v39;
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v42 = (void *)v6[5].i64[1];
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v40));
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v43);

            LODWORD(v166) = 0;
          }
          continue;
        }
        if (v14 == -1)
        {
          if (v6[3].i64[1] == 1)
          {
            if ((v6[2].i8[0] & 2) != 0)
            {
              v56 = CFSTR("--layout is not compatible with -v");
              goto LABEL_82;
            }
            if (v6->i8[9])
            {
              v56 = CFSTR("--layout is not compatible with -a");
LABEL_82:
              v62 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v56));
              v63 = (void *)v62;
              if (v62)
              {
                v184 = NSLocalizedDescriptionKey;
                v185 = v62;
                v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1));
                v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 10, v64));

                goto LABEL_92;
              }
            }
          }
          if (v6->i8[14] && v6->i8[9])
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--forkCorpse is not compatible with -a/--all due to corpse resource limits")));
            v182 = NSLocalizedDescriptionKey;
            v183 = v65;
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
            v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 10, v66));

            goto LABEL_92;
          }
          if (v6->i8[11] || !v6->i8[13])
          {
            if (v6->i8[9] && v6->i8[13])
            {
              warnx("NOTICE: '--unmapped' is redundant when using -a/--all");
              goto LABEL_160;
            }
          }
          else
          {
            warnx("WARNING: ignoring '--unmapped' because the requested analysis mode '--vmObjectDirty' does not support unmapped owned VM objects");
LABEL_160:
            v6->i8[13] = 0;
          }
          v119 = *(double *)&v6[7].i64[1];
          if (v119 > 0.0)
          {
            v120 = *(double *)v6[7].i64;
            if (v120 == 0.0)
            {
              warnx("WARNING: ignoring '--sample-duration' because sampling was not enabled via '--sample'");
            }
            else if (v120 > v119)
            {
              warnx("WARNING: sample interval greater than duration effectively disables sampling mode");
            }
          }
          if (a1 - optind >= 1)
          {
            v135 = &a2[optind];
            v136 = a1 - optind + 1;
            do
            {
              v137 = *v135;
              v138 = (id)v6[6].i64[0];
              v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v137));
              objc_msgSend(v138, "addObject:", v139);

              ++v135;
              --v136;
            }
            while (v136 > 1);
          }
          v69 = v6;
          v48 = 0;
        }
        else
        {
LABEL_76:
          v58 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPFootprintError"), 5, 0));
LABEL_78:
          v48 = v58;
LABEL_92:
          v69 = 0;
        }

        v44 = (FPFootprintArgs *)v48;
        if (!v69)
        {
LABEL_98:
          if (v44)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs userInfo](v44, "userInfo"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

            if (v72)
              warnx("%s", (const char *)objc_msgSend(objc_retainAutorelease(v72), "UTF8String"));

          }
          sub_1000111D8();
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs domain](v44, "domain"));
          if (v73 == CFSTR("FPFootprintError"))
          {
            if (-[FPFootprintArgs code](v44, "code") == (id)1)
            {
              v69 = 0;
              v70 = 0;
LABEL_107:

              objc_autoreleasePoolPop(context);
              v74 = 0;
              goto LABEL_108;
            }
          }
          else
          {

          }
          v69 = 0;
          v70 = 64;
          goto LABEL_107;
        }
        if ((v69->i8[9] || v69->i8[13]) && geteuid())
        {
          warnx("Must run as root.");
          v70 = 77;
          goto LABEL_107;
        }
        v76 = sub_10001A35C((id *)[FPOutputFormatterText alloc], (void *)v69[2].i64[1], (void *)v69[3].i64[0], (void *)v69[4].i64[0], (void *)v69[3].i64[1]);
        if (!v76)
        {
          warnx("Unable to initialize text output");

          objc_autoreleasePoolPop(context);
          v74 = 0;
          v70 = 73;
          goto LABEL_108;
        }
        objc_msgSend(v149, "addObject:", v76);
        if (!v69[4].i64[1])
        {
          v77 = v76;
LABEL_115:
          if (v69[5].i64[0])
          {
            v78 = sub_1000193F0([FPOutputFormatterPerfdata alloc], (void *)v69[5].i64[0]);

            if (!v78)
            {
              warnx("Unable to create perfdata output");
              goto LABEL_131;
            }
            objc_msgSend(v149, "addObject:", v78);
          }
          else
          {
            v78 = v77;
          }
          v154 = v44;
          v79 = sub_10000E788((uint64_t)v69, &v154);
          v74 = (NSMapTable *)objc_claimAutoreleasedReturnValue(v79);
          v80 = v154;

          if (v74)
          {
            if (-[NSMapTable count](v74, "count"))
            {
              if (v80)
              {
                v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs localizedDescription](v80, "localizedDescription")));
                warnx("%s", (const char *)objc_msgSend(v81, "UTF8String"));

              }
              objc_autoreleasePoolPop(context);
              if (qword_1000389F0 != -1)
                dispatch_once(&qword_1000389F0, &stru_100029AE0);
              sub_100011F60((uint64_t)FPFootprint, 1);
              location = (id *)objc_autoreleasePoolPush();
              if (*(double *)v69[7].i64 == 0.0)
              {
                v82 = (id)-[NSMapTable count](v74, "count") == (id)1;
                objc_opt_self(FPFootprint);
                byte_100038A08 = v82;
                v83 = NSAllMapTableValues(v74);
                contexta = (id)objc_claimAutoreleasedReturnValue(v83);
                v84 = v149;
                v85 = v69;
                v86 = sub_100011FC0((id *)[FPFootprint alloc], contexta);
                if (isatty(1))
                {
                  v87 = 0;
                }
                else
                {
                  *(_QWORD *)&v155 = _NSConcreteStackBlock;
                  *((_QWORD *)&v155 + 1) = 3221225472;
                  *(_QWORD *)&v156 = sub_100011348;
                  *((_QWORD *)&v156 + 1) = &unk_100029B08;
                  *(_QWORD *)&v157 = v86;
                  v121 = sub_1000120D0((uint64_t)FPFootprint, &v155);
                  v87 = objc_claimAutoreleasedReturnValue(v121);

                }
                v122 = v85[2].u64[0];
                v123 = objc_autoreleasePoolPush();
                sub_10001213C((uint64_t)v86, v122);
                objc_autoreleasePoolPop(v123);
                v124 = objc_autoreleasePoolPush();
                sub_10001239C((uint64_t)v86);
                objc_autoreleasePoolPop(v124);
                if (v87)
                {
                  dispatch_source_cancel(v87);
                  signal(2, 0);
                }
                v196 = 0u;
                v197 = 0u;
                handler = 0u;
                v195 = 0u;
                v125 = v84;
                v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &handler, &v205, 16);
                if (v126)
                {
                  v127 = *(_QWORD *)v195;
                  do
                  {
                    for (i = 0; i != v126; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v195 != v127)
                        objc_enumerationMutation(v125);
                      if (v86)
                        objc_msgSend(v86[11], "addObject:", *(_QWORD *)(*((_QWORD *)&handler + 1) + 8 * (_QWORD)i));
                    }
                    v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &handler, &v205, 16);
                  }
                  while (v126);
                }

                sub_100012FD4((uint64_t)v86, (v122 >> 1) & 1, v122 & 1, v85->u8[15]);
              }
              else
              {
                v92 = v149;
                contextb = v69;
                v162 = (objc_super)0;
                v163 = 0u;
                v164 = 0u;
                v165 = 0u;
                v93 = v92;
                v94 = (char *)objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v162, &v205, 16);
                if (v94)
                {
                  v95 = *(_QWORD *)v163;
                  do
                  {
                    for (j = 0; j != v94; ++j)
                    {
                      if (*(_QWORD *)v163 != v95)
                        objc_enumerationMutation(v93);
                      v97 = (void *)*((_QWORD *)v162.super_class + (_QWORD)j);
                      if ((objc_opt_respondsToSelector(v97, "configureForMultipleOutputs") & 1) == 0)
                      {
                        v98 = (objc_class *)objc_opt_class(v97);
                        v99 = NSStringFromClass(v98);
                        v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v99));
                        warnx("Selected output format (%s) does not support sampling mode", (const char *)objc_msgSend(v100, "UTF8String"));

                      }
                      objc_msgSend(v97, "configureForMultipleOutputs");
                    }
                    v94 = (char *)objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v162, &v205, 16);
                  }
                  while (v94);
                }

                v143 = dispatch_semaphore_create(0);
                __endptr[0] = 0;
                __endptr[1] = (char *)__endptr;
                __endptr[2] = (char *)0x3042000000;
                __endptr[3] = (char *)sub_100011378;
                __endptr[4] = (char *)sub_100011384;
                v161 = 0;
                v180[0] = 0;
                v180[1] = v180;
                v180[2] = 0x3032000000;
                v180[3] = sub_10001138C;
                v180[4] = sub_10001139C;
                v181 = 0;
                v178[0] = 0;
                v178[1] = v178;
                v178[2] = 0x3032000000;
                v178[3] = sub_10001138C;
                v178[4] = sub_10001139C;
                v179 = 0;
                v101 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
                v141 = objc_claimAutoreleasedReturnValue(v101);
                v102 = dispatch_queue_create("com.apple.footprint.sample-analysis", v141);
                v103 = dispatch_queue_create("com.apple.footprint.sample-timer", 0);
                v104 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v103);
                v176[0] = 0;
                v176[1] = v176;
                v176[2] = 0x2020000000;
                v177 = 1;
                v172 = 0;
                v173 = &v172;
                v174 = 0x2020000000;
                v175 = (unint64_t)(*(double *)v69[7].i64 * 1000000000.0);
                v170[0] = 0;
                v170[1] = v170;
                v170[2] = 0x2020000000;
                v171 = 0;
                v171 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
                v105 = (uint64_t)v173[3];
                v106 = 1000000000;
                if (v105 < 0x3B9ACA00)
                  v106 = (unint64_t)v173[3];
                v107 = v106 >> 1;
                dispatch_source_set_timer(v104, 0, v105, v106 >> 1);
                *(_QWORD *)&handler = _NSConcreteStackBlock;
                *((_QWORD *)&handler + 1) = 3221225472;
                *(_QWORD *)&v195 = sub_1000113A4;
                *((_QWORD *)&v195 + 1) = &unk_100029B58;
                v108 = v104;
                *(_QWORD *)&v196 = v108;
                v198 = v176;
                v199 = v170;
                v200 = &v172;
                v204 = v107;
                v201 = v178;
                v109 = contextb;
                *((_QWORD *)&v196 + 1) = v109;
                v202 = v180;
                v203 = __endptr;
                v110 = v102;
                *(_QWORD *)&v197 = v110;
                v140 = v93;
                *((_QWORD *)&v197 + 1) = v140;
                dispatch_source_set_event_handler(v108, &handler);
                v168[0] = 0;
                v168[1] = v168;
                v168[2] = 0x3020000000;
                v169 = 0;
                *(_QWORD *)&v155 = _NSConcreteStackBlock;
                *((_QWORD *)&v155 + 1) = 3221225472;
                *(_QWORD *)&v156 = sub_1000118FC;
                *((_QWORD *)&v156 + 1) = &unk_100029BA0;
                *((_QWORD *)&v158 + 1) = v168;
                v111 = v108;
                *(_QWORD *)&v157 = v111;
                v159 = __endptr;
                v142 = v103;
                *((_QWORD *)&v157 + 1) = v142;
                contextc = v143;
                *(_QWORD *)&v158 = contextc;
                v112 = objc_retainBlock(&v155);
                v113 = sub_1000120D0((uint64_t)FPFootprint, v112);
                v114 = objc_claimAutoreleasedReturnValue(v113);
                fprintf(__stderrp, "Sampling at %.3gs interval", *(double *)v69[7].i64);
                if (v109[15] > 0.0)
                  fprintf(__stderrp, " for %.1fs", v109[15]);
                fwrite("... (<ctrl-c> to stop)\n", 0x17uLL, 1uLL, __stderrp);
                v115 = v109[15];
                if (v115 > 0.0)
                {
                  v116 = dispatch_time(0, (uint64_t)(v115 * 1000000000.0));
                  global_queue = dispatch_get_global_queue(21, 0);
                  v118 = objc_claimAutoreleasedReturnValue(global_queue);
                  dispatch_after(v116, v118, v112);

                }
                dispatch_resume(v111);
                dispatch_semaphore_wait(contextc, 0xFFFFFFFFFFFFFFFFLL);
                fwrite("Analyzing and writing output...\n", 0x20uLL, 1uLL, __stderrp);
                if (v114)
                {
                  dispatch_source_cancel(v114);
                  signal(2, 0);
                }
                dispatch_sync(v110, &stru_100029BC0);

                _Block_object_dispose(v168, 8);
                _Block_object_dispose(v170, 8);
                _Block_object_dispose(&v172, 8);
                _Block_object_dispose(v176, 8);

                _Block_object_dispose(v178, 8);
                _Block_object_dispose(v180, 8);

                _Block_object_dispose(__endptr, 8);
                objc_destroyWeak(&v161);

              }
              objc_autoreleasePoolPop(location);
              v129 = objc_autoreleasePoolPush();
              v152 = 0u;
              v153 = 0u;
              v150 = 0u;
              v151 = 0u;
              v130 = v149;
              v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v150, v167, 16);
              if (v131)
              {
                v132 = *(_QWORD *)v151;
                do
                {
                  for (k = 0; k != v131; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v151 != v132)
                      objc_enumerationMutation(v130);
                    v134 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)k);
                    if ((objc_opt_respondsToSelector(v134, "close") & 1) != 0)
                      objc_msgSend(v134, "close");
                  }
                  v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v150, v167, 16);
                }
                while (v131);
              }

              objc_autoreleasePoolPop(v129);
              v70 = 0;
              goto LABEL_108;
            }
            warnx("Unable to find any processes matching the supplied process names or pids (try as root?)");
            if (!v80)
            {
              v70 = 66;
              goto LABEL_136;
            }
            v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs localizedDescription](v80, "localizedDescription")));
            warnx("%s", (const char *)objc_msgSend(v89, "UTF8String"));

            v70 = 66;
          }
          else
          {
            v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPFootprintArgs localizedDescription](v80, "localizedDescription")));
            warnx("%s", (const char *)objc_msgSend(v88, "UTF8String"));

            sub_1000111D8();
            v74 = 0;
            v70 = 64;
          }
          v44 = v80;
          goto LABEL_135;
        }
        v77 = sub_100015C48([FPOutputFormatterJSON alloc], (void *)v69[4].i64[1]);

        if (v77)
        {
          objc_msgSend(v149, "addObject:", v77);
          goto LABEL_115;
        }
        warnx("Unable to create JSON output");
LABEL_131:
        v74 = 0;
        v78 = 0;
        v70 = 73;
LABEL_135:

LABEL_136:
        objc_autoreleasePoolPop(context);
        v90 = (void *)v69[4].i64[1];
        if (v90)
          unlink((const char *)objc_msgSend(objc_retainAutorelease(v90), "UTF8String"));
        v91 = (void *)v69[5].i64[0];
        if (v91)
          unlink((const char *)objc_msgSend(objc_retainAutorelease(v91), "UTF8String"));
LABEL_108:

        return v70;
    }
  }
}

void sub_1000110C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&a39, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

size_t sub_1000111D8()
{
  FILE *v0;
  id v1;
  size_t result;

  fwrite("Gather memory information about a process or set of processes\nUsage: footprint [args] [proc/pid/memgraph [proc/pid/memgraph [...]]]\n    -a, --all                             target all processes\n    -j, --json <file>                     print json output to a file\n    -h, --help                            print this output\n    -p, --proc, --pid [proc/pid]          target pid or process (or interpret for -p)\n    -x, --exclude [proc/pid]              exclude pid or process\n    -s, --skip                            skip processes that are idle-exit clean\n    --minFootprint <MiB>                  skip processes with footprint less than the provided minimum\n    --forkCorpse                          analyze a forked corpse of the target process (not compatible with --all)\n    -v                                    print all regions and vmmap-like output of address space layout (default output is a summary)\n    -f, --format (bytes|formatted|pages)  change size formatting preference (default: formatted)\n", 0x3F2uLL, 1uLL, __stdoutp);
  v0 = __stdoutp;
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Dirty"), "lowercaseString")));
  fprintf(v0, "    --sort <column>                       change the column used for sorting (default: %s)\n", (const char *)objc_msgSend(v1, "UTF8String"));

  fwrite("    -w, --wide                            show wide output with all columns and full paths (implies --swapped --wired)\n    --swapped                             show swapped/compressed column\n    --wired                               show wired column\n    --vmObjectDirty                       interpret dirty memory as viewed by VM objects in the kernel\n    --unmapped                            search all processes for unmapped memory owned by the target processes\n    --sample <interval>                   repeatedly gather footprint at the given sampling interval in seconds (can be fractional — e.g. 0.5)\n    --sample-duration <duration>          how long to sample in seconds (default and 0 is unlimited)\n    --noCategories                        exclude categories\n", 0x307uLL, 1uLL, __stdoutp);
  result = os_variant_has_internal_content("com.apple.footprint");
  if ((_DWORD)result)
  {
    fwrite("\nAppleInternal:\n", 0x10uLL, 1uLL, __stdoutp);
    fwrite("    --perfdata <file.pdj>                 print perfdata(1) output to a file\n", 0x4DuLL, 1uLL, __stdoutp);
    fwrite("    --layout (v|h)                        layout style for text formatter v:vertical h:horizontal (default: v)\n", 0x6FuLL, 1uLL, __stdoutp);
    result = sub_100015318((uint64_t)FPFootprint);
    if ((_DWORD)result)
      return fwrite("    --ioaccel                             print IOAccelMemory region descriptions, implies -v\n", 0x5EuLL, 1uLL, __stdoutp);
  }
  return result;
}

void sub_100011300(id a1)
{
  rlim_t rlim_max;
  rlimit v2;

  v2.rlim_cur = 0;
  v2.rlim_max = 0;
  getrlimit(8, &v2);
  rlim_max = 16 * v2.rlim_cur;
  if (16 * v2.rlim_cur >= v2.rlim_max)
    rlim_max = v2.rlim_max;
  v2.rlim_cur = rlim_max;
  setrlimit(8, &v2);
}

size_t sub_100011348(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    *(_BYTE *)(v1 + 96) = 1;
  return fwrite("Exiting early due to SIGINT\n", 0x1CuLL, 1uLL, __stderrp);
}

void sub_100011378(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_100011384(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

uint64_t sub_10001138C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001139C(uint64_t a1)
{

}

void sub_1000113A4(uint64_t a1)
{
  __uint64_t v2;
  uint64_t v3;
  __uint64_t v4;
  uint64_t v5;
  __uint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  id v10;
  NSMapTable *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  FPFootprint *v26;
  NSArray *v27;
  void *v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  NSObject *v34;
  id *v35;
  id v36;
  NSObject *v37;
  dispatch_time_t v38;
  uint64_t v39;
  _QWORD block[4];
  id *v41;
  id v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
  if (dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)) >= 2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v3 + 24))
    {
      *(_BYTE *)(v3 + 24) = 0;
    }
    else
    {
      v4 = v2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v6 = *(_QWORD *)(v5 + 24);
      v7 = v4 > v6;
      v8 = v4 - v6;
      if (v7)
      {
        *(_QWORD *)(v5 + 24) = v6 + (unint64_t)((double)v8 * 1.1);
        warnx("WARNING: Unable to keep up with sampling interval. Increasing interval to %.3gs.", (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) / 1000000000.0);
        v37 = *(NSObject **)(a1 + 32);
        v38 = dispatch_time(0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
        dispatch_source_set_timer(v37, v38, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 112));
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v2;
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v9)
  {
    v11 = sub_10000E788((uint64_t)v9, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v9)
    {
      if (objc_msgSend(v10, "count"))
      {
        v39 = a1;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              if ((objc_opt_respondsToSelector(v17, "physFootprint") & 1) != 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "asNumber"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v18));

                if (v19)
                {
                  v20 = objc_msgSend(v19, "physFootprint");
                  if (v20 == objc_msgSend(v17, "physFootprint"))
                  {
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "asNumber"));
                    objc_msgSend(v9, "setObject:forKey:", v17, v21);

                  }
                }

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v14);
        }

        a1 = v39;
      }
    }
  }

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v9;

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = 0;

  v26 = [FPFootprint alloc];
  v27 = NSAllMapTableValues(*(NSMapTable **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = sub_100011FC0((id *)&v26->super.isa, v28);

  if (v29)
    *((_DWORD *)v29 + 25) = 25;
  v30 = *(_QWORD *)(a1 + 40);
  if (v30)
    v31 = *(_QWORD *)(v30 + 32);
  else
    v31 = 0;
  objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v29);
  v32 = objc_autoreleasePoolPush();
  v33 = sub_10001213C((uint64_t)v29, v31);
  objc_autoreleasePoolPop(v32);
  if ((v33 & 1) == 0)
  {
    v34 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000117A8;
    block[3] = &unk_100029B30;
    v35 = v29;
    v41 = v35;
    v42 = *(id *)(a1 + 56);
    v44 = v31;
    v43 = *(id *)(a1 + 40);
    dispatch_async(v34, block);
    if (v29)
      v36 = v35[1];
    else
      v36 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v36);

  }
}

void sub_1000117A8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_autoreleasePoolPush();
  sub_10001239C(*(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
  v3 = objc_autoreleasePoolPush();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(a1 + 32);
        if (v9)
          objc_msgSend(*(id *)(v9 + 88), "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    v11 = *(unsigned __int8 *)(v10 + 15) != 0;
  else
    v11 = 0;
  sub_100012FD4(*(_QWORD *)(a1 + 32), (*(_QWORD *)(a1 + 56) >> 1) & 1, *(_BYTE *)(a1 + 56) & 1, v11);
  objc_autoreleasePoolPop(v3);
}

intptr_t sub_1000118FC(intptr_t result)
{
  intptr_t v1;
  unsigned __int8 *v2;
  _BYTE *WeakRetained;

  v1 = result;
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40);
  do
  {
    if (__ldxr(v2))
    {
      __clrex();
      return result;
    }
  }
  while (__stxr(1u, v2));
  dispatch_source_cancel(*(dispatch_source_t *)(result + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40));
  if (WeakRetained)
    WeakRetained[96] = 1;

  fwrite("\nStopping...\n", 0xDuLL, 1uLL, __stderrp);
  dispatch_sync(*(dispatch_queue_t *)(v1 + 40), &stru_100029B78);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
}

id sub_1000119AC(void *a1, uint64_t a2)
{
  mach_port_name_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  mach_error_t v8;
  id v9;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  _BYTE v33[32];
  _DWORD v34[32];
  uint64_t v35;

  if (!a1)
    return 0;
  v2 = a2;
  v3 = a1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100011CB4;
  v19 = sub_100011CC4;
  v20 = 0;
  memset(v33, 0, sizeof(v33));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011CCC;
  v14[3] = &unk_100029BE8;
  v14[4] = &v29;
  v14[5] = &v25;
  v14[7] = &v15;
  v14[8] = v33;
  v14[6] = &v21;
  if ((sub_100008B3C(a2, v14) & 1) != 0)
  {
    v4 = *((unsigned int *)v30 + 6);
    v5 = *((unsigned int *)v26 + 6);
    v6 = *((_DWORD *)v22 + 6);
    v7 = (id)v16[5];
    v8 = mach_port_mod_refs(mach_task_self_, v2, 0, 1);
    if (v8)
    {
      mach_error("initWithCorpse:mach_port_mod_refs", v8);

    }
    else
    {
      *((_DWORD *)v3 + 24) = v2;
      v35 = 0;
      memset(v34, 0, sizeof(v34));
      v34[3] = v4;
      v34[0] = v6 & 0x4000 | (v6 >> 9) & 1 | (16 * ((v6 >> 2) & 1)) & 0xFFFFDF7F | (((v6 >> 1) & 1) << 7) & 0xFFFFDFFF | HIWORD(v6) & 0x100 | (((v6 >> 8) & 1) << 13);
      *((_BYTE *)v3 + 13) = (v6 & 0x20000) != 0;
      v11 = objc_msgSend(v3, "initWithBsdInfo:", v34);
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setName:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%d] (corpse)"), v7, v4));
        objc_msgSend(v12, "setDisplayString:", v13);

        objc_msgSend(v12, "_setIdleExitStatusFromDirtyFlags:", v5);
        objc_msgSend(v12, "addLedgerData:count:", v33, 4);
        v3 = v12;
        v9 = v3;
        goto LABEL_7;
      }

    }
    v3 = 0;
  }
  v9 = 0;
LABEL_7:
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v9;
}

void sub_100011C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011CB4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100011CC4(uint64_t a1)
{

}

void sub_100011CCC(uint64_t a1, int *a2)
{
  int v3;
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[1024];

  v3 = *a2;
  if ((*a2 & 0xFFFFFFF0) == 0x20)
    v3 = 17;
  if (v3 <= 2072)
  {
    switch(v3)
    {
      case 2053:
        v4 = a2[4];
        v5 = *(_QWORD *)(a1 + 32);
        break;
      case 2063:
        __strlcpy_chk(v10, a2 + 4, 1024, 1024);
        v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v10);
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        return;
      case 2069:
        v4 = a2[4];
        v5 = *(_QWORD *)(a1 + 48);
        break;
      default:
        return;
    }
    goto LABEL_17;
  }
  if (v3 <= 2085)
  {
    if (v3 != 2073)
    {
      if (v3 == 2085)
        **(_QWORD **)(a1 + 64) = *((_QWORD *)a2 + 2);
      return;
    }
    v4 = a2[4];
    v5 = *(_QWORD *)(a1 + 40);
LABEL_17:
    *(_DWORD *)(*(_QWORD *)(v5 + 8) + 24) = v4;
    return;
  }
  if (v3 == 2086)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) = *((_QWORD *)a2 + 2);
  }
  else if (v3 == 2087)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 16) = *((_QWORD *)a2 + 2);
  }
}

BOOL sub_100011E4C()
{
  int v0;
  size_t v2;
  int v3;

  objc_opt_self();
  v0 = byte_100034800;
  if (byte_100034800 == 2)
  {
    v3 = 0;
    v2 = 4;
    if (sysctlbyname("vm.self_region_footprint", &v3, &v2, 0, 0) && *__error() != 2)
    {
      perror("Unable to retrieve status of physical footprint data collection");
      v3 = 0;
    }
    v0 = v3 != 0;
    byte_100034800 = v3 != 0;
  }
  return v0 == 1;
}

void sub_100011EE8(uint64_t a1, int a2)
{
  int v3;

  objc_opt_self();
  v3 = a2;
  if (sysctlbyname("vm.self_region_footprint", 0, 0, &v3, 4uLL) && *__error() != 2)
    perror("Unable to configure physical footprint data collection");
  byte_100034800 = 2;
}

void sub_100011F60(uint64_t a1, int a2)
{
  int v2;

  v2 = a2;
  objc_opt_self();
  if (sysctlbyname("vm.self_region_info_flags", 0, 0, &v2, 4uLL))
  {
    if (*__error() != 2)
      perror("Unable to configure VM region info flags");
  }
}

id *sub_100011FC0(id *a1, void *a2)
{
  id v4;
  id *v5;
  id v6;
  id v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FPFootprint;
    v5 = (id *)objc_msgSendSuper2(&v9, "init");
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      *((_BYTE *)a1 + 96) = 0;
      v6 = objc_alloc_init((Class)NSMutableArray);
      v7 = a1[11];
      a1[11] = v6;

      *((_DWORD *)a1 + 25) = 17;
      *((_DWORD *)a1 + 8) = 0;
      *((_DWORD *)a1 + 12) = 0;
    }
  }

  return a1;
}

NSObject *sub_1000120D0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_opt_self(a1);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, 0);
  dispatch_source_set_event_handler(v4, v3);

  signal(2, (void (__cdecl *)(int))1);
  dispatch_resume(v4);
  return v4;
}

uint64_t sub_10001213C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  FPTime *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  FPTime *v17;
  uint64_t v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v2 = a1;
  if (a1)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)*(_DWORD *)(v2 + 100), 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);

    v8 = dispatch_queue_create("com.apple.footprint.gatherdata", v7);
    v9 = *(id *)(v2 + 8);
    objc_opt_self(FPFootprint);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingComparator:", &stru_100029CA8));

    v11 = sub_1000192E0((uint64_t)FPTime);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = *(void **)(v2 + 104);
    *(_QWORD *)(v2 + 104) = v12;

    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v14 = objc_msgSend(v10, "count");
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100012328;
    v24 = &unk_100029C10;
    v25 = v2;
    v27 = &v29;
    v15 = v10;
    v26 = v15;
    v28 = a2;
    dispatch_apply((size_t)v14, v8, &v21);
    if (*((_BYTE *)v30 + 24))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject", v21, v22, v23, v24, v25));
      objc_msgSend(v16, "_addGlobalError:", CFSTR("Footprint exited early due to SIGINT and did not finish gathering all data"));

    }
    v17 = sub_1000192E0((uint64_t)FPTime);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = *(void **)(v2 + 112);
    *(_QWORD *)(v2 + 112) = v18;

    v2 = *((_BYTE *)v30 + 24) != 0;
    _Block_object_dispose(&v29, 8);

  }
  return v2;
}

void sub_100012310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012328(uint64_t a1, uint64_t a2)
{
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 96))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2));
    objc_msgSend(v3, "gatherData:extendedInfoProvider:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

  }
}

void sub_10001239C(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  CFMutableDictionaryRef Mutable;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  const void *v23;
  int v24;
  const __CFDictionary *v25;
  int v26;
  BOOL v27;
  char v28;
  int v29;
  const void *Value;
  FPMemoryObject *v31;
  FPMemoryObject *v32;
  unsigned int v33;
  BOOL v34;
  int v35;
  BOOL v36;
  FPMemoryObject *v37;
  FPMemoryObject *v38;
  FPMemoryObject *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  id v51;
  id v52;
  void *j;
  void *v54;
  __CFArray *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *k;
  const void *v62;
  const void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *m;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *n;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  void *ii;
  _QWORD *v84;
  _QWORD *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id obj;
  id v92;
  uint64_t v93;
  uint64_t v94;
  vm_size_t v95;
  id v96;
  uint64_t v97;
  const __CFDictionary *context;
  void *contexta;
  void *v100;
  uint64_t v101;
  id v102;
  id v103;
  BOOL v104;
  id v105;
  id v106;
  uint64_t v107;
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[3];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];

  if (!a1)
    return;
  v1 = a1;
  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v2;

  *(_QWORD *)(v1 + 56) = CFDictionaryCreateMutable(kCFAllocatorDefault, 100 * (_QWORD)objc_msgSend(*(id *)(v1 + 8), "count"), (const CFDictionaryKeyCallBacks *)&unk_100029C30, &kCFTypeDictionaryValueCallBacks);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = v4;

  *(_QWORD *)(v1 + 72) = CFDictionaryCreateMutable(kCFAllocatorDefault, 2 * (_QWORD)objc_msgSend(*(id *)(v1 + 8), "count"), (const CFDictionaryKeyCallBacks *)&unk_100029C30, &kCFTypeDictionaryValueCallBacks);
  *(_QWORD *)(v1 + 80) = CFDictionaryCreateMutable(kCFAllocatorDefault, 2 * (_QWORD)objc_msgSend(*(id *)(v1 + 8), "count"), (const CFDictionaryKeyCallBacks *)&unk_100029C30, &kCFTypeDictionaryValueCallBacks);
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = *(id *)(v1 + 8);
  v107 = v1;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
  if (!v92)
    goto LABEL_72;
  v93 = *(_QWORD *)v111;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v111 != v93)
        objc_enumerationMutation(obj);
      v7 = *(id *)(*((_QWORD *)&v110 + 1) + 8 * v6);
      v104 = sub_100011E4C();
      v96 = objc_msgSend(v7, "pageSize");
      v95 = vm_kernel_page_size;
      v100 = v7;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedCache"));
      v9 = (id *)v8;
      v94 = v6;
      if (v8)
      {
        v10 = *(void **)(v1 + 64);
        v97 = *(_QWORD *)(v8 + 24);
        v11 = *(id *)(v8 + 16);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

        context = (const __CFDictionary *)v12;
        if (!v12)
        {
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, (const CFDictionaryKeyCallBacks *)&unk_100029C30, &kCFTypeDictionaryValueCallBacks);
          v14 = *(void **)(v1 + 64);
          v15 = v9[2];
          objc_msgSend(v14, "setObject:forKeyedSubscript:", Mutable, v15);

          context = Mutable;
        }
      }
      else
      {
        v97 = 0;
        context = 0;
      }
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v108 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "memoryRegions"));
      v16 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v132, v136, 16);
      if (v16)
      {
        v19 = v16;
        v20 = *(id *)v133;
        v102 = *(id *)v133;
        do
        {
          v21 = 0;
          do
          {
            if (*(id *)v133 != v20)
              objc_enumerationMutation(v108);
            v22 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)v21);
            if (!v22)
            {
              v23 = 0;
LABEL_32:
              v25 = *(const __CFDictionary **)(v1 + 56);
              goto LABEL_33;
            }
            if ((*(_BYTE *)(v22 + 8) & 2) == 0)
            {
              v23 = *(const void **)(v22 + 96);
              v24 = *(unsigned __int8 *)(v22 + 9);
              if (v24 == 4)
              {
                v25 = *(const __CFDictionary **)(v1 + 80);
                goto LABEL_33;
              }
              if (v24 == 2)
              {
                v25 = *(const __CFDictionary **)(v1 + 72);
                goto LABEL_33;
              }
              goto LABEL_32;
            }
            if (!v9)
            {
              v90 = _os_assert_log(0, v17, v18);
              _os_crash(v90);
              __break(1u);
            }
            v26 = *(unsigned __int8 *)(v22 + 9);
            v27 = v26 == 2 || v26 == 4;
            if (!v27 && (*(_QWORD *)(v22 + 16) || *(_QWORD *)(v22 + 24)))
              goto LABEL_35;
            v25 = context;
            v23 = (const void *)(*(_QWORD *)(v22 + 80) - v97 + 1);
LABEL_33:
            if ((unint64_t)v23 + 1 <= 1)
            {
              if (!v22)
                goto LABEL_63;
LABEL_35:
              *(_QWORD *)(v22 + 64) = v22;
              goto LABEL_63;
            }
            v28 = !v104;
            if (!v22)
              v28 = 1;
            if ((v28 & 1) != 0)
              v29 = 0;
            else
              v29 = (*(unsigned __int8 *)(v22 + 8) >> 3) & 1;
            Value = CFDictionaryGetValue(v25, v23);
            v31 = (FPMemoryObject *)objc_claimAutoreleasedReturnValue(Value);
            if (!v31)
            {
              if ((v29 & 1) != 0
                || v22
                && (*(_BYTE *)(v22 + 8) & 2) == 0
                && ((v33 = *(unsigned __int8 *)(v22 + 10), v34 = v33 > 6, v35 = (1 << v33) & 0x4C, !v34)
                  ? (v36 = v35 == 0)
                  : (v36 = 1),
                    v36 && *(unsigned __int8 *)(v22 + 9) - 5 < 0xFFFFFFFD)
                || v96 != (id)v95)
              {
                v32 = objc_alloc_init(FPMemoryObject);
              }
              else
              {
                v32 = (FPMemoryObject *)(id)v22;
              }
              v31 = v32;
              CFDictionaryAddValue(v25, v23, v32);
            }
            v37 = (FPMemoryObject *)v22;
            if (v31 != (FPMemoryObject *)v22)
            {
              v38 = (FPMemoryObject *)objc_claimAutoreleasedReturnValue(-[FPMemoryObject ensureMemoryObject](v31, "ensureMemoryObject"));
              v39 = v38;
              if (v38 == v31)
              {
                v37 = v31;
              }
              else
              {
                v37 = v38;

                CFDictionaryReplaceValue(v25, v23, v37);
              }
              sub_1000068FC((uint64_t)v39, (void *)v22, v100);
              if (v29)
                -[FPMemoryObject setOwnerPid:](v39, "setOwnerPid:", objc_msgSend(v100, "pid"));

              v1 = v107;
            }
            if (v22)
              *(_QWORD *)(v22 + 64) = v37;

            v20 = v102;
LABEL_63:
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          v40 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v132, v136, 16);
          v19 = v40;
        }
        while (v40);
      }

      v6 = v94 + 1;
    }
    while ((id)(v94 + 1) != v92);
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
    v92 = v41;
  }
  while (v41);
LABEL_72:

  contexta = objc_autoreleasePoolPush();
  v42 = *(_QWORD *)(v1 + 72);
  v43 = *(_QWORD *)(v1 + 80);
  v131[0] = *(_QWORD *)(v1 + 56);
  v131[1] = v42;
  v131[2] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v131, 3));
  v45 = objc_msgSend(v44, "mutableCopy");

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 64), "objectEnumerator"));
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v122, v136, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v48; i = (char *)i + 1)
      {
        if (*(_QWORD *)v123 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(v45, "addObject:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v122, v136, 16);
    }
    while (v48);
  }

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v105 = v45;
  v51 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v118, &v132, 16);
  if (v51)
  {
    v52 = v51;
    v109 = *(id *)v119;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(id *)v119 != v109)
          objc_enumerationMutation(v105);
        v54 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j);
        v55 = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
        v56 = objc_autoreleasePoolPush();
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v57 = v54;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v114, &v127, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v115;
          do
          {
            for (k = 0; k != v59; k = (char *)k + 1)
            {
              if (*(_QWORD *)v115 != v60)
                objc_enumerationMutation(v57);
              v62 = *(const void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)k);
              v63 = CFDictionaryGetValue((CFDictionaryRef)v57, v62);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              if ((objc_msgSend(v64, "finalizeObject") & 1) == 0)
                CFArrayAppendValue(v55, v62);

            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v114, &v127, 16);
          }
          while (v59);
        }

        objc_autoreleasePoolPop(v56);
        objc_msgSend(v57, "removeObjectsForKeys:", v55);
        if (v55)
          CFRelease(v55);
        v1 = v107;
      }
      v52 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v118, &v132, 16);
    }
    while (v52);
  }

  objc_msgSend(*(id *)(v1 + 16), "removeAllObjects");
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v65 = sub_100014AF4(v1);
  v103 = (id)objc_claimAutoreleasedReturnValue(v65);
  v106 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v122, &v132, 16);
  if (v106)
  {
    v66 = *(_QWORD *)v123;
    v101 = *(_QWORD *)v123;
    do
    {
      for (m = 0; m != v106; m = (char *)m + 1)
      {
        if (*(_QWORD *)v123 != v66)
          objc_enumerationMutation(v103);
        v68 = *(id *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)m);
        if (sub_100011E4C())
        {
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v69 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "memoryRegions"));
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
          if (v70)
          {
            v71 = v70;
            v72 = 0;
            v73 = *(_QWORD *)v128;
            do
            {
              for (n = 0; n != v71; n = (char *)n + 1)
              {
                if (*(_QWORD *)v128 != v73)
                  objc_enumerationMutation(v69);
                v75 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)n);
                v76 = objc_msgSend(v75, "dirtySize");
                v72 += (uint64_t)objc_msgSend(v75, "swappedSize") + (_QWORD)v76;
              }
              v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
            }
            while (v71);
          }
          else
          {
            v72 = 0;
          }
        }
        else
        {
          v77 = objc_alloc((Class)NSMutableSet);
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "memoryRegions"));
          v69 = objc_msgSend(v77, "initWithCapacity:", objc_msgSend(v78, "count"));

          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "memoryRegions"));
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
          if (v80)
          {
            v81 = v80;
            v72 = 0;
            v82 = *(_QWORD *)v128;
            do
            {
              for (ii = 0; ii != v81; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v128 != v82)
                  objc_enumerationMutation(v79);
                v84 = *(_QWORD **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)ii);
                if (v84)
                  v84 = (_QWORD *)v84[8];
                v85 = v84;
                if ((objc_msgSend(v69, "containsObject:", v85) & 1) == 0)
                {
                  v86 = objc_msgSend(v85, "dirtySize");
                  v72 += (uint64_t)objc_msgSend(v85, "swappedSize") + (_QWORD)v86;
                  objc_msgSend(v69, "addObject:", v85);
                }

              }
              v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
            }
            while (v81);
          }
          else
          {
            v72 = 0;
          }

          v66 = v101;
        }

        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v72));
        v88 = *(void **)(v107 + 16);
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v68, "pid")));
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v87, v89);

      }
      v106 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v122, &v132, 16);
    }
    while (v106);
  }

  objc_autoreleasePoolPop(contexta);
}

void sub_100012E34(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a2;
  objc_opt_self(a1);
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        *(_QWORD *)a3 += objc_msgSend(v11, "totalDirtySize");
        *(_QWORD *)(a3 + 8) += objc_msgSend(v11, "totalSwappedSize");
        *(_QWORD *)(a3 + 16) += objc_msgSend(v11, "totalCleanSize");
        *(_QWORD *)(a3 + 24) += objc_msgSend(v11, "totalReclaimableSize");
        *(_QWORD *)(a3 + 32) += objc_msgSend(v11, "totalWiredSize");
        v12 = objc_msgSend(v11, "totalRegions");

        *(_DWORD *)(a3 + 40) += v12;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void sub_100012FD4(uint64_t a1, int a2, char a3, int a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  id v21;
  id v22;
  void *k;
  void *v24;
  NSMutableArray *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *m;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *n;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *ii;
  uint64_t v48;
  void *v49;
  FPProcessGroup *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *jj;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *kk;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *mm;
  uint64_t v77;
  void *v78;
  void *v79;
  FPProcessGroup *v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  void *nn;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  char *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  void *i1;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  const void *v103;
  void *v104;
  const void *v105;
  const void *v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  void *i2;
  void *v112;
  void *v113;
  char *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  void *i3;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  char *v134;
  _QWORD *v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  id v148;
  uint64_t v149;
  void *i4;
  void *v151;
  void *v152;
  id v153;
  char *v154;
  id v155;
  id v156;
  id v157;
  uint64_t v158;
  void *i5;
  void *v160;
  id v161;
  id v162;
  id v163;
  uint64_t v164;
  void *i6;
  void *v166;
  void *v167;
  id v168;
  id v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  id v182;
  uint64_t v183;
  void *i7;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  uint64_t v190;
  void *i8;
  void *v192;
  void *v193;
  id v194;
  id v195;
  id v196;
  uint64_t v197;
  void *i9;
  id v199;
  void *v200;
  id v201;
  uint64_t v202;
  void *v203;
  void *v204;
  id v205;
  id v206;
  uint64_t v207;
  void *i10;
  _QWORD *v209;
  _QWORD *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  double v214;
  void *v215;
  _BOOL8 v216;
  id v217;
  id v218;
  id v219;
  uint64_t v220;
  void *v221;
  void *i11;
  void *v223;
  void *v224;
  void *context;
  void *v226;
  id v227;
  id v228;
  void *v229;
  uint64_t v230;
  char *v232;
  void *v233;
  NSMutableArray *v234;
  NSMutableArray *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  char *v241;
  id v242;
  id v243;
  id v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  id v250;
  id v251;
  char *v252;
  id v253;
  id obj;
  char *obja;
  id objb;
  id objc;
  id v258;
  id v259;
  char *v260;
  char *v261;
  id v262;
  id v263;
  NSMutableArray *v265;
  id v266;
  id v267;
  uint64_t v268;
  uint64_t v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  _QWORD v338[4];
  id v339;
  id v340;
  id v341;
  id v342;
  void *v343;
  unsigned __int8 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  _BYTE v353[128];
  _BYTE v354[128];
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  _BYTE v358[128];
  _BYTE v359[128];
  _BYTE v360[128];
  _BYTE v361[128];
  _BYTE v362[128];
  _BYTE v363[128];
  _BYTE v364[128];
  _BYTE v365[128];
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  unsigned __int8 v382[128];
  __int128 v383;
  __int128 v384;
  __int128 v385;

  if (a1)
  {
    v5 = a1;
    v6 = sub_100014AF4(a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_QWORD *)&v383 = _NSConcreteStackBlock;
    *((_QWORD *)&v383 + 1) = 3221225472;
    *(_QWORD *)&v384 = sub_100014F28;
    *((_QWORD *)&v384 + 1) = &unk_100029CD0;
    *(_QWORD *)&v385 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &v383));

    v320 = 0u;
    v321 = 0u;
    v318 = 0u;
    v319 = 0u;
    v9 = *(id *)(v5 + 88);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v318, v365, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v319;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v319 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v318 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v14, "startAtTime:") & 1) != 0)
            objc_msgSend(v14, "startAtTime:", *(_QWORD *)(v5 + 104));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v318, v365, 16);
      }
      while (v11);
    }

    v249 = v5;
    if (a2)
    {
      v250 = v8;
      v265 = objc_opt_new(NSMutableArray);
      v374 = 0u;
      v375 = 0u;
      v376 = 0u;
      v377 = 0u;
      v15 = *(id *)(v5 + 88);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v374, &v383, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v375;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v375 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v374 + 1) + 8 * (_QWORD)j);
            if ((objc_opt_respondsToSelector(v20, "printVmmapLikeOutputForProcess:regions:") & 1) != 0)
              -[NSMutableArray addObject:](v265, "addObject:", v20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v374, &v383, 16);
        }
        while (v17);
      }

      if (-[NSMutableArray count](v265, "count"))
      {
        v236 = v8;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        obj = v250;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v370, v382, 16);
        if (v21)
        {
          v22 = v21;
          v258 = *(id *)v371;
          do
          {
            for (k = 0; k != v22; k = (char *)k + 1)
            {
              if (*(id *)v371 != v258)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v370 + 1) + 8 * (_QWORD)k);
              v366 = 0u;
              v367 = 0u;
              v368 = 0u;
              v369 = 0u;
              v25 = v265;
              v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v366, &v378, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v367;
                do
                {
                  for (m = 0; m != v27; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v367 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * (_QWORD)m);
                    v31 = objc_autoreleasePoolPush();
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "memoryRegions"));
                    objc_msgSend(v30, "printVmmapLikeOutputForProcess:regions:", v24, v32);

                    objc_autoreleasePoolPop(v31);
                  }
                  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v366, &v378, 16);
                }
                while (v27);
              }

            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v370, v382, 16);
          }
          while (v22);
        }

        v5 = v249;
        v8 = v236;
      }

    }
    v235 = objc_opt_new(NSMutableArray);
    v234 = objc_opt_new(NSMutableArray);
    v226 = 0;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2 && (a4 & 1) == 0)
    {
      v33 = objc_alloc_init((Class)NSMutableDictionary);
      v378 = 0u;
      v379 = 0u;
      v380 = 0u;
      v381 = 0u;
      v34 = *(id *)(v5 + 8);
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v378, &v383, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v379;
        do
        {
          for (n = 0; n != v36; n = (char *)n + 1)
          {
            if (*(_QWORD *)v379 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * (_QWORD)n);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "sharedCache"));
            if (v40)
            {
              v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v40));
              if (!v41)
              {
                v41 = -[FPProcessGroupMinimal initUniqueProcessGroup]([FPProcessGroupMinimal alloc], "initUniqueProcessGroup");
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v41, v40);
              }
              objc_msgSend(v41, "addProcess:", v39);

            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v378, &v383, 16);
        }
        while (v36);
      }

      v42 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v33, "count"));
      v374 = 0u;
      v375 = 0u;
      v376 = 0u;
      v377 = 0u;
      v43 = v33;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v374, v382, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v375;
        do
        {
          for (ii = 0; ii != v45; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v375 != v46)
              objc_enumerationMutation(v43);
            v48 = *(_QWORD *)(*((_QWORD *)&v374 + 1) + 8 * (_QWORD)ii);
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v48));
            v50 = sub_100018E1C((uint64_t)v49);
            v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v51, v48);

          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v374, v382, 16);
        }
        while (v45);
      }
      v226 = v42;

      v5 = v249;
    }
    if ((a4 & 1) != 0)
    {
      v227 = 0;
    }
    else
    {
      v251 = v226;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v53 = sub_100014AF4(v5);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v266 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v54, "count"));
      v349 = 0u;
      v350 = 0u;
      v351 = 0u;
      v352 = 0u;
      v243 = v54;
      v55 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v349, &v383, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v350;
        do
        {
          for (jj = 0; jj != v56; jj = (char *)jj + 1)
          {
            if (*(_QWORD *)v350 != v57)
              objc_enumerationMutation(v243);
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v349 + 1) + 8 * (_QWORD)jj), "pid")));
            objc_msgSend(v266, "addObject:", v59);

          }
          v56 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v349, &v383, 16);
        }
        while (v56);
      }
      v237 = v8;

      v348 = 0u;
      v347 = 0u;
      v346 = 0u;
      v345 = 0u;
      v259 = *(id *)(v5 + 8);
      v60 = objc_msgSend(v259, "countByEnumeratingWithState:objects:count:", &v345, v382, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v346;
        do
        {
          for (kk = 0; kk != v61; kk = (char *)kk + 1)
          {
            if (*(_QWORD *)v346 != v62)
              objc_enumerationMutation(v259);
            v64 = *(void **)(*((_QWORD *)&v345 + 1) + 8 * (_QWORD)kk);
            v65 = objc_msgSend(v64, "hiddenFromDisplay");
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "sharedCache"));
            if (v66)
            {
              v67 = v251;
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "objectForKeyedSubscript:", v66));
            }
            else
            {
              v68 = 0;
              v67 = v251;
            }
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "memoryRegions"));
            v338[0] = _NSConcreteStackBlock;
            v338[1] = 3221225472;
            v338[2] = sub_100014D54;
            v338[3] = &unk_100029C68;
            v344 = v65;
            v339 = v266;
            v340 = v67;
            v341 = v68;
            v342 = v52;
            v343 = v64;
            v70 = v68;
            objc_msgSend(v69, "fp_enumerateObjectsWithBatchSize:usingBlock:", 256, v338);

          }
          v61 = objc_msgSend(v259, "countByEnumeratingWithState:objects:count:", &v345, v382, 16);
        }
        while (v61);
      }

      v71 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 3 * (_QWORD)objc_msgSend(v266, "count"));
      v334 = 0u;
      v335 = 0u;
      v336 = 0u;
      v337 = 0u;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "allKeys"));
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v334, &v378, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v335;
        do
        {
          for (mm = 0; mm != v74; mm = (char *)mm + 1)
          {
            if (*(_QWORD *)v335 != v75)
              objc_enumerationMutation(v72);
            v77 = *(_QWORD *)(*((_QWORD *)&v334 + 1) + 8 * (_QWORD)mm);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v77));
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "member:", v78));
            if (!v79)
            {
              v80 = sub_100018E1C((uint64_t)v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue(v80);
              objc_msgSend(v71, "addObject:", v79);
            }
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v79, v77);

          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v334, &v378, 16);
        }
        while (v74);
      }

      v333 = 0u;
      v332 = 0u;
      v331 = 0u;
      v330 = 0u;
      v81 = v52;
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v330, &v374, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v331;
        do
        {
          for (nn = 0; nn != v83; nn = (char *)nn + 1)
          {
            if (*(_QWORD *)v331 != v84)
              objc_enumerationMutation(v81);
            v86 = *(void **)(*((_QWORD *)&v330 + 1) + 8 * (_QWORD)nn);
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v86));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "nonretainedObjectValue"));
            sub_100019018((uint64_t)v87, v88);

          }
          v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v330, &v374, 16);
        }
        while (v83);
      }

      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v326 = 0u;
      v327 = 0u;
      v328 = 0u;
      v329 = 0u;
      v240 = v71;
      obja = (char *)objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v326, &v370, 16);
      if (obja)
      {
        v246 = *(_QWORD *)v327;
        do
        {
          v90 = 0;
          do
          {
            if (*(_QWORD *)v327 != v246)
              objc_enumerationMutation(v240);
            v260 = v90;
            v91 = *(void **)(*((_QWORD *)&v326 + 1) + 8 * (_QWORD)v90);
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "processes"));
            v93 = objc_msgSend(v92, "count");

            v325 = 0u;
            v324 = 0u;
            v322 = 0u;
            v323 = 0u;
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "processes"));
            v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v322, &v366, 16);
            if (v95)
            {
              v96 = v95;
              v97 = *(_QWORD *)v323;
              do
              {
                for (i1 = 0; i1 != v96; i1 = (char *)i1 + 1)
                {
                  if (*(_QWORD *)v323 != v97)
                    objc_enumerationMutation(v94);
                  v99 = *(void **)(*((_QWORD *)&v322 + 1) + 8 * (_QWORD)i1);
                  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "asNumber"));
                  v101 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", v100));

                  if (!v101)
                  {
                    v101 = objc_alloc_init((Class)NSMutableArray);
                    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "asNumber"));
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v101, v102);

                  }
                  if (v93 == (id)1)
                    objc_msgSend(v101, "insertObject:atIndex:", v91, 0);
                  else
                    objc_msgSend(v101, "addObject:", v91);

                }
                v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v322, &v366, 16);
              }
              while (v96);
            }

            v90 = v260 + 1;
          }
          while (v260 + 1 != obja);
          obja = (char *)objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v326, &v370, 16);
        }
        while (obja);
      }

      v227 = v89;
      v5 = v249;
      v103 = *(const void **)(v249 + 56);
      if (v103)
      {
        CFRelease(v103);
        *(_QWORD *)(v249 + 56) = 0;
      }
      v104 = *(void **)(v249 + 64);
      *(_QWORD *)(v249 + 64) = 0;

      v105 = *(const void **)(v249 + 72);
      v8 = v237;
      if (v105)
      {
        CFRelease(v105);
        *(_QWORD *)(v249 + 72) = 0;
      }
      v106 = *(const void **)(v249 + 80);
      if (v106)
      {
        CFRelease(v106);
        *(_QWORD *)(v249 + 80) = 0;
      }
    }
    context = objc_autoreleasePoolPush();
    v314 = 0u;
    v315 = 0u;
    v316 = 0u;
    v317 = 0u;
    v107 = *(id *)(v5 + 88);
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v314, v364, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v315;
      do
      {
        for (i2 = 0; i2 != v109; i2 = (char *)i2 + 1)
        {
          if (*(_QWORD *)v315 != v110)
            objc_enumerationMutation(v107);
          v112 = *(void **)(*((_QWORD *)&v314 + 1) + 8 * (_QWORD)i2);
          v113 = objc_autoreleasePoolPush();
          if ((objc_opt_respondsToSelector(v112, "printHeader") & 1) != 0)
            objc_msgSend(v112, "printHeader");
          objc_autoreleasePoolPop(v113);
        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v314, v364, 16);
      }
      while (v109);
    }

    v312 = 0u;
    v313 = 0u;
    v310 = 0u;
    v311 = 0u;
    v228 = v8;
    v232 = (char *)objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v310, v363, 16);
    if (v232)
    {
      v230 = *(_QWORD *)v311;
      v233 = &__NSDictionary0__struct;
      do
      {
        v114 = 0;
        do
        {
          if (*(_QWORD *)v311 != v230)
            objc_enumerationMutation(v228);
          v115 = *(void **)(*((_QWORD *)&v310 + 1) + 8 * (_QWORD)v114);
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "errors"));
          v267 = objc_msgSend(v116, "count");

          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "warnings"));
          v118 = objc_msgSend(v117, "count");

          if (v118)
            -[NSMutableArray addObject:](v234, "addObject:", v115);
          v241 = v114;
          if (v267)
          {
            -[NSMutableArray addObject:](v235, "addObject:", v115);
          }
          else
          {
            v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "auxData"));
            v120 = v119;
            if (v119)
            {
              v121 = objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "fp_mergeWithData:", v233));

              v233 = (void *)v121;
            }

          }
          v122 = *(void **)(v5 + 16);
          v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v115, "pid")));
          v124 = objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectForKeyedSubscript:", v123));

          v308 = 0u;
          v309 = 0u;
          v306 = 0u;
          v307 = 0u;
          v125 = *(id *)(v5 + 88);
          v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v306, v362, 16);
          if (v126)
          {
            v127 = v126;
            v128 = *(_QWORD *)v307;
            do
            {
              for (i3 = 0; i3 != v127; i3 = (char *)i3 + 1)
              {
                if (*(_QWORD *)v307 != v128)
                  objc_enumerationMutation(v125);
                v130 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * (_QWORD)i3);
                v131 = objc_autoreleasePoolPush();
                objc_msgSend(v130, "printProcessHeader:", v115);
                if (!v267)
                  objc_msgSend(v130, "printProcessTotal:forProcess:", v124, v115);
                objc_msgSend(v130, "endProcessHeader:", v115);
                objc_autoreleasePoolPop(v131);
              }
              v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v306, v362, 16);
            }
            while (v127);
          }
          v238 = (void *)v124;

          if ((a4 & 1) == 0)
          {
            v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "asNumber"));
            v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "objectForKeyedSubscript:", v132));

            if (v133)
            {
              v300 = 0uLL;
              v301 = 0uLL;
              v298 = 0uLL;
              v299 = 0uLL;
              v229 = v133;
              v244 = v133;
              v252 = (char *)objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v298, v360, 16);
              if (v252)
              {
                v247 = *(_QWORD *)v299;
                do
                {
                  v134 = 0;
                  do
                  {
                    if (*(_QWORD *)v299 != v247)
                      objc_enumerationMutation(v244);
                    v261 = v134;
                    v135 = *(_QWORD **)(*((_QWORD *)&v298 + 1) + 8 * (_QWORD)v134);
                    v136 = sub_100019120((uint64_t)v135);
                    v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
                    v384 = 0u;
                    v385 = 0u;
                    v383 = 0u;
                    v382[0] = 0;
                    if (!v137)
                    {
                      if (v135)
                        v138 = (void *)v135[4];
                      else
                        v138 = 0;
                      v139 = v138;
                      v140 = objc_autoreleasePoolPush();
                      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectEnumerator"));
                      v142 = sub_100014B48(v141, v115, v382, a3);
                      v137 = (void *)objc_claimAutoreleasedReturnValue(v142);

                      objc_autoreleasePoolPop(v140);
                      if (!v382[0])
                      {
                        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "processes"));
                        v144 = objc_msgSend(v143, "count");

                        if ((unint64_t)v144 >= 0x1A)
                        {
                          v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "processes"));
                          sub_1000190A8((uint64_t)v135, v137, objc_msgSend(v145, "count") - 1);

                        }
                      }

                    }
                    if (!v267)
                      sub_100012E34((uint64_t)FPFootprint, v137, (uint64_t)&v383);
                    objb = objc_autoreleasePoolPush();
                    v294 = 0u;
                    v295 = 0u;
                    v296 = 0u;
                    v297 = 0u;
                    v146 = *(id *)(v249 + 88);
                    v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v294, v359, 16);
                    if (v147)
                    {
                      v148 = v147;
                      v149 = *(_QWORD *)v295;
                      do
                      {
                        for (i4 = 0; i4 != v148; i4 = (char *)i4 + 1)
                        {
                          if (*(_QWORD *)v295 != v149)
                            objc_enumerationMutation(v146);
                          v151 = *(void **)(*((_QWORD *)&v294 + 1) + 8 * (_QWORD)i4);
                          v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "processes"));
                          v153 = objc_msgSend(v152, "count");

                          if (v153 == (id)1)
                            objc_msgSend(v151, "printProcessCategories:total:forProcess:", v137, &v383, v115);
                          else
                            objc_msgSend(v151, "printSharedCategories:sharedWith:forProcess:hasProcessView:total:", v137, v135, v115, v382[0] == 2, &v383);
                        }
                        v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v294, v359, 16);
                      }
                      while (v148);
                    }

                    objc_autoreleasePoolPop(objb);
                    v134 = v261 + 1;
                  }
                  while (v261 + 1 != v252);
                  v154 = (char *)objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v298, v360, 16);
                  v252 = v154;
                }
                while (v154);
              }

              v5 = v249;
              v133 = v229;
            }
            else
            {
              v384 = 0uLL;
              v385 = 0uLL;
              v383 = 0uLL;
              v302 = 0uLL;
              v303 = 0uLL;
              v304 = 0uLL;
              v305 = 0uLL;
              v155 = *(id *)(v5 + 88);
              v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v302, v361, 16);
              if (v156)
              {
                v157 = v156;
                v158 = *(_QWORD *)v303;
                do
                {
                  for (i5 = 0; i5 != v157; i5 = (char *)i5 + 1)
                  {
                    if (*(_QWORD *)v303 != v158)
                      objc_enumerationMutation(v155);
                    objc_msgSend(*(id *)(*((_QWORD *)&v302 + 1) + 8 * (_QWORD)i5), "printProcessCategories:total:forProcess:", &__NSDictionary0__struct, &v383, v115);
                  }
                  v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v302, v361, 16);
                }
                while (v157);
              }

            }
          }
          v160 = objc_autoreleasePoolPush();
          v290 = 0u;
          v291 = 0u;
          v292 = 0u;
          v293 = 0u;
          v161 = *(id *)(v5 + 88);
          v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v290, v358, 16);
          if (v162)
          {
            v163 = v162;
            v164 = *(_QWORD *)v291;
            do
            {
              for (i6 = 0; i6 != v163; i6 = (char *)i6 + 1)
              {
                if (*(_QWORD *)v291 != v164)
                  objc_enumerationMutation(v161);
                v166 = *(void **)(*((_QWORD *)&v290 + 1) + 8 * (_QWORD)i6);
                v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "auxData"));
                objc_msgSend(v166, "printProcessAuxData:forProcess:", v167, v115);

              }
              v163 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v290, v358, 16);
            }
            while (v163);
          }

          objc_autoreleasePoolPop(v160);
          v114 = v241 + 1;
        }
        while (v241 + 1 != v232);
        v232 = (char *)objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v310, v363, 16);
      }
      while (v232);
    }
    else
    {
      v233 = &__NSDictionary0__struct;
    }

    objc_autoreleasePoolPop(context);
    v262 = objc_autoreleasePoolPush();
    v286 = 0u;
    v287 = 0u;
    v288 = 0u;
    v289 = 0u;
    objc = v226;
    v168 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v286, v357, 16);
    if (v168)
    {
      v169 = v168;
      v268 = *(_QWORD *)v287;
      do
      {
        v170 = 0;
        do
        {
          if (*(_QWORD *)v287 != v268)
            objc_enumerationMutation(objc);
          v171 = *(_QWORD *)(*((_QWORD *)&v286 + 1) + 8 * (_QWORD)v170);
          v172 = objc_claimAutoreleasedReturnValue(objc_msgSend(objc, "objectForKeyedSubscript:", v171));
          v173 = (void *)v172;
          if (v172)
            v174 = *(void **)(v172 + 32);
          else
            v174 = 0;
          v175 = v174;
          v176 = objc_autoreleasePoolPush();
          v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "objectEnumerator"));
          v178 = sub_100014B48(v177, 0, 0, a3);
          v179 = (void *)objc_claimAutoreleasedReturnValue(v178);

          objc_autoreleasePoolPop(v176);
          v384 = 0u;
          v385 = 0u;
          v383 = 0u;
          sub_100012E34((uint64_t)FPFootprint, v179, (uint64_t)&v383);
          v284 = 0u;
          v285 = 0u;
          v282 = 0u;
          v283 = 0u;
          v180 = *(id *)(v249 + 88);
          v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v282, v356, 16);
          if (v181)
          {
            v182 = v181;
            v183 = *(_QWORD *)v283;
            do
            {
              for (i7 = 0; i7 != v182; i7 = (char *)i7 + 1)
              {
                if (*(_QWORD *)v283 != v183)
                  objc_enumerationMutation(v180);
                objc_msgSend(*(id *)(*((_QWORD *)&v282 + 1) + 8 * (_QWORD)i7), "printSharedCache:categories:sharedWith:total:", v171, v179, v173, &v383);
              }
              v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v282, v356, 16);
            }
            while (v182);
          }

          v170 = (char *)v170 + 1;
        }
        while (v170 != v169);
        v185 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v286, v357, 16);
        v169 = v185;
      }
      while (v185);
    }

    objc_autoreleasePoolPop(v262);
    v186 = objc_alloc_init((Class)NSMutableArray);
    v278 = 0u;
    v279 = 0u;
    v280 = 0u;
    v281 = 0u;
    v187 = v228;
    v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v278, v355, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v279;
      do
      {
        for (i8 = 0; i8 != v189; i8 = (char *)i8 + 1)
        {
          if (*(_QWORD *)v279 != v190)
            objc_enumerationMutation(v187);
          v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * (_QWORD)i8), "globalErrors"));
          objc_msgSend(v186, "addObjectsFromArray:", v192);

        }
        v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v278, v355, 16);
      }
      while (v189);
    }
    v242 = v187;

    v193 = objc_autoreleasePoolPush();
    v274 = 0u;
    v275 = 0u;
    v276 = 0u;
    v277 = 0u;
    v194 = *(id *)(v249 + 88);
    v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v274, v354, 16);
    if (v195)
    {
      v196 = v195;
      v197 = *(_QWORD *)v275;
      do
      {
        for (i9 = 0; i9 != v196; i9 = (char *)i9 + 1)
        {
          if (*(_QWORD *)v275 != v197)
            objc_enumerationMutation(v194);
          objc_msgSend(*(id *)(*((_QWORD *)&v274 + 1) + 8 * (_QWORD)i9), "printProcessesWithWarnings:processesWithErrors:globalErrors:", v234, v235, v186);
        }
        v196 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v274, v354, 16);
      }
      while (v196);
    }
    v239 = v186;

    objc_autoreleasePoolPop(v193);
    v372 = 0u;
    v371 = 0u;
    v370 = 0u;
    v199 = objc_alloc_init((Class)NSMutableSet);
    v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v378 = 0u;
    v379 = 0u;
    v380 = 0u;
    v381 = 0u;
    v201 = sub_100014AF4(v249);
    v245 = (id)objc_claimAutoreleasedReturnValue(v201);
    v253 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v378, &v383, 16);
    if (v253)
    {
      v248 = *(_QWORD *)v379;
      do
      {
        v202 = 0;
        do
        {
          if (*(_QWORD *)v379 != v248)
            objc_enumerationMutation(v245);
          v269 = v202;
          v203 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * v202);
          v263 = objc_autoreleasePoolPush();
          v374 = 0u;
          v375 = 0u;
          v376 = 0u;
          v377 = 0u;
          v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "memoryRegions"));
          v205 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v374, v382, 16);
          if (v205)
          {
            v206 = v205;
            v207 = *(_QWORD *)v375;
            do
            {
              for (i10 = 0; i10 != v206; i10 = (char *)i10 + 1)
              {
                if (*(_QWORD *)v375 != v207)
                  objc_enumerationMutation(v204);
                v209 = *(_QWORD **)(*((_QWORD *)&v374 + 1) + 8 * (_QWORD)i10);
                if (v209)
                  v209 = (_QWORD *)v209[8];
                v210 = v209;
                if ((objc_msgSend(v199, "containsObject:", v210) & 1) == 0)
                {
                  objc_msgSend(v199, "addObject:", v210);
                  if ((a3 & 1) != 0)
                    v211 = objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "name"));
                  else
                    v211 = objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "fullName"));
                  v212 = (void *)v211;
                  v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "objectForKeyedSubscript:", v211));
                  if (!v213)
                  {
                    v214 = sub_10001D8B0([FPMemoryCategory alloc], a3);
                    v213 = v215;
                    objc_msgSend(v200, "setObject:forKeyedSubscript:", v215, v212, v214);
                  }
                  sub_10001DAE4((uint64_t)v213, v210);

                }
              }
              v206 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v374, v382, 16);
            }
            while (v206);
          }

          objc_autoreleasePoolPop(v263);
          v202 = v269 + 1;
        }
        while ((id)(v269 + 1) != v253);
        v253 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v378, &v383, 16);
      }
      while (v253);
    }

    sub_100012E34((uint64_t)FPFootprint, v200, (uint64_t)&v370);
    if (objc_msgSend(v186, "count"))
      v216 = 1;
    else
      v216 = -[NSMutableArray count](v235, "count") != 0;
    v272 = 0u;
    v273 = 0u;
    v270 = 0u;
    v271 = 0u;
    v217 = *(id *)(v249 + 88);
    v218 = objc_msgSend(v217, "countByEnumeratingWithState:objects:count:", &v270, v353, 16);
    if (v218)
    {
      v219 = v218;
      v220 = *(_QWORD *)v271;
      if (a4)
        v221 = 0;
      else
        v221 = v200;
      do
      {
        for (i11 = 0; i11 != v219; i11 = (char *)i11 + 1)
        {
          if (*(_QWORD *)v271 != v220)
            objc_enumerationMutation(v217);
          v223 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * (_QWORD)i11);
          v224 = objc_autoreleasePoolPush();
          objc_msgSend(v223, "printSummaryCategories:total:hadErrors:", v221, &v370, v216);
          objc_msgSend(v223, "printGlobalAuxData:", v233);
          objc_msgSend(v223, "endAtTime:", *(_QWORD *)(v249 + 112));
          objc_autoreleasePoolPop(v224);
        }
        v219 = objc_msgSend(v217, "countByEnumeratingWithState:objects:count:", &v270, v353, 16);
      }
      while (v219);
    }

  }
}

id sub_100014AF4(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("hiddenFromDisplay == NO")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "filteredArrayUsingPredicate:", v2));

  return v3;
}

id sub_100014B48(void *a1, void *a2, unsigned __int8 *a3, char a4)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a1;
  v23 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((a4 & 1) != 0)
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        else
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fullName"));
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
        if (!v16)
        {
          v17 = sub_10001D8B0([FPMemoryCategory alloc], a4);
          v16 = v18;
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v15, v17);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewForProcess:", v23));
        sub_10001DAE4((uint64_t)v16, v19);
        if (v10 == 2 || v19 == v13)
        {
          if (!v10)
            v10 = objc_msgSend(v13, "couldHaveProcessView");
        }
        else
        {
          v10 = 2;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (a3)
    *a3 = v10;

  return v7;
}

void sub_100014D54(uint64_t a1, id *a2, uint64_t a3)
{
  uint64_t v3;
  _BYTE *v6;
  _BYTE *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  FPProcessGroupMinimal *v15;

  if (a3)
  {
    v3 = a3;
    while (1)
    {
      v6 = *a2;
      v7 = v6;
      v8 = v6 ? (void *)*((_QWORD *)v6 + 8) : 0;
      v9 = v8;
      v10 = v9;
      if (!*(_BYTE *)(a1 + 72))
        break;
      if (objc_msgSend(v9, "ownerPid") != -1)
      {
        v11 = *(void **)(a1 + 32);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "ownerPid")));
        if ((objc_msgSend(v11, "containsObject:", v12) & 1) == 0)
          goto LABEL_18;
        v13 = objc_msgSend(v10, "containsFakeRegion");

        if (v13)
          break;
      }
LABEL_19:

      ++a2;
      if (!--v3)
        return;
    }
    if (v7)
      v14 = *(_QWORD *)(a1 + 40) == 0;
    else
      v14 = 1;
    if (!v14 && (v7[8] & 2) != 0 && !sub_100006114((_BOOL8)v7))
    {
      sub_100019018(*(_QWORD *)(a1 + 48), v10);
      goto LABEL_19;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v10));
    v15 = (FPProcessGroupMinimal *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v12));
    if (!v15)
    {
      v15 = objc_alloc_init(FPProcessGroupMinimal);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v15, v12);
    }
    -[FPProcessGroupMinimal addProcess:](v15, "addProcess:", *(_QWORD *)(a1 + 64));

LABEL_18:
    goto LABEL_19;
  }
}

int64_t sub_100014ED4(id a1, FPProcess *a2, FPProcess *a3)
{
  FPProcess *v4;
  int v5;

  v4 = a3;
  LODWORD(a2) = -[FPProcess pid](a2, "pid");
  v5 = -[FPProcess pid](v4, "pid");

  if ((int)a2 > v5)
    return -1;
  else
    return 1;
}

uint64_t sub_100014F28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "pid")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "pid")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

  v13 = (uint64_t)objc_msgSend(v12, "compare:", v9);
  if (!v13)
  {
    v14 = objc_msgSend(v5, "pid");
    if (v14 > (int)objc_msgSend(v6, "pid"))
      v13 = -1;
    else
      v13 = 1;
  }

  return v13;
}

BOOL sub_1000152E8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "virtualAddress") == *(id *)(a1 + 32);
}

BOOL sub_100015318(uint64_t a1)
{
  objc_opt_self(a1);
  return objc_opt_class(IOAccelMemoryInfo) != 0;
}

void sub_100015974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000159A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000159B0(uint64_t a1)
{

}

void sub_1000159B8(uint64_t a1, void *a2)
{
  id v3;
  void *i;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *j;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processIDs"));
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v17 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v11));
              if (!v12)
              {
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v11);
              }
              objc_msgSend(v12, "addObject:", v5);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v8);
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v15);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

BOOL sub_100015C34(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

unint64_t sub_100015C40(unint64_t a1)
{
  return a1 >> 8;
}

id sub_100015C48(id a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  _BYTE *v8;
  FILE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)FPOutputFormatterJSON;
    a1 = objc_msgSendSuper2(&v17, "init");
    if (a1)
    {
      v4 = objc_alloc_init((Class)NSISO8601DateFormatter);
      v5 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v4;

      objc_msgSend(*((id *)a1 + 6), "setFormatOptions:", 3955);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
      objc_msgSend(*((id *)a1 + 6), "setTimeZone:", v6);

      v7 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      v8 = malloc_type_malloc(0x10uLL, 0x10200405F07FB98uLL);
      v9 = fopen(v7, "w+");
      *(_QWORD *)v8 = v9;
      if (v9)
      {
        v8[8] = 0;
        *((_QWORD *)a1 + 5) = v8;
        fputc(123, *(FILE **)v8);
        v10 = *((_QWORD *)a1 + 5);
        *(_BYTE *)(v10 + 8) = 0;
        fwrite("\"unit\":", 7uLL, 1uLL, *(FILE **)v10);
        v11 = *((_QWORD *)a1 + 5);
        *(_BYTE *)(v11 + 8) = 0;
        fwrite("\"byte\"", 6uLL, 1uLL, *(FILE **)v11);
        v12 = *((_QWORD *)a1 + 5);
        *(_BYTE *)(v12 + 8) = 1;
        fputc(44, *(FILE **)v12);
        fwrite("\"bytes per unit\":", 0x11uLL, 1uLL, **((FILE ***)a1 + 5));
        v13 = *((_QWORD *)a1 + 5);
        *(_BYTE *)(v13 + 8) = 0;
        fprintf(*(FILE **)v13, "%d", 1);
        *(_BYTE *)(*((_QWORD *)a1 + 5) + 8) = 1;
        if (!sub_100011E4C())
        {
          v14 = *((_QWORD *)a1 + 5);
          if (v14)
          {
            if (*(_BYTE *)(v14 + 8))
            {
              fputc(44, *(FILE **)v14);
              v14 = *((_QWORD *)a1 + 5);
            }
            fwrite("\"vm_object_dirty_analysis\":", 0x1BuLL, 1uLL, *(FILE **)v14);
            v15 = *((_QWORD *)a1 + 5);
            *(_BYTE *)(v15 + 8) = 0;
            fputs("true", *(FILE **)v15);
            *(_BYTE *)(*((_QWORD *)a1 + 5) + 8) = 1;
          }
        }
      }
      else
      {
        free(v8);
        *((_QWORD *)a1 + 5) = 0;
        perror("Unable to open JSON writer");

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_10001604C(uint64_t a1, void *a2, const char *a3)
{
  double *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FILE *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FILE *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  FILE *v21;
  void *v22;
  double *v23;
  void *v24;
  id v25;
  uint64_t v26;
  double *v27;

  v5 = a2;
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v27 = v5;
      if (*(_BYTE *)(v6 + 8))
      {
        fputc(44, *(FILE **)v6);
        v6 = *(_QWORD *)(a1 + 40);
      }
      fprintf(*(FILE **)v6, "\"%s\":", a3);
      v7 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v7 + 8) = 0;
      fputc(123, *(FILE **)v7);
      v8 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v8 + 8) = 0;
      fwrite("\"mach_absolute_time_ns\":", 0x18uLL, 1uLL, *(FILE **)v8);
      v9 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v9 + 8) = 0;
      v10 = *(FILE **)v9;
      v11 = sub_100019300((unint64_t)v27);
      fprintf(v10, "%llu", v11);
      v12 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v12 + 8) = 1;
      fputc(44, *(FILE **)v12);
      fwrite("\"mach_continuous_time_ns\":", 0x1AuLL, 1uLL, **(FILE ***)(a1 + 40));
      v13 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v13 + 8) = 0;
      v14 = *(FILE **)v13;
      v15 = sub_10001935C((unint64_t)v27);
      fprintf(v14, "%llu", v15);
      v16 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v16 + 8) = 1;
      fputc(44, *(FILE **)v16);
      fwrite("\"wall_time_s\":", 0xEuLL, 1uLL, **(FILE ***)(a1 + 40));
      v17 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v17 + 8) = 0;
      if (v27)
        v18 = v27[3];
      else
        v18 = 0.0;
      fprintf(*(FILE **)v17, "%f", v18);
      v19 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v19 + 8) = 1;
      fputc(44, *(FILE **)v19);
      fwrite("\"date\":", 7uLL, 1uLL, **(FILE ***)(a1 + 40));
      v20 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v20 + 8) = 0;
      v21 = *(FILE **)v20;
      v22 = *(void **)(a1 + 48);
      v23 = sub_1000193B8(v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringFromDate:", v24)));
      fprintf(v21, "\"%s\"", (const char *)objc_msgSend(v25, "UTF8String"));

      v26 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v26 + 8) = 1;
      fputc(125, *(FILE **)v26);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
      v5 = v27;
    }
  }

}

void sub_1000168A8(uint64_t a1, id *a2, uint64_t a3)
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  const char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  FILE **v12;
  uint64_t v13;
  uint64_t v14;
  FILE **v15;
  FILE *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  FILE **v24;
  uint64_t v25;
  uint64_t v26;
  FILE **v27;
  uint64_t v28;
  uint64_t v29;
  FILE **v30;
  id v31;
  uint64_t v32;
  id v33;
  FILE **v34;
  id v35;
  uint64_t v36;
  id v37;
  FILE **v38;
  id v39;
  uint64_t v40;
  id v41;
  FILE **v42;
  id v43;
  uint64_t v44;
  id v45;
  FILE **v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  FILE **v51;
  FILE **v52;

  if (a3)
  {
    v3 = a3;
    v6 = "\"addr\":";
    v7 = "%llu";
    v8 = "\"wired\":";
    while (1)
    {
      v9 = *a2;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      if (v10)
      {
        if (*(_BYTE *)(v10 + 8))
        {
          fputc(44, *(FILE **)v10);
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        }
        fputc(123, *(FILE **)v10);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        if (v11)
        {
          if (*(_BYTE *)(v11 + 8))
          {
            fputc(44, *(FILE **)v11);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fwrite("\"id\":", 5uLL, 1uLL, *(FILE **)v11);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v12 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
          if (v12)
          {
            v13 = v9 ? v9[12] : 0;
            fprintf(*v12, v7, v13);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
            if (v14)
            {
              if (*(_BYTE *)(v14 + 8))
              {
                fputc(44, *(FILE **)v14);
                v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
              }
              fwrite("\"name\":", 7uLL, 1uLL, *(FILE **)v14);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
              v15 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
              if (v15)
              {
                v16 = *v15;
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fullName"));
                v18 = v7;
                v19 = v8;
                v20 = v6;
                v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\""), CFSTR("\\\""))));
                fprintf(v16, "\"%s\"", (const char *)objc_msgSend(v21, "UTF8String"));

                v6 = v20;
                v8 = v19;
                v7 = v18;

                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
              }
            }
          }
        }
      }
      if (!v9)
        break;
      v22 = *(_QWORD *)(a1 + 32);
      if (v9[10] != -1)
        goto LABEL_19;
LABEL_26:
      v26 = *(_QWORD *)(v22 + 40);
      if (v26)
      {
        if (*(_BYTE *)(v26 + 8))
        {
          fputc(44, *(FILE **)v26);
          v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        }
        fwrite("\"vsize\":", 8uLL, 1uLL, *(FILE **)v26);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
        v27 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
        if (v27)
        {
          if (v9)
            v28 = v9[11];
          else
            v28 = 0;
          fprintf(*v27, v7, v28);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
        }
      }
      if (v9)
      {
        if (v9[9])
        {
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          if (v29)
          {
            if (*(_BYTE *)(v29 + 8))
            {
              fputc(44, *(FILE **)v29);
              v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
            }
            fwrite("\"offset\":", 9uLL, 1uLL, *(FILE **)v29);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
            v30 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
            if (v30)
            {
              fprintf(*v30, v7, v9[9]);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
            }
          }
        }
      }
      v31 = objc_msgSend(v9, "dirtySize");
      if (v31)
      {
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        if (v32)
        {
          v33 = v31;
          if (*(_BYTE *)(v32 + 8))
          {
            fputc(44, *(FILE **)v32);
            v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fwrite("\"dirty\":", 8uLL, 1uLL, *(FILE **)v32);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v34 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
          if (v34)
          {
            fprintf(*v34, v7, v33);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
          }
        }
      }
      v35 = objc_msgSend(v9, "swappedSize");
      if (v35)
      {
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        if (v36)
        {
          v37 = v35;
          if (*(_BYTE *)(v36 + 8))
          {
            fputc(44, *(FILE **)v36);
            v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fwrite("\"swapped\":", 0xAuLL, 1uLL, *(FILE **)v36);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v38 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
          if (v38)
          {
            fprintf(*v38, v7, v37);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
          }
        }
      }
      v39 = objc_msgSend(v9, "cleanSize");
      if (v39)
      {
        v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        if (v40)
        {
          v41 = v39;
          if (*(_BYTE *)(v40 + 8))
          {
            fputc(44, *(FILE **)v40);
            v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fwrite("\"clean\":", 8uLL, 1uLL, *(FILE **)v40);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v42 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
          if (v42)
          {
            fprintf(*v42, v7, v41);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
          }
        }
      }
      v43 = objc_msgSend(v9, "reclaimableSize");
      if (v43)
      {
        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        if (v44)
        {
          v45 = v43;
          if (*(_BYTE *)(v44 + 8))
          {
            fputc(44, *(FILE **)v44);
            v44 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fwrite("\"reclaimable\":", 0xEuLL, 1uLL, *(FILE **)v44);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v46 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
          if (v46)
          {
            fprintf(*v46, v7, v45);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
          }
        }
      }
      v47 = objc_msgSend(v9, "wiredSize");
      v48 = *(_QWORD *)(a1 + 32);
      if (v47)
      {
        v49 = *(_QWORD *)(v48 + 40);
        if (v49)
        {
          v50 = v47;
          if (*(_BYTE *)(v49 + 8))
          {
            fputc(44, *(FILE **)v49);
            v49 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fwrite(v8, 8uLL, 1uLL, *(FILE **)v49);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v48 = *(_QWORD *)(a1 + 32);
          v51 = *(FILE ***)(v48 + 40);
          if (v51)
          {
            fprintf(*v51, v7, v50);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
            v48 = *(_QWORD *)(a1 + 32);
          }
        }
      }
      v52 = *(FILE ***)(v48 + 40);
      if (v52)
      {
        fputc(125, *v52);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
      }

      ++a2;
      if (!--v3)
        return;
    }
    v22 = *(_QWORD *)(a1 + 32);
LABEL_19:
    v23 = *(_QWORD *)(v22 + 40);
    if (v23)
    {
      if (*(_BYTE *)(v23 + 8))
      {
        fputc(44, *(FILE **)v23);
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      }
      fwrite(v6, 7uLL, 1uLL, *(FILE **)v23);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
      v22 = *(_QWORD *)(a1 + 32);
      v24 = *(FILE ***)(v22 + 40);
      if (v24)
      {
        if (v9)
          v25 = v9[10];
        else
          v25 = 0;
        fprintf(*v24, v7, v25);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
        v22 = *(_QWORD *)(a1 + 32);
      }
    }
    goto LABEL_26;
  }
}

void sub_1000170A4(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  if (a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectEnumerator"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000186B0;
    v4[3] = &unk_100029DA0;
    v4[4] = a1;
    objc_msgSend(v3, "fp_enumerateObjectsWithBatchSize:usingBlock:", 16, v4);

  }
}

void sub_1000175F4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  FILE **v15;
  FILE **v16;
  FILE **v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_27;
  if (!v3)
  {
    v16 = *(FILE ***)(a1 + 40);
    if (!v16)
      goto LABEL_27;
    fputs("null", *v16);
LABEL_26:
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
    goto LABEL_27;
  }
  if (!objc_msgSend(v3, "fp_isContainer"))
  {
    v17 = *(FILE ***)(a1 + 40);
    if (!v17)
      goto LABEL_27;
    fprintf(*v17, "%lld", objc_msgSend(v4, "value"));
    goto LABEL_26;
  }
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (*(_BYTE *)(v6 + 8))
    {
      fputc(44, *(FILE **)v6);
      v6 = *(_QWORD *)(a1 + 40);
    }
    fputc(123, *(FILE **)v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 0;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = *(_QWORD *)(a1 + 40);
        if (v13)
        {
          if (*(_BYTE *)(v13 + 8))
          {
            fputc(44, *(FILE **)v13);
            v13 = *(_QWORD *)(a1 + 40);
          }
          fprintf(*(FILE **)v13, "\"%s\":", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
          *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 0;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12));
        sub_1000175F4(a1, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = *(FILE ***)(a1 + 40);
  if (v15)
  {
    fputc(125, *v15);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
  }

LABEL_27:
}

void sub_1000186B0(uint64_t a1, id *a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  FILE *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  FILE **v14;
  uint64_t v15;
  FILE **v16;
  uint64_t v17;
  FILE **v18;
  uint64_t v19;
  FILE **v20;
  uint64_t v21;
  FILE **v22;
  uint64_t v23;
  FILE **v24;
  FILE **v25;

  if (a3)
  {
    v3 = a3;
    do
    {
      v6 = *a2;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      if (v7)
      {
        if (*(_BYTE *)(v7 + 8))
        {
          fputc(44, *(FILE **)v7);
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        }
        v8 = *(FILE **)v7;
        v9 = sub_10001D980((uint64_t)v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\""), CFSTR("\\\""))));
        fprintf(v8, "\"%s\":", (const char *)objc_msgSend(v11, "UTF8String"));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        if (v12)
        {
          if (*(_BYTE *)(v12 + 8))
          {
            fputc(44, *(FILE **)v12);
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          }
          fputc(123, *(FILE **)v12);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          if (v13)
          {
            if (*(_BYTE *)(v13 + 8))
            {
              fputc(44, *(FILE **)v13);
              v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
            }
            fwrite("\"dirty\":", 8uLL, 1uLL, *(FILE **)v13);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
            v14 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
            if (v14)
            {
              fprintf(*v14, "%llu", (char *)objc_msgSend(v6, "totalDirtySize") + (_QWORD)objc_msgSend(v6, "totalSwappedSize"));
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
              v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
              if (v15)
              {
                if (*(_BYTE *)(v15 + 8))
                {
                  fputc(44, *(FILE **)v15);
                  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                }
                fwrite("\"swapped\":", 0xAuLL, 1uLL, *(FILE **)v15);
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
                v16 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
                if (v16)
                {
                  fprintf(*v16, "%llu", objc_msgSend(v6, "totalSwappedSize"));
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
                  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                  if (v17)
                  {
                    if (*(_BYTE *)(v17 + 8))
                    {
                      fputc(44, *(FILE **)v17);
                      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                    }
                    fwrite("\"clean\":", 8uLL, 1uLL, *(FILE **)v17);
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
                    v18 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
                    if (v18)
                    {
                      fprintf(*v18, "%llu", objc_msgSend(v6, "totalCleanSize"));
                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
                      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                      if (v19)
                      {
                        if (*(_BYTE *)(v19 + 8))
                        {
                          fputc(44, *(FILE **)v19);
                          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                        }
                        fwrite("\"reclaimable\":", 0xEuLL, 1uLL, *(FILE **)v19);
                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
                        v20 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
                        if (v20)
                        {
                          fprintf(*v20, "%llu", objc_msgSend(v6, "totalReclaimableSize"));
                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
                          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                          if (v21)
                          {
                            if (*(_BYTE *)(v21 + 8))
                            {
                              fputc(44, *(FILE **)v21);
                              v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                            }
                            fwrite("\"wired\":", 8uLL, 1uLL, *(FILE **)v21);
                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
                            v22 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
                            if (v22)
                            {
                              fprintf(*v22, "%llu", objc_msgSend(v6, "totalWiredSize"));
                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
                              v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                              if (v23)
                              {
                                if (*(_BYTE *)(v23 + 8))
                                {
                                  fputc(44, *(FILE **)v23);
                                  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
                                }
                                fwrite("\"regions\":", 0xAuLL, 1uLL, *(FILE **)v23);
                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 0;
                                v24 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
                                if (v24)
                                {
                                  fprintf(*v24, "%u", objc_msgSend(v6, "totalRegions"));
                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
                                  v25 = *(FILE ***)(*(_QWORD *)(a1 + 32) + 40);
                                  if (v25)
                                  {
                                    fputc(125, *v25);
                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8) = 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      ++a2;
      --v3;
    }
    while (v3);
  }
}

void sub_100018BA0(void *a1, unint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD, unint64_t);
  void *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v5 = a1;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  if (a2 <= 1)
    a2 = 1;
  v7 = malloc_type_malloc(8 * a2, 0x80040B8603338uLL);
  v8 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v7, a2);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = (uint64_t *)v17;
      if ((v11 & 1) == 0 && v10 != *(_QWORD *)v17)
      {
        objc_enumerationMutation(v5);
        v12 = (uint64_t *)v17;
      }
      v10 = *v12;
      v13 = *((_QWORD *)&v16 + 1);
      do
      {
        if (a2 >= (unint64_t)v9)
          v14 = (unint64_t)v9;
        else
          v14 = a2;
        v15 = objc_autoreleasePoolPush();
        v6[2](v6, v13, v14);
        objc_autoreleasePoolPop(v15);
        v13 += 8 * v14;
        v9 -= v14;
      }
      while (v9);
      v9 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v7, a2);
      v11 = 0;
    }
    while (v9);
  }
  free(v7);

}

_QWORD *sub_100018CF0(void *a1, uint64_t a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)FPProcessGroupMinimal;
  v3 = objc_msgSendSuper2(&v7, "init");
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableSet);
    v5 = (void *)v3[1];
    v3[1] = v4;

    v3[2] = a2;
  }
  return v3;
}

FPProcessGroup *sub_100018E1C(uint64_t a1)
{
  FPProcessGroup *v2;

  if (a1)
  {
    v2 = objc_alloc_init(FPProcessGroup);
    v2->super._hashValue = *(_QWORD *)(a1 + 16);
    objc_storeStrong((id *)&v2->super._processes, *(id *)(a1 + 8));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_100019018(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init((Class)NSMutableSet);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

void sub_1000190A8(uint64_t a1, void *a2, int a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a2;
  if (!a1)
    goto LABEL_4;
  if (a3)
  {
    *(_DWORD *)(a1 + 24) = a3;
    v10 = v6;
    objc_storeStrong((id *)(a1 + 40), a2);
    v6 = v10;
LABEL_4:

    return;
  }
  v9 = _os_assert_log(0, v7, v8);
  _os_crash(v9);
  __break(1u);
}

id sub_100019120(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = *(id *)(a1 + 40);
    if (v2)
    {
      if (!--*(_DWORD *)(a1 + 24))
      {
        v3 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = 0;

      }
      v4 = v2;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

FPTime *sub_1000192E0(uint64_t a1)
{
  objc_opt_self(a1);
  return objc_alloc_init(FPTime);
}

unint64_t sub_100019300(unint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 8);
    if (qword_100038A00 != -1)
      dispatch_once(&qword_100038A00, &stru_100029DC0);
    return v1 * (unint64_t)dword_1000389F8 / *(unsigned int *)algn_1000389FC;
  }
  return result;
}

unint64_t sub_10001935C(unint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 16);
    if (qword_100038A00 != -1)
      dispatch_once(&qword_100038A00, &stru_100029DC0);
    return v1 * (unint64_t)dword_1000389F8 / *(unsigned int *)algn_1000389FC;
  }
  return result;
}

double *sub_1000193B8(double *a1)
{
  if (a1)
    a1 = (double *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a1[3]));
  return a1;
}

void sub_1000193E4(id a1)
{
  mach_timebase_info((mach_timebase_info_t)&dword_1000389F8);
}

_QWORD *sub_1000193F0(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FPOutputFormatterPerfdata;
    a1 = objc_msgSendSuper2(&v7, "init");
    if (a1)
    {
      if (sub_100011E4C())
        v4 = "footprint.phys_footprint";
      else
        v4 = "footprint.vm_object_dirty";
      v5 = pdwriter_open(objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), v4, 1, 0);
      a1[1] = v5;
      if (v5)
      {
        pdwriter_set_description(v5, "Memory measurements gathered by the footprint(1) tool");
        pdwriter_set_primary_metric(a1[1], "total_memory,procname=ALL_PROCESSES");
      }
      else
      {
        perror("Unable to open pdwriter");

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_1000196B4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  FPAuxDataInfo *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  FPAuxDataInfo *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectEnumerator"));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v4)
    {
      v5 = v4;
      v21 = *(_QWORD *)v23;
      v20 = v3;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v21)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v8 = sub_10001D980((uint64_t)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v7, "totalSwappedSize")+ (_QWORD)objc_msgSend(v7, "totalDirtySize")+ (unint64_t)objc_msgSend(v10, "unsignedLongLongValue")));
          objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v11, v9);

          if (!v10)
          {
            v12 = sub_10001D9B4((id *)v7);
            v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            if (v13)
            {
              v14 = [FPAuxDataInfo alloc];
              v15 = sub_10001DA3C((uint64_t)v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
              v17 = v13;
              v18 = v16;
              if (v14)
              {
                v26.receiver = v14;
                v26.super_class = (Class)FPAuxDataInfo;
                v19 = (FPAuxDataInfo *)objc_msgSendSuper2(&v26, "init");
                v14 = v19;
                if (v19)
                {
                  objc_storeStrong((id *)&v19->_dictionary, v13);
                  objc_storeStrong((id *)&v14->_fullName, v16);
                }
              }

              objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v14, v9);
              v3 = v20;
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v5);
    }

  }
}

void sub_100019B50(uint64_t a1, void *a2, const char *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  const char *v15;
  char *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char __str[1024];
  _BYTE v26[128];

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (objc_msgSend(v5, "fp_isContainer"))
    {
      v9 = v6;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
            v15 = (const char *)objc_msgSend(v14, "UTF8String");
            v16 = (char *)v15;
            if (a3)
            {
              v16 = __str;
              snprintf(__str, 0x400uLL, "%s.%s", a3, v15);
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
            sub_100019B50(a1, v17, v16);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v11);
      }
    }
    else
    {
      if (!a3)
      {
        v20 = _os_assert_log(0, v7, v8);
        _os_crash(v20);
        __break(1u);
      }
      v9 = v6;
      v18 = objc_msgSend(v9, "supportsFormattedValue");
      v19 = *(_QWORD *)(a1 + 8);
      if (v18)
        pdwriter_record_variable_str(v19, a3, objc_msgSend(v9, "formattedValue"));
      else
        pdwriter_record_variable_dbl(v19, a3, (double)(uint64_t)objc_msgSend(v9, "value"));
    }

  }
}

void sub_100019D20(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char __str[1024];
  _BYTE v21[128];

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    if (objc_msgSend(v7, "fp_isContainer"))
    {
      v9 = v8;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13));
            snprintf(__str, 0x400uLL, "%s.%s", a3, (const char *)objc_msgSend(v14, "UTF8String"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
            sub_100019D20(a1, v15, __str, a4);

            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v11);
      }

    }
    else
    {
      pdwriter_new_value(*(_QWORD *)(a1 + 8), a3, pdunit_B, (double)(uint64_t)objc_msgSend(v8, "value"));
      pdwriter_record_variable_str(*(_QWORD *)(a1 + 8), "process", a4);
      pdwriter_record_variable_str(*(_QWORD *)(a1 + 8), "procname", a4);
      pdwriter_record_tag(*(_QWORD *)(a1 + 8), pdtag_context);
    }
  }

}

id sub_10001A2B8()
{
  _QWORD v1[7];

  v1[0] = CFSTR("Dirty");
  v1[1] = CFSTR("Swapped");
  v1[2] = CFSTR("Clean");
  v1[3] = CFSTR("Reclaimable");
  v1[4] = CFSTR("Wired");
  v1[5] = CFSTR("Regions");
  v1[6] = CFSTR("Category");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1, 7));
}

id *sub_10001A35C(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v30;

  v10 = a4;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)FPOutputFormatterText;
    v11 = (id *)objc_msgSendSuper2(&v30, "init");
    a1 = v11;
    if (v11)
    {
      v11[17] = __stdoutp;
      v11[14] = a2;
      v11[15] = a3;
      objc_storeStrong(v11 + 16, a4);
      a1[8] = a5;
      if ((a3 & 2) != 0)
      {
        v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("(%@)"), CFSTR("Swapped"));
        v12 = a1[3];
        a1[3] = v13;
      }
      else
      {
        v12 = a1[3];
        a1[3] = 0;
      }

      if ((a3 & 1) != 0)
      {
        v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("(%@)"), CFSTR("Wired"));
        v14 = a1[4];
        a1[4] = v15;
      }
      else
      {
        v14 = a1[4];
        a1[4] = 0;
      }

      v16 = objc_alloc_init((Class)NSISO8601DateFormatter);
      v17 = a1[6];
      a1[6] = v16;

      objc_msgSend(a1[6], "setFormatOptions:", 4083);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
      objc_msgSend(a1[6], "setTimeZone:", v18);

      if (a5 == (void *)1)
      {
        v19 = objc_alloc_init((Class)NSMutableDictionary);
        v20 = a1[9];
        a1[9] = v19;

        v21 = objc_alloc_init((Class)NSMutableArray);
        v22 = a1[10];
        a1[10] = v21;

        v23 = objc_alloc_init((Class)NSMutableDictionary);
        v24 = a1[11];
        a1[11] = v23;

        v25 = objc_alloc_init((Class)NSMutableString);
        v26 = a1[12];
        a1[12] = v25;

        v27 = objc_alloc_init((Class)NSMutableString);
        v28 = a1[13];
        a1[13] = v27;

      }
    }
  }

  return a1;
}

void sub_10001A5D8(uint64_t a1, void *a2, int a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  id v18;
  int v19;
  char v20[208];
  _QWORD v21[2];
  va_list v22;

  v12 = a2;
  if (!a1)
    goto LABEL_15;
  v22 = &a9;
  if (!*(_QWORD *)(a1 + 64))
  {
    v21[1] = &a9;
    vfprintf(*(FILE **)(a1 + 136), a4, &a9);
    goto LABEL_15;
  }
  v13 = v20;
  v14 = vsnprintf(v20, 0xC8uLL, a4, v22);
  if ((v14 & 0x80000000) != 0)
    goto LABEL_10;
  if (v14 >= 0xC9)
  {
    v15 = 200;
    while (1)
    {
      v16 = v15 + 200;
      v13 = (char *)v21 - ((v15 + 215) & 0xFFFFFFFFFFFFFFF0);
      v17 = vsnprintf(v13, v15 + 200, a4, v22);
      if ((v17 & 0x80000000) != 0)
        break;
      v15 = v16;
      if (v16 >= v17)
        goto LABEL_8;
    }
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
LABEL_8:
  v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v13, 4);
LABEL_11:
  if (v12)
    v19 = a3;
  else
    v19 = 2;
  sub_10001D424((_QWORD *)a1, v12, v19, v18);

LABEL_15:
}

void sub_10001A8A4(uint64_t a1, id *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  FILE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  FILE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  FILE *v24;
  id v25;
  const char *v26;
  unsigned int v27;
  unsigned int v28;
  id *v29;
  uint64_t v30;

  if (a3)
  {
    v3 = a3;
    do
    {
      v6 = *a2;
      v7 = v6;
      if (v6)
      {
        v8 = v6[10];
        v9 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
        if (v8 == -1)
        {
          fprintf(v9, "        unmapped -         unmapped [%010llx]", v7[12] & 0xFFFFFFFFFFLL);
          v12 = objc_msgSend(v7, "swappedSize");
          v13 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
          goto LABEL_9;
        }
        v10 = v7[12];
        v11 = v7[11] + v8;
      }
      else
      {
        v11 = 0;
        v8 = 0;
        v10 = 0;
        v9 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
      }
      fprintf(v9, "%16llx - %16llx [%010llx]", v8, v11, v10 & 0xFFFFFFFFFFLL);
      v12 = objc_msgSend(v7, "swappedSize");
      v13 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
      if (!v7)
      {
        v14 = 0;
        goto LABEL_10;
      }
LABEL_9:
      v14 = v7[11];
LABEL_10:
      fprintf(v13, " %7llu %7llu", (unint64_t)(v14 + *(_QWORD *)(a1 + 40) - 1) / *(_QWORD *)(a1 + 40), ((unint64_t)v12 + (_QWORD)objc_msgSend(v7, "dirtySize") + *(_QWORD *)(a1 + 40) - 1)/ *(_QWORD *)(a1 + 40));
      v15 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v15 + 120) & 2) != 0)
      {
        fprintf(*(FILE **)(v15 + 136), " %7llu", ((unint64_t)v12 + *(_QWORD *)(a1 + 40) - 1) / *(_QWORD *)(a1 + 40));
        v15 = *(_QWORD *)(a1 + 32);
      }
      fprintf(*(FILE **)(v15 + 136), " %7llu %7llu", ((unint64_t)objc_msgSend(v7, "cleanSize") + *(_QWORD *)(a1 + 40) - 1) / *(_QWORD *)(a1 + 40), ((unint64_t)objc_msgSend(v7, "reclaimableSize") + *(_QWORD *)(a1 + 40) - 1) / *(_QWORD *)(a1 + 40));
      v16 = *(_QWORD *)(a1 + 32);
      v29 = a2;
      v30 = v3;
      if ((*(_BYTE *)(v16 + 120) & 1) != 0)
      {
        fprintf(*(FILE **)(v16 + 136), " %7llu", ((unint64_t)objc_msgSend(v7, "wiredSize") + *(_QWORD *)(a1 + 40) - 1) / *(_QWORD *)(a1 + 40));
        v16 = *(_QWORD *)(a1 + 32);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailedName"));
      v18 = sub_10001ABA0(v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      v20 = objc_retainAutorelease(v19);
      v21 = (const char *)objc_msgSend(v20, "UTF8String");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "extendedInfo")));
      v23 = (const char *)objc_msgSend(v22, "UTF8String");
      v24 = *(FILE **)(*(_QWORD *)(a1 + 32) + 136);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name")));
      v26 = (const char *)objc_msgSend(v25, "UTF8String");
      if (v21)
      {
        v27 = objc_msgSend(v20, "length") + 1;
        if (!v23)
          goto LABEL_18;
      }
      else
      {
        v27 = 0;
        v21 = "";
        if (!v23)
        {
LABEL_18:
          v28 = 0;
          v23 = "";
          goto LABEL_19;
        }
      }
      v28 = objc_msgSend(v22, "length") + 1;
LABEL_19:
      fprintf(v24, "   %s%*s%*s\n", v26, v27, v21, v28, v23);

      a2 = v29 + 1;
      v3 = v30 - 1;
    }
    while (v30 != 1);
  }
}

id sub_10001ABA0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_7;
  }
  if ((*(_BYTE *)(a1 + 120) & 4) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v6 = objc_msgSend(v5, "length");
    if (v6 != objc_msgSend(v4, "length"))
    {
      v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR(".../%@"), v5);

      goto LABEL_7;
    }

  }
  v7 = v4;
LABEL_7:

  return v7;
}

_QWORD *sub_10001B0B8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE v4[8];

  if (a1)
  {
    v2 = a1[14];
    switch(v2)
    {
      case 2:
        a1 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%llu pages"), (unint64_t)(a2 + a1[2] - 1) / a1[2]);
        break;
      case 1:
        humanize_number(v4, 8, a2, "B", 32, 0);
        a1 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v4);
        break;
      case 0:
        a1 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%lld B"), a2);
        break;
    }
  }
  return a1;
}

void sub_10001B45C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  char **v9;
  Block_layout *v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[6];

  v15 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_19;
  v6 = v15;
  v7 = v6;
  v8 = *(__CFString **)(a1 + 128);
  if (v8 == CFSTR("Dirty"))
  {
    v10 = &stru_100029E58;
LABEL_17:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keysSortedByValueUsingComparator:", v10, v15));
    goto LABEL_18;
  }
  if (v8 == CFSTR("Category"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingSelector:", "compare:"));

LABEL_18:
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001CA6C;
    v16[3] = &unk_100029E18;
    v17 = v7;
    v18 = a1;
    v19 = v5;
    objc_msgSend(v12, "fp_enumerateObjectsWithBatchSize:usingBlock:", 32, v16);

LABEL_19:
    return;
  }
  if (v8 == CFSTR("Swapped"))
  {
    v9 = &selRef_totalSwappedSize;
    goto LABEL_16;
  }
  if (v8 == CFSTR("Clean"))
  {
    v9 = &selRef_totalCleanSize;
    goto LABEL_16;
  }
  if (v8 == CFSTR("Reclaimable"))
  {
    v9 = &selRef_totalReclaimableSize;
    goto LABEL_16;
  }
  if (v8 == CFSTR("Wired"))
  {
    v9 = &selRef_totalWiredSize;
    goto LABEL_16;
  }
  if (v8 == CFSTR("Regions"))
  {
    v9 = &selRef_totalRegions;
LABEL_16:
    v13 = *v9;
    v14 = +[FPMemoryCategory instanceMethodForSelector:](FPMemoryCategory, "instanceMethodForSelector:", *v9, v15);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001D3B8;
    v20[3] = &unk_100029E78;
    v20[4] = v14;
    v20[5] = v13;
    v10 = (Block_layout *)v20;
    goto LABEL_17;
  }
  _os_crash("Unhandled text sort column");
  __break(1u);
}

void sub_10001B668(_QWORD *a1, _QWORD *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char v31;
  void *v32;

  v5 = a3;
  if (a1)
  {
    if (a1[14] == 1)
      v10 = 7;
    else
      v10 = 11;
    v32 = v5;
    sub_10001A5D8((uint64_t)a1, v5, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v6, v7, v8, v9, v10);
    if (a1[14] == 1)
      v11 = 7;
    else
      v11 = 11;
    v31 = v11;
    v12 = sub_10001B0B8(a1, a2[1] + *a2);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v12));
    objc_msgSend(v13, "UTF8String");
    v14 = a1[15];
    if ((v14 & 2) != 0)
    {
      v15 = sub_10001B0B8(a1, a2[1]);
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v15));
      objc_msgSend(v30, "UTF8String");
    }
    v16 = sub_10001B0B8(a1, a2[2]);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v16));
    objc_msgSend(v17, "UTF8String");
    v18 = sub_10001B0B8(a1, a2[3]);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v18));
    objc_msgSend(v19, "UTF8String");
    if ((a1[15] & 1) != 0)
    {
      v24 = sub_10001B0B8(a1, a2[4]);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v24));
      objc_msgSend(v25, "UTF8String");
      sub_10001A5D8((uint64_t)a1, v32, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v26, v27, v28, v29, v31);

    }
    else
    {
      sub_10001A5D8((uint64_t)a1, v32, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v20, v21, v22, v23, v31);
    }

    if ((v14 & 2) != 0)
    v5 = v32;
  }

}

void sub_10001BEBC(uint64_t a1, char *__format, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  id v16;
  char v17[208];
  va_list v18;

  if (a1)
  {
    v18 = (va_list)&a9;
    if (!*(_QWORD *)(a1 + 64))
    {
      vfprintf(*(FILE **)(a1 + 136), __format, v18);
      return;
    }
    v11 = v17;
    v12 = vsnprintf(v17, 0xC8uLL, __format, v18);
    if ((v12 & 0x80000000) == 0)
    {
      if (v12 < 0xC9)
      {
LABEL_8:
        v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v11, 4);
LABEL_11:
        sub_10001D424((_QWORD *)a1, 0, 2, v16);

        return;
      }
      v13 = 200;
      while (1)
      {
        v14 = v13 + 200;
        v11 = (char *)&v18 - ((v13 + 215) & 0xFFFFFFFFFFFFFFF0);
        v15 = vsnprintf(v11, v13 + 200, __format, v18);
        if ((v15 & 0x80000000) != 0)
          break;
        v13 = v14;
        if (v14 >= v15)
          goto LABEL_8;
      }
    }
    v16 = 0;
    goto LABEL_11;
  }
}

void sub_10001C060(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;

  if (a1)
  {
    v5 = a3;
    v11 = a2;
    sub_10001A5D8((uint64_t)a1, v5, 1, "Auxiliary data:\n", v6, v7, v8, v9, v10);
    sub_10001C7D8(a1, v11, 1, v5);

  }
}

void sub_10001C7D8(_QWORD *a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int j;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  unsigned int v42;
  int v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  v7 = a2;
  v8 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));

  obj = v10;
  v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v45)
  {
    v11 = *(_QWORD *)v47;
    v42 = a3 + 1;
    v43 = a3;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
        for (j = a3; j; --j)
          sub_10001A5D8((uint64_t)a1, v8, 1, "    ", v14, v15, v16, v17, v41);
        if ((objc_msgSend(v18, "fp_isContainer") & 1) != 0)
        {
          v20 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
          sub_10001A5D8((uint64_t)a1, v8, 1, "%s:\n", v21, v22, v23, v24, v20);
          sub_10001C7D8(a1, v18, v42, v8);
        }
        else
        {
          v25 = v11;
          v26 = v7;
          v27 = v18;
          if (objc_msgSend(v27, "supportsFormattedValue"))
          {
            v28 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
            objc_msgSend(v27, "formattedValue");
            sub_10001A5D8((uint64_t)a1, v8, 1, "%s: %s\n", v29, v30, v31, v32, v28);
          }
          else
          {
            v33 = objc_msgSend(v27, "value");
            v34 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
            v35 = sub_10001B0B8(a1, (uint64_t)v33);
            v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v35));
            objc_msgSend(v36, "UTF8String");
            sub_10001A5D8((uint64_t)a1, v8, 1, "%s: %s\n", v37, v38, v39, v40, v34);

          }
          v7 = v26;
          v11 = v25;
          a3 = v43;
        }

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v45);
  }

}

void sub_10001CA6C(uint64_t a1, id *a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  _QWORD *v17;
  char v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  char v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;

  if (a3)
  {
    v3 = a3;
    while (1)
    {
      v6 = *a2;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6));
      v8 = (void *)v7;
      v9 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v9 + 56))
        v10 = 1;
      else
        v10 = v7 == 0;
      if (v10)
        goto LABEL_9;
      if ((objc_msgSend(*(id *)(v7 + 24), "verbose") & 1) == 0)
        break;
LABEL_25:

      ++a2;
      if (!--v3)
        return;
    }
    v9 = *(_QWORD *)(a1 + 40);
LABEL_9:
    v11 = sub_10001D950((uint64_t)v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_10001ABA0(v9, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v43 = objc_retainAutorelease(v14);
    v42 = objc_msgSend(v43, "UTF8String");
    v15 = sub_10001D908((id *)v8);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (!v16)
      v16 = v6;
    v17 = *(_QWORD **)(a1 + 40);
    if (v17[14] == 1)
      v18 = 7;
    else
      v18 = 11;
    v37 = v18;
    v38 = *(void **)(a1 + 48);
    v39 = *(_QWORD *)(a1 + 40);
    v19 = sub_10001B0B8(v17, (uint64_t)objc_msgSend(v8, "totalDirtySize") + (_QWORD)objc_msgSend(v8, "totalSwappedSize"));
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v19));
    objc_msgSend(v40, "UTF8String");
    v20 = *(_QWORD **)(a1 + 40);
    v36 = v20[15];
    v41 = v6;
    if ((v36 & 2) != 0)
    {
      v21 = sub_10001B0B8(v20, (uint64_t)objc_msgSend(v8, "totalSwappedSize"));
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v21));
      objc_msgSend(v34, "UTF8String");
      v20 = *(_QWORD **)(a1 + 40);
    }
    v22 = sub_10001B0B8(v20, (uint64_t)objc_msgSend(v8, "totalCleanSize"));
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v22));
    objc_msgSend(v35, "UTF8String");
    v23 = sub_10001B0B8(*(_QWORD **)(a1 + 40), (uint64_t)objc_msgSend(v8, "totalReclaimableSize"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v23));
    objc_msgSend(v24, "UTF8String");
    v25 = *(_QWORD **)(a1 + 40);
    v26 = v25[15];
    if ((v26 & 1) != 0)
    {
      v27 = sub_10001B0B8(v25, (uint64_t)objc_msgSend(v8, "totalWiredSize"));
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v27));
      objc_msgSend(v33, "UTF8String");
    }
    objc_msgSend(v8, "totalRegions");
    v28 = objc_retainAutorelease(v16);
    objc_msgSend(v28, "UTF8String");
    if (v42)
      objc_msgSend(v43, "length");
    sub_10001A5D8(v39, v38, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v29, v30, v31, v32, v37);
    if ((v26 & 1) != 0)

    if ((v36 & 2) != 0)
    v6 = v41;
    goto LABEL_25;
  }
}

int64_t sub_10001D288(id a1, FPMemoryCategory *a2, FPMemoryCategory *a3)
{
  FPMemoryCategory *v4;
  FPMemoryCategory *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  int64_t v14;
  id v15;
  id v17;

  v4 = a2;
  v5 = a3;
  v6 = -[FPMemoryCategory totalDirtySize](v4, "totalDirtySize");
  v7 = &v6[-[FPMemoryCategory totalSwappedSize](v4, "totalSwappedSize")];
  v8 = -[FPMemoryCategory totalDirtySize](v5, "totalDirtySize");
  if (v7 > &v8[-[FPMemoryCategory totalSwappedSize](v5, "totalSwappedSize")])
    goto LABEL_7;
  v9 = -[FPMemoryCategory totalDirtySize](v4, "totalDirtySize");
  v10 = &v9[-[FPMemoryCategory totalSwappedSize](v4, "totalSwappedSize")];
  v11 = -[FPMemoryCategory totalDirtySize](v5, "totalDirtySize");
  if (v10 >= &v11[-[FPMemoryCategory totalSwappedSize](v5, "totalSwappedSize")])
  {
    v12 = -[FPMemoryCategory totalReclaimableSize](v4, "totalReclaimableSize");
    if (v12 <= (id)-[FPMemoryCategory totalReclaimableSize](v5, "totalReclaimableSize"))
    {
      v13 = -[FPMemoryCategory totalReclaimableSize](v4, "totalReclaimableSize");
      if (v13 < (id)-[FPMemoryCategory totalReclaimableSize](v5, "totalReclaimableSize"))
        goto LABEL_5;
      v15 = -[FPMemoryCategory totalCleanSize](v4, "totalCleanSize");
      if (v15 <= (id)-[FPMemoryCategory totalCleanSize](v5, "totalCleanSize"))
      {
        v17 = -[FPMemoryCategory totalCleanSize](v4, "totalCleanSize");
        v14 = v17 < (id)-[FPMemoryCategory totalCleanSize](v5, "totalCleanSize");
        goto LABEL_8;
      }
    }
LABEL_7:
    v14 = -1;
    goto LABEL_8;
  }
LABEL_5:
  v14 = 1;
LABEL_8:

  return v14;
}

uint64_t sub_10001D3B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  unint64_t v8;
  unint64_t v9;

  v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = v6(a2, v5);
  v9 = (*(uint64_t (**)(id, _QWORD))(a1 + 32))(v7, *(_QWORD *)(a1 + 40));

  if (v8 > v9)
    return -1;
  else
    return v8 < v9;
}

void sub_10001D424(_QWORD *a1, void *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v7 = a4;
  if (v7)
  {
    switch(a3)
    {
      case 2:
        v8 = (void *)a1[13];
        goto LABEL_7;
      case 1:
        v9 = (void *)a1[11];
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v25, "pid")));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

        if (!v11)
        {
          v11 = objc_alloc_init((Class)NSMutableArray);
          v12 = (void *)a1[11];
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v25, "pid")));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
        v15 = v14;
        if (v14 && !objc_msgSend(v14, "hasSuffix:", CFSTR("\n")))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", v7));
          objc_msgSend(v11, "setObject:atIndexedSubscript:", v16, (char *)objc_msgSend(v11, "count") - 1);

        }
        else
        {
          objc_msgSend(v11, "addObject:", v7);
        }
        v17 = objc_msgSend(v7, "length");
        v18 = (void *)a1[9];
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v25, "pid")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));
        v21 = objc_msgSend(v20, "integerValue");

        if (v17 > v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
          v23 = (void *)a1[9];
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v25, "pid")));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

        }
        break;
      case 0:
        v8 = (void *)a1[12];
LABEL_7:
        objc_msgSend(v8, "appendString:", v7);
        break;
    }
  }

}

void sub_10001D6E4(id a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned int v10;
  char *v11;
  uint64_t v12;

  v1 = 0;
  v2 = 40;
  do
  {
    v3 = 2 * v2;
    v12 = 2 * v2;
    v1 = malloc_type_realloc(v1, 192 * v2, 0x1000040565EDBD2uLL);
    if ((ledger(2, v1, &v12, 0) & 0x80000000) != 0)
    {
      free(v1);
      qword_100038A30 = -1;
      perror("Unable to retrieve ledger template info");
      return;
    }
    v2 = v3;
  }
  while (v3 == v12);
  qword_100038A30 = v12;
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  xmmword_100038A10 = v6;
  unk_100038A20 = v6;
  if (v12 >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = 0;
      while (1)
      {
        v10 = v9;
        v11 = sub_10001D830(v9, v4, v5);
        if (v11)
        {
          if (!strcmp(v11, (const char *)v1 + 96 * v7))
            break;
        }
        ++v9;
        if (v10 >= 3)
          goto LABEL_12;
      }
      *((_QWORD *)&xmmword_100038A10 + v9) = v7;
      if (++v8 == 4)
        break;
LABEL_12:
      ++v7;
    }
    while (v7 < qword_100038A30);
  }
  free(v1);
}

char *sub_10001D830(unsigned int a1, uint64_t a2, uint64_t a3)
{
  char *result;
  uint64_t v4;

  if (a1 < 4)
    return off_100029EB8[a1];
  v4 = _os_assert_log(0, a2, a3);
  result = (char *)_os_crash(v4);
  __break(1u);
  return result;
}

double sub_10001D8B0(void *a1, char a2)
{
  _BYTE *v3;
  double result;
  objc_super v5;

  if (a1)
  {
    v5.receiver = a1;
    v5.super_class = (Class)FPMemoryCategory;
    v3 = objc_msgSendSuper2(&v5, "init");
    if (v3)
    {
      v3[8] = a2;
      result = 0.0;
      *((_OWORD *)v3 + 2) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_QWORD *)v3 + 8) = 0;
    }
  }
  return result;
}

id *sub_10001D908(id *a1)
{
  id *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[2];
    if (!v2)
    {
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[3], "name"));
      v4 = v1[2];
      v1[2] = (id)v3;

      v2 = v1[2];
    }
    a1 = (id *)v2;
  }
  return a1;
}

id sub_10001D950(uint64_t a1)
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
      return 0;
    a1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "detailedName"));
  }
  return (id)a1;
}

id sub_10001D980(uint64_t a1)
{
  id *v1;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      v1 = sub_10001D908((id *)a1);
      a1 = objc_claimAutoreleasedReturnValue(v1);
    }
    else
    {
      a1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "fullName"));
    }
  }
  return (id)a1;
}

id *sub_10001D9B4(id *a1)
{
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[3], "auxData"));
    v3 = v2;
    if (*((_BYTE *)v1 + 8))
    {
      v1 = v2;
    }
    else
    {
      v1 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[3], "detailedAuxData"));
      if (v3)
      {
        v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fp_mergeWithData:forceAggregate:", v1, 1));

        v1 = (id *)v4;
      }
    }

  }
  return v1;
}

id sub_10001DA3C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "auxDataName"));
    v3 = v2;
    if (*(_BYTE *)(a1 + 8))
    {
      v4 = v2;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "detailedAuxDataName"));
      if (objc_msgSend(v5, "length"))
        v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@ %@"), v3, v5);
      else
        v6 = v3;
      v4 = v6;

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void sub_10001DAE4(uint64_t a1, void *a2)
{
  id v4;
  unsigned int v5;
  void *v6;

  v4 = a2;
  if (a1)
  {
    v6 = v4;
    if (!*(_QWORD *)(a1 + 24))
    {
      objc_storeStrong((id *)(a1 + 24), a2);
      v4 = v6;
    }
    *(_QWORD *)(a1 + 32) += objc_msgSend(v4, "dirtySize");
    *(_QWORD *)(a1 + 40) += objc_msgSend(v6, "swappedSize");
    *(_QWORD *)(a1 + 48) += objc_msgSend(v6, "cleanSize");
    *(_QWORD *)(a1 + 56) += objc_msgSend(v6, "reclaimableSize");
    *(_QWORD *)(a1 + 64) += objc_msgSend(v6, "wiredSize");
    v5 = objc_msgSend(v6, "totalRegions");
    v4 = v6;
    *(_DWORD *)(a1 + 12) += v5;
  }

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__addGlobalError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addGlobalError:");
}

id objc_msgSend__addSubrangesForRegion_purgeState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addSubrangesForRegion:purgeState:");
}

id objc_msgSend__configurePageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configurePageSize");
}

id objc_msgSend__gatherIdleExitStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherIdleExitStatus");
}

id objc_msgSend__gatherImageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherImageData");
}

id objc_msgSend__gatherIsTranslated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherIsTranslated");
}

id objc_msgSend__gatherLedgers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherLedgers");
}

id objc_msgSend__gatherOwnedVmObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherOwnedVmObjects");
}

id objc_msgSend__gatherPageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherPageSize");
}

id objc_msgSend__gatherPhysFootprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherPhysFootprint");
}

id objc_msgSend__gatherSharedCacheFromDyldSnapshot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherSharedCacheFromDyldSnapshot:");
}

id objc_msgSend__isAlive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isAlive");
}

id objc_msgSend__nameForBsdInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nameForBsdInfo:");
}

id objc_msgSend__populateMemoryRegionWithPageQueries_regionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateMemoryRegionWithPageQueries:regionInfo:");
}

id objc_msgSend__populateTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateTask");
}

id objc_msgSend__setIdleExitStatusFromDirtyFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setIdleExitStatusFromDirtyFlags:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addLedgerData_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLedgerData:count:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProcess:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allProcessesExcludingPids_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allProcessesExcludingPids:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asNumber");
}

id objc_msgSend_auxData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auxData");
}

id objc_msgSend_auxDataName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auxDataName");
}

id objc_msgSend_binaryImagesDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "binaryImagesDescription");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_breakDownPhysFootprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "breakDownPhysFootprint");
}

id objc_msgSend_cachedCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedCopy");
}

id objc_msgSend_childPidsForPids_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPidsForPids:");
}

id objc_msgSend_cleanSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanSize");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectDataWithCompletionQueue_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectDataWithCompletionQueue:completionBlock:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configureForMultipleOutputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureForMultipleOutputs");
}

id objc_msgSend_containsFakeRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsFakeRegion");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_couldHaveProcessView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "couldHaveProcessView");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_detailedAuxData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailedAuxData");
}

id objc_msgSend_detailedAuxDataName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailedAuxDataName");
}

id objc_msgSend_detailedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailedName");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didPhysFootprintDirtyAccounting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPhysFootprintDirtyAccounting");
}

id objc_msgSend_directedGraphWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directedGraphWithData:error:");
}

id objc_msgSend_dirtyLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dirtyLength");
}

id objc_msgSend_dirtySize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dirtySize");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayString");
}

id objc_msgSend_doOwnedAccountingAdjustments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doOwnedAccountingAdjustments");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dyldSharedCacheRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dyldSharedCacheRange");
}

id objc_msgSend_endAtTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endAtTime:");
}

id objc_msgSend_endProcessHeader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endProcessHeader:");
}

id objc_msgSend_ensureMemoryObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensureMemoryObject");
}

id objc_msgSend_enumerateRegions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRegions:");
}

id objc_msgSend_enumerateRegionsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRegionsWithBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errors");
}

id objc_msgSend_extendedInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedInfo");
}

id objc_msgSend_extendedInfoForRegionType_at_extendedInfoProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedInfoForRegionType:at:extendedInfoProvider:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalizeObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeObject");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formattedDescriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedDescriptions");
}

id objc_msgSend_formattedValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedValue");
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatter");
}

id objc_msgSend_fp_enumerateObjectsWithBatchSize_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_enumerateObjectsWithBatchSize:usingBlock:");
}

id objc_msgSend_fp_isContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_isContainer");
}

id objc_msgSend_fp_jsonRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_jsonRepresentation");
}

id objc_msgSend_fp_mergeAuxDatum_withDatum_forceAggregate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_mergeAuxDatum:withDatum:forceAggregate:");
}

id objc_msgSend_fp_mergeWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_mergeWithData:");
}

id objc_msgSend_fp_mergeWithData_forceAggregate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_mergeWithData:forceAggregate:");
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullName");
}

id objc_msgSend_gatherData_extendedInfoProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherData:extendedInfoProvider:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCString:maxLength:encoding:");
}

id objc_msgSend_globalErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalErrors");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "height");
}

id objc_msgSend_hiddenFromDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hiddenFromDisplay");
}

id objc_msgSend_idleExitStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idleExitStatus");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initUniqueProcessGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initUniqueProcessGroup");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBsdInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBsdInfo:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithValue_shouldAggregate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValue:shouldAggregate:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instanceMethodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceMethodForSelector:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_ioAccelMemoryInfoDetailsAtAddress_for_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioAccelMemoryInfoDetailsAtAddress:for:error:");
}

id objc_msgSend_ioSurfaceExtendedInfoDetailsAtAddress_for_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioSurfaceExtendedInfoDetailsAtAddress:for:");
}

id objc_msgSend_is64bit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is64bit");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isKernelPageTableMemory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKernelPageTableMemory");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isTranslated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTranslated");
}

id objc_msgSend_isTranslatedByRosetta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTranslatedByRosetta");
}

id objc_msgSend_kernelPageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kernelPageSize");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_ledgerValueForKey_keyExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ledgerValueForKey:keyExists:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mappings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mappings");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "member:");
}

id objc_msgSend_memoryPool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memoryPool");
}

id objc_msgSend_memoryRegions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memoryRegions");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newlineCharacterSet");
}

id objc_msgSend_nonretainedObjectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonretainedObjectValue");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_ownerPid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerPid");
}

id objc_msgSend_pageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pageSize");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_physFootprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physFootprint");
}

id objc_msgSend_physicalFootprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physicalFootprint");
}

id objc_msgSend_physicalFootprintPeak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "physicalFootprintPeak");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pidsForStringDescriptions_errors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidsForStringDescriptions:errors:");
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pixelFormat");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_printGlobalAuxData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printGlobalAuxData:");
}

id objc_msgSend_printHeader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printHeader");
}

id objc_msgSend_printProcessAuxData_forProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printProcessAuxData:forProcess:");
}

id objc_msgSend_printProcessCategories_total_forProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printProcessCategories:total:forProcess:");
}

id objc_msgSend_printProcessHeader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printProcessHeader:");
}

id objc_msgSend_printProcessTotal_forProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printProcessTotal:forProcess:");
}

id objc_msgSend_printProcessesWithWarnings_processesWithErrors_globalErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printProcessesWithWarnings:processesWithErrors:globalErrors:");
}

id objc_msgSend_printSharedCache_categories_sharedWith_total_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printSharedCache:categories:sharedWith:total:");
}

id objc_msgSend_printSharedCategories_sharedWith_forProcess_hasProcessView_total_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printSharedCategories:sharedWith:forProcess:hasProcessView:total:");
}

id objc_msgSend_printSummaryCategories_total_hadErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printSummaryCategories:total:hadErrors:");
}

id objc_msgSend_printVmmapLikeOutputForProcess_regions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printVmmapLikeOutputForProcess:regions:");
}

id objc_msgSend_processDescriptionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDescriptionString");
}

id objc_msgSend_processIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIDs");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_processWithBsdInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processWithBsdInfo:");
}

id objc_msgSend_processWithMemgraph_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processWithMemgraph:error:");
}

id objc_msgSend_processWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processWithPid:");
}

id objc_msgSend_processes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processes");
}

id objc_msgSend_purgeable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeable");
}

id objc_msgSend_reclaimableSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reclaimableSize");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeIdleExitCleanProcessesFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIdleExitCleanProcessesFrom:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_residentLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "residentLength");
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanInt:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAuxDataName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuxDataName:");
}

id objc_msgSend_setCleanSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCleanSize:");
}

id objc_msgSend_setDetailedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetailedName:");
}

id objc_msgSend_setDirtySize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirtySize:");
}

id objc_msgSend_setDisplayString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayString:");
}

id objc_msgSend_setExtendedInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtendedInfo:");
}

id objc_msgSend_setFormatOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatOptions:");
}

id objc_msgSend_setFormatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatter:");
}

id objc_msgSend_setHiddenFromDisplay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHiddenFromDisplay:");
}

id objc_msgSend_setMemoryRegions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemoryRegions:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOwnerPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOwnerPid:");
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPid:");
}

id objc_msgSend_setReclaimableSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReclaimableSize:");
}

id objc_msgSend_setRegionSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegionSize:");
}

id objc_msgSend_setSwappedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwappedSize:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTotalRegions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalRegions:");
}

id objc_msgSend_setVerbose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVerbose:");
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCache");
}

id objc_msgSend_shouldAggregate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAggregate");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_startAtTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAtTime:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByResolvingSymlinksInPath");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongToStrongObjectsMapTable");
}

id objc_msgSend_supportsFormattedValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFormattedValue");
}

id objc_msgSend_surfaceDescriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "surfaceDescriptions");
}

id objc_msgSend_surfaceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "surfaceID");
}

id objc_msgSend_swappedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swappedSize");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "task");
}

id objc_msgSend_totalCleanSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalCleanSize");
}

id objc_msgSend_totalDirtySize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalDirtySize");
}

id objc_msgSend_totalReclaimableSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalReclaimableSize");
}

id objc_msgSend_totalRegions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalRegions");
}

id objc_msgSend_totalSwappedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalSwappedSize");
}

id objc_msgSend_totalWiredSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalWiredSize");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_verbose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verbose");
}

id objc_msgSend_viewForProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewForProcess:");
}

id objc_msgSend_virtualAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "virtualAddress");
}

id objc_msgSend_vmPageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vmPageSize");
}

id objc_msgSend_warnings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnings");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "width");
}

id objc_msgSend_wired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wired");
}

id objc_msgSend_wiredSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiredSize");
}
