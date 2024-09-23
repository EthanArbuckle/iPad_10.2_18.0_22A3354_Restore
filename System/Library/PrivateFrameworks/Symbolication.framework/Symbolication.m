_DWORD *copySamplingResultToCallstack(_DWORD *result, int a2, const void *a3, const void *a4, unsigned int a5, int a6)
{
  _DWORD *v7;
  size_t v11;
  void *v12;
  void *v13;

  v7 = result;
  result[10] = a5;
  if (a5)
  {
    v11 = 8 * a5;
    v12 = malloc_type_malloc(v11, 0x9CF6DC70uLL);
    *((_QWORD *)v7 + 3) = v12;
    result = memcpy(v12, a3, v11);
    if (a6)
    {
      v13 = malloc_type_malloc(v11, 0x857BF787uLL);
      *((_QWORD *)v7 + 4) = v13;
      result = memcpy(v13, a4, v11);
    }
  }
  v7[1] = a2;
  return result;
}

void markStacks(void *a1, void *a2)
{
  id v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t RegionForAddress;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;

  v25 = a1;
  v3 = a2;
  v4 = objc_msgSend(v25, "count");
  v5 = objc_msgSend(v3, "threadCount");
  if (v5)
  {
    LODWORD(v6) = v5;
    do
    {
      v6 = (v6 - 1);
      v7 = objc_msgSend(v3, "stackPointerForThreadNum:", v6);
      v26 = 0;
      RegionForAddress = findRegionForAddress(v25, v7, (void **)&v26);
      v9 = v26;
      if (v26)
      {
        v10 = RegionForAddress;
        while (!*(_QWORD *)(v9 + 32))
        {
          if (*(_DWORD *)(v9 + 24))
            break;
          if (*(_BYTE *)(v9 + 50) != 3)
            break;
          if (!objc_msgSend((id)v9, "isStack"))
            break;
          if (++v10 >= v4)
            break;
          objc_msgSend(v25, "objectAtIndex:", v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = v11;
          if (!v11)
            goto LABEL_13;
        }
        if (!*(_QWORD *)(v9 + 32) && *(_DWORD *)(v9 + 24) && objc_msgSend((id)v9, "isStack"))
        {
          v12 = *(void **)(v9 + 32);
          *(_QWORD *)(v9 + 32) = CFSTR("Stack");

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("thread %d"), v6);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v13;

          if (v10 + 1 < v4)
          {
            objc_msgSend(v25, "objectAtIndex:");
            v15 = objc_claimAutoreleasedReturnValue();
            if (!*(_QWORD *)(v15 + 32)
              && objc_msgSend((id)v9, "isStack")
              && *(_QWORD *)(v9 + 16) + *(_QWORD *)(v9 + 8) == *(_QWORD *)(v15 + 8)
              && objc_msgSend((id)v9, "hasSameInfoAsRegion:", v15))
            {
              objc_storeStrong((id *)(v15 + 32), *(id *)(v9 + 32));
              objc_storeStrong((id *)(v15 + 40), *(id *)(v9 + 40));
            }

          }
          if (v10 >= 2)
          {
            v16 = v10 - 1;
            while (1)
            {
              objc_msgSend(v25, "objectAtIndex:", v16);
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = v16 + 1;
              objc_msgSend(v25, "objectAtIndex:", v16 + 1);
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)v19;
              if (*(_QWORD *)(v17 + 32)
                || *(_QWORD *)(v17 + 16) + *(_QWORD *)(v17 + 8) != *(_QWORD *)(v19 + 8)
                || !objc_msgSend((id)v17, "isStack"))
              {
                break;
              }
              v21 = *(_DWORD *)(v17 + 24);
              if (v21 == 3)
              {
                objc_storeStrong((id *)(v17 + 32), *(id *)(v9 + 32));
                objc_storeStrong((id *)(v17 + 40), *(id *)(v9 + 40));
              }
              else if (!v21)
              {
                v22 = *(void **)(v17 + 32);
                *(_QWORD *)(v17 + 32) = CFSTR("STACK GUARD");

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stack guard for thread %d"), v6);
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = *(void **)(v17 + 40);
                *(_QWORD *)(v17 + 40) = v23;

                break;
              }

              v16 = v18 - 2;
              if (v18 == 2)
                goto LABEL_13;
            }

          }
        }
      }
LABEL_13:

    }
    while ((_DWORD)v6);
  }

}

void __markMachOLibraries_block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t Range;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = (void *)MEMORY[0x1A85A9758]();
  Range = CSRegionGetRange();
  v5 = v4;
  if (VMURangeIntersectsRange(Range, v4, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88)))
  {
    getBinarySegmentName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_BYTE *)(a1 + 112) || *(_BYTE *)(a1 + 113))
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("__LINKEDIT")))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        if (*(_BYTE *)(v8 + 24))
        {
LABEL_17:

          goto LABEL_18;
        }
        *(_BYTE *)(v8 + 24) = 1;
        if (*(_BYTE *)(a1 + 113))
          v9 = CFSTR("kernelcache combined __LINKEDIT");
        else
          v9 = CFSTR("dyld shared cache combined __LINKEDIT");
        goto LABEL_13;
      }
      if (*(_BYTE *)(a1 + 114))
      {
        v10 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Range);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);
LABEL_16:

        goto LABEL_17;
      }
    }
    v9 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByResolvingSymlinksInPath");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v9 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    }
LABEL_13:
    v11 = v9;
    objc_msgSend(*(id *)(a1 + 40), "member:", v7);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      v16 = v7;
    }
    setTypeAndPath(*(void **)(a1 + 48), *(void **)(a1 + 56), Range, v5, v16, v11, 1, 1);

    goto LABEL_16;
  }
LABEL_18:
  objc_autoreleasePoolPop(v2);
}

__CFString *getBinarySegmentName()
{
  uint64_t Name;
  __CFString *v1;

  Name = CSRegionGetName();
  if (!strcmp((const char *)Name, "MACH_HEADER"))
    v1 = CFSTR("__TEXT");
  else
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", Name, &strchr((char *)Name, 32)[-Name], 4);
  return v1;
}

void setTypeAndPath(void *a1, void *a2, unint64_t a3, uint64_t a4, void *a5, void *a6, int a7, uint64_t a8)
{
  id v15;
  unint64_t RegionForAddress;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char v37;
  id obj;
  void *context;
  void *v40;

  v35 = a1;
  v15 = a2;
  v36 = a5;
  VMUSanitizePath(a6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  RegionForAddress = findRegionForAddress(v15, a3, &v40);
  v17 = objc_msgSend(v15, "count");
  v18 = v40;
  if (RegionForAddress < v17)
  {
    v19 = v17;
    if (a7)
      v20 = 2;
    else
      v20 = 0;
    v37 = v20;
    v21 = v36;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndex:", RegionForAddress);
      v22 = objc_claimAutoreleasedReturnValue();

      if ((*(_BYTE *)(v22 + 132) & 1) == 0)
        break;
LABEL_32:
      ++RegionForAddress;
      v18 = (void *)v22;
      if (RegionForAddress >= v19)
        goto LABEL_35;
    }
    if (*(_QWORD *)(v22 + 8) > *MEMORY[0x1E0C85AD8] + a4 + a3)
      goto LABEL_35;
    context = (void *)MEMORY[0x1A85A9758]();
    if (!VMURangeIntersectsRange(*(_QWORD *)(v22 + 8), *(_QWORD *)(v22 + 16), a3, a4))
    {
LABEL_31:
      objc_autoreleasePoolPop(context);
      goto LABEL_32;
    }
    v23 = *(_QWORD *)(v22 + 8);
    if (a3 > v23)
    {
      objc_msgSend((id)v22, "breakAtLength:", a3 - v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v15, "insertObject:atIndex:", v24, ++RegionForAddress);
        v25 = a8;
        v26 = v24;

        ++v19;
        v22 = (uint64_t)v26;
        a8 = v25;
        v21 = v36;
      }

      v23 = *(_QWORD *)(v22 + 8);
    }
    v27 = *(_QWORD *)(v22 + 16);
    if (a4 + a3 >= v27 + v23)
    {
      a3 += v27;
      a4 -= v27;
    }
    else if (*MEMORY[0x1E0C85AD8] <= 0x1000uLL
           || (objc_msgSend(v35, "rangeIsInSharedCache:", a3, a4) & 1) != 0
           || !*(_BYTE *)(v22 + 49)
           || (objc_msgSend(v21, "isEqualToString:", CFSTR("__LINKEDIT")) & 1) == 0)
    {
      objc_msgSend((id)v22, "breakAtLength:", a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v15, "insertObject:atIndex:", v28, RegionForAddress + 1);
        ++v19;
      }

    }
    *(_BYTE *)(v22 + 132) = *(_BYTE *)(v22 + 132) & 0xFD | v37;
    if ((a8 & 1) == 0 && (*(_BYTE *)(v22 + 24) & 2) != 0)
      *(_BYTE *)(v22 + 132) |= 4u;
    v29 = *(void **)(v22 + 32);
    if (v29)
    {
      objc_msgSend(v29, "rangeOfString:", v21);
      if (v30)
      {
LABEL_30:
        objc_storeStrong((id *)(v22 + 40), obj);
        goto LABEL_31;
      }
      v31 = *(id *)(v22 + 32);
      objc_msgSend(v31, "stringByAppendingPathComponent:", v21);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(v22 + 32);
      *(_QWORD *)(v22 + 32) = v32;

    }
    else
    {
      v34 = v21;
      v31 = *(id *)(v22 + 32);
      *(_QWORD *)(v22 + 32) = v34;
    }

    goto LABEL_30;
  }
  v22 = (uint64_t)v40;
  v21 = v36;
LABEL_35:

}

BOOL VMURangeIntersectsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3)
    return a3 + a4 > a1;
  else
    return a1 + a2 > a3;
}

BOOL VMURangeContainsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return a3 >= a1 && a3 + a4 <= a1 + a2;
}

unint64_t findRegionForAddress(void *a1, unint64_t a2, void **a3)
{
  id v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;

  v5 = a1;
  v6 = 0;
  v7 = 0;
  v8 = objc_msgSend(v5, "count") - 1;
  while (1)
  {
    v9 = v6;
    v10 = v7 + ((v8 - v7) >> 1);
    objc_msgSend(v5, "objectAtIndex:", v10);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v6[1] > a2)
    {
      if (!v10)
        goto LABEL_9;
      v8 = v10 - 1;
      goto LABEL_8;
    }
    if (v6[2] + v6[1] > a2)
      break;
    if (v10 >= v8)
      goto LABEL_9;
    v7 = v10 + 1;
LABEL_8:
    if (v7 > v8)
    {
LABEL_9:
      v11 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
  }
  v11 = v6;
LABEL_10:
  v12 = *a3;
  *a3 = v11;

  return v10;
}

id VMUSanitizePath(void *a1)
{
  return a1;
}

void coalesceIdenticalRegions(void *a1, char a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  if ((a2 & 0x80) == 0)
  {
    v3 = objc_msgSend(v8, "count");
    if (v3 >= 2)
    {
      v4 = v3;
      v5 = 1;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v5 - 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (shouldProbablyCoalesceRegions(v6, v7) && (objc_msgSend(v6, "hasSameInfoAsRegion:", v7) & 1) != 0)
        {
          objc_msgSend(v6, "addInfoFromRegion:", v7);
          objc_msgSend(v8, "removeObjectAtIndex:", v5);
          --v4;
        }
        else
        {
          ++v5;
        }

      }
      while (v5 < v4);
    }
  }

}

BOOL shouldProbablyCoalesceRegions(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a1;
  v4 = a2;
  v5 = *((_QWORD *)v3 + 2) + *((_QWORD *)v3 + 1) == *((_QWORD *)v4 + 1)
    && sameString(*((void **)v3 + 4), *((void **)v4 + 4))
    && (!*((_QWORD *)v3 + 4) && !*((_QWORD *)v4 + 4)
     || (sameString(*((void **)v3 + 5), *((void **)v4 + 5)) & 1) != 0
     || (sameString(0, *((void **)v4 + 5)) & 1) != 0);

  return v5;
}

uint64_t sameString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "isEqualToString:", v4);
  }

  return v6;
}

id VMUidentifyRegionTypeFromUserTag(int a1, unsigned __int8 a2, int a3, int a4)
{
  void *v6;
  uint64_t v7;

  if (a1)
    VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(a2);
  else
    VMURegionTypeDescriptionForTagShareProtAndPager(a2, a3, a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, VMUreservedLabelSuffix);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

__CFString *VMURegionTypeDescriptionForTagShareProtAndPager(uint64_t a1, int a2, int a3, int a4)
{
  __CFString *v5;
  __CFString *v6;
  const __CFString *v8;

  if ((_DWORD)a1 == 30)
  {
    if (!a3)
      return CFSTR("Stack Guard");
    v6 = CFSTR("Stack");
  }
  else
  {
    if ((_DWORD)a1 == 1)
    {
      v8 = CFSTR("MALLOC metadata");
      if (a2 == 3)
        v8 = CFSTR("MALLOC");
      if (a3)
        v6 = (__CFString *)v8;
      else
        v6 = CFSTR("MALLOC guard page");
      return v6;
    }
    if ((_DWORD)a1)
    {
      v6 = vmRegionLabels[a1];
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Memory Tag %d"), a1);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      return v6;
    }
    if (a4 == 1)
    {
      v5 = VMUmappedFileLabel[0];
LABEL_21:
      v6 = v5;
      return v6;
    }
    if (a2 != 5)
    {
      v5 = (__CFString *)VMUuntaggedRegionLabel;
      goto LABEL_21;
    }
    v6 = CFSTR("shared memory");
  }
  return v6;
}

void recursivelyListAllRegions(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6, _BYTE *a7)
{
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  char v18;
  char v19;
  int v20;
  uint64_t v21;
  unint64_t v22;

  v13 = a1;
  v14 = a2;
  v22 = a4;
  if (!*a7)
  {
    while (1)
    {
      v21 = 0;
      v20 = a6;
      getRegionData(v13, &v22, &v21, &v20);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (_QWORD *)v15;
      if (!v15)
        break;
      if (!VMURangeContainsRange(a4, a5, *(_QWORD *)(v15 + 8), *(_QWORD *)(v15 + 16)) || v20 != a6)
        break;
      v18 = objc_msgSend(v16, "isNullRegion");
      if ((a3 & 0x20) != 0 || (v18 & 1) == 0)
      {
        if (!objc_msgSend(v13, "isCore")
          || (v19 = objc_msgSend(v16, "isOwnedUnmappedMemory"), (a3 & 0x10000) != 0)
          || (v19 & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v16);
        }
      }
      if (objc_msgSend(v16, "isSubmap"))
        recursivelyListAllRegions(v13, v14, a3, v16[1], v16[2], (a6 + 1), a7);
      v22 += v21;

      if (*a7)
        goto LABEL_19;
    }

  }
LABEL_19:

}

id getRegionData(void *a1, _QWORD *a2, _QWORD *a3, int *a4)
{
  id v7;
  void *v8;
  int *v9;
  void *v10;
  mach_error_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v17;
  _OWORD v18[2];
  __int128 v19;
  _DWORD v20[7];

  v7 = a1;
  v8 = v7;
  v19 = 0u;
  memset(v20, 0, sizeof(v20));
  memset(v18, 0, sizeof(v18));
  v17 = 9999;
  if (a4)
    v9 = a4;
  else
    v9 = &v17;
  objc_msgSend(v7, "memoryCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "machVMRegionRecurseSubmapInfo64onAddress:size:nestingDepth:info:", a2, a3, v9, v18);

  if (v11)
  {
    if (v11 != 1)
      mach_error("vm_region", v11);
    v12 = 0;
  }
  else
  {
    v12 = objc_opt_new();
    *(_QWORD *)(v12 + 8) = *a2;
    *(_QWORD *)(v12 + 16) = *a3;
    *(_QWORD *)(v12 + 24) = *(_QWORD *)&v18[0];
    *(_BYTE *)(v12 + 49) = BYTE14(v19);
    *(_DWORD *)(v12 + 128) = *v9;
    *(_BYTE *)(v12 + 132) = *(_BYTE *)(v12 + 132) & 0xFE | (v20[0] != 0);
    *(_BYTE *)(v12 + 132) = *(_BYTE *)(v12 + 132) & 0xEF | (16 * (LOWORD(v20[3]) != 0));
    *(_BYTE *)(v12 + 50) = HIBYTE(v19);
    *(_QWORD *)(v12 + 56) = 0;
    *(_QWORD *)(v12 + 96) = DWORD2(v19);
    *(_DWORD *)(v12 + 104) = DWORD1(v18[1]);
    *(_QWORD *)(v12 + 112) = v20[2];
    *(_QWORD *)(v12 + 120) = *(_QWORD *)((char *)v18 + 12);
    *(_QWORD *)(v12 + 224) = *(_QWORD *)&v20[5];
    objc_msgSend(v8, "memoryCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "machVMPurgableControlWithAddress:control:state:", *a2, 1, v12 + 52);

    if (v14)
      *(_DWORD *)(v12 + 52) = 3;
    *(_BYTE *)(v12 + 232) = objc_msgSend(v8, "isExclave");
    if (*(_BYTE *)(v12 + 232))
    {
      objc_msgSend(v8, "memoryCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUTaskMemoryCache getExclaveVMFlagsForAddress:exclaveVMFlags:]((uint64_t)v15);

    }
  }

  return (id)v12;
}

void appendStatsLine(void *a1, __int16 a2, unsigned int a3, char a4, unsigned int a5, uint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, unsigned int a14, uint64_t a15)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *context;
  id v31;

  v31 = a1;
  context = (void *)MEMORY[0x1A85A9758]();
  v19 = pageCountString(a7, a3, a4);
  v20 = pageCountString(a8, a3, a4);
  v21 = pageCountString(a9, a3, a4);
  v22 = pageCountString(a10, a3, a4);
  v23 = pageCountString(a11, a3, a4);
  v24 = pageCountString(a12, a3, a4);
  v25 = pageCountString(a13, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%8u"), a14);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  appendTextLine(v31, a2, a3 > 1, a5, a6, v19, v20, v21, v22, v23, v24, v25, objc_msgSend(v26, "UTF8String"), a15);

  objc_autoreleasePoolPop(context);
}

uint64_t memorySizeString(unint64_t a1)
{
  double v1;
  __CFString *v2;
  double v3;
  double v4;
  __CFString *v5;
  uint64_t v6;

  if (a1)
  {
    v1 = (double)a1 * 0.0009765625;
    if (v1 >= 4.0)
    {
      if (v1 >= 10000.0)
      {
        v3 = v1 * 0.0009765625;
        if (v3 >= 1000.0)
        {
          v4 = v3 * 0.0009765625;
          if (v4 >= 1000.0)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fT"), v4 * 0.0009765625);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fG"), *(_QWORD *)&v4);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1fM"), *(_QWORD *)&v3);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fK"), *(_QWORD *)&v1);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a1);
    }
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("0K");
  }
  v5 = objc_retainAutorelease(v2);
  v6 = -[__CFString UTF8String](v5, "UTF8String");

  return v6;
}

void appendTextLine(void *a1, __int16 a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a1;
  objc_msgSend(v23, "appendFormat:", CFSTR("%-*s"), a4, a5);
  v21 = 8;
  if (a3)
    v22 = 10;
  else
    v22 = 8;
  if (a3)
    v21 = 10;
  objc_msgSend(v23, "appendFormat:", CFSTR(" %*s"), v21, a6);
  if ((a2 & 4) != 0)
  {
    objc_msgSend(v23, "appendFormat:", CFSTR(" %*s"), v22, a7);
    if ((a2 & 8) == 0)
    {
LABEL_8:
      if ((a2 & 0x800) == 0)
        goto LABEL_9;
LABEL_14:
      objc_msgSend(v23, "appendFormat:", CFSTR(" %*s"), v22, a9);
      if ((a2 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((a2 & 8) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v23, "appendFormat:", CFSTR(" %*s"), v22, a8);
  if ((a2 & 0x800) != 0)
    goto LABEL_14;
LABEL_9:
  if ((a2 & 0x10) != 0)
LABEL_10:
    objc_msgSend(v23, "appendFormat:", CFSTR(" %*s %*s %*s"), v22, a10, v22, a11, v22, a12);
LABEL_11:
  objc_msgSend(v23, "appendFormat:", CFSTR(" %8s"), a13);
  objc_msgSend(v23, "appendFormat:", CFSTR(" %s"), a14);
  objc_msgSend(v23, "appendString:", CFSTR("\n"));

}

uint64_t pageCountString(unint64_t a1, unsigned int a2, char a3)
{
  id v4;
  uint64_t v5;

  if (a2 < 2)
    return memorySizeString(a1);
  if ((a3 & 1) != 0)
  {
    if (a1 % a2)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), (double)a1 / (double)a2);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu   "), a1 / a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1 / a2);
  }
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");

  return v5;
}

void cumulateLibraries(void *a1, void *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!*(_BYTE *)(v14 + 48)
          && objc_msgSend(*(id *)(v14 + 32), "isEqual:", v9)
          && *(_BYTE *)(v14 + 50) == 1)
        {
          *a3 += *(_QWORD *)(v14 + 16);
          *a4 += *(_QWORD *)(v14 + 160);
          *a5 += *(_QWORD *)(v14 + 16) - *(_QWORD *)(v14 + 160);
          *(_BYTE *)(v14 + 48) = 1;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

void __markMachOLibraries_block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  CSSymbolOwnerIsDyldSharedCache();
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  v7 = 0;
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  CSSymbolOwnerForeachSegment();

  _Block_object_dispose(v6, 8);
}

void sub_1A4D7D9A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return 2076;
}

uint64_t task_stop_peeking()
{
  uint64_t result;
  uint64_t v1;

  result = task_lookup_mapped_memory_cache();
  if (result)
  {
    v1 = mapped_memory_resume_target();
    task_release_mapped_memory_cache();
    return v1;
  }
  return result;
}

uint64_t task_start_peeking()
{
  task_get_mapped_memory_cache_with_label();
  return mapped_memory_suspend_target();
}

uint64_t task_peek_to_end_of_region(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4, _QWORD *a5)
{
  vm_map_read_t *IsSelf_portOfCachedResult;
  uint64_t result;
  _BYTE *IsSelf_cachedResult;
  int v13;
  const char *v14;
  uint64_t *node;
  uint64_t v16;

  *a4 = 0;
  if (a3)
  {
    if (*MEMORY[0x1E0C85AD8] > a2)
      return 1;
    IsSelf_portOfCachedResult = (vm_map_read_t *)VMUTaskIsSelf_portOfCachedResult();
    if (*IsSelf_portOfCachedResult == a1)
    {
      if (*(_BYTE *)VMUTaskIsSelf_cachedResult())
      {
LABEL_5:
        if (HIDWORD(a2) && memoryExists(a1, a2, a3))
        {
          result = 0;
          *a4 = a2;
          return result;
        }
        return 1;
      }
    }
    else
    {
      *IsSelf_portOfCachedResult = a1;
      mach_task_is_self(a1);
      IsSelf_cachedResult = (_BYTE *)VMUTaskIsSelf_cachedResult();
      *IsSelf_cachedResult = v13;
      if (v13)
        goto LABEL_5;
    }
    v14 = (const char *)task_lookup_mapped_memory_cache();
    if (!v14)
    {
      NSLog(CFSTR("*** Error: calling task_peek() before task_start_peeking()\n"));
      return 0xFFFFFFFFLL;
    }
    node = (uint64_t *)find_node(v14, (tree *)a2);
    if (!node)
    {
      node = (uint64_t *)map_new_node();
      if (!node)
        return 0;
    }
    v16 = *node;
    *a4 = node[2] + a2 - *node;
    if (a5)
    {
      result = 0;
      *a5 = v16 - a2 + node[1];
      return result;
    }
  }
  return 0;
}

uint64_t task_peek(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4)
{
  return task_peek_to_end_of_region(a1, a2, a3, a4, 0);
}

void markMallocAreas(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  NSMapTable *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  os_signpost_id_t v31;
  id v32;
  id v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  os_signpost_id_t v37;
  id v38;
  id *v39;
  id *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  NSMapTable *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  BOOL v53;
  id v54[4];
  _BOOL8 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[8];
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  void *v64;
  id v65;
  id *v66;
  id *v67;
  char v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a6;
  if ((a5 & 0x400) == 0)
  {
    if (objc_msgSend(v11, "taskType") == 2)
    {
      v15 = malloc_type_calloc(1uLL, 0x50uLL, 0x10000404247E4FDuLL);
      NSMapInsertKnownAbsent(v13, CFSTR("zalloc (no zone)"), v15);
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "range");

      objc_msgSend(v12, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v13;
      v19 = objc_msgSend(v18, "range");
      v21 = v20;

      v22 = (void *)(v21 - (_QWORD)v17 + v19);
      v23 = " Aborting";
      if ((objc_msgSend(v11, "isCore") & 1) != 0)
      {
        v24 = 0;
      }
      else
      {
        v25 = objc_msgSend(v11, "taskPort");
        v24 = v25 == *MEMORY[0x1E0C83DA0];
        if (v25 == *MEMORY[0x1E0C83DA0])
          v23 = "";
      }
      v54[0] = v12;
      v54[1] = v17;
      v54[2] = v22;
      v54[3] = a4;
      v55 = v24;
      *(_DWORD *)((char *)&v55 + 1) = (a5 & 0x800000) != 0;
      v56 = v23;
      v57 = 0x7FFFFFFFFFFFFFFFLL;
      v59 = 0;
      v60 = 0;
      v58 = 0;
      v26 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __markMallocAreas_block_invoke;
      v51[3] = &unk_1E4E02740;
      v27 = v54[0];
      v52 = v27;
      v53 = (a5 & 0x800000) != 0;
      VMUTask_foreach_malloc_zone(v11, v51);
      v13 = v46;
      if (v14 && objc_msgSend(v14, "signpostID"))
      {
        objc_msgSend(v14, "logHandle");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v14, "signpostID");
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v28, OS_SIGNPOST_INTERVAL_END, v29, "recordRegions", "", buf, 2u);
        }

      }
      objc_msgSend(v14, "endEvent:", "recordRegions");
      objc_msgSend(v14, "startWithCategory:message:", "recordRegions", "marking malloc VM regions");
      if (v14)
      {
        objc_msgSend(v14, "logHandle");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v14, "signpostID");
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v31, "recordRegions", "marking malloc VM regions", buf, 2u);
        }

      }
      v32 = v11;
      *(_QWORD *)buf = v26;
      v62 = 3221225472;
      v63 = ___markRegionsForMallocZones_block_invoke;
      v64 = &unk_1E4E027E0;
      v65 = v32;
      v66 = v54;
      LOBYTE(v67) = BYTE1(v55);
      v33 = v32;
      withPeekFunctionForVMUTask(v33, buf);

      if ((a5 & 0x100) == 0)
      {
        if (v14 && objc_msgSend(v14, "signpostID"))
        {
          objc_msgSend(v14, "logHandle");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v14, "signpostID");
          if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v34, OS_SIGNPOST_INTERVAL_END, v35, "recordRegions", "", buf, 2u);
          }

        }
        objc_msgSend(v14, "endEvent:", "recordRegions");
        objc_msgSend(v14, "startWithCategory:message:", "recordRegions", "marking malloc allocations in VM regions");
        if (v14)
        {
          objc_msgSend(v14, "logHandle");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v14, "signpostID");
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "recordRegions", "marking malloc allocations in VM regions", buf, 2u);
          }

        }
        v38 = v33;
        v39 = v46;
        *(_QWORD *)buf = v26;
        v62 = 3221225472;
        v63 = ___getRegionMallocStatistics_block_invoke;
        v64 = &unk_1E4E02858;
        v65 = v38;
        v66 = v39;
        v67 = v54;
        v68 = BYTE1(v55);
        v40 = v39;
        v41 = v38;
        withPeekFunctionForVMUTask(v41, buf);

      }
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v42 = v27;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v48 != v44)
              objc_enumerationMutation(v42);
            setTypeIfMallocRegion(*(void **)(*((_QWORD *)&v47 + 1) + 8 * i));
          }
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
        }
        while (v43);
      }

      __destructor_8_s0_s56_s64_sb72(v54);
    }
  }

}

void sub_1A4D7E878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  __destructor_8_s0_s56_s64_sb72((id *)va);
  _Unwind_Resume(a1);
}

void markIOSurfaces(void *a1, void *a2, __int16 a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t j;
  uint64_t v57;
  int v58;
  BOOL v59;
  void *v60;
  __CFString *v61;
  VMUProcInfo *v62;
  uint64_t v63;
  void *v64;
  __CFString *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  id v70;
  void *context;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id obj;
  id obja;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  int v87;
  _QWORD *v88;
  int v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char __str[5];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v81 = a1;
  v5 = a2;
  if ((a3 & 0x400) != 0)
    goto LABEL_69;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v72 = v5;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
  if (!v7)
  {
LABEL_10:

    goto LABEL_68;
  }
  v8 = v7;
  v9 = *(_QWORD *)v109;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v109 != v9)
      objc_enumerationMutation(v6);
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * v10), "isIOSurface") & 1) != 0)
      break;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
      if (!v8)
        goto LABEL_10;
      goto LABEL_4;
    }
  }

  context = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(v81, "ioSurfaceDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_67;
  v69 = v6;
  v12 = v11;
  v13 = (void *)objc_opt_new();
  v83 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  v80 = (void *)objc_opt_new();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v70 = v12;
  obj = v12;
  v14 = 0x1E0CB3000uLL;
  v84 = v13;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
  if (!v74)
    goto LABEL_37;
  v73 = *(_QWORD *)v105;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v105 != v73)
        objc_enumerationMutation(obj);
      v78 = v15;
      v16 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v15);
      v89 = objc_msgSend(v81, "pid");
      v87 = objc_msgSend(v16, "integerValue");
      v17 = v16;
      objc_msgSend(obj, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v85 = v18;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v101;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v101 != v21)
              objc_enumerationMutation(v85);
            v23 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
            v24 = objc_msgSend(v23, "surfaceID");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              v26 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v27);

            }
            objc_msgSend(v26, "addObject:", v17);
            if (v89 == v87)
            {
              v28 = objc_msgSend(v23, "pixelFormat");
              v29 = v28;
              v30 = HIBYTE(v28);
              if ((v28 & 0x80000000) != 0)
              {
                if (!__maskrune(HIBYTE(v28), 0x800uLL))
                  goto LABEL_29;
LABEL_27:
                __str[0] = v30;
                __str[1] = BYTE2(v29);
                __str[2] = BYTE1(v29);
                __str[3] = v29;
                __str[4] = 0;
              }
              else
              {
                if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v30 + 60) & 0x800) != 0)
                  goto LABEL_27;
LABEL_29:
                snprintf(__str, 5uLL, "%4d", v29);
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "virtualAddress"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "setObject:forKeyedSubscript:", v31, v32);

              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SurfaceID: %#x  %llux%llu (%s) %s"), v24, objc_msgSend(v23, "width"), objc_msgSend(v23, "height"), __str, VMUMemorySizeString(objc_msgSend(v23, "allocationSize")));
              objc_msgSend(v23, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "length");

              if (v35)
              {
                objc_msgSend(v23, "name");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "appendFormat:", CFSTR("  '%@'"), v36);

              }
              v14 = 0x1E0CB3000uLL;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "virtualAddress"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "setObject:forKeyedSubscript:", v33, v37);

              v13 = v84;
            }

          }
          v20 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
        }
        while (v20);
      }

      v15 = v78 + 1;
    }
    while (v78 + 1 != v74);
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
  }
  while (v74);
LABEL_37:

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v38 = v69;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v96;
    v75 = *(_QWORD *)v96;
    obja = v38;
    do
    {
      v42 = 0;
      v79 = v40;
      do
      {
        if (*(_QWORD *)v96 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD **)(*((_QWORD *)&v95 + 1) + 8 * v42);
        if (objc_msgSend(v43, "isIOSurface"))
        {
          v90 = v42;
          objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v43[1]);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKeyedSubscript:", v44);
          v45 = v43;
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v88 = v45;
          objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v45[1]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectForKeyedSubscript:", v47);
          v48 = objc_claimAutoreleasedReturnValue();

          v49 = (void *)v48;
          objc_msgSend(v84, "objectForKeyedSubscript:", v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v50, "count") >= 2)
          {
            v86 = (id)v48;
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            v51 = v50;
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
            if (v52)
            {
              v53 = v52;
              v54 = 0;
              v55 = *(_QWORD *)v92;
              do
              {
                for (j = 0; j != v53; ++j)
                {
                  if (*(_QWORD *)v92 != v55)
                    objc_enumerationMutation(v51);
                  v57 = objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "intValue");
                  v58 = objc_msgSend(v81, "pid");
                  if ((_DWORD)v57)
                    v59 = (_DWORD)v57 == v58;
                  else
                    v59 = 1;
                  if (!v59)
                  {
                    if ((v54 & 1) == 0)
                      objc_msgSend(v46, "appendString:", CFSTR(", shared with"));
                    objc_msgSend(*(id *)(v14 + 2024), "numberWithInt:", v57);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "objectForKeyedSubscript:", v60);
                    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    if (!v61)
                    {
                      v62 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", v57);
                      -[VMUProcInfo name](v62, "name");
                      v63 = objc_claimAutoreleasedReturnValue();
                      v64 = (void *)v63;
                      v65 = CFSTR("<unknown>");
                      if (v63)
                        v65 = (__CFString *)v63;
                      v61 = v65;

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v57);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v80, "setObject:forKeyedSubscript:", v61, v66);

                    }
                    v67 = objc_retainAutorelease(v61);
                    objc_msgSend(v46, "appendFormat:", CFSTR(" %s[%u]"), -[__CFString UTF8String](v67, "UTF8String"), v57);

                    v54 = 1;
                    v14 = 0x1E0CB3000;
                  }
                }
                v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
              }
              while (v53);
            }

            v41 = v75;
            v38 = obja;
            v40 = v79;
            v49 = v86;
          }
          v68 = (void *)v88[5];
          v88[5] = v46;

          v42 = v90;
        }
        ++v42;
      }
      while (v42 != v40);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
    }
    while (v40);
  }

  v11 = v70;
LABEL_67:

  objc_autoreleasePoolPop(context);
LABEL_68:
  v5 = v72;
LABEL_69:

}

uint64_t VMUTaskIsSelf()
{
  task_name_t *IsSelf_portOfCachedResult;
  task_name_t v1;
  unsigned __int8 *IsSelf_cachedResult;
  unsigned __int8 v3;

  IsSelf_portOfCachedResult = (task_name_t *)VMUTaskIsSelf_portOfCachedResult();
  if (*IsSelf_portOfCachedResult == v1)
  {
    IsSelf_cachedResult = (unsigned __int8 *)VMUTaskIsSelf_cachedResult();
  }
  else
  {
    *IsSelf_portOfCachedResult = v1;
    mach_task_is_self(v1);
    IsSelf_cachedResult = (unsigned __int8 *)VMUTaskIsSelf_cachedResult();
    *IsSelf_cachedResult = v3;
  }
  return *IsSelf_cachedResult;
}

uint64_t _determine_pthread_offsets(uint64_t (*a1)())
{
  id v2;
  void *v3;
  pthread_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  void *v7;
  void *v8;
  thread_inspect_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[2];
  uint64_t v18;
  uint64_t v19;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)gPthreadOffsets;
  gPthreadOffsets = (uint64_t)v2;

  v4 = pthread_self();
  v5 = 0;
  while (1)
  {
    v6 = *(uint64_t (**)())((char *)&v4->__sig + v5);
    if (v6 == _determine_pthread_offsets)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)gPthreadOffsets, "setObject:forKeyedSubscript:", v7, CFSTR("StartRoutineOffsetKey"));

      v6 = *(uint64_t (**)())((char *)&v4->__sig + v5);
    }
    if (v6 == a1)
      break;
    if (++v5 == 8184)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gPthreadOffsets, "setObject:forKeyedSubscript:", v8, CFSTR("StartRoutineArgumentOffsetKey"));

LABEL_8:
  *(_QWORD *)thread_info_out = 0;
  v18 = 0;
  v19 = 0;
  thread_info_outCnt = 6;
  v9 = MEMORY[0x1A85A9254]();
  thread_info(v9, 4u, thread_info_out, &thread_info_outCnt);
  v10 = v18;
  v11 = v18 - (_QWORD)v4 + 4088;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gPthreadOffsets, "setObject:forKeyedSubscript:", v12, CFSTR("FirstTLSslotKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gPthreadOffsets, "setObject:forKeyedSubscript:", v13, CFSTR("LastTLSslotKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", ((v10 + *MEMORY[0x1E0C85AD8] + 4087) & -*MEMORY[0x1E0C85AD8]) - (_QWORD)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gPthreadOffsets, "setObject:forKeyedSubscript:", v14, CFSTR("RegionEndOffsetKey"));

  return 0;
}

void sub_1A4D823A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

BOOL task_exists(void *a1)
{
  id v1;
  _BOOL8 v2;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;
  uint64_t v7;

  v1 = a1;
  if ((objc_msgSend(v1, "isCore") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v7 = 0;
    *(_OWORD *)task_info_out = 0u;
    v6 = 0u;
    task_info_outCnt = 10;
    v2 = objc_msgSend(v1, "taskPort")
      && objc_msgSend(v1, "taskPort") != -1
      && task_info(objc_msgSend(v1, "taskPort"), 0x12u, task_info_out, &task_info_outCnt) == 0;
  }

  return v2;
}

uint64_t _task_peek_transformer_function(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;

  if (!a3)
  {
    v5 = 0;
    v6 = 0;
    if (!a4)
      return v6;
    goto LABEL_6;
  }
  v5 = (*(uint64_t (**)(void))(s_peekBlock + 16))();
  if (v5)
    v6 = 0;
  else
    v6 = 5;
  if (a4)
LABEL_6:
    *a4 = v5;
  return v6;
}

void _withPeekTransformerFunctionForMemoryReader(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  if (_withPeekTransformerFunctionForMemoryReader_s_onceToken != -1)
    dispatch_once(&_withPeekTransformerFunctionForMemoryReader_s_onceToken, &__block_literal_global_66);
  v5 = _withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___withPeekTransformerFunctionForMemoryReader_block_invoke_2;
  block[3] = &unk_1E4E00930;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_sync(v5, block);

}

void ___withPeekTransformerFunctionForMemoryReader_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("task peeking transformer guard queue", 0);
  v1 = (void *)_withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard;
  _withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard = (uint64_t)v0;

}

void ___withPeekTransformerFunctionForMemoryReader_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = MEMORY[0x1A85A995C](*(_QWORD *)(a1 + 32));
  v3 = (void *)s_peekBlock;
  s_peekBlock = v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)s_peekBlock;
  s_peekBlock = 0;

}

void sub_1A4D83A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t failingPeekFunction()
{
  return 5;
}

uint64_t _pointerRecorderBlockContextAdapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_1A4D85848(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D88DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _debugSwiftAsyncPrintfIsEnabled()
{
  if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1)
    dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_163);
  return _debugSwiftAsyncPrintfIsEnabled_enabled;
}

const char *___debugSwiftAsyncPrintfIsEnabled_block_invoke()
{
  const char *result;
  const char *v1;

  result = getenv("SYMBOLICATION_DEBUG_SWIFT_ASYNC");
  if (result)
  {
    v1 = result;
    result = (const char *)strcmp(result, "YES");
    if (!(_DWORD)result || (result = (const char *)strcmp(v1, "1"), !(_DWORD)result))
      _debugSwiftAsyncPrintfIsEnabled_enabled = 1;
  }
  return result;
}

uint64_t _debugSwiftAsyncPrintf(int a1, char *a2, ...)
{
  int v3;
  FILE **v4;
  va_list va;

  va_start(va, a2);
  if (a1)
  {
    v3 = a1;
    v4 = (FILE **)MEMORY[0x1E0C80C10];
    do
    {
      fwrite("  ", 2uLL, 1uLL, *v4);
      --v3;
    }
    while (v3);
  }
  return vfprintf((FILE *)*MEMORY[0x1E0C80C10], a2, va);
}

void sub_1A4D8B394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A4D8C7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D8E304(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D90250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a67;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Unwind_Resume(a1);
}

void sub_1A4D92748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___unmapRegion_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;

  v12 = 0;
  v13 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "unmapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(**(_QWORD **)(a1 + 48) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), &v13, &v12);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 48);
    result = fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to deallocate mapped region %#llx-%#llx[%llu] with local addresses %p-%p[%llu]\n", *(_QWORD *)(*(_QWORD *)v3 + 8), *(_QWORD *)(*(_QWORD *)v3 + 16) + *(_QWORD *)(*(_QWORD *)v3 + 8), *(_QWORD *)(*(_QWORD *)v3 + 16), *(const void **)(v3 + 48), (const void *)(*(_QWORD *)(v3 + 48) + *(_QWORD *)(v3 + 40)), *(_QWORD *)(v3 + 40));
LABEL_3:
    v4 = *(_QWORD **)(a1 + 48);
    v4[5] = 0;
    v4[6] = 0;
    v4[7] = 0;
    return result;
  }
  if (!v13)
    goto LABEL_3;
  result = objc_msgSend(*(id *)(a1 + 40), "flushRemoteMirrorMemoryCacheEntryForAddress:", *(_QWORD *)(**(_QWORD **)(a1 + 48) + 8));
  v5 = *(_QWORD **)(a1 + 48);
  for (i = *(_QWORD *)(a1 + 56); (unint64_t)v5 > i; v5 -= 8)
  {
    if (v13 >= *(_QWORD *)(*v5 + 8))
      break;
  }
  v7 = v12;
  if (v12)
  {
    do
    {
      v5[5] = 0;
      v5[6] = 0;
      v5[7] = 0;
      v8 = *v5;
      v5 += 8;
      v9 = *(_QWORD *)(v8 + 16);
      v10 = v7 >= v9;
      v7 -= v9;
      v11 = v7 != 0 && v10;
      if (!v10)
        v7 = 0;
    }
    while (v11);
  }
  return result;
}

void sub_1A4D9455C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t _pointerRecorderBlockContextAdapter_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_1A4D98F1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D9B560(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D9B754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D9CF4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D9EA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1A4DA0890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___unmapRegion_block_invoke_0(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;

  v12 = 0;
  v13 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "unmapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)(**(_QWORD **)(a1 + 40) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), &v13, &v12);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 40);
    result = fprintf((FILE *)*MEMORY[0x1E0C80C10], "Failed to deallocate mapped region %#llx-%#llx[%llu] with local addresses %p-%p[%llu]\n", *(_QWORD *)(*(_QWORD *)v3 + 8), *(_QWORD *)(*(_QWORD *)v3 + 16) + *(_QWORD *)(*(_QWORD *)v3 + 8), *(_QWORD *)(*(_QWORD *)v3 + 16), *(const void **)(v3 + 48), (const void *)(*(_QWORD *)(v3 + 48) + *(_QWORD *)(v3 + 40)), *(_QWORD *)(v3 + 40));
LABEL_3:
    v4 = *(_QWORD **)(a1 + 40);
    v4[5] = 0;
    v4[6] = 0;
    v4[7] = 0;
    return result;
  }
  if (!v13)
    goto LABEL_3;
  v5 = *(_QWORD **)(a1 + 40);
  for (i = *(_QWORD *)(a1 + 48); (unint64_t)v5 > i; v5 -= 8)
  {
    if (v13 >= *(_QWORD *)(*v5 + 8))
      break;
  }
  v7 = v12;
  if (v12)
  {
    do
    {
      v5[5] = 0;
      v5[6] = 0;
      v5[7] = 0;
      v8 = *v5;
      v5 += 8;
      v9 = *(_QWORD *)(v8 + 16);
      v10 = v7 >= v9;
      v7 -= v9;
      v11 = v7 != 0 && v10;
      if (!v10)
        v7 = 0;
    }
    while (v11);
  }
  return result;
}

char *___shouldScanVMregion_block_invoke()
{
  char *result;

  result = getenv("SCAN_VM_REGIONS_WITH_UNKNOWN_PATHS");
  _shouldScanVMregion_scanVMRegionWithUnknownPathsEnvVar = (uint64_t)result;
  return result;
}

unint64_t VMUUnionRange(unint64_t result, uint64_t a2, unint64_t a3)
{
  if (result >= a3)
    return a3;
  return result;
}

unint64_t VMUIntersectionRange(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;

  if (a3 > result || result >= a3 + a4)
  {
    if (a3 < result + a2)
      v4 = a3;
    else
      v4 = 0;
    if (result <= a3)
      return v4;
    else
      return 0;
  }
  return result;
}

BOOL VMURangeIntersectsOrAbutsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3)
    return a3 + a4 >= a1;
  else
    return a1 + a2 >= a3;
}

uint64_t VMURangeDescription(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx-%#llx[%llu]"), a1, a1 + a2, a2);
}

void sub_1A4DA1750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DA17B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)VMUSymbolStore;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1A4DA1908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DA1B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DA1C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DA1D20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *_uuidStringForOwner@<X0>(_CSTypeRef a1@<0:X0, 8:X1>, _QWORD *a2@<X8>)
{
  uint64_t CFUUIDBytes;
  char *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (!CFUUIDBytes || (v4 = (char *)v6, (MEMORY[0x1A85A8B88](CFUUIDBytes, v6, 40) & 1) == 0))
    v4 = "<null-uuid>";
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

void sub_1A4DA1EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  void *v29;
  void *v30;

  v30 = v29;

  _Block_object_dispose(&a22, 8);
  if (__p)
  {
    a29 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1A4DA2158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va1);
  if (*(char *)(v4 - 49) < 0)
    operator delete(*(void **)(v4 - 72));
  _Unwind_Resume(a1);
}

uint64_t _sparsifySymbolOwner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t SymbolWithAddress;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t SparseDataWithBlock;
  void *v21;
  void *v22;
  uint64_t v23;
  void *__p;
  char *v25;
  char *v26;

  __p = 0;
  v25 = 0;
  v26 = 0;
  v3 = *(_QWORD **)(a3 + 16);
  if (v3)
  {
    do
    {
      SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress();
      v6 = v5;
      if ((CSIsNull() & 1) == 0)
      {
        v7 = v25;
        if (v25 >= v26)
        {
          v9 = (char *)__p;
          v10 = (v25 - (_BYTE *)__p) >> 4;
          v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 60)
            std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
          v12 = v26 - (_BYTE *)__p;
          if ((v26 - (_BYTE *)__p) >> 3 > v11)
            v11 = v12 >> 3;
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
            v13 = 0xFFFFFFFFFFFFFFFLL;
          else
            v13 = v11;
          if (v13)
          {
            v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)&v26, v13);
            v9 = (char *)__p;
            v7 = v25;
          }
          else
          {
            v14 = 0;
          }
          v15 = (uint64_t *)&v14[16 * v10];
          *v15 = SymbolWithAddress;
          v15[1] = v6;
          v16 = v15;
          if (v7 != v9)
          {
            do
            {
              *((_OWORD *)v16 - 1) = *((_OWORD *)v7 - 1);
              v16 -= 2;
              v7 -= 16;
            }
            while (v7 != v9);
            v9 = (char *)__p;
          }
          v8 = (char *)(v15 + 2);
          __p = v16;
          v25 = (char *)(v15 + 2);
          v26 = &v14[16 * v13];
          if (v9)
            operator delete(v9);
        }
        else
        {
          *(_QWORD *)v25 = SymbolWithAddress;
          *((_QWORD *)v7 + 1) = v6;
          v8 = v7 + 16;
        }
        v25 = v8;
      }
      v3 = (_QWORD *)*v3;
    }
    while (v3);
    v17 = __p;
    v18 = (uint64_t)v25;
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  v22 = 0;
  v23 = 0;
  v21 = 0;
  std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>(&v21, v17, v18, (v18 - (uint64_t)v17) >> 4);
  SparseDataWithBlock = CSSymbolOwnerCreateSparseDataWithBlock();
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
  if (__p)
  {
    v25 = (char *)__p;
    operator delete(__p);
  }
  return SparseDataWithBlock;
}

void sub_1A4DA2384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

void sub_1A4DA2498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DA25D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va1);
  if (*(char *)(v2 - 49) < 0)
    operator delete(*(void **)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A4DA2B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1A4DA2D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1A4DA2E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1A4DA2FBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;

  if (*(char *)(v20 - 33) < 0)
    operator delete(*(void **)(v20 - 56));
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_ea8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

void sub_1A4DA35BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
  void *v46;
  void *v47;

  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_1A4DA378C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1A4DA389C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1A4DA3A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4DFF6C8, MEMORY[0x1E0DE42D0]);
}

void sub_1A4DA3BF8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

BOOL ___ZL20_sparsifySymbolOwner10_CSTypeRefNSt3__113unordered_setIyNS0_4hashIyEENS0_8equal_toIyEENS0_9allocatorIyEEEE_block_invoke(uint64_t a1, unint64_t a2, _OWORD *a3)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (*(_QWORD *)(a1 + 40) - v3) >> 4;
  if (v4 > a2)
    *a3 = *(_OWORD *)(v3 + 16 * a2);
  return v4 <= a2;
}

_QWORD *__copy_helper_block_ea8_32c52_ZTSNSt3__16vectorI10_CSTypeRefNS_9allocatorIS1_EEEE(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v2 = (_QWORD *)(a1 + 32);
  v2[2] = 0;
  return std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>(v2, *(const void **)(a2 + 32), *(_QWORD *)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 4);
}

void __destroy_helper_block_ea8_32c52_ZTSNSt3__16vectorI10_CSTypeRefNS_9allocatorIS1_EEEE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(_QWORD *)(a1 + 40) = v2;
    operator delete(v2);
  }
}

_QWORD *std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<_CSTypeRef>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A4DA3D10(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<_CSTypeRef>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1A4DA3FB8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  char *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v29[2];
  char v30;

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = (char *)operator new(0x50uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = v10;
  v18 = *a4;
  v19 = **a4;
  *((_QWORD *)v17 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  *(_OWORD *)(v17 + 40) = 0u;
  *(_OWORD *)(v17 + 56) = 0u;
  *((_DWORD *)v17 + 18) = 1065353216;
  v30 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v26)
  {
    *(_QWORD *)v29[0] = *v26;
    *v26 = v29[0];
  }
  else
  {
    *(_QWORD *)v29[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v29[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v29[0])
    {
      v27 = *(_QWORD *)(*(_QWORD *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11)
          v27 %= v11;
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = v29[0];
    }
  }
  i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)v29, 0);
  return i;
}

void sub_1A4DA4498(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>(uint64_t a1)
{
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::unordered_set<unsigned long long>::unordered_set(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(a1, i + 2, i + 2);
  return a1;
}

void sub_1A4DA4BD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1A4DA4DF4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_1A4DA51D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;
  double result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x50uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  result = 0.0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *((_DWORD *)v8 + 18) = 1065353216;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1A4DA527C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

id VMUVMLedgerNameForTag(unint64_t a1)
{
  id v1;

  if (a1 > 5)
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("VM ledger tag %llu"), a1);
  else
    v1 = gVMLedgerNames[a1];
  return v1;
}

id VMUGatherOwnedVmObjects(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  size_t v31;
  size_t v32;

  v1 = a1;
  v32 = 0;
  objc_msgSend(v1, "memoryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:]((uint64_t)v2, 0, &v32);

  v4 = 0;
  if (!v3)
  {
    v5 = v32;
    if (v32)
    {
      v6 = 0;
      v31 = 0;
      do
      {
        v5 += 896;
        v6 = (unint64_t *)malloc_type_realloc(v6, v5, 0x8FC1A16uLL);
        v31 = v5;
        objc_msgSend(v1, "memoryCache");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:]((uint64_t)v7, v6, &v31);

        if (v8)
        {
          v4 = 0;
          goto LABEL_12;
        }
      }
      while (v5 == v31);
      v4 = (void *)objc_opt_new();
      if (v31)
      {
        if (v31 > 7)
        {
          if (v31 - 8 >= 56 * *v6)
          {
            if (*v6)
            {
              v26 = 0;
              v27 = (uint64_t *)(v6 + 1);
              do
              {
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v27, 56);
                v29 = *v27;
                v27 += 7;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, v30);

                ++v26;
              }
              while (v26 < *v6);
            }
          }
          else
          {
            v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v18)
              VMUGatherOwnedVmObjects_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
          }
        }
        else
        {
          v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v9)
            VMUGatherOwnedVmObjects_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
LABEL_12:
      free(v6);
    }
    else
    {
      v4 = (void *)objc_opt_new();
    }
  }

  return v4;
}

uint64_t VMUFootprintForVmObject(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  unsigned int v3;
  int v4;
  uint64_t v6;

  v3 = *(unsigned __int8 *)(result + 48);
  if ((v3 & 1) != 0)
  {
    v6 = 0;
    *a2 = 0;
  }
  else
  {
    v4 = (v3 >> 4) & 3;
    if (v4 == 3 || v4 == 0)
    {
      *a2 = *(_QWORD *)(result + 16) - *(_QWORD *)(result + 32);
      v6 = *(_QWORD *)(result + 40);
    }
    else
    {
      v6 = 0;
      *a2 = *(_QWORD *)(result + 24);
    }
  }
  *a3 = v6;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id _removeReturnValueFromCPlusPlusSymbolName(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  id v4;

  v1 = a1;
  if (objc_msgSend(v1, "containsString:", CFSTR("::")))
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__1::"), &stru_1E4E04720);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v2, "hasPrefix:", CFSTR("invocation function ")) & 1) != 0
      || (objc_msgSend(v2, "hasPrefix:", CFSTR("operator ")) & 1) != 0
      || (v3 = _lengthOfSubclauseInCPlusPlusSymbolName(v2, 0, 0, 1)) == 0)
    {
      v1 = v2;
    }
    else
    {
      objc_msgSend(v2, "substringFromIndex:", v3);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v4 = v1;

  return v4;
}

id _removeStdArgumentsFromCPlusPlusSymbolName(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  unint64_t j;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "containsString:", CFSTR("std::")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = objc_msgSend(&unk_1E4E206A0, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v15 != v4)
            objc_enumerationMutation(&unk_1E4E206A0);
          v6 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v7 = objc_msgSend(v1, "rangeOfString:", v6);
          if (v7 != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (j = v7; j != 0x7FFFFFFFFFFFFFFFLL; j = objc_msgSend(v1, "rangeOfString:", v6))
            {
              v9 = _lengthOfSubclauseInCPlusPlusSymbolName(v1, j, 1, 0);
              if (v9)
              {
                objc_msgSend(v1, "substringWithRange:", j, v9);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", v10, &stru_1E4E04720);
                v11 = objc_claimAutoreleasedReturnValue();

                v1 = (id)v11;
              }
            }
          }
        }
        v3 = objc_msgSend(&unk_1E4E206A0, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v3);
    }
  }
  v12 = v1;

  return v12;
}

void _printCPlusPlusNameSimplification(void *a1, void *a2)
{
  id v3;
  FILE **v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (_printCPlusPlusNameSimplification_onceToken != -1)
    dispatch_once(&_printCPlusPlusNameSimplification_onceToken, &__block_literal_global_413);
  if (_printCPlusPlusNameSimplification_printCPlusPlusNameSimplification == 1
    && (objc_msgSend(v5, "isEqualToString:", v3) & 1) == 0)
  {
    v4 = (FILE **)MEMORY[0x1E0C80C10];
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "ORIGINAL: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    fprintf(*v4, " SIMPLER: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    fputc(10, *v4);
  }

}

id VMUSimplifyCPlusPlusSymbolName(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _removeReturnValueFromCPlusPlusSymbolName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _removeStdArgumentsFromCPlusPlusSymbolName(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _printCPlusPlusNameSimplification(v1, v3);
  return v3;
}

unint64_t _lengthOfSubclauseInCPlusPlusSymbolName(void *a1, unint64_t a2, int a3, char a4)
{
  id v7;
  unint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a1;
  if (objc_msgSend(v7, "length") <= a2)
  {
LABEL_19:
    v15 = 0;
    goto LABEL_20;
  }
  v8 = 0;
  v9 = 0;
  v10 = a3 ^ 1;
  v11 = a2;
  while (1)
  {
    v12 = objc_msgSend(v7, "characterAtIndex:", v11);
    if (v9)
      v13 = 0;
    else
      v13 = v10;
    if (v13 == 1 && v12 == 32)
    {
      v9 = 0;
      v8 = v11 + 1;
      goto LABEL_16;
    }
    if (!v9 && v12 == 40)
      goto LABEL_17;
    if (v12 != 62)
    {
      if (v12 == 60)
      {
        v14 = v8;
        if (v8)
          goto LABEL_28;
        ++v9;
      }
      goto LABEL_16;
    }
    if (!--v9)
      break;
LABEL_16:
    if (++v11 >= objc_msgSend(v7, "length"))
      goto LABEL_17;
  }
  v14 = v11 + 1;
  if (v11 + 1 < objc_msgSend(v7, "length") && objc_msgSend(v7, "characterAtIndex:", v11 + 1) == 38)
    v14 = v11 + 2;
  if (v14 < objc_msgSend(v7, "length") && objc_msgSend(v7, "characterAtIndex:", v14) == 32)
  {
    ++v14;
LABEL_28:
    v15 = v14 - a2;
    goto LABEL_20;
  }
  if ((a4 & 1) == 0)
    goto LABEL_28;
LABEL_17:
  if (!v8)
    goto LABEL_19;
  v15 = v8 - a2;
LABEL_20:

  return v15;
}

char *___printCPlusPlusNameSimplification_block_invoke()
{
  char *result;

  result = getenv("DT_PRINT_NAME_SIMPLIFICATION");
  if (result)
  {
    if ((*result | 0x20) != 0x6E)
      _printCPlusPlusNameSimplification_printCPlusPlusNameSimplification = 1;
  }
  return result;
}

void sub_1A4DA9748(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x270], 8);
  _Unwind_Resume(a1);
}

void sub_1A4DA9B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1A4DAAF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t _parseAllocationSizeBound(const char **__endptr)
{
  char v2;
  uint64_t result;
  int v4;

  v2 = 10;
  result = strtoll(*__endptr, (char **)__endptr, 10);
  v4 = **__endptr & 0xDF;
  if (v4 != 75)
  {
    if (v4 != 77)
      return result;
    v2 = 20;
  }
  result <<= v2;
  ++*__endptr;
  return result;
}

void sub_1A4DACD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A4DACF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DACFCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DAD22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26)
{
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;

  _Block_object_dispose(&a19, 8);
  if (__p)
  {
    a26 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v28 - 136), 8);
  v30 = *(void **)(v28 - 88);
  if (v30)
  {
    *(_QWORD *)(v28 - 80) = v30;
    operator delete(v30);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__3(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

__n128 __Block_byref_object_copy__11(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1A4DAD870(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A4DAD974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DAE034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, void *a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  void *v44;
  void *v45;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4DAE1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_1A4DAE254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DAE4C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DAED7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  small_objc_portable_task_crash_info_t::~small_objc_portable_task_crash_info_t((id *)va);
  _Unwind_Resume(a1);
}

void small_objc_portable_task_crash_info_t::~small_objc_portable_task_crash_info_t(id *this)
{

}

void sub_1A4DAF178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DAF5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A4DAF6BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DAF7DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A4DAF8A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DAFE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t _compareBinaryImageDicts(objc_object *a1, objc_object *a2, void *a3)
{
  objc_object *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  -[objc_object objectForKey:](a1, "objectForKey:", CFSTR("StartAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  -[objc_object objectForKey:](v4, "objectForKey:", CFSTR("StartAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  v9 = 1;
  if (v6 <= v8)
    v9 = -1;
  if (v6 == v8)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

void sub_1A4DAFF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DB008C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DB02D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A4DB08B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A4DB0CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A4DB0E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DB0E8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DB0FB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A4DB1074(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DB116C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A4DB1518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,void *a26,int a27,uint64_t a28,void *a29)
{
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;

  if (v32)

  if (v34)
  {

  }
  if (v30)

  if (a23)
  if (a25)

  if (a27)
  if (a28)

  _Unwind_Resume(a1);
}

void sub_1A4DB1644()
{
  JUMPOUT(0x1A4DB1624);
}

void sub_1A4DB174C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A4DB19E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DB1A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VMUProcessDescription;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

id VMUOptionParserError(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
    v12 = (void *)v11;
    if (v11)
    {
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VMUOptionParserDomain"), a1, v13, &a9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void _arrayFreeValue(int a1, void *a2)
{
  if (a2)
    free(a2);
}

void VMUOptionParserRegisterFlag(void *a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a1;
  v10 = a5;
  if (!v10)
    goto LABEL_16;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    if (a4)
      goto LABEL_5;
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  if (!a3)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
    goto LABEL_8;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __VMUOptionParserRegisterFlag_block_invoke;
  v14[3] = &unk_1E4E01600;
  v15 = v10;
  objc_msgSend(v9, "registerOptionWithLongName:shortName:argumentKind:argumentName:optionDescription:handler:", v11, v12, 0, 0, v13, v14);
  if (a4)

  if (a3)
  if (a2)

LABEL_16:
}

void VMUOptionParserRegisterFlagInternal(void *a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a1;
  v10 = a5;
  if (!v10)
    goto LABEL_16;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    if (a4)
      goto LABEL_5;
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  if (!a3)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
    goto LABEL_8;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __VMUOptionParserRegisterFlagInternal_block_invoke;
  v14[3] = &unk_1E4E01600;
  v15 = v10;
  objc_msgSend(v9, "registerOptionWithLongName:shortName:argumentKind:argumentName:optionDescription:flags:handler:", v11, v12, 0, 0, v13, 1, v14);
  if (a4)

  if (a3)
  if (a2)

LABEL_16:
}

void VMUSetCrashReporterInfo(void *a1)
{
  id v2;

  v2 = a1;
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&crashreporterInfoLock);
    objc_storeStrong((id *)&gVMUCrashLogMessage, a1);
    qword_1ED09E6E8 = objc_msgSend((id)gVMUCrashLogMessage, "UTF8String");
    os_unfair_lock_unlock((os_unfair_lock_t)&crashreporterInfoLock);
  }
  else
  {
    VMUClearCrashReporterInfo();
  }

}

void VMUClearCrashReporterInfo()
{
  void *v0;

  if (gVMUCrashLogMessage)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&crashreporterInfoLock);
    qword_1ED09E6E8 = 0;
    v0 = (void *)gVMUCrashLogMessage;
    gVMUCrashLogMessage = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&crashreporterInfoLock);
  }
}

_QWORD *vmu_swift_reflection_createReflectionContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;

  v12 = malloc_type_calloc(0x58uLL, 1uLL, 0x391CAB93uLL);
  *v12 = a1;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  v12[5] = a6;
  v12[10] = CFDictionaryCreateMutable(0, 0, 0, 0);
  return v12;
}

uint64_t vmu_swift_reflection_interop_addLibrary(_QWORD *a1, void *a2)
{
  char *v4;
  char *v5;
  int v6;
  char *v7;
  uint64_t result;
  void *v9;
  _BOOL4 v10;
  char *v11;
  char *v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unsigned __int8 v19;

  v4 = (char *)malloc_type_realloc((void *)a1[6], 288 * *((int *)a1 + 14) + 288, 0x637C0AE7uLL);
  a1[6] = v4;
  if (!a2)
    return 0;
  v5 = v4;
  v6 = *((_DWORD *)a1 + 14);
  v7 = &v4[288 * v6];
  *((_QWORD *)v7 + 1) = dlsym(a2, "swift_reflection_classIsSwiftMask");
  result = (uint64_t)dlsym(a2, "swift_reflection_getSupportedMetadataVersion");
  *((_QWORD *)v7 + 2) = result;
  if (!result)
    return result;
  if (((unsigned int (*)(void))result)() < 3)
    return 0;
  v9 = dlsym(a2, "swift_reflection_addImage");
  v10 = v9 == 0;
  result = (uint64_t)dlsym(a2, "swift_reflection_createReflectionContext");
  v11 = &v5[288 * v6];
  if (v9)
  {
    *((_QWORD *)v11 + 3) = result;
    if (!result)
      return result;
    result = (uint64_t)dlsym(a2, "swift_reflection_addReflectionInfo");
    *(_QWORD *)&v5[288 * v6 + 56] = result;
    if (!result)
      return result;
    result = (uint64_t)dlsym(a2, "swift_reflection_addImage");
    *(_QWORD *)&v5[288 * v6 + 72] = result;
    if (!result)
      return result;
    result = (uint64_t)dlsym(a2, "swift_reflection_ownsObject");
    *(_QWORD *)&v5[288 * v6 + 96] = result;
    if (!result)
      return result;
    result = (uint64_t)dlsym(a2, "swift_reflection_ownsAddress");
    *(_QWORD *)&v5[288 * v6 + 104] = result;
    if (!result)
      return result;
    result = (uint64_t)dlsym(a2, "swift_reflection_metadataForObject");
    *(_QWORD *)&v5[288 * v6 + 112] = result;
    if (!result)
      return result;
    *(_QWORD *)&v5[288 * v6 + 32] = dlsym(a2, "swift_reflection_createReflectionContextWithDataLayout");
  }
  else
  {
    *((_QWORD *)v11 + 5) = result;
    if (!result)
      return result;
    result = (uint64_t)dlsym(a2, "swift_reflection_addReflectionInfo");
    *(_QWORD *)&v5[288 * v6 + 64] = result;
    if (!result)
      return result;
  }
  result = (uint64_t)dlsym(a2, "swift_reflection_destroyReflectionContext");
  *(_QWORD *)&v5[288 * v6 + 48] = result;
  if (result)
  {
    result = (uint64_t)dlsym(a2, "swift_reflection_readIsaMask");
    *(_QWORD *)&v5[288 * v6 + 80] = result;
    if (result)
    {
      result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForMetadata");
      *(_QWORD *)&v5[288 * v6 + 88] = result;
      if (result)
      {
        result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForInstance");
        *(_QWORD *)&v5[288 * v6 + 120] = result;
        if (result)
        {
          result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForMangledTypeName");
          *(_QWORD *)&v5[288 * v6 + 128] = result;
          if (result)
          {
            v12 = &v5[288 * v6];
            *((_QWORD *)v12 + 17) = dlsym(a2, "swift_reflection_copyDemangledNameForTypeRef");
            result = (uint64_t)dlsym(a2, "swift_reflection_infoForTypeRef");
            *((_QWORD *)v12 + 20) = result;
            if (result)
            {
              result = (uint64_t)dlsym(a2, "swift_reflection_childOfTypeRef");
              *(_QWORD *)&v5[288 * v6 + 168] = result;
              if (result)
              {
                result = (uint64_t)dlsym(a2, "swift_reflection_infoForMetadata");
                *(_QWORD *)&v5[288 * v6 + 176] = result;
                if (result)
                {
                  result = (uint64_t)dlsym(a2, "swift_reflection_childOfMetadata");
                  *(_QWORD *)&v5[288 * v6 + 184] = result;
                  if (result)
                  {
                    result = (uint64_t)dlsym(a2, "swift_reflection_infoForInstance");
                    *(_QWORD *)&v5[288 * v6 + 192] = result;
                    if (result)
                    {
                      result = (uint64_t)dlsym(a2, "swift_reflection_childOfInstance");
                      *(_QWORD *)&v5[288 * v6 + 200] = result;
                      if (result)
                      {
                        result = (uint64_t)dlsym(a2, "swift_reflection_genericArgumentCountOfTypeRef");
                        *(_QWORD *)&v5[288 * v6 + 208] = result;
                        if (result)
                        {
                          result = (uint64_t)dlsym(a2, "swift_reflection_genericArgumentOfTypeRef");
                          *(_QWORD *)&v5[288 * v6 + 216] = result;
                          if (result)
                          {
                            result = (uint64_t)dlsym(a2, "swift_reflection_projectExistential");
                            *(_QWORD *)&v5[288 * v6 + 224] = result;
                            if (result)
                            {
                              v13 = &v5[288 * v6];
                              *((_QWORD *)v13 + 29) = dlsym(a2, "swift_reflection_projectEnumValue");
                              *((_QWORD *)v13 + 18) = dlsym(a2, "swift_reflection_asyncTaskSlabPointer");
                              *((_QWORD *)v13 + 19) = dlsym(a2, "swift_reflection_asyncTaskSlabAllocations");
                              result = (uint64_t)dlsym(a2, "swift_reflection_dumpTypeRef");
                              *((_QWORD *)v13 + 30) = result;
                              if (result)
                              {
                                result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForTypeRef");
                                *(_QWORD *)&v5[288 * v6 + 248] = result;
                                if (result)
                                {
                                  result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForInstance");
                                  *(_QWORD *)&v5[288 * v6 + 264] = result;
                                  if (result)
                                  {
                                    result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForMetadata");
                                    *(_QWORD *)&v5[288 * v6 + 256] = result;
                                    if (result)
                                    {
                                      *(_DWORD *)&v5[288 * v6 + 280] = v10;
                                      v14 = *((_DWORD *)a1 + 14);
                                      *((_DWORD *)a1 + 14) = v14 + 1;
                                      v15 = a1[6];
                                      v16 = v15 + 288 * v14;
                                      if (*(_DWORD *)(v16 + 280))
                                      {
                                        v17 = (*(uint64_t (**)(_QWORD *, uint64_t (*)(), uint64_t (*)(), uint64_t (*)(_QWORD *, uint64_t, void *, size_t), uint64_t (*)(uint64_t), uint64_t (*)(uint64_t)))(v15 + 288 * v14 + 40))(a1, swift_reflection_interop_getSizeAdapter, swift_reflection_interop_getSizeAdapter, swift_reflection_interop_readBytesAdapter, swift_reflection_interop_GetStringLengthAdapter, swift_reflection_interop_GetSymbolAddressAdapter);
                                      }
                                      else
                                      {
                                        v18 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v15 + 288 * v14 + 32);
                                        if (v18)
                                        {
                                          v17 = v18(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
                                        }
                                        else
                                        {
                                          v19 = 0;
                                          if (!((unsigned int (*)(_QWORD, _QWORD, _QWORD, unsigned __int8 *))a1[1])(*a1, 0, 0, &v19))abort();
                                          v17 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v15 + 288 * v14 + 24))(*a1, v19, a1[2], a1[3], a1[4], a1[5]);
                                        }
                                      }
                                      *(_QWORD *)v16 = v17;
                                      return 1;
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
      }
    }
  }
  return result;
}

void vmu_swift_reflection_destroyReflectionContext(int *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = (_QWORD *)*((_QWORD *)a1 + 6);
  if (a1[14] >= 1)
  {
    do
    {
      ((void (*)(_QWORD))v2[6])(*v2);
      v2 += 36;
    }
    while ((unint64_t)v2 < *((_QWORD *)a1 + 6) + 288 * a1[14]);
    v2 = (_QWORD *)*((_QWORD *)a1 + 6);
  }
  free(v2);
  v3 = (_QWORD *)*((_QWORD *)a1 + 9);
  if (v3)
  {
    do
    {
      v4 = (_QWORD *)*v3;
      free(v3);
      v3 = v4;
    }
    while (v4);
  }
  v5 = (_QWORD *)*((_QWORD *)a1 + 8);
  if (v5)
  {
    do
    {
      (*((void (**)(_QWORD, _QWORD, _QWORD))a1 + 2))(*(_QWORD *)a1, v5[1], v5[2]);
      v6 = (_QWORD *)*v5;
      free(v5);
      v5 = v6;
    }
    while (v6);
  }
  CFRelease(*((CFTypeRef *)a1 + 10));
  free(a1);
}

uint64_t vmu_swift_reflection_addImage(int *a1, unint64_t a2)
{
  unint64_t v4;
  const mach_header_64 *v5;
  const mach_header_64 *v6;
  uint64_t sizeofcmds;
  void (*v8)(_QWORD, const mach_header_64 *, _QWORD);
  const mach_header_64 *v9;
  uint8_t *v10;
  void (*v11)(_QWORD, const mach_header_64 *, _QWORD);
  const mach_header_64 *v12;
  uint8_t *v13;
  uint8_t *v14;
  uint8_t *v15;
  uint8_t *v16;
  uint8_t *v17;
  uint8_t *v18;
  uint8_t *v19;
  uint8_t *v20;
  uint8_t *v21;
  uint8_t *v22;
  uint8_t *v23;
  unint64_t v24;
  void (*v25)(uint64_t, unint64_t *);
  uint64_t v26;
  uint8_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  void (*v30)(uint64_t, const mach_header_64 *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39[14];
  unint64_t size;
  _QWORD v41[2];

  if (a1[14] < 1)
    return 0;
  v4 = *((_QWORD *)a1 + 6);
  while (1)
  {
    if (!*(_DWORD *)(v4 + 280))
    {
      LODWORD(v5) = (*(uint64_t (**)(_QWORD, unint64_t))(v4 + 72))(*(_QWORD *)v4, a2);
LABEL_29:
      if ((_DWORD)v5)
        return 1;
      goto LABEL_30;
    }
    v41[0] = 0;
    v5 = (const mach_header_64 *)(*((uint64_t (**)(_QWORD, unint64_t, uint64_t, _QWORD *))a1 + 3))(*(_QWORD *)a1, a2, 32, v41);
    if (!v5)
      goto LABEL_29;
    v6 = v5;
    if (v5->magic >> 1 == 2138504551)
      break;
    v30 = (void (*)(uint64_t, const mach_header_64 *, uint64_t))*((_QWORD *)a1 + 2);
    if (v30)
    {
      v31 = *(_QWORD *)a1;
      v32 = v41[0];
LABEL_34:
      v30(v31, v6, v32);
    }
LABEL_30:
    v4 += 288;
    if (v4 >= *((_QWORD *)a1 + 6) + 288 * a1[14])
      return 0;
  }
  sizeofcmds = v5->sizeofcmds;
  v8 = (void (*)(_QWORD, const mach_header_64 *, _QWORD))*((_QWORD *)a1 + 2);
  if (v8)
    v8(*(_QWORD *)a1, v5, v41[0]);
  v5 = (const mach_header_64 *)(*((uint64_t (**)(_QWORD, unint64_t, uint64_t, _QWORD *))a1 + 3))(*(_QWORD *)a1, a2, sizeofcmds, v41);
  if (!v5)
    goto LABEL_29;
  v9 = v5;
  size = 0;
  v10 = getsegmentdata(v5, "__TEXT", &size);
  v11 = (void (*)(_QWORD, const mach_header_64 *, _QWORD))*((_QWORD *)a1 + 2);
  if (v11)
    v11(*(_QWORD *)a1, v9, v41[0]);
  if (!v10)
    goto LABEL_30;
  v5 = (const mach_header_64 *)(*((uint64_t (**)(_QWORD, unint64_t, unint64_t, _QWORD *))a1 + 3))(*(_QWORD *)a1, a2, v10 - (uint8_t *)v9 + size, v41);
  if (!v5)
    goto LABEL_29;
  v12 = v5;
  v39[0] = 0;
  v13 = getsectiondata(v5, "__TEXT", "__swift3_fieldmd", v39);
  v14 = &v13[v39[0]];
  if (!v13)
    v14 = 0;
  v38 = (unint64_t)v14;
  v39[0] = 0;
  v15 = getsectiondata(v12, "__TEXT", "__swift3_assocty", v39);
  v16 = &v15[v39[0]];
  if (!v15)
    v16 = 0;
  v37 = (unint64_t)v16;
  v39[0] = 0;
  v17 = getsectiondata(v12, "__TEXT", "__swift3_builtin", v39);
  v18 = &v17[v39[0]];
  if (!v17)
    v18 = 0;
  v36 = (unint64_t)v18;
  v39[0] = 0;
  v19 = getsectiondata(v12, "__TEXT", "__swift3_capture", v39);
  v20 = &v19[v39[0]];
  if (!v19)
    v20 = 0;
  v35 = (unint64_t)v20;
  v39[0] = 0;
  v21 = getsectiondata(v12, "__TEXT", "__swift3_typeref", v39);
  v22 = &v21[v39[0]];
  if (!v21)
    v22 = 0;
  v34 = (unint64_t)v22;
  v39[0] = 0;
  v23 = getsectiondata(v12, "__TEXT", "__swift3_reflstr", v39);
  if (!v23)
  {
    v24 = 0;
    if (v21 || v19 || v17 || v15 || v13)
      goto LABEL_25;
    v30 = (void (*)(uint64_t, const mach_header_64 *, uint64_t))*((_QWORD *)a1 + 2);
    if (v30)
    {
      v31 = *(_QWORD *)a1;
      v32 = v41[0];
      v6 = v12;
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  v24 = (unint64_t)&v23[v39[0]];
LABEL_25:
  v25 = *(void (**)(uint64_t, unint64_t *))(v4 + 64);
  v26 = *(_QWORD *)v4;
  v39[0] = (unint64_t)v13;
  v39[1] = v38;
  v39[2] = (unint64_t)v15;
  v39[3] = v37;
  v39[4] = (unint64_t)v17;
  v39[5] = v36;
  v39[6] = (unint64_t)v19;
  v39[7] = v35;
  v39[8] = (unint64_t)v21;
  v39[9] = v34;
  v39[10] = (unint64_t)v23;
  v39[11] = v24;
  v39[12] = (unint64_t)v12;
  v39[13] = a2;
  v25(v26, v39);
  v39[0] = 0;
  v27 = getsegmentdata(v12, "__DATA", v39);
  v28 = malloc_type_malloc(0x18uLL, 0x102004024DAA5DEuLL);
  *v28 = *((_QWORD *)a1 + 9);
  v28[1] = a2;
  v28[2] = &v27[a2 - (_QWORD)v12 + v39[0]];
  *((_QWORD *)a1 + 9) = v28;
  if (*((_QWORD *)a1 + 2))
  {
    v29 = malloc_type_malloc(0x18uLL, 0xE00400670D255uLL);
    *v29 = *((_QWORD *)a1 + 8);
    v29[1] = v12;
    v29[2] = v41[0];
    *((_QWORD *)a1 + 8) = v29;
  }
  return 1;
}

uint64_t vmu_swift_reflection_interop_typeRefForMetadata(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48) + 288 * a3;
  return (*(uint64_t (**)(_QWORD))(v3 + 88))(*(_QWORD *)v3);
}

uint64_t vmu_swift_reflection_interop_metadataForObject(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 56);
  if (v2 >= 1)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = v5;
    do
    {
      if (!*(_DWORD *)(v6 + 280))
      {
        result = (*(uint64_t (**)(_QWORD, uint64_t))(v6 + 112))(*(_QWORD *)v6, a2);
        if (result)
          return result;
        v5 = *(_QWORD *)(a1 + 48);
        v2 = *(_DWORD *)(a1 + 56);
      }
      v6 += 288;
    }
    while (v6 < v5 + 288 * v2);
  }
  return 0;
}

char *vmu_swift_reflection_interop_copyDemangledNameForTypeRef(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(uint64_t (**)(_QWORD))(v3 + 288 * a3 + 136);
  if (v4)
  {
    v5 = (char *)v4(*(_QWORD *)(v3 + 288 * a3));
    if (v5)
      v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, strlen(v5), 4, 1);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t vmu_swift_reflection_infoForTypeRef(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48) + 288 * a3;
  return (*(uint64_t (**)(_QWORD))(v3 + 160))(*(_QWORD *)v3);
}

double vmu_swift_reflection_childOfTypeRef@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, double *a5@<X8>)
{
  uint64_t v7;
  double result;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v7 = *(_QWORD *)(a1 + 48) + 288 * a3;
  v9 = 0;
  v10 = 0.0;
  v11 = 0;
  (*(void (**)(uint64_t *__return_ptr, _QWORD, uint64_t, uint64_t))(v7 + 168))(&v9, *(_QWORD *)v7, a2, a4);
  *(_QWORD *)a5 = v9;
  result = v10;
  a5[1] = v10;
  *((_QWORD *)a5 + 2) = v11;
  a5[3] = 0.0;
  *((_DWORD *)a5 + 6) = a3;
  return result;
}

const void *vmu_swift_reflection_interop_lookupMetadata(uint64_t a1, const void *a2)
{
  const void *v2;
  int v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  int v8;
  void *value;

  v2 = a2;
  value = 0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 80), a2, (const void **)&value))
  {
    if (*(_QWORD *)(a1 + 48) + 288 * (_QWORD)value)
      return v2;
    return 0;
  }
  v4 = *(_DWORD *)(a1 + 56);
  if (v4 < 1)
    return 0;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v5;
  while (!*(_DWORD *)(v6 + 280))
  {
    v8 = (*(uint64_t (**)(_QWORD, const void *))(v6 + 104))(*(_QWORD *)v6, v2);
    v5 = *(_QWORD *)(a1 + 48);
    if (v8)
      goto LABEL_16;
    v4 = *(_DWORD *)(a1 + 56);
LABEL_14:
    v6 += 288;
    if (v6 >= v5 + 288 * v4)
      return 0;
  }
  v7 = *(_QWORD **)(a1 + 72);
  if (!v7)
    goto LABEL_14;
  while (v7[1] > (unint64_t)v2 || v7[2] <= (unint64_t)v2)
  {
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_14;
  }
LABEL_16:
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 80), v2, (const void *)(0x8E38E38E38E38E39 * ((uint64_t)(v6 - v5) >> 5)));
  if (!v6)
    return 0;
  return v2;
}

uint64_t vmu_swift_reflection_infoForMetadata(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48) + 288 * a3;
  return (*(uint64_t (**)(_QWORD))(v3 + 176))(*(_QWORD *)v3);
}

double vmu_swift_reflection_childOfMetadata@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, double *a5@<X8>)
{
  uint64_t v7;
  double result;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v7 = *(_QWORD *)(a1 + 48) + 288 * a3;
  v9 = 0;
  v10 = 0.0;
  v11 = 0;
  (*(void (**)(uint64_t *__return_ptr, _QWORD, uint64_t, uint64_t))(v7 + 184))(&v9, *(_QWORD *)v7, a2, a4);
  *(_QWORD *)a5 = v9;
  result = v10;
  a5[1] = v10;
  *((_QWORD *)a5 + 2) = v11;
  a5[3] = 0.0;
  *((_DWORD *)a5 + 6) = a3;
  return result;
}

_QWORD *vmu_swift_reflection_infoForInstance@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  __int128 v6;
  int v7;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  result = (_QWORD *)swift_reflection_interop_libraryForObject(a1, a2);
  if (result)
  {
    result = ((_QWORD *(*)(__int128 *__return_ptr, _QWORD, uint64_t))result[24])(&v6, *result, a2);
    *(_OWORD *)a3 = v6;
    *(_DWORD *)(a3 + 16) = v7;
  }
  else
  {
    *(_DWORD *)a3 = 0;
  }
  return result;
}

_QWORD *vmu_swift_reflection_childOfInstance@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *result;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  result = (_QWORD *)swift_reflection_interop_libraryForObject(a1, a2);
  if (result)
  {
    v9 = result;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    result = ((_QWORD *(*)(uint64_t *__return_ptr, _QWORD, uint64_t, uint64_t))result[25])(&v11, *result, a2, a3);
    *(_QWORD *)a4 = v11;
    v10 = HIDWORD(v12);
    *(_DWORD *)(a4 + 8) = v12;
    *(_QWORD *)(a4 + 16) = v13;
    *(_DWORD *)(a4 + 24) = 954437177 * (((unint64_t)v9 - *(_QWORD *)(a1 + 48)) >> 5);
  }
  else
  {
    v10 = 0;
  }
  *(_DWORD *)(a4 + 12) = v10;
  return result;
}

uint64_t vmu_swift_reflection_interop_setClassIsSwiftMask(uint64_t result, uint64_t a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;

  v2 = *(_DWORD *)(result + 56);
  if (v2 >= 1)
  {
    v3 = *(_QWORD *)(result + 48);
    v4 = v3 + 288 * v2;
    do
    {
      v5 = *(_QWORD **)(v3 + 8);
      if (v5)
        *v5 = a2;
      v3 += 288;
    }
    while (v3 < v4);
  }
  return result;
}

BOOL vmu_swift_reflection_projectEnumValue(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5;
  unsigned int (*v6)(_QWORD, uint64_t, uint64_t, uint64_t);

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned int (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v5 + 288 * a4 + 232);
  return v6 && v6(*(_QWORD *)(v5 + 288 * a4), a2, a3, a5) != 0;
}

const char *vmu_swift_reflection_asyncTaskSlabPointer(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  _QWORD *v3;
  const char *result;
  uint64_t (*v5)(_QWORD);

  v1 = *(_DWORD *)(a1 + 56);
  if (v1 < 1)
    return "Failed to find Remote Mirror function asyncTaskSlabPointer";
  v2 = *(_QWORD **)(a1 + 48);
  v3 = &v2[36 * v1];
  result = "Failed to find Remote Mirror function asyncTaskSlabPointer";
  while (1)
  {
    v5 = (uint64_t (*)(_QWORD))v2[18];
    if (v5)
      break;
    v2 += 36;
    if (v2 >= v3)
      return result;
  }
  return (const char *)v5(*v2);
}

uint64_t vmu_reflection_interop_asyncTaskSlabAllocations@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v5)(_QWORD);

  v2 = *(_DWORD *)(result + 56);
  if (v2 < 1)
  {
LABEL_5:
    a2[2] = 0;
    a2[3] = 0;
    *a2 = "Failed to find Remote Mirror function asyncTaskSlabAllocations";
    a2[1] = 0;
  }
  else
  {
    v3 = *(_QWORD **)(result + 48);
    v4 = &v3[36 * v2];
    while (1)
    {
      v5 = (uint64_t (*)(_QWORD))v3[19];
      if (v5)
        return v5(*v3);
      v3 += 36;
      if (v3 >= v4)
        goto LABEL_5;
    }
  }
  return result;
}

uint64_t vmu_swift_reflection_interop_ownsObject(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(_QWORD);

  v1 = *(_DWORD *)(a1 + 56);
  if (v1 < 1)
    return 0;
  v2 = *(_QWORD **)(a1 + 48);
  v3 = &v2[36 * v1];
  while (1)
  {
    v4 = (uint64_t (*)(_QWORD))v2[12];
    if (v4)
      break;
    v2 += 36;
    if (v2 >= v3)
      return 0;
  }
  return v4(*v2);
}

uint64_t vmu_swift_reflection_interop_typeRefForMangledTypeName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if (*(int *)(a1 + 56) < 1)
    return 0;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v6;
  while (1)
  {
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v7 + 128))(*(_QWORD *)v7, a2, a3);
    if (result)
      break;
    v7 += 288;
    v6 += 288;
    if (v7 >= *(_QWORD *)(a1 + 48) + 288 * *(int *)(a1 + 56))
      return 0;
  }
  return result;
}

uint64_t swift_reflection_interop_getSizeAdapter()
{
  return 8;
}

uint64_t swift_reflection_interop_readBytesAdapter(_QWORD *a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t result;
  uint64_t v8;
  void (*v9)(_QWORD, uint64_t, uint64_t);
  uint64_t v10;

  v10 = 0;
  result = ((uint64_t (*)(_QWORD, uint64_t, size_t, uint64_t *))a1[3])(*a1, a2, a4, &v10);
  if (result)
  {
    v8 = result;
    memcpy(a3, (const void *)result, a4);
    v9 = (void (*)(_QWORD, uint64_t, uint64_t))a1[2];
    if (v9)
      v9(*a1, v8, v10);
    return 1;
  }
  return result;
}

uint64_t swift_reflection_interop_GetStringLengthAdapter(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)a1);
}

uint64_t swift_reflection_interop_GetSymbolAddressAdapter(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 40))(*(_QWORD *)a1);
}

uint64_t swift_reflection_interop_libraryForObject(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v5;
  unint64_t v6;
  const void *v7;
  unint64_t v8;
  const void *v10;
  int v11;
  unint64_t v12;
  _QWORD *v13;
  int v14;
  void *value;

  v2 = *(_DWORD *)(a1 + 56);
  if (v2 < 1)
    return 0;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v5;
  while (*(_DWORD *)(v6 + 280))
  {
LABEL_6:
    v6 += 288;
    v8 = v5 + 288 * v2;
    if (v6 >= v8)
    {
      if (v2 >= 1)
      {
        while (!*(_DWORD *)(v5 + 280))
        {
          v5 += 288;
          if (v5 >= v8)
            return 0;
        }
        return v5;
      }
      return 0;
    }
  }
  v7 = (const void *)(*(uint64_t (**)(_QWORD, uint64_t))(v6 + 112))(*(_QWORD *)v6, a2);
  if (!v7)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v2 = *(_DWORD *)(a1 + 56);
    goto LABEL_6;
  }
  v10 = v7;
  value = 0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 80), v7, (const void **)&value))
    return *(_QWORD *)(a1 + 48) + 288 * (_QWORD)value;
  v11 = *(_DWORD *)(a1 + 56);
  if (v11 < 1)
    return 0;
  v12 = *(_QWORD *)(a1 + 48);
  v5 = v12;
  while (2)
  {
    if (!*(_DWORD *)(v5 + 280))
    {
      v14 = (*(uint64_t (**)(_QWORD, const void *))(v5 + 104))(*(_QWORD *)v5, v10);
      v12 = *(_QWORD *)(a1 + 48);
      if (v14)
        goto LABEL_26;
      v11 = *(_DWORD *)(a1 + 56);
      goto LABEL_24;
    }
    v13 = *(_QWORD **)(a1 + 72);
    if (!v13)
    {
LABEL_24:
      v5 += 288;
      if (v5 >= v12 + 288 * v11)
        return 0;
      continue;
    }
    break;
  }
  while (v13[1] > (unint64_t)v10 || v13[2] <= (unint64_t)v10)
  {
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_24;
  }
LABEL_26:
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 80), v10, (const void *)(0x8E38E38E38E38E39 * ((uint64_t)(v5 - v12) >> 5)));
  return v5;
}

void sub_1A4DB47D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DB499C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4DB4CA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A4DB4D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DB4E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DB4EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DB52C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A4DB54E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>(uint64_t a1, unsigned int *a2, _DWORD *a3, int *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  _QWORD *v12;
  unint64_t v13;
  int v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v9 <= v8)
        v4 = v8 % v9;
    }
    else
    {
      v4 = ((_DWORD)v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == (_DWORD)v8)
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v12 = operator new(0x18uLL);
  *v12 = 0;
  v12[1] = v8;
  v14 = *a4;
  *((_DWORD *)v12 + 4) = *a3;
  *((_DWORD *)v12 + 5) = v14;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = ((_DWORD)v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *v12 = *v22;
LABEL_38:
    *v22 = v12;
    goto LABEL_39;
  }
  *v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    v23 = *(_QWORD *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_1A4DB5788(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>(uint64_t a1, id *a2, id *a3, _DWORD *a4)
{
  unint64_t v4;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  void **v14;
  void *i;
  unint64_t v16;
  _QWORD *v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;

  v9 = objc_msgSend(*a2, "hash");
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(void **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((NSStringEqualsFunctor::operator()(a1 + 32, *((void **)i + 2), *a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v10;
  *((_QWORD *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    v20 = 1;
    if (v11 >= 3)
      v20 = (v11 & (v11 - 1)) != 0;
    v21 = v20 | (2 * v11);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v23);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v24 = *(_QWORD *)a1;
  v25 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v25)
  {
    *(_QWORD *)i = *v25;
LABEL_38:
    *v25 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v17;
  *v17 = i;
  *(_QWORD *)(v24 + 8 * v4) = v17;
  if (*(_QWORD *)i)
  {
    v26 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v26 >= v11)
        v26 %= v11;
    }
    else
    {
      v26 &= v11 - 1;
    }
    v25 = (_QWORD *)(*(_QWORD *)a1 + 8 * v26);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1A4DB59FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

uint64_t NSStringEqualsFunctor::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if (v4 == v5)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

void sub_1A4DB5A78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

uint64_t **std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>(_QWORD *a1, id *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **v11;
  uint64_t v12;
  unint64_t v13;

  v4 = objc_msgSend(*a2, "hash");
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if ((NSStringEqualsFunctor::operator()(v12, v11[2], *a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(_QWORD *a1, unsigned int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4DFF6D0, MEMORY[0x1E0DE42E0]);
}

void sub_1A4DB5CC0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void sub_1A4DB77AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t _isSwiftRootClass(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "superclassInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v1, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "containsString:", CFSTR("Swift"));

  }
  return v3;
}

void _variantForCFBasicHash(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "firstFieldWithName:", CFSTR("_callbacks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "setScanType:", 0);
  objc_msgSend(v1, "firstFieldWithName:", CFSTR("_bits"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v1, "firstFieldWithName:", CFSTR("_keys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "ivarName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _destinationLayoutStorageVariant(v1, 48, v7, 2, CFSTR("Key"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "replaceField:withFields:", v6, v9);

      objc_msgSend(v6, "ivarName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _destinationLayoutStorageVariant(v1, 48, v10, 4, CFSTR("Key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1, "addVariant:forField:withEvaluator:", v11, v8, &__block_literal_global_459);
    }
    objc_msgSend(v1, "firstFieldWithName:", CFSTR("_values"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "ivarName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _destinationLayoutStorageVariant(v1, 40, v14, 2, CFSTR("Value"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "replaceField:withFields:", v13, v16);

    }
  }

}

VMUMutableFieldInfo *_destinationLayoutStorageVariant(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  VMUMutableFieldInfo *v19;
  uint64_t v20;
  VMUMutableFieldInfo *v21;

  v9 = a5;
  v10 = a3;
  v11 = a1;
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a4 == 4)
    v13 = "Weak ";
  else
    v13 = "";
  v14 = objc_msgSend(v9, "length");
  v15 = " ";
  if (!v14)
    v15 = "";
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" (%s%@%sStorage)"), v13, v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "binaryPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v16, v17, 16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setDefaultScanType:", a4);
  v19 = [VMUMutableFieldInfo alloc];
  v20 = objc_msgSend(v11, "pointerSize");

  v21 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v19, "initWithName:type:scan:offset:size:", v10, CFSTR("^@"), 2, a2, v20);
  -[VMUFieldInfo setDestinationLayout:](v21, "setDestinationLayout:", v18);

  return v21;
}

void _variantForNSSlice(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  VMUMutableFieldInfo *v14;
  void *v15;
  VMUMutableFieldInfo *v16;
  VMUMutableFieldInfo *v17;
  void *v18;
  VMUMutableFieldInfo *v19;
  VMUMutableFieldInfo *v20;
  void *v21;
  VMUMutableFieldInfo *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  VMUMutableFieldInfo *v30;
  void *v31;
  VMUMutableFieldInfo *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  VMUMutableFieldInfo *v51;
  VMUMutableFieldInfo *v52;
  VMUMutableFieldInfo *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (+[VMUScanOverlay foundationHasNSSliceMemoryOptimization](VMUScanOverlay, "foundationHasNSSliceMemoryOptimization"))
  {
    v8 = v5;
    v9 = v6;
    v10 = v7;
    objc_msgSend(v8, "firstFieldWithName:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = objc_msgSend(v11, "offset");
      _destinationLayoutStorageVariant(v8, v13, v12, 2, v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v5;
      v38 = v7;
      v14 = [VMUMutableFieldInfo alloc];
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".acquisitionProps"));
      v40 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v14, "initWithName:type:scan:offset:size:", v15, CFSTR("^{NSSliceExternalAcquisitionProperties}"), 1, (v13 + 8), 8);

      v17 = [VMUMutableFieldInfo alloc];
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".personalityProps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v12;
      v19 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v17, "initWithName:type:scan:offset:size:", v18, CFSTR("^{NSSliceExternalPersonalityProperties}"), 1, (v13 + 16), 8);

      v20 = [VMUMutableFieldInfo alloc];
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".internalProps"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v20, "initWithName:type:scan:offset:size:", v21, CFSTR("^{NSSliceInternalProperties}"), 1, (v13 + 24), 8);

      v50 = v35;
      v51 = v16;
      v52 = v19;
      v53 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "replaceField:withFields:", v11, v23);

      _destinationLayoutStorageVariant(v8, v13, v37, 4, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = ___variantForNSSlice_Version2_block_invoke;
      v47 = &__block_descriptor_36_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
      v48 = v13;
      objc_msgSend(v8, "addVariant:forField:withEvaluator:", v24, v35, &v44);

      v5 = v42;
      v6 = v40;

      v12 = v37;
      v7 = v38;

    }
  }
  else
  {
    v8 = v5;
    v9 = v6;
    v25 = v7;
    objc_msgSend(v8, "firstFieldWithName:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".items"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v28 = objc_msgSend(v8, "pointerSize");
      v39 = v7;
      v29 = objc_msgSend(v26, "offset");
      _destinationLayoutStorageVariant(v8, v29, v27, 2, v25);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v6;
      v30 = [VMUMutableFieldInfo alloc];
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".fields"));
      v43 = v5;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v30, "initWithName:type:scan:offset:size:", v31, CFSTR("{NSSliceFields}"), 0, objc_msgSend(v26, "offset") + v28, objc_msgSend(v26, "size") - v28);

      _destinationLayoutStorageVariant(v8, v29, v27, 4, v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v36;
      v51 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "replaceField:withFields:", v26, v34);

      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = ___variantForNSSlice_Version1_block_invoke;
      v47 = &__block_descriptor_40_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
      v48 = v29;
      v7 = v39;
      v49 = v28;
      objc_msgSend(v8, "addVariant:forField:withEvaluator:", v33, v36, &v44);

      v5 = v43;
      v6 = v41;

    }
  }

}

void ___variantForSwiftClass_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  uint64_t v6;
  VMUMutableFieldInfo *v7;
  id v8;
  VMUMutableFieldInfo *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_msgSend(WeakRetained, "pointerSize");

  if (objc_msgSend(v3, "offset") == (_DWORD)v6)
  {
    v7 = [VMUMutableFieldInfo alloc];
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v7, "initWithName:type:scan:offset:size:", CFSTR("_refcounts"), CFSTR("^v"), 5, v6, objc_msgSend(v8, "pointerSize"));

    objc_msgSend(*(id *)(a1 + 32), "sideTableLayoutWithScannableOwnerPointer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUFieldInfo setDestinationLayout:](v9, "setDestinationLayout:", v10);

    v11 = objc_loadWeakRetained(v4);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceField:withFields:", v3, v12);

  }
}

void ___variantForSwiftClass_block_invoke_2(void **a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  int v32;
  _QWORD v33[4];
  id v34;
  id v35;
  int v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  int v50;

  v5 = a2;
  v6 = objc_msgSend(v5, "offset") + a3;
  if (objc_msgSend(v5, "scanType") == 4)
  {
    _createSwiftWeakExactVariant(v5, a1[4], 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _createSwiftWeakExactVariant(v5, a1[4], 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = ___variantForSwiftClass_block_invoke_3;
    v44[3] = &unk_1E4E01A60;
    objc_copyWeak(&v48, a1 + 6);
    v45 = a1[4];
    v46 = a1[5];
    objc_copyWeak(&v49, a1 + 7);
    v9 = v5;
    v47 = v9;
    v50 = a3;
    objc_msgSend(WeakRetained, "addVariantRecursively:forField:atOffset:withEvaluator:", v7, v9, v6, v44);

    v10 = objc_loadWeakRetained(a1 + 6);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = ___variantForSwiftClass_block_invoke_4;
    v37[3] = &unk_1E4E01A60;
    objc_copyWeak(&v41, a1 + 6);
    v38 = a1[4];
    v39 = a1[5];
    objc_copyWeak(&v42, a1 + 7);
    v40 = v9;
    v43 = a3;
    objc_msgSend(v10, "addVariantRecursively:forField:atOffset:withEvaluator:", v17, v40, v6, v37);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v41);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v48);

  }
  else if (objc_msgSend(v5, "scanType") == 3)
  {
    _createSwiftExactUnownedVariant(v5, a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1 + 6;
    v13 = objc_loadWeakRetained(a1 + 6);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = ___variantForSwiftClass_block_invoke_5;
    v33[3] = &unk_1E4E01A88;
    objc_copyWeak(&v35, v12);
    v34 = v5;
    v36 = a3;
    objc_msgSend(v13, "addVariantRecursively:forField:atOffset:withEvaluator:", v11, v34, v6, v33);

    objc_destroyWeak(&v35);
  }
  else if (objc_msgSend(v5, "kind") == 6)
  {
    v14 = objc_loadWeakRetained(a1 + 6);
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = ___variantForSwiftClass_block_invoke_6;
    v25[3] = &unk_1E4E01AB0;
    objc_copyWeak(&v29, a1 + 6);
    v26 = a1[4];
    v27 = a1[5];
    objc_copyWeak(&v30, a1 + 7);
    v16 = v5;
    v28 = v16;
    v31 = a3;
    v32 = v6;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = ___variantForSwiftClass_block_invoke_7;
    v18[3] = &unk_1E4E01AD8;
    objc_copyWeak(&v22, a1 + 6);
    v19 = a1[4];
    v20 = a1[5];
    objc_copyWeak(&v23, a1 + 7);
    v21 = v16;
    v24 = a3;
    objc_msgSend(v14, "addComplexAction:withEvaluator:", v25, v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
  }

}

void sub_1A4DB9650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  id *v12;
  id *v13;
  id *v14;

  objc_destroyWeak(v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

id _createSwiftWeakExactVariant(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = (void *)objc_msgSend(a1, "mutableCopy");
  v7 = v6;
  if (a3 == 2)
  {
    objc_msgSend(v6, "setScanType:", 5);
    objc_msgSend(v5, "sideTableLayoutWithUnscannableOwnerPointer");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(v6, "setScanType:", 5);
    objc_msgSend(v5, "sideTableLayoutWithScannableOwnerPointer");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    objc_msgSend(v7, "setDestinationLayout:", v8);

  }
  return v7;
}

BOOL ___variantForSwiftClass_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v6 = (id *)(a1 + 56);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  v9 = objc_msgSend(WeakRetained, "pointerSize");
  v10 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = _determineSwiftWeakExactVariant(v9, v10, v11, v12, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2);

  return v13 == 1;
}

uint64_t _determineSwiftWeakExactVariant(unsigned int a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t (*v20)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v21;
  uint64_t v22;
  unsigned int *v23;
  void *v24;
  uint64_t v25;
  uint64_t (*v26)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v27;
  uint64_t v28;
  _DWORD *v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  unsigned int *v38;
  uint64_t v39;
  unsigned int *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (!v15 || !objc_msgSend(v15, "nativeWeakReferencePointerIsSideTable"))
    goto LABEL_42;
  if (!v16 || (objc_msgSend(v16, "nativeWeakReferencePointerIsSideTable") & 1) != 0)
    goto LABEL_12;
  v20 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v19[2];
  if (a1 == 8)
  {
    v21 = (uint64_t *)v20(v19, a8, 8);
    if (v21)
    {
      v22 = *v21;
      goto LABEL_11;
    }
  }
  else
  {
    v23 = (unsigned int *)v20(v19, a8, 4);
    if (v23)
    {
      v22 = *v23;
      goto LABEL_11;
    }
  }
  v22 = 0;
LABEL_11:
  objc_msgSend(v17, "classInfoForMemory:length:remoteAddress:", v22, a1, a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    goto LABEL_42;
LABEL_12:
  v25 = a8 + a7 + objc_msgSend(v18, "offset");
  v26 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v19[2];
  if (a1 == 8)
  {
    v27 = (uint64_t *)v26(v19, v25, 8);
    if (!v27)
      goto LABEL_42;
    v28 = *v27;
    if (!*v27)
      goto LABEL_42;
  }
  else
  {
    v29 = (_DWORD *)v26(v19, v25, 4);
    if (!v29)
      goto LABEL_42;
    v28 = *v29;
    if (!*v29)
      goto LABEL_42;
  }
  objc_msgSend(v17, "vmuTask");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isExclaveCore");

  if ((v31 & 1) == 0)
  {
    v32 = objc_msgSend(v15, "nativeWeakReferenceMarkerMask") & v28;
    if (v32 == objc_msgSend(v15, "nativeWeakReferenceMarkerValue"))
    {
      v28 &= objc_msgSend(v15, "nativeWeakReferencePointerMask");
      goto LABEL_23;
    }
LABEL_42:
    v41 = 0;
    goto LABEL_43;
  }
LABEL_23:
  v33 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v19[2])(v19, v28 + 16, 8);
  if (!v33 || (*(_BYTE *)(v33 + 4) & 1) == 0)
  {
    v34 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v19[2];
    if (a1 == 8)
    {
      v35 = (_QWORD *)v34(v19, v28, 8);
      if (v35 && *v35)
      {
        v36 = (uint64_t *)((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v19[2])(v19, *v35 + 8, 8);
        if (v36)
        {
          v37 = *v36;
LABEL_36:
          if (v37)
          {
            v42 = v15;
            v43 = objc_msgSend(v42, "refcountIsSideTableMarkerMask") & v37;
            if (v43 == objc_msgSend(v42, "refcountIsSideTableMarkerValue"))
            {
              v44 = objc_msgSend(v42, "sideTablePointerMask") & v37;
              v45 = v44 >> objc_msgSend(v42, "sideTablePointerRightShift");
              v46 = v45 << objc_msgSend(v42, "sideTablePointerLeftShift");
            }
            else
            {
              v46 = 0;
            }

            if (v46 != v28)
              goto LABEL_42;
          }
          goto LABEL_41;
        }
        goto LABEL_35;
      }
    }
    else
    {
      v38 = (unsigned int *)v34(v19, v28, 4);
      if (v38)
      {
        v39 = *v38;
        if ((_DWORD)v39)
        {
          v40 = (unsigned int *)((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v19[2])(v19, v39 + a1, 4);
          if (v40)
          {
            v37 = *v40;
            goto LABEL_36;
          }
LABEL_35:
          v37 = 0;
          goto LABEL_36;
        }
      }
    }
LABEL_41:
    v41 = 1;
    goto LABEL_43;
  }
  v41 = 2;
LABEL_43:

  return v41;
}

BOOL ___variantForSwiftClass_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v6 = (id *)(a1 + 56);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  v9 = objc_msgSend(WeakRetained, "pointerSize");
  v10 = *(void **)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = _determineSwiftWeakExactVariant(v9, v10, v11, v12, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2);

  return v13 == 2;
}

id _createSwiftExactUnownedVariant(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v3, "unownedExtraDataLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDestinationLayout:", v5);
  return v4;
}

uint64_t ___variantForSwiftClass_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t shouldApplySwiftExactUnownedVariant;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  shouldApplySwiftExactUnownedVariant = _shouldApplySwiftExactUnownedVariant(objc_msgSend(WeakRetained, "pointerSize"), *(void **)(a1 + 32), v6);

  return shouldApplySwiftExactUnownedVariant;
}

uint64_t _shouldApplySwiftExactUnownedVariant(int a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t (*v7)(void);
  uint64_t *v8;
  uint64_t v9;
  _DWORD *v10;

  v5 = a3;
  objc_msgSend(a2, "offset");
  v6 = v5;
  v7 = (uint64_t (*)(void))v6[2];
  if (a1 != 8)
  {
    v10 = (_DWORD *)v7();
    if (v10)
    {
      LODWORD(v9) = *v10;
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_7;
  }
  v8 = (uint64_t *)v7();
  if (!v8)
    goto LABEL_6;
  v9 = *v8;
LABEL_7:

  return v9 & 1;
}

void ___variantForSwiftClass_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = objc_loadWeakRetained((id *)(a1 + 64));
  _recursivelyCreateSwiftEnumPayloadVariant(WeakRetained, v9, v10, v11, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v13, "replaceFieldRecursively:atOffset:withField:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 76), v12);

}

id _recursivelyCreateSwiftEnumPayloadVariant(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unsigned int active;
  unsigned int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  active = _determineActiveSwiftEnumPayloadCaseIndex(v18, v19, a7, a8);
  if ((active & 0x80000000) != 0)
  {
    v28 = 0;
  }
  else
  {
    v22 = active;
    v33 = v15;
    objc_msgSend(v19, "possibleEnumPayloadFieldArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if ((int)v22 >= v24)
    {
      v28 = 0;
    }
    else
    {
      objc_msgSend(v19, "possibleEnumPayloadFieldArray");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = swiftEnumDummyNoPayloadSubField;
      v28 = (void *)objc_msgSend(v19, "mutableCopy");
      objc_msgSend(v28, "setScanType:", 0);
      if (v26 != (void *)v27)
      {
        _recursivelyCreateSwiftVariant(v33, v16, v17, v18, v26, v20, objc_msgSend(v19, "offset") + a7, a8);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v29)
          v31 = (void *)v29;
        else
          v31 = v26;
        objc_msgSend(v28, "addSubField:", v31);

      }
    }
    v15 = v33;
  }

  return v28;
}

uint64_t ___variantForSwiftClass_block_invoke_7(uint64_t a1, const void *a2, void *a3, uint64_t *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v7 = a3;
  v14 = objc_msgSend(CFSTR("seed"), "hash");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = objc_loadWeakRetained((id *)(a1 + 64));
  v12 = _recursivelyDetermineSwiftEnumPayloadVariantHash(WeakRetained, v9, v10, v11, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2, &v14, 0);

  *a4 = v14;
  return v12;
}

uint64_t _recursivelyDetermineSwiftEnumPayloadVariantHash(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, const void *a8, _QWORD *a9, int a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned int active;
  unsigned int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int IsEnabled;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  id v33;
  const char *v34;
  id v35;
  uint64_t v36;
  id v37;
  const char *v38;
  id v39;
  id v41;
  const char *v42;
  id v43;
  const char *v44;
  const char *v45;
  id v46;
  const char *v47;
  const void *v48;
  id v49;

  v17 = a1;
  v49 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v48 = a8;
  active = _determineActiveSwiftEnumPayloadCaseIndex(v19, v20, a7, (uint64_t)a8);
  if ((active & 0x80000000) != 0
    || (v23 = active,
        objc_msgSend(v20, "possibleEnumPayloadFieldArray"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "count"),
        v24,
        (int)v23 >= v25))
  {
    if (debugSwiftSubfieldIsEnabled())
    {
      objc_msgSend(v20, "ivarName");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v47 = (const char *)objc_msgSend(v30, "UTF8String");
      v31 = *(_QWORD *)objc_msgSend(v19, "swiftMirror");
      v32 = (uint64_t *)objc_msgSend(v20, "swiftTyperef");
      vmu_swift_reflection_interop_copyDemangledNameForTypeRef(v31, *v32, v32[1]);
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34 = (const char *)objc_msgSend(v33, "UTF8String");
      objc_msgSend(v17, "className");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      _debugSwiftAsyncPrintf(a10, "Failed to project enum case for field %s (type %s), of object at %p of class %s. Falling back to conservative scanning.\n", v47, v34, v48, (const char *)objc_msgSend(v35, "UTF8String"));

      if (!a10)
        fputc(10, (FILE *)*MEMORY[0x1E0C80C10]);
    }
    VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, objc_msgSend(CFSTR("No-Change"), "hash"));
    v36 = 0;
  }
  else
  {
    objc_msgSend(v20, "possibleEnumPayloadFieldArray");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = swiftEnumDummyNoPayloadSubField;
    IsEnabled = debugSwiftSubfieldIsEnabled();
    if (v27 == (void *)v28)
    {
      if (IsEnabled)
      {
        objc_msgSend(v20, "ivarName");
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v38 = (const char *)objc_msgSend(v37, "UTF8String");
        objc_msgSend(v17, "className");
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        _debugSwiftAsyncPrintf(a10, "Detected no-payload of field %s, of object at %p of class %s. Treating as a non-payload case and not scanning the subfield.\n", v38, a8, (const char *)objc_msgSend(v39, "UTF8String"));

        if (!a10)
          fputc(10, (FILE *)*MEMORY[0x1E0C80C10]);
      }
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, objc_msgSend(CFSTR("Payload-Empty"), "hash"));
    }
    else
    {
      if (IsEnabled)
      {
        objc_msgSend(v27, "ivarName");
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v45 = (const char *)objc_msgSend(v46, "UTF8String");
        v44 = VMUScanTypeScanDescription(objc_msgSend(v27, "scanType"));
        objc_msgSend(v20, "ivarName");
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = (const char *)objc_msgSend(v43, "UTF8String");
        objc_msgSend(v17, "className");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        _debugSwiftAsyncPrintf(a10, "enum payload  %s  scanType %s (may be changed), of field %s, of object at %p of class %s  size %u stride %u\n", v45, v44, v42, a8, (const char *)objc_msgSend(v41, "UTF8String"), objc_msgSend(v27, "size"), objc_msgSend(v27, "stride"));

        if (!a10)
          fputc(10, (FILE *)*MEMORY[0x1E0C80C10]);
      }
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, objc_msgSend(CFSTR("Payload-"), "hash") + v23);
      _recursivelyDetermineComplexSwiftVariantHash(v17, v49, v18, v19, v27, v21, objc_msgSend(v20, "offset") + a7, (uint64_t)a8, a9, a10 + 1);
    }

    v36 = 1;
  }

  return v36;
}

uint64_t _determineActiveSwiftEnumPayloadCaseIndex(void *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned int v15;

  v5 = a4 + a3;
  v6 = a2;
  v7 = a1;
  v8 = v5 + objc_msgSend(v6, "offset");
  v9 = (uint64_t *)objc_msgSend(v6, "swiftTyperef");

  v10 = *v9;
  v11 = v9[1];
  v12 = (uint64_t *)objc_msgSend(v7, "swiftMirror");

  v13 = *v12;
  v15 = 0x80000000;
  if (vmu_swift_reflection_projectEnumValue(v13, v8, v10, v11, (uint64_t)&v15))
    return v15;
  else
    return 0x80000000;
}

id _recursivelyCreateSwiftVariant(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;
  unsigned int v52;
  int v53;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v44 = v15;
  v21 = objc_msgSend(v15, "pointerSize");
  v43 = v18;
  if (objc_msgSend(v19, "scanType") == 4)
  {
    v22 = a8;
    v23 = v17;
    v24 = _determineSwiftWeakExactVariant(v21, v16, v17, v18, v19, v20, a7, v22);
    if (v24)
    {
      _createSwiftWeakExactVariant(v19, v16, v24);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v28 = (void *)v25;
      goto LABEL_20;
    }
LABEL_19:
    v28 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v19, "scanType") == 3)
  {
    v26 = a8;
    v23 = v17;
    v27 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = ___recursivelyCreateSwiftVariant_block_invoke_2;
    v48[3] = &unk_1E4E01B28;
    v52 = v21;
    v49 = v19;
    v53 = a7;
    v50 = v20;
    v51 = v26;
    v45[0] = v27;
    v45[1] = 3221225472;
    v45[2] = ___recursivelyCreateSwiftVariant_block_invoke_3;
    v45[3] = &unk_1E4E01B50;
    v46 = v49;
    v47 = v16;
    ___recursivelyCreateSwiftVariant_block_invoke((uint64_t)v47, (uint64_t)v48, v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v19, "kind") == 6)
    {
      v29 = a8;
      v23 = v17;
      _recursivelyCreateSwiftEnumPayloadVariant(v15, v16, v17, v18, v19, v20, a7, v29, v18);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v19, "subFieldArray");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (!v31)
    {
      v23 = v17;
      goto LABEL_19;
    }
    v32 = objc_msgSend(v19, "offset");
    objc_msgSend(v19, "subFieldArray");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v33, "count");

    if (v28)
    {
      v34 = a8;
      v23 = v17;
      v35 = 0;
      v28 = 0;
      v36 = (v32 + a7);
      do
      {
        objc_msgSend(v19, "subFieldArray", v43);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        _recursivelyCreateSwiftVariant(v44, v16, v23, v43, v38, v20, v36, v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          if (!v28)
            v28 = (void *)objc_msgSend(v19, "mutableCopy");
          objc_msgSend(v28, "replaceFieldRecursively:atOffset:withField:", v38, objc_msgSend(v38, "offset"), v39);
        }

        ++v35;
        objc_msgSend(v19, "subFieldArray");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

      }
      while (v35 < v41);
    }
    else
    {
      v23 = v17;
    }
  }
LABEL_20:

  return v28;
}

id ___recursivelyCreateSwiftVariant_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(_QWORD);
  void *v5;

  v4 = a3;
  if ((*(unsigned int (**)(uint64_t))(a2 + 16))(a2))
  {
    v4[2](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t ___recursivelyCreateSwiftVariant_block_invoke_2(uint64_t a1)
{
  return _shouldApplySwiftExactUnownedVariant(*(_DWORD *)(a1 + 56), *(void **)(a1 + 32), *(void **)(a1 + 40));
}

id ___recursivelyCreateSwiftVariant_block_invoke_3(uint64_t a1)
{
  return _createSwiftExactUnownedVariant(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void _recursivelyDetermineComplexSwiftVariantHash(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, _QWORD *a9, int a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v17 = a1;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  if (objc_msgSend(v21, "scanType") == 4)
  {
    v23 = _determineSwiftWeakExactVariant(objc_msgSend(v17, "pointerSize"), v18, v19, v20, v21, v22, a7, a8);
    if (v23 == 2)
    {
      v24 = CFSTR("Weak-With-Unscannable-Owner-Pointer-Applied");
      goto LABEL_14;
    }
    if (v23 == 1)
    {
      v24 = CFSTR("Weak-With-Scannable-Owner-Pointer-Applied");
      goto LABEL_14;
    }
    if (v23)
      goto LABEL_15;
    goto LABEL_11;
  }
  if (objc_msgSend(v21, "scanType") == 3)
  {
    if (_shouldApplySwiftExactUnownedVariant(objc_msgSend(v17, "pointerSize"), v21, v22))
    {
      v24 = CFSTR("Unowned-Applied");
LABEL_14:
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, -[__CFString hash](v24, "hash"));
      goto LABEL_15;
    }
LABEL_11:
    v24 = CFSTR("No-Change");
    goto LABEL_14;
  }
  if (objc_msgSend(v21, "kind") == 6)
  {
    _recursivelyDetermineSwiftEnumPayloadVariantHash(v17, v18, v19, v20, v21, v22, a7, a8, a9, a10);
  }
  else
  {
    objc_msgSend(v21, "subFieldArray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v37 = v22;
      v27 = v20;
      v28 = v19;
      v29 = v17;
      v30 = objc_msgSend(v21, "offset");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v21, "subFieldArray");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v31)
      {
        v32 = v31;
        v33 = (v30 + a7);
        v34 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v39 != v34)
              objc_enumerationMutation(obj);
            _recursivelyDetermineComplexSwiftVariantHash(v29, v18, v28, v27, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v37, v33, a8, a9, a10 + 1);
          }
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v32);
      }

      v17 = v29;
      v19 = v28;
      v20 = v27;
      v22 = v37;
    }
  }
LABEL_15:

}

uint64_t ___variantForCFBasicHash_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 48);
  if (result)
    return (*(_QWORD *)(result + 24) & 0x3FF003FF000000 | *(_QWORD *)(result + 32) & 0x3FF003FF0) == 0;
  return result;
}

void sub_1A4DBB360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DBB49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DBC090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t zoneEnumeratorBlockAdapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_1A4DBC93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL memoryExists(vm_map_read_t target_task, mach_vm_address_t a2, mach_vm_size_t a3)
{
  mach_vm_size_t v3;
  __int128 v6;
  mach_vm_size_t v7;
  BOOL v8;
  _BOOL8 result;
  mach_vm_size_t size;
  mach_vm_address_t address;
  mach_msg_type_number_t infoCnt;
  int info[4];
  __int128 v14;
  __int128 v15;
  natural_t nesting_depth;

  if (!a3)
    return 0;
  v3 = a3;
  v6 = 0uLL;
  do
  {
    nesting_depth = 0;
    v14 = v6;
    v15 = v6;
    *(_OWORD *)info = v6;
    size = 0;
    address = a2;
    infoCnt = 12;
    while (1)
    {
      if (mach_vm_region_recurse(target_task, &address, &size, &nesting_depth, info, &infoCnt)
        || !info[0]
        || address > a2)
      {
        return 0;
      }
      if (!(_DWORD)v15)
        break;
      ++nesting_depth;
      address = a2;
    }
    if (size + address <= a2)
      return 0;
    v7 = size + address - a2;
    v8 = v3 > v7;
    v3 -= v7;
    result = !v8;
    v6 = 0uLL;
  }
  while (v8);
  return result;
}

uint64_t task_peek_natural_size(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4)
{
  return task_peek_to_end_of_region(a1, a2, a3, a4, 0);
}

uint64_t *task_try_peek(uint64_t a1, tree *a2, _QWORD *a3)
{
  const char *v5;
  uint64_t *result;
  uint64_t v7;
  uint64_t v8;

  v5 = (const char *)task_lookup_mapped_memory_cache();
  if (v5)
  {
    result = (uint64_t *)find_node(v5, a2);
    if (result || (result = (uint64_t *)map_new_node()) != 0)
    {
      v7 = result[1];
      v8 = *result;
      *a3 = (char *)a2 + result[2] - *result;
      return (uint64_t *)(v8 - (_QWORD)a2 + v7);
    }
  }
  else
  {
    NSLog(CFSTR("*** Error: calling task_try_peek() before task_start_peeking()\n"));
    return 0;
  }
  return result;
}

uint64_t task_read_ptr_at(vm_map_read_t a1, mach_vm_address_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;

  v6 = 0;
  result = task_peek_to_end_of_region(a1, a2, 8uLL, (mach_vm_address_t *)&v6, 0);
  v5 = 0;
  if (!(_DWORD)result && v6)
    v5 = *v6;
  *a3 = v5;
  return result;
}

uint64_t task_read_unsigned_at(vm_map_read_t a1, mach_vm_address_t a2, _DWORD *a3)
{
  uint64_t result;
  int v5;
  int *v6;

  v6 = 0;
  result = task_peek_to_end_of_region(a1, a2, 4uLL, (mach_vm_address_t *)&v6, 0);
  v5 = 0;
  if (!(_DWORD)result && v6)
    v5 = *v6;
  *a3 = v5;
  return result;
}

mach_vm_address_t task_peek_string(task_name_t a1, mach_vm_address_t a2)
{
  task_name_t *IsSelf_portOfCachedResult;
  mach_vm_address_t result;
  _BYTE *IsSelf_cachedResult;
  int v7;
  int v8;
  mach_vm_address_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unsigned int v13;
  BOOL v14;
  mach_vm_size_t v15;
  int v16;
  mach_vm_address_t v18;
  unint64_t v19;

  IsSelf_portOfCachedResult = (task_name_t *)VMUTaskIsSelf_portOfCachedResult();
  if (*IsSelf_portOfCachedResult == a1)
  {
    if (*(_BYTE *)VMUTaskIsSelf_cachedResult())
      return a2;
  }
  else
  {
    *IsSelf_portOfCachedResult = a1;
    mach_task_is_self(a1);
    IsSelf_cachedResult = (_BYTE *)VMUTaskIsSelf_cachedResult();
    *IsSelf_cachedResult = v7;
    if (v7)
      return a2;
  }
  v18 = 0;
  v19 = 1;
  v8 = task_peek_to_end_of_region(a1, a2, 1uLL, &v18, &v19);
  result = 0;
  if (!v8)
  {
    v9 = v18;
    if (v18)
    {
      v10 = 0;
      v11 = MEMORY[0x1E0C80978];
      v12 = (_QWORD *)MEMORY[0x1E0C85AD8];
      while (1)
      {
        while (v10 >= v19)
        {
          v15 = *v12 + v19;
          v19 = v15;
          if (v15 <= 0x19000)
          {
            v18 = 0;
            v16 = task_peek_to_end_of_region(a1, a2, v15, &v18, &v19);
            v9 = v18;
            if (!v16 && v18 != 0)
              continue;
          }
          return 0;
        }
        v13 = *(char *)(v9 + v10);
        if (!*(_BYTE *)(v9 + v10))
          return v9;
        if ((v13 & 0x80000000) != 0)
        {
          if (__maskrune(*(char *)(v9 + v10), 0x40000uLL))
            goto LABEL_21;
        }
        else if ((*(_DWORD *)(v11 + 4 * v13 + 60) & 0x40000) != 0)
        {
          goto LABEL_21;
        }
        v14 = v13 > 0xD || ((1 << v13) & 0x2600) == 0;
        if (v14 && v13 - 169 >= 2)
          return 0;
LABEL_21:
        ++v10;
      }
    }
  }
  return result;
}

BOOL objectIsDeallocatingOrDeallocated(_BOOL8 result)
{
  if (result)
    return (*(_BYTE *)(result + 10) & 0xE0) != 0;
  return result;
}

BOOL stringHasInlineContents(_BOOL8 result)
{
  char v1;

  if (result)
  {
    v1 = atomic_load((unint64_t *)(result + 8));
    return (v1 & 0x60) == 0;
  }
  return result;
}

__CFString *stringFromMappedNSCFString(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, int *a6)
{
  id v11;
  id v12;
  __CFString *v13;
  char v15;
  unsigned int v16;
  char v17;
  uint64_t v18;
  char v19;
  _BOOL4 v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t Length2;
  int v25;
  int64_t v26;
  unint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  _WORD *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  BOOL v42;
  int64_t v43;
  id v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  id v49;
  int v50;
  char v51;
  unint64_t v52;
  unint64_t v53;
  char v54;
  _WORD *v55;
  uint64_t v56;

  v11 = a1;
  v56 = a2;
  v12 = a5;
  if (a6)
    *a6 = 0;
  if (!a2 || a3 - 1 < 0xF)
    goto LABEL_5;
  v15 = atomic_load((unint64_t *)(a2 + 8));
  v16 = atomic_load((unint64_t *)(a2 + 8));
  v17 = atomic_load((unint64_t *)(a2 + 8));
  v18 = v56;
  if (v56)
  {
    v19 = atomic_load((unint64_t *)(v56 + 8));
    v20 = (v19 & 0x60) == 0;
    v18 = v56;
  }
  else
  {
    v20 = 0;
  }
  v21 = v15 | ((v17 & 4) == 0);
  v22 = atomic_load((unint64_t *)(v18 + 8));
  if (!v20 && !(v15 & 1 | ((v17 & 4) == 0)))
  {
    v13 = 0;
    v55 = 0;
    goto LABEL_6;
  }
  v23 = 32;
  if (v20)
    v23 = 24;
  if (v23 > a3)
    goto LABEL_5;
  v53 = v22;
  v54 = v15;
  Length2 = _CFStringGetLength2();
  if (Length2 > 0x3B9ACA00)
    goto LABEL_5;
  v25 = (v16 >> 4) & 1;
  if (!Length2)
  {
    if (a6)
    {
      v32 = (v54 & 1) != 0 ? 11 : 3;
      *a6 = v32;
      if (v25)
        *a6 = v32 | 0x10;
    }
    v13 = &stru_1E4E04720;
    goto LABEL_6;
  }
  v55 = 0;
  v52 = Length2;
  if (v20)
  {
    if (!remoteAddressIsOKtoRead(a4, v12))
      goto LABEL_5;
    v26 = v52;
    if (a3)
    {
      v27 = (v52 << v25) + 16;
      if (v27 > a3)
      {
        objc_msgSend(v11, "memoryCache");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "peekAtAddress:size:returnsBuf:", a4, v27, &v56);

        v13 = 0;
        if (v29)
          goto LABEL_6;
        v26 = v52;
        if (!v56)
          goto LABEL_6;
      }
    }
    v30 = 8;
    if ((v21 & 1) == 0)
      v30 = 0;
    v31 = (_WORD *)(v56 + v30 + 16);
    v55 = v31;
  }
  else
  {
    if (v25 && (v17 & 4) != 0)
      goto LABEL_5;
    v33 = *(_QWORD *)(v56 + 16);
    if (!remoteAddressIsOKtoRead(v33, v12))
      goto LABEL_5;
    if (v25)
      v34 = 2 * v52;
    else
      v34 = v52 + ((unint64_t)(v17 & 4) >> 2);
    objc_msgSend(v11, "memoryCache");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "peekAtAddress:size:returnsBuf:", v33, v34, &v55);

    v13 = 0;
    if (v36)
      goto LABEL_6;
    v31 = v55;
    v26 = v52;
    if (!v55)
      goto LABEL_6;
  }
  if (v25)
  {
    v45 = v54;
    if (!*v31)
      goto LABEL_5;
    v46 = 1;
    do
    {
      v47 = v46;
      if (v26 == v46)
        break;
      ++v46;
    }
    while (v31[v47]);
    if (v47 < v26)
      goto LABEL_5;
    v48 = v26;
    v49 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = (__CFString *)objc_msgSend(v49, "initWithCharactersNoCopy:length:freeWhenDone:", v55, v48, 0);
LABEL_69:
    if (a6 && v13)
    {
      if (v20)
        v50 = 3;
      else
        v50 = 35;
      if (!HIDWORD(v53))
        v50 |= 0x40u;
      if ((v45 & 1) != 0)
        v50 |= 8u;
      *a6 = v50;
      if (v25)
        *a6 = v50 | 0x10;
    }
    goto LABEL_6;
  }
  if ((v17 & 4) != 0)
  {
    v31 = (_WORD *)((char *)v31 + 1);
    v55 = v31;
  }
  v37 = 0;
  v38 = MEMORY[0x1E0C80978];
  v51 = 1;
  while (1)
  {
    v39 = *((unsigned __int8 *)v31 + v37);
    v40 = *((unsigned __int8 *)v31 + v37);
    if (*((char *)v31 + v37) < 0)
      break;
    if ((*(_DWORD *)(v38 + 4 * v40 + 60) & 0x40000) == 0)
      goto LABEL_50;
LABEL_60:
    if (v26 == ++v37)
      goto LABEL_61;
  }
  v41 = __maskrune(*((unsigned __int8 *)v31 + v37), 0x40000uLL);
  v26 = v52;
  if (v41)
    goto LABEL_60;
LABEL_50:
  v42 = v39 > 0xD || ((1 << v39) & 0x2600) == 0;
  if (v42 && v39 - 169 >= 2)
    v51 = 0;
  if (v40 <= 0xD && ((1 << v40) & 0x2600) != 0 || (v40 - 169) < 2)
    goto LABEL_60;
LABEL_61:
  if ((v51 & 1) != 0)
  {
    v43 = v26;
    v44 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = (__CFString *)objc_msgSend(v44, "initWithBytes:length:encoding:", v55, v43, 4);
    v45 = v54;
    v25 = 0;
    goto LABEL_69;
  }
LABEL_5:
  v13 = 0;
LABEL_6:

  return v13;
}

BOOL remoteAddressIsOKtoRead(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  v4 = v3;
  v5 = !v3 || objc_msgSend(v3, "containsLocation:", a1);

  return v5;
}

unsigned __int8 *stringFromBytes(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  char v14;
  int v15;
  int v16;
  int v18;
  unint64_t v19;
  BOOL v20;
  _BOOL4 v21;
  int v22;
  BOOL v23;
  char v24;
  int v26;

  if (a1)
  {
    v4 = a1;
    a1 = 0;
    if (a2)
    {
      v5 = *v4;
      v6 = (char)v5;
      if ((_BYTE)v5)
      {
        v8 = MEMORY[0x1E0C80978];
        if ((char)v5 < 0)
          v9 = __maskrune((char)v5, 0x40000uLL);
        else
          v9 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * (char)v5 + 60) & 0x40000;
        v10 = 1;
        if (!v9 && (v5 > 0xD || ((1 << v5) & 0x2600) == 0) && (v5 - 169) >= 2)
          v10 = 0;
        if (a2 >= 2)
        {
          v11 = 1;
          while (1)
          {
            v6 = (char)v4[v11];
            if (!v4[v11])
              goto LABEL_28;
            if ((v6 & 0x80000000) != 0)
            {
              if (__maskrune((char)v4[v11], 0x40000uLL))
                goto LABEL_25;
            }
            else if ((*(_DWORD *)(v8 + 4 * v6 + 60) & 0x40000) != 0)
            {
              goto LABEL_25;
            }
            v12 = v6 > 0xD || ((1 << v6) & 0x2600) == 0;
            if (v12 && v6 - 169 >= 2)
            {
              if (v11 == 1)
                v24 = v10;
              else
                v24 = 1;
              if ((v24 & 1) != 0)
                goto LABEL_33;
              goto LABEL_66;
            }
LABEL_25:
            if (a2 == ++v11)
            {
              v11 = a2;
              goto LABEL_33;
            }
          }
        }
        v11 = 1;
LABEL_28:
        v13 = v11 - 1;
        if (v11 == 1)
          v14 = v10;
        else
          v14 = 1;
        if ((v14 & 1) != 0)
        {
          if (v6)
          {
LABEL_33:
            if (a2 > 0x100 || v11 < v5)
            {
              v16 = 0;
              v15 = 0;
              if ((v10 & (v11 > 3)) != 0)
                v5 = v11;
              else
                v5 = 0;
            }
            else
            {
              v15 = 0;
              v16 = 1;
            }
          }
          else
          {
            if (a2 <= 0x100 && v13 >= v5)
              v18 = v10;
            else
              v18 = 1;
            if (v10)
              v19 = v11;
            else
              v19 = 0;
            v20 = v18 == 1;
            v21 = v18 != 1;
            if (v20)
              v22 = v10;
            else
              v22 = 0;
            if (!v20)
              v19 = v5;
            v23 = v13 == v5;
            v16 = v13 == v5 || v21;
            if (v13 == v5)
              v15 = 1;
            else
              v15 = v22;
            if (!v23)
              v5 = v19;
          }
        }
        else
        {
LABEL_66:
          v16 = 0;
          v15 = 0;
          v5 = 0;
        }
        if (a2 < 0x11 || v5 >= 4)
        {
          a1 = 0;
          if ((v16 | v15) == 1 && v5)
          {
            if (v16)
              ++v4;
            a1 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, v5, 4, 0);
            if (a3)
            {
              if (v16)
                v26 = 2;
              else
                v26 = 1;
              *a3 = v26;
            }
          }
        }
        else
        {
          a1 = 0;
        }
      }
    }
  }
  return a1;
}

id shortenString(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    if (shortenString_onceToken != -1)
      dispatch_once(&shortenString_onceToken, &__block_literal_global_6);
    if (objc_msgSend(v2, "containsString:", CFSTR("binary plist:  {")))
    {
      v3 = v2;
      if (!flattenPlistString_newlineCharacterSet)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)flattenPlistString_newlineCharacterSet;
        flattenPlistString_newlineCharacterSet = v4;

        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "invertedSet");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)flattenPlistString_nonwhitespaceCharacterSet;
        flattenPlistString_nonwhitespaceCharacterSet = v7;

      }
      v9 = objc_msgSend(v3, "length");
      v10 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", flattenPlistString_newlineCharacterSet, 0, 0, v9);
      v11 = 96;
      if (v9 < 0x60)
        v11 = v9;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL || (v12 = v10, v10 > v11))
      {
        v15 = v3;
      }
      else
      {
        do
        {
          v13 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", flattenPlistString_nonwhitespaceCharacterSet, 0, v12, v9 - v12);
          v14 = v13 - v12;
          objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v12, v13 - v12, CFSTR(" "));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v9 - v14 + 1;
          v16 = objc_msgSend(v15, "rangeOfString:options:range:", CFSTR(" =  "), 0, v12, v9 - v12);
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v18 = objc_msgSend(v15, "rangeOfCharacterFromSet:options:range:", flattenPlistString_nonwhitespaceCharacterSet, 0, v16 + v17, v9 - (v16 + v17))- (v16+ v17- 1);
            if (v18)
            {
              objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:");
              v19 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v19;
            }
            v9 -= v18;
          }
          v20 = objc_msgSend(v15, "rangeOfCharacterFromSet:options:range:", flattenPlistString_newlineCharacterSet, 0, v12, v9 - v12);
          v12 = v20;
          if (v9 >= 0x60)
            v21 = 96;
          else
            v21 = v9;
          v22 = v20 == 0x7FFFFFFFFFFFFFFFLL || v20 > v21;
          v3 = v15;
        }
        while (!v22);
      }
    }
    else
    {
      v23 = objc_msgSend(v2, "length");
      if (v23 >= 0x60)
        v24 = 96;
      else
        v24 = v23;
      objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 0, 0, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ((unint64_t)objc_msgSend(v15, "length") >= 0x61)
    {
      objc_msgSend(v15, "substringToIndex:", 96);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (objc_msgSend(v25, "UTF8String"))
      {
        if (!v25)
          return v15;
        goto LABEL_36;
      }
      objc_msgSend(v15, "substringToIndex:", 95);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_retainAutorelease(v26);
      if (!objc_msgSend(v27, "UTF8String"))
      {
        v30 = CFSTR("<<couldn't convert to UTF8>>");
        v25 = v15;
LABEL_42:

        v15 = (void *)v30;
        return v15;
      }
      v25 = v27;
      if (v27)
      {
LABEL_36:
        v28 = objc_msgSend(v25, "length");
        if (v28 == objc_msgSend(v15, "length") - 2 && (objc_msgSend(v15, "hasSuffix:", CFSTR("\n\"")) & 1) != 0)
          v29 = CFSTR("\"");
        else
          v29 = CFSTR("...\"");
        objc_msgSend(v25, "stringByAppendingString:", v29);
        v30 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v27 = v15;
        goto LABEL_42;
      }
    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

void __shortenString_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shortenString_newlineCharacterSet;
  shortenString_newlineCharacterSet = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shortenString_nonwhitespaceCharacterSet;
  shortenString_nonwhitespaceCharacterSet = v2;

}

__CFString *stringFromMappedNSCFData(void *a1, unint64_t *a2, uint64_t a3, void *a4, int a5, int a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  CFIndex Length;
  uint64_t v17;
  const char *BytePtr;
  char v19;
  __CFString *v20;
  id v21;
  void *v22;
  const char *v23;
  size_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t Name;
  uint64_t v53;
  uint64_t Range;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  char *v73;
  void *v74;
  char v75;
  id v76;
  void *v77;
  CC_SHA256_CTX c;
  const char *v79;
  unsigned __int8 md[32];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a4;
  v15 = a7;
  if (stringFromMappedNSCFData_onceToken != -1)
    dispatch_once(&stringFromMappedNSCFData_onceToken, &__block_literal_global_22);
  v79 = 0;
  Length = CFDataGetLength((CFDataRef)a2);
  if (!Length)
  {
    v20 = CFSTR("content length 0");
    goto LABEL_118;
  }
  v17 = Length;
  v77 = v13;
  BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)a2);
  if (a6)
  {
    v19 = atomic_load(a2 + 1);
    if ((v19 & 4) == 0)
      goto LABEL_77;
  }
  else if (!a5)
  {
    goto LABEL_77;
  }
  if (!remoteAddressIsOKtoRead(a3, v14))
  {
    v22 = 0;
    v20 = 0;
    v13 = v77;
    goto LABEL_117;
  }
  if (BytePtr - (const char *)a2 < (unint64_t)stringFromMappedNSCFData_cfDataSize)
  {
    v76 = v15;
    v21 = v14;
    v79 = BytePtr;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inline content length %ld"), v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = "inline ";
    goto LABEL_12;
  }
LABEL_77:
  objc_msgSend(v15, "vmuVMRegionForAddress:", BytePtr);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (!v43)
    goto LABEL_79;
  v45 = objc_msgSend(v43, "range");
  if ((unint64_t)&BytePtr[v17] > v45 + v46)
    goto LABEL_79;
  objc_msgSend(v44, "type");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "hasPrefix:", CFSTR("MALLOC_"));

  if ((v48 & 1) == 0)
  {
    objc_msgSend(v44, "descriptionWithOptions:maximumLength:", VMUGetFlagsForAllVMRegionStatistics() | 0x201, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "type");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "hasPrefix:", CFSTR("__"));

    if (v51 && (CSSymbolicatorGetSymbolWithAddressAtTime(), (Name = CSSymbolGetName()) != 0))
    {
      v53 = Name;
      Range = CSSymbolGetRange();
      if ((const char *)Range == BytePtr)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content length %ld  %s in VM:  %@"), v17, v53, v49, v69);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content length %ld  %s + %llu in VM:  %@"), v17, v53, &BytePtr[-Range], v49);
    }
    else if ((const char *)objc_msgSend(v44, "range") == BytePtr && (objc_msgSend(v44, "range"), v17 == v55))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content length %ld entire VM:  %@"), v17, v49, v68, v69);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content length %ld at offset %llu in VM:  %@"), v17, &BytePtr[-objc_msgSend(v44, "range")], v49, v69);
    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v77;

    goto LABEL_81;
  }
  if (!remoteAddressIsOKtoRead(a3, v14))
  {
LABEL_79:
    v20 = 0;
LABEL_80:
    v13 = v77;
LABEL_81:

    v22 = 0;
    goto LABEL_117;
  }
  task_peek_if_pages_exist(v77, (uint64_t)BytePtr, v17, &v79);
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content length %ld -- failed to read data from %#llx"), v17, BytePtr);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }
  v76 = v15;
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content length %ld at %#llx"), v17, BytePtr);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = "";
  BytePtr = v79;
LABEL_12:
  if (!strncmp(BytePtr, "bplist0", 7uLL))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", BytePtr, v17, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v56, 0, 0, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "description");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%sbinary plist:  %@"), v23, v58);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_98:
      v14 = v21;
      v15 = v76;
      v13 = v77;
      goto LABEL_117;
    }

  }
  if (v17 == 1)
    v24 = 5;
  else
    v24 = 3 * v17 + 1;
  v25 = (char *)malloc_type_malloc(v24, 0x8485E948uLL);
  if (!v25)
  {
    v20 = 0;
    goto LABEL_98;
  }
  v70 = v25;
  v71 = v22;
  v26 = &v25[v24];
  v14 = v21;
  v73 = &v25[v24];
  if (v17 < 1)
  {
    v28 = 0;
    v31 = v25;
    v15 = v76;
    goto LABEL_100;
  }
  v27 = 0;
  v28 = 0;
  v29 = v17 - 2;
  v72 = (unint64_t)(v26 - 2);
  v30 = MEMORY[0x1E0C80978];
  v75 = 1;
  v31 = v25;
  v74 = v21;
  do
  {
    v32 = 0;
    while (1)
    {
      v33 = v79[v27 + v32];
      if (v79[v27 + v32] < 0)
        break;
      if ((*(_DWORD *)(v30 + 4 * v33 + 60) & 0x40000) == 0)
        goto LABEL_24;
LABEL_30:
      ++v32;
      v35 = v27 + v32;
      if (v27 + v32 >= v17)
      {
        if (v32 > 3)
        {
          v36 = 0;
LABEL_33:
          v15 = v76;
          v37 = 0;
          v14 = v74;
          if (v27 >= 1 && !v36)
          {
            v36 = 0;
            v37 = 0;
            v31 -= v35 - v27 == v79[v27 - 1];
          }
          goto LABEL_66;
        }
        goto LABEL_38;
      }
    }
    if (__maskrune(v79[v27 + v32], 0x40000uLL))
      goto LABEL_30;
LABEL_24:
    v34 = v33 > 0xD || ((1 << v33) & 0x2600) == 0;
    if (!v34 || (v33 - 169) < 2)
      goto LABEL_30;
    if (v32 > 3)
    {
      v35 = v27 + v32;
      v36 = v79[v27 + v32] == 0;
      goto LABEL_33;
    }
LABEL_38:
    v35 = v27;
    if (v27 >= v29)
    {
LABEL_52:
      if (v35 - v27 > 7)
      {
        v36 = 0;
        v37 = 1;
        v14 = v74;
        goto LABEL_65;
      }
LABEL_57:
      v14 = v74;
      if ((v75 & 1) == 0)
      {
        v15 = v76;
        goto LABEL_61;
      }
      v15 = v76;
      if ((unint64_t)v31 < v72)
      {
        *(_WORD *)v31 = 30768;
        v31 += 2;
LABEL_61:
        if ((unint64_t)v31 < v72)
        {
          v75 = 0;
          *v31 = stringFromMappedNSCFData_hex[(unint64_t)v79[v27] >> 4];
          v31[1] = stringFromMappedNSCFData_hex[v79[v27] & 0xF];
          goto LABEL_75;
        }
      }
LABEL_104:
      free(v70);
      v20 = 0;
      v13 = v77;
      v22 = v71;
      goto LABEL_117;
    }
    v38 = 0;
    while (2)
    {
      if (!v79[v27 + v38])
      {
        v39 = v79[v27 + 1 + v38];
        if (v79[v27 + 1 + v38] < 0)
        {
          if (!__maskrune(v79[v27 + 1 + v38], 0x40000uLL))
          {
LABEL_45:
            v40 = v39 > 0xD || ((1 << v39) & 0x2600) == 0;
            if (v40 && (v39 - 169) >= 2)
              break;
          }
        }
        else if ((*(_DWORD *)(v30 + 4 * v39 + 60) & 0x40000) == 0)
        {
          goto LABEL_45;
        }
        v38 += 2;
        v35 = v27 + v38;
        if (v27 + v38 >= v29)
          goto LABEL_52;
        continue;
      }
      break;
    }
    if (v38 <= 7)
      goto LABEL_57;
    v35 = v27 + v38;
    v14 = v74;
    if (v79[v27 + v38])
      v36 = 0;
    else
      v36 = v79[v27 + 1 + v38] == 0;
    v37 = 1;
LABEL_65:
    v15 = v76;
LABEL_66:
    if (v31 >= &v73[v27 - v35 - 4])
      goto LABEL_104;
    *(_WORD *)v31 = 8736;
    v31 += 2;
    if (v27 >= v35)
    {
      v41 = v27;
    }
    else
    {
      do
      {
        v41 = v27 + v37 + 1;
        *v31++ = v79[v37 + v27];
        ++v28;
        v27 = v41;
      }
      while (v41 < v35);
    }
    *(_WORD *)v31 = 8226;
    if (v36)
      v42 = v37;
    else
      v42 = -1;
    v27 = v42 + v41;
    v75 = 1;
LABEL_75:
    v31 += 2;
    ++v27;
  }
  while (v27 < v17);
LABEL_100:
  if (v31 >= v73)
    goto LABEL_104;
  *v31 = 0;
  if (v17 >= 128 && (double)v28 * 100.0 / (double)v17 <= 25.0)
  {
    v61 = v15;
    v62 = v14;
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v63 = 0;
    v64 = 0x100000;
    v22 = v71;
    do
    {
      if (v17 - v63 < v64)
        v64 = v17 - v63;
      CC_SHA256_Update(&c, &v79[v63], v64);
      v63 += v64;
    }
    while (v63 < v17);
    CC_SHA256_Final(md, &c);
    v65 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v66 = 0;
    v13 = v77;
    do
      objc_msgSend(v65, "appendFormat:", CFSTR("%02x"), md[v66++]);
    while (v66 != 16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %.128s...   SHA256: %@"), v71, v70, v65);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v14 = v62;
    v15 = v61;
    v60 = v70;
  }
  else
  {
    v60 = v70;
    v22 = v71;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), v71, v70);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v77;
  }
  free(v60);
LABEL_117:

LABEL_118:
  return v20;
}

void __stringFromMappedNSCFData_block_invoke()
{
  CFDataRef v0;
  UInt8 bytes;

  bytes = 97;
  v0 = CFDataCreate(0, &bytes, 1);
  stringFromMappedNSCFData_cfDataSize = malloc_size(v0);
  CFRelease(v0);
}

void task_peek_if_pages_exist(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  void *v13;
  int v14;
  unint64_t v15;
  int v16;
  void *v17;
  unint64_t v18;

  v7 = a1;
  *a4 = 0;
  v8 = *MEMORY[0x1E0C85AA0];
  if (*MEMORY[0x1E0C85AA0] >= *MEMORY[0x1E0C85AC0])
    v8 = *MEMORY[0x1E0C85AC0];
  v9 = a2 & ~v8;
  v10 = ((a3 + a2 + v8) & ~v8) - v9;
  v11 = *MEMORY[0x1E0C85AA8];
  if (*MEMORY[0x1E0C85AA8] >= *MEMORY[0x1E0C85AD8])
    v11 = *MEMORY[0x1E0C85AD8];
  v18 = v10 / v11;
  v12 = malloc_type_malloc(4 * (v10 / v11), 0x30CAE2CEuLL);
  objc_msgSend(v7, "memoryCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "machVMPageRangeQueryWithAddress:size:dispositions:dispositionsCount:", v9, v10, v12, &v18);

  if (!v14)
  {
    if (!v18)
    {
LABEL_12:
      objc_msgSend(v7, "memoryCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "peekAtAddress:size:returnsBuf:", a2, a3, a4);

      goto LABEL_13;
    }
    if ((*v12 & 0x91) != 0)
    {
      v15 = 0;
      while (v18 - 1 != v15)
      {
        v16 = *(_DWORD *)&v12[4 * v15++ + 4];
        if ((v16 & 0x91) == 0)
        {
          if (v15 < v18)
            goto LABEL_13;
          goto LABEL_12;
        }
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  free(v12);

}

uint64_t checkStringIsValidHexAddress(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") < 6)
    goto LABEL_6;
  if ((unint64_t)objc_msgSend(v1, "length") > 0x12)
    goto LABEL_6;
  if (!objc_msgSend(v1, "hasPrefix:", CFSTR("0x")))
    goto LABEL_6;
  objc_msgSend(v1, "substringFromIndex:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEF"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 1;
  else
LABEL_6:
    v7 = 0;

  return v7;
}

void sub_1A4DBE718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void invertRecursiveWithNewInvertedRoot(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a1;
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "addObject:", v23);
  v7 = objc_msgSend(v23, "numChildren");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v23, "pseudoNodeTopOfStackChild");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      invertRecursiveWithNewInvertedRoot(v9, v5, v6);
    v11 = 0;
    do
    {
      objc_msgSend(v23, "childAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      invertRecursiveWithNewInvertedRoot(v12, v5, v6);

      v11 = (v11 + 1);
    }
    while (v8 != (_DWORD)v11);
  }
  else
  {
    v13 = v5;
    v14 = v6;
    objc_msgSend(v14, "lastObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v15;
    if (v15
      && (v16 = *(_DWORD *)(v15 + 40),
          v17 = *(_QWORD *)(v15 + 32),
          *((_DWORD *)v13 + 10) += v16,
          *((_QWORD *)v13 + 4) += v17,
          (v18 = objc_msgSend(v14, "count", v15)) != 0))
    {
      v19 = v18 - 1;
      do
      {
        objc_msgSend(v14, "objectAtIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", v21, objc_msgSend(v20, "address"), 1, 0);
        v10 = objc_claimAutoreleasedReturnValue();

        *(_DWORD *)(v10 + 40) += v16;
        *(_QWORD *)(v10 + 32) += v17;

        --v19;
        v13 = (id)v10;
      }
      while (v19 != -1);
    }
    else
    {
      v10 = (uint64_t)v13;
    }

  }
  objc_msgSend(v6, "removeLastObject");

}

BOOL isSystemPath(const char *a1)
{
  if (!a1)
    return 1;
  if (!strncmp(a1, "/System/", 8uLL))
    return 1;
  return strncmp(a1, "/usr/", 5uLL) == 0;
}

uint64_t __printTotalNumberInStack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);
  if (v7 <= v8)
  {
    if (v7 >= v8)
      v9 = objc_msgSend(v5, "compare:", v6);
    else
      v9 = 1;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __printCollapsedTops_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = NSMapGet(*(NSMapTable **)(a1 + 32), v5);
  v8 = NSMapGet(*(NSMapTable **)(a1 + 32), v6);
  if (*v7 <= *v8)
  {
    if (*v7 >= *v8)
      v9 = objc_msgSend(v5, "compare:", v6);
    else
      v9 = 1;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void sub_1A4DC1614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DC17F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4DC1BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A4DC1D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL CompareRangeAndString(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

void sub_1A4DC1E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DC2024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DC2260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DC23EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4DC248C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DC2624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>(uint64_t a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4, char a5, __n128 a6)
{
  __int128 *v10;
  __int128 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 *v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

LABEL_1:
  v10 = (__int128 *)((char *)a2 - 24);
  v11 = (__int128 *)a1;
LABEL_2:
  v12 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v11;
    v13 = v12;
    v14 = (char *)a2 - (char *)v11;
    v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    switch(v15)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((*a3)((__int128 *)((char *)a2 - 24), v11))
        {
          v30 = *((_QWORD *)v11 + 2);
          v28 = *v11;
          v26 = *v10;
          *((_QWORD *)v11 + 2) = *((_QWORD *)a2 - 1);
          *v11 = v26;
          *v10 = v28;
          *((_QWORD *)a2 - 1) = v30;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v11, (__int128 *)((char *)v11 + 24), (__int128 *)((char *)a2 - 24), a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)a2 - 24, a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__n128 *)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)v11 + 72, (uint64_t)a2 - 24, a3);
        return;
      default:
        if (v14 <= 575)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)v11, (uint64_t)a2, (uint64_t (**)(uint64_t, uint64_t))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)v11, (uint64_t)a2, (uint64_t (**)(uint64_t, uint64_t))a3);
          return;
        }
        if (v13 != 1)
        {
          v16 = v15 >> 1;
          v17 = (__int128 *)((char *)v11 + 24 * (v15 >> 1));
          if ((unint64_t)v14 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__int128 *)((char *)v11 + 24 * v16), v11, (__int128 *)((char *)a2 - 24), a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v11, (__int128 *)((char *)v11 + 24 * v16), (__int128 *)((char *)a2 - 24), a3);
            v18 = 3 * v16;
            v19 = (__int128 *)((char *)v11 + 24 * v16 - 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__int128 *)((char *)v11 + 24), v19, a2 - 3, a3);
            v20 = v11 + 3;
            v21 = (__int128 *)((char *)v11 + 8 * v18 + 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v20, v21, (__int128 *)((char *)a2 - 72), a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v19, v17, v21, a3);
            v29 = *(_QWORD *)(a1 + 16);
            v27 = *(_OWORD *)a1;
            v22 = *v17;
            *(_QWORD *)(a1 + 16) = *((_QWORD *)v17 + 2);
            *(_OWORD *)a1 = v22;
            *((_QWORD *)v17 + 2) = v29;
            *v17 = v27;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if (((*a3)((__int128 *)(a1 - 24), (__int128 *)a1) & 1) == 0)
          {
            v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>((__int128 *)a1, a2, a3);
            goto LABEL_16;
          }
LABEL_11:
          v23 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>((__int128 *)a1, (unint64_t)a2, (uint64_t (**)(char *, __int128 *))a3);
          if ((v24 & 1) == 0)
            goto LABEL_14;
          v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(a1, v23, a3);
          v11 = (__int128 *)(v23 + 24);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v23 + 24, (uint64_t)a2, a3))
          {
            v12 = v13 + 1;
            if (v25)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>(a1, v23, a3, -v13, a5 & 1);
            v11 = (__int128 *)(v23 + 24);
LABEL_16:
            a5 = 0;
            a4 = -v13;
            goto LABEL_2;
          }
          a4 = -v13;
          a2 = (__int128 *)v23;
          if (v25)
            return;
          goto LABEL_1;
        }
        if (v11 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,RangeAndString*>((__n128 *)v11, (__n128 *)a2, (__n128 *)a2, (unsigned int (**)(uint64_t, __int8 *))a3, a6);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (result != a2)
  {
    v17 = v3;
    v18 = v4;
    v6 = result;
    v7 = result + 24;
    if (result + 24 != a2)
    {
      v9 = 0;
      v10 = result;
      do
      {
        v11 = v10;
        v10 = v7;
        result = (*a3)(v7, v11);
        if ((_DWORD)result)
        {
          v15 = *(_OWORD *)v10;
          v16 = *(_QWORD *)(v10 + 16);
          v12 = v9;
          while (1)
          {
            v13 = v6 + v12;
            *(_OWORD *)(v13 + 24) = *(_OWORD *)(v6 + v12);
            *(_QWORD *)(v13 + 40) = *(_QWORD *)(v6 + v12 + 16);
            if (!v12)
              break;
            v12 -= 24;
            result = (*a3)((uint64_t)&v15, v12 + v6);
            if ((result & 1) == 0)
            {
              v14 = v6 + v12 + 24;
              goto LABEL_10;
            }
          }
          v14 = v6;
LABEL_10:
          *(_OWORD *)v14 = v15;
          *(_QWORD *)(v14 + 16) = v16;
        }
        v7 = v10 + 24;
        v9 += 24;
      }
      while (v10 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (result != a2)
  {
    v14 = v3;
    v15 = v4;
    v6 = result;
    v7 = result + 24;
    if (result + 24 != a2)
    {
      v9 = result - 24;
      do
      {
        v10 = v6;
        v6 = v7;
        result = (*a3)(v7, v10);
        if ((_DWORD)result)
        {
          v12 = *(_OWORD *)v6;
          v13 = *(_QWORD *)(v6 + 16);
          v11 = v9;
          do
          {
            *(_OWORD *)(v11 + 48) = *(_OWORD *)(v11 + 24);
            *(_QWORD *)(v11 + 64) = *(_QWORD *)(v11 + 40);
            result = (*a3)((uint64_t)&v12, v11);
            v11 -= 24;
          }
          while ((result & 1) != 0);
          *(_OWORD *)(v11 + 48) = v12;
          *(_QWORD *)(v11 + 64) = v13;
        }
        v7 = v6 + 24;
        v9 += 24;
      }
      while (v6 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t (**a4)(__int128 *, __int128 *))
{
  char v8;
  uint64_t result;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v8 = (*a4)(a2, a1);
  result = (*a4)(a3, a2);
  if ((v8 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    v13 = *((_QWORD *)a2 + 2);
    v14 = *a2;
    v15 = *((_QWORD *)a3 + 2);
    *a2 = *a3;
    *((_QWORD *)a2 + 2) = v15;
    *a3 = v14;
    *((_QWORD *)a3 + 2) = v13;
    if (!(*a4)(a2, a1))
      return 1;
    v16 = *((_QWORD *)a1 + 2);
    v17 = *a1;
    v18 = *((_QWORD *)a2 + 2);
    *a1 = *a2;
    *((_QWORD *)a1 + 2) = v18;
    *a2 = v17;
    *((_QWORD *)a2 + 2) = v16;
    return 2;
  }
  if (!(_DWORD)result)
  {
    v19 = *((_QWORD *)a1 + 2);
    v20 = *a1;
    v21 = *((_QWORD *)a2 + 2);
    *a1 = *a2;
    *((_QWORD *)a1 + 2) = v21;
    *a2 = v20;
    *((_QWORD *)a2 + 2) = v19;
    if (!(*a4)(a3, a2))
      return 1;
    v22 = *((_QWORD *)a2 + 2);
    v23 = *a2;
    v24 = *((_QWORD *)a3 + 2);
    *a2 = *a3;
    *((_QWORD *)a2 + 2) = v24;
    *a3 = v23;
    *((_QWORD *)a3 + 2) = v22;
    return 2;
  }
  v10 = *((_QWORD *)a1 + 2);
  v11 = *a1;
  v12 = *((_QWORD *)a3 + 2);
  *a1 = *a3;
  *((_QWORD *)a1 + 2) = v12;
  *a3 = v11;
  *((_QWORD *)a3 + 2) = v10;
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  __int128 *v4;
  __int128 *v6;
  __int128 *v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v4 = a2;
  v16 = *a1;
  v17 = *((_QWORD *)a1 + 2);
  if (((*a3)(&v16, (__int128 *)((char *)a2 - 24)) & 1) != 0)
  {
    v6 = a1;
    do
      v6 = (__int128 *)((char *)v6 + 24);
    while (((*a3)(&v16, v6) & 1) == 0);
  }
  else
  {
    v7 = (__int128 *)((char *)a1 + 24);
    do
    {
      v6 = v7;
      if (v7 >= v4)
        break;
      v8 = (*a3)(&v16, v7);
      v7 = (__int128 *)((char *)v6 + 24);
    }
    while (!v8);
  }
  if (v6 < v4)
  {
    do
      v4 = (__int128 *)((char *)v4 - 24);
    while (((*a3)(&v16, v4) & 1) != 0);
  }
  while (v6 < v4)
  {
    v9 = *v6;
    v19 = *((_QWORD *)v6 + 2);
    v18 = v9;
    v10 = *v4;
    *((_QWORD *)v6 + 2) = *((_QWORD *)v4 + 2);
    *v6 = v10;
    v11 = v18;
    *((_QWORD *)v4 + 2) = v19;
    *v4 = v11;
    do
      v6 = (__int128 *)((char *)v6 + 24);
    while (!(*a3)(&v16, v6));
    do
      v4 = (__int128 *)((char *)v4 - 24);
    while (((*a3)(&v16, v4) & 1) != 0);
  }
  v12 = (__int128 *)((char *)v6 - 24);
  if ((__int128 *)((char *)v6 - 24) != a1)
  {
    v13 = *v12;
    *((_QWORD *)a1 + 2) = *((_QWORD *)v6 - 1);
    *a1 = v13;
  }
  v14 = v16;
  *((_QWORD *)v6 - 1) = v17;
  *v12 = v14;
  return v6;
}

uint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>(__int128 *a1, unint64_t a2, uint64_t (**a3)(char *, __int128 *))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 *v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = 0;
  v17 = *a1;
  v18 = *((_QWORD *)a1 + 2);
  do
    v6 += 24;
  while (((*a3)((char *)a1 + v6, &v17) & 1) != 0);
  v7 = (unint64_t)a1 + v6;
  v8 = (uint64_t)a1 + v6 - 24;
  if (v6 == 24)
  {
    do
    {
      if (v7 >= a2)
        break;
      a2 -= 24;
    }
    while (((*a3)((char *)a2, &v17) & 1) == 0);
  }
  else
  {
    do
      a2 -= 24;
    while (!(*a3)((char *)a2, &v17));
  }
  if (v7 < a2)
  {
    v9 = (__int128 *)((char *)a1 + v6);
    v10 = a2;
    do
    {
      v19 = *v9;
      v11 = v19;
      v20 = *((_QWORD *)v9 + 2);
      v12 = v20;
      v13 = *(_QWORD *)(v10 + 16);
      *v9 = *(_OWORD *)v10;
      *((_QWORD *)v9 + 2) = v13;
      *(_QWORD *)(v10 + 16) = v12;
      *(_OWORD *)v10 = v11;
      do
        v9 = (__int128 *)((char *)v9 + 24);
      while (((*a3)((char *)v9, &v17) & 1) != 0);
      do
        v10 -= 24;
      while (!(*a3)((char *)v10, &v17));
    }
    while ((unint64_t)v9 < v10);
    v8 = (uint64_t)v9 - 24;
  }
  if ((__int128 *)v8 != a1)
  {
    v14 = *(_OWORD *)v8;
    *((_QWORD *)a1 + 2) = *(_QWORD *)(v8 + 16);
    *a1 = v14;
  }
  v15 = v17;
  *(_QWORD *)(v8 + 16) = v18;
  *(_OWORD *)v8 = v15;
  return v8;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  unint64_t v6;
  _BOOL8 result;
  __int128 *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = (__int128 *)(a2 - 24);
      if ((*a3)((__int128 *)(a2 - 24), (__int128 *)a1))
      {
        v9 = *(_QWORD *)(a1 + 16);
        v10 = *(_OWORD *)a1;
        v11 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(_QWORD *)(a1 + 16) = v11;
        *v8 = v10;
        *(_QWORD *)(a2 - 8) = v9;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24, a3);
      return 1;
    default:
      v12 = (__int128 *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48), a3);
      v13 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)((__int128 *)v13, v12))
    {
      v19 = *(_OWORD *)v13;
      v20 = *(_QWORD *)(v13 + 16);
      v16 = v14;
      while (1)
      {
        v17 = a1 + v16;
        *(_OWORD *)(v17 + 72) = *(_OWORD *)(a1 + v16 + 48);
        *(_QWORD *)(v17 + 88) = *(_QWORD *)(a1 + v16 + 64);
        if (v16 == -48)
          break;
        v16 -= 24;
        if (((*a3)(&v19, (__int128 *)(v17 + 24)) & 1) == 0)
        {
          v18 = a1 + v16 + 72;
          goto LABEL_12;
        }
      }
      v18 = a1;
LABEL_12:
      *(_OWORD *)v18 = v19;
      *(_QWORD *)(v18 + 16) = v20;
      if (++v15 == 8)
        return v13 + 24 == a2;
    }
    v12 = (__int128 *)v13;
    v14 += 24;
    v13 += 24;
    if (v13 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(__int128 *, __int128 *))
{
  __n128 result;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3, a5);
  if ((*a5)((__int128 *)a4, (__int128 *)a3))
  {
    v11 = *(_QWORD *)(a3 + 16);
    v12 = *(_OWORD *)a3;
    v13 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(_QWORD *)(a4 + 16) = v11;
    if ((*a5)((__int128 *)a3, (__int128 *)a2))
    {
      v14 = *(_QWORD *)(a2 + 16);
      v15 = *(_OWORD *)a2;
      v16 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(_QWORD *)(a3 + 16) = v14;
      if ((*a5)((__int128 *)a2, (__int128 *)a1))
      {
        v17 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v18 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v17;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(__int128 *, __int128 *))
{
  __n128 v12;
  __n128 result;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, a2, a3, a4, a6);
  if (((unsigned int (*)(uint64_t, uint64_t, __n128))*a6)(a5, a4, v12))
  {
    v14 = *(_QWORD *)(a4 + 16);
    v15 = *(_OWORD *)a4;
    v16 = *(_QWORD *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_QWORD *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(_QWORD *)(a5 + 16) = v14;
    if ((*a6)((__int128 *)a4, (__int128 *)a3))
    {
      v17 = *(_QWORD *)(a3 + 16);
      v18 = *(_OWORD *)a3;
      v19 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_QWORD *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(_QWORD *)(a4 + 16) = v17;
      if ((*a6)((__int128 *)a3, (__int128 *)a2))
      {
        v20 = *(_QWORD *)(a2 + 16);
        v21 = *(__n128 *)a2;
        v22 = *(_QWORD *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_QWORD *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(_QWORD *)(a3 + 16) = v20;
        if ((*a6)((__int128 *)a2, (__int128 *)a1))
        {
          v23 = a1[1].n128_u64[0];
          result = *a1;
          v24 = *(_QWORD *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(_QWORD *)(a2 + 16) = v23;
        }
      }
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,RangeAndString*>(__n128 *a1, __n128 *a2, __n128 *a3, unsigned int (**a4)(uint64_t, __int8 *), __n128 a5)
{
  __n128 *v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __n128 *v13;
  __n128 *v14;
  __n128 *v15;
  unint64_t v16;
  __n128 v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __n128 v26;
  __n128 *v29;
  __n128 *v30;
  __n128 v31;
  unint64_t v32;

  if (a1 != a2)
  {
    v7 = a2;
    v9 = (char *)a2 - (char *)a1;
    v10 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      v11 = (unint64_t)(v10 - 2) >> 1;
      v12 = v11 + 1;
      v13 = (__n128 *)((char *)a1 + 24 * v11);
      do
      {
        a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, a4, v10, v13);
        v13 = (__n128 *)((char *)v13 - 24);
        --v12;
      }
      while (v12);
    }
    v14 = v7;
    if (v7 != a3)
    {
      v15 = v7;
      do
      {
        if (((unsigned int (*)(__n128 *, __n128 *, __n128))*a4)(v15, a1, a5))
        {
          v16 = v15[1].n128_u64[0];
          v17 = *v15;
          v18 = a1[1].n128_u64[0];
          *v15 = *a1;
          v15[1].n128_u64[0] = v18;
          *a1 = v17;
          a1[1].n128_u64[0] = v16;
          a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, a4, v10, a1);
        }
        v15 = (__n128 *)((char *)v15 + 24);
      }
      while (v15 != a3);
      v14 = a3;
    }
    if (v9 < 25)
    {
      return v14;
    }
    else
    {
      v29 = v14;
      v19 = v9 / 0x18uLL;
      do
      {
        v30 = v7;
        v20 = 0;
        v31 = *a1;
        v32 = a1[1].n128_u64[0];
        v21 = (uint64_t)a1;
        do
        {
          v22 = v21 + 24 * v20 + 24;
          v23 = (2 * v20) | 1;
          v24 = 2 * v20 + 2;
          if (v24 < v19 && (*a4)(v21 + 24 * v20 + 24, (__int8 *)(v21 + 24 * v20 + 48)))
          {
            v22 += 24;
            v23 = v24;
          }
          v25 = *(_OWORD *)v22;
          *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
          *(_OWORD *)v21 = v25;
          v21 = v22;
          v20 = v23;
        }
        while (v23 <= (uint64_t)((unint64_t)(v19 - 2) >> 1));
        v7 = (__n128 *)((char *)v30 - 24);
        if ((__int8 *)v22 == &v30[-2].n128_i8[8])
        {
          *(_QWORD *)(v22 + 16) = v32;
          *(__n128 *)v22 = v31;
        }
        else
        {
          v26 = *v7;
          *(_QWORD *)(v22 + 16) = v30[-1].n128_u64[1];
          *(__n128 *)v22 = v26;
          *v7 = v31;
          v30[-1].n128_u64[1] = v32;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, v22 + 24, (uint64_t (**)(__int128 *, __int128 *))a4, 0xAAAAAAAAAAAAAAABLL * ((v22 + 24 - (uint64_t)a1) >> 3));
        }
      }
      while (v19-- > 2);
      return v29;
    }
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, unsigned int (**a2)(uint64_t, __int8 *), uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 *v7;
  uint64_t v9;
  uint64_t v12;
  __n128 *v13;
  uint64_t v14;
  __n128 result;
  __n128 *v16;
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v22 = v4;
    v23 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      v13 = (__n128 *)(a1 + 24 * v12);
      v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v14 < a3 && (*a2)(a1 + 24 * v12, &v13[1].n128_i8[8]))
      {
        v13 = (__n128 *)((char *)v13 + 24);
        v12 = v14;
      }
      if ((((uint64_t (*)(__n128 *, __n128 *))*a2)(v13, v7) & 1) == 0)
      {
        v20 = *v7;
        v21 = v7[1].n128_u64[0];
        do
        {
          v16 = v13;
          v17 = *v13;
          v7[1].n128_u64[0] = v13[1].n128_u64[0];
          *v7 = v17;
          if (v9 < v12)
            break;
          v18 = (2 * v12) | 1;
          v13 = (__n128 *)(a1 + 24 * v18);
          v19 = 2 * v12 + 2;
          if (v19 < a3)
          {
            if ((*a2)(a1 + 24 * v18, &v13[1].n128_i8[8]))
            {
              v13 = (__n128 *)((char *)v13 + 24);
              v18 = v19;
            }
          }
          v7 = v16;
          v12 = v18;
        }
        while (!(*a2)((uint64_t)v13, (__int8 *)&v20));
        result = v20;
        v16[1].n128_u64[0] = v21;
        *v16 = result;
      }
    }
  }
  return result;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v9;
  __int128 *v10;
  __int128 *v11;
  double result;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4 - 2;
  if (a4 >= 2)
  {
    v17 = v4;
    v18 = v5;
    v9 = v6 >> 1;
    v10 = (__int128 *)(a1 + 24 * (v6 >> 1));
    v11 = (__int128 *)(a2 - 24);
    if ((*a3)(v10, (__int128 *)(a2 - 24)))
    {
      v15 = *v11;
      v16 = *((_QWORD *)v11 + 2);
      do
      {
        v13 = v10;
        v14 = *v10;
        *((_QWORD *)v11 + 2) = *((_QWORD *)v10 + 2);
        *v11 = v14;
        if (!v9)
          break;
        v9 = (v9 - 1) >> 1;
        v10 = (__int128 *)(a1 + 24 * v9);
        v11 = v13;
      }
      while (((*a3)(v10, &v15) & 1) != 0);
      result = *(double *)&v15;
      *v13 = v15;
      *((_QWORD *)v13 + 2) = v16;
    }
  }
  return result;
}

void sub_1A4DC3F88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4DC51B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1A4DC5840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

id vmuTaskMemoryCacheInitializationError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("VMUTaskMemoryCache initialization"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1A4DC7828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DC7C7C(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1A4DC7BB8);
  }
  _Unwind_Resume(exc_buf);
}

unsigned __int8 *_appendToBuffer(unsigned __int8 *ptr, unsigned int *a2, unsigned int *a3, void *__src, size_t __n)
{
  unsigned int v5;
  unsigned __int8 *v8;
  int v9;
  int v10;
  size_t v11;
  unsigned int v12;

  v5 = __n;
  v8 = ptr;
  v9 = *a3;
  v10 = *a2;
  if (*a3 + __n > *a2)
  {
    LODWORD(v11) = 2 * v10;
    v12 = v10 + __n;
    if (v11 <= v12)
      LODWORD(v11) = v12;
    if (v11 <= 0x400)
      v11 = 1024;
    else
      v11 = v11;
    *a2 = v11;
    v8 = (unsigned __int8 *)malloc_type_realloc(ptr, v11, 0xE99C43A3uLL);
    v9 = *a3;
  }
  memcpy(&v8[v9], __src, v5);
  *a3 += v5;
  return v8;
}

void sub_1A4DC8774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DC89A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DC8AB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _nextField(uint64_t a1, unsigned int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t result;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = *a3;
  if (v4 + 4 <= (unint64_t)a2)
  {
    result = *(unsigned int *)(a1 + v4);
    *a3 = v4 + 4;
  }
  else
  {
    serializerLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      _nextField(v6, v7, v8, v9, v10, v11, v12, v13);

    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = OOBDOMAIN;
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("Out-of-bound access.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return result;
}

void sub_1A4DC8BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DC8E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id serializerLogHandle(void)
{
  if (serializerLogHandle(void)::onceToken != -1)
    dispatch_once(&serializerLogHandle(void)::onceToken, &__block_literal_global_9);
  return (id)serializerLogHandle(void)::log;
}

void sub_1A4DC90A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL19serializerLogHandlev_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Symbolication", "VMUSimpleSerializer");
  v1 = (void *)serializerLogHandle(void)::log;
  serializerLogHandle(void)::log = (uint64_t)v0;

}

void *std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,char const*,unsigned int &>(uint64_t a1, const char **a2, _QWORD *a3, _DWORD *a4)
{
  unint64_t v4;
  const char *v8;
  char v9;
  unint64_t v10;
  unsigned __int8 *v11;
  int v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  void **v16;
  void *i;
  unint64_t v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;

  v8 = *a2;
  v9 = **a2;
  if (v9)
  {
    v10 = 0;
    v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      v10 = 5 * v10 + v9;
      v12 = *v11++;
      v9 = v12;
    }
    while (v12);
  }
  else
  {
    v10 = 0;
  }
  v13 = *(_QWORD *)(a1 + 8);
  if (v13)
  {
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    v15 = v14.u32[0];
    if (v14.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v13)
        v4 = v10 % v13;
    }
    else
    {
      v4 = (v13 - 1) & v10;
    }
    v16 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v16)
    {
      for (i = *v16; i; i = *(void **)i)
      {
        v18 = *((_QWORD *)i + 1);
        if (v18 == v10)
        {
          if (!strcmp(*((const char **)i + 2), v8))
            return i;
        }
        else
        {
          if (v15 > 1)
          {
            if (v18 >= v13)
              v18 %= v13;
          }
          else
          {
            v18 &= v13 - 1;
          }
          if (v18 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v10;
  *((_QWORD *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  v19 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v20 = *(float *)(a1 + 32);
  if (!v13 || (float)(v20 * (float)v13) < v19)
  {
    v21 = 1;
    if (v13 >= 3)
      v21 = (v13 & (v13 - 1)) != 0;
    v22 = v21 | (2 * v13);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      v24 = v23;
    else
      v24 = v22;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v24);
    v13 = *(_QWORD *)(a1 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v10 >= v13)
        v4 = v10 % v13;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v13 - 1) & v10;
    }
  }
  v25 = *(_QWORD *)a1;
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v26)
  {
    *(_QWORD *)i = *v26;
LABEL_43:
    *v26 = i;
    goto LABEL_44;
  }
  *(_QWORD *)i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v25 + 8 * v4) = a1 + 16;
  if (*(_QWORD *)i)
  {
    v27 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v27 >= v13)
        v27 %= v13;
    }
    else
    {
      v27 &= v13 - 1;
    }
    v26 = (_QWORD *)(*(_QWORD *)a1 + 8 * v27);
    goto LABEL_43;
  }
LABEL_44:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1A4DC9398(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  v13 = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(a3 + 8) = 0;
  v10[3] = v13;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    v16 = 1;
    if (v7 >= 3)
      v16 = (v7 & (v7 - 1)) != 0;
    v17 = v16 | (2 * v7);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v19);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *v10 = *v21;
LABEL_38:
    *v21 = v10;
    goto LABEL_39;
  }
  *v10 = *v12;
  *v12 = v10;
  *(_QWORD *)(v20 + 8 * v3) = v12;
  if (*v10)
  {
    v22 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7)
        v22 %= v7;
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_1A4DC95E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t compareRange(_QWORD *a1, _QWORD *a2)
{
  unsigned int v2;

  if (*a1 >= *a2)
    v2 = 0;
  else
    v2 = -1;
  if (*a1 > *a2)
    return 1;
  else
    return v2;
}

void RangeArrayInsertRangeAtIndex(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unsigned int *v14;

  v7 = a1;
  v8 = v7[2];
  v14 = v7;
  if (v8 >= v7[6])
  {
    v9 = (3 * v8 + 3) >> 1;
    v7[6] = v9;
    *((_QWORD *)v7 + 2) = malloc_type_realloc(*((void **)v7 + 2), 16 * v9, 0x1000040451B5BE8uLL);
    v7 = v14;
    v8 = v14[2];
  }
  v10 = v8 - a4;
  v11 = a4;
  if (v10)
  {
    v12 = *((_QWORD *)v7 + 2) + 16 * a4;
    memmove((void *)(v12 + 16), (const void *)v12, 16 * v10);
    v7 = v14;
    a4 = v14[2];
  }
  v13 = (_QWORD *)(*((_QWORD *)v7 + 2) + 16 * v11);
  *v13 = a2;
  v13[1] = a3;
  v7[2] = a4 + 1;

}

void RangeArrayRemoveRangeAtIndex(void *a1, unsigned int a2)
{
  _DWORD *v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  _DWORD *v7;

  v3 = a1;
  v4 = v3[2];
  if (v4 > a2)
  {
    v5 = v4 - 1;
    if (v4 - 1 > a2)
    {
      v7 = v3;
      v6 = *((_QWORD *)v3 + 2) + 16 * a2;
      memmove((void *)v6, (const void *)(v6 + 16), 16 * (v4 + ~a2));
      v3 = v7;
      v5 = v7[2] - 1;
    }
    v3[2] = v5;
  }

}

uint64_t VMUIsMetaclass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a1;
  v8 = a2;
  if (a3)
  {
    v9 = (_BYTE *)_classDataRWV1ofClass(v7, v8, a4);
  }
  else
  {
    v10 = _classDataRWV0ofClass(v7, v8, a4);
    if (!v10)
    {
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    v9 = (_BYTE *)(*((uint64_t (**)(id, _QWORD, uint64_t))v8 + 2))(v8, *(_QWORD *)(v10 + 8), 4);
  }
  if (!v9)
    goto LABEL_7;
  v11 = *v9 & 1;
LABEL_8:

  return v11;
}

void sub_1A4DCA658(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _classDataRWV0ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t (**v6)(id, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  v7 = _classDataRWAddressofClass(v5, (uint64_t)v6, a3);
  if (v7)
    v8 = v6[2](v6, v7, 64);
  else
    v8 = 0;

  return v8;
}

void sub_1A4DCA6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _classDataRWV1ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t (**v6)(id, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  v7 = _classDataRWAddressofClass(v5, (uint64_t)v6, a3);
  if (v7)
    v8 = v6[2](v6, v7, 32);
  else
    v8 = 0;

  return v8;
}

void sub_1A4DCA778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t VMUGetNextSiblingOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a1;
  v8 = a2;
  if (!a3)
  {
    v11 = _classDataRWV0ofClass(v7, v8, a4);
    if (v11)
    {
      v10 = (uint64_t *)(v11 + 48);
      goto LABEL_6;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9)
    goto LABEL_7;
  v10 = (uint64_t *)(v9 + 24);
LABEL_6:
  v12 = *v10;
LABEL_8:

  return v12;
}

void sub_1A4DCA818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t VMUGetFirstSubclassOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a1;
  v8 = a2;
  if (!a3)
  {
    v11 = _classDataRWV0ofClass(v7, v8, a4);
    if (v11)
    {
      v10 = (uint64_t *)(v11 + 40);
      goto LABEL_6;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9)
    goto LABEL_7;
  v10 = (uint64_t *)(v9 + 16);
LABEL_6:
  v12 = *v10;
LABEL_8:

  return v12;
}

void sub_1A4DCA8BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataRO(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t (**v6)(id, _QWORD, uint64_t);
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;

  v5 = a1;
  v6 = a2;
  v7 = v6[2](v6, a3, 72);
  if (v7
    && (objc_msgSend(v5, "memoryCache"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (const char *)objc_msgSend(v8, "peekStringAtAddress:", *(_QWORD *)(v7 + 24)),
        v8,
        v9))
  {
    if (!strncmp(v9, "_Tt", 3uLL))
      demangleSwiftClassName(v9);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metaclass for %@"), v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1A4DCA9E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id demangleSwiftClassName(const char *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v1 = CSDemangleSymbolName();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v1);
    free(v2);
    if (demangleSwiftClassName(char const*)::onceToken != -1)
      dispatch_once(&demangleSwiftClassName(char const*)::onceToken, &__block_literal_global_398);
    v4 = v3;
    v5 = v4;
    if (objc_msgSend((id)demangleSwiftClassName(char const*)::s_removeUUIDRegex, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")))
    {
      objc_msgSend((id)demangleSwiftClassName(char const*)::s_removeUUIDRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), CFSTR("$1"));
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
    if (objc_msgSend((id)demangleSwiftClassName(char const*)::s_unsuffixRegex, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")))
    {
      objc_msgSend((id)demangleSwiftClassName(char const*)::s_unsuffixRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), CFSTR("$1"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    if (objc_msgSend((id)demangleSwiftClassName(char const*)::s_demodularRegex, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")))
    {
      objc_msgSend((id)demangleSwiftClassName(char const*)::s_demodularRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), CFSTR("$2"));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    if (v5 != v4)
    {
      v9 = v5;

      v4 = v9;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void sub_1A4DCABF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataExtRW(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v7 = a1;
  v8 = a2;
  v9 = v8;
  if (a3
    && (v10 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v8 + 2))(v8, a4 & 0xFFFFFFFFFFFFFFFELL, 48)) != 0)
  {
    v11 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *v10);
    VMUGetClassNameFromClassDataRO(v7, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_1A4DCAC98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataRW(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  uint64_t (**v8)(id, uint64_t, uint64_t);
  uint64_t (**v9)(id, uint64_t, uint64_t);
  uint64_t (*v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a1;
  v8 = a2;
  v9 = v8;
  v10 = v8[2];
  if (!a3)
  {
    v14 = v10(v8, a4, 64);
    if (!v14)
      goto LABEL_10;
    v12 = *(_QWORD *)(v14 + 8);
    goto LABEL_7;
  }
  v11 = v10(v8, a4, 32);
  if (!v11)
    goto LABEL_10;
  v12 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(_QWORD *)(v11 + 8));
  if ((v12 & 1) == 0)
  {
LABEL_7:
    if (v12)
    {
      VMUGetClassNameFromClassDataRO(v7, v9, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  VMUGetClassNameFromClassDataExtRW(v7, v9, a3, v12);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = (void *)v13;
LABEL_11:

  return v15;
}

void sub_1A4DCAD7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassStructure(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a1;
  v8 = a2;
  v9 = _classDataRWAddressofClass(v7, (uint64_t)v8, a4);
  if (v9)
  {
    VMUGetClassNameFromClassDataRW(v7, v8, a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1A4DCAE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _classDataRWAddressofClass(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3 + 32, 8);
  if (v6)
    v7 = *v6;
  else
    v7 = 0;
  v8 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v5, v7) & 0x7FFFFFFFFFF8;

  return v8;
}

void sub_1A4DCAE98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCB17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DCB204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DCB278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DCB300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t debugSwiftSubfieldIsEnabled()
{
  if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
    dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
  return debugSwiftSubfieldIsEnabled::isEnabled;
}

void __debugSwiftSubfieldIsEnabled_block_invoke()
{
  BOOL v0;

  if ((_debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_DEBUG_SWIFT_SUBFIELDS") & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1)
      dispatch_once(&_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken, &__block_literal_global_412);
    v0 = _debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled != 0;
  }
  debugSwiftSubfieldIsEnabled::isEnabled = v0;
}

char *_debugSwiftSubfieldEnvironmentVariableIsEnabled(const char *a1)
{
  char *result;
  const char *v2;

  result = getenv(a1);
  if (result)
  {
    v2 = result;
    if (!strcmp(result, "YES"))
      return (char *)1;
    else
      return (char *)(strcmp(v2, "1") == 0);
  }
  return result;
}

void sub_1A4DCB59C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DCB670(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4DCB9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void _debugSwiftSubfieldDumpSwiftChildInfo(int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  int v9;
  const char *v10;
  const char *v11;
  const void *v12;
  id v13;

  if (*(_QWORD *)a3)
    v8 = *(const char **)a3;
  else
    v8 = "NULL";
  v9 = *(_DWORD *)(a3 + 8);
  v10 = nameOfSwiftLayoutKind(*(_DWORD *)(a3 + 12));
  v11 = v10;
  v12 = *(const void **)(a3 + 16);
  if (v12)
  {
    vmu_swift_reflection_interop_copyDemangledNameForTypeRef(a4, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    _debugSwiftAsyncPrintf(a1, "%s gave { .name = \"%s\", .Offset = %u, .Kind = %s, .TR = { .Typeref = %p (type %s), .Library = %d } }\n", a2, v8, v9, v11, v12, (const char *)objc_msgSend(v13, "UTF8String"), *(_DWORD *)(a3 + 24));

  }
  else
  {
    _debugSwiftAsyncPrintf(a1, "%s gave { .name = \"%s\", .Offset = %u, .Kind = %s, .TR = { .Typeref = %p (type %s), .Library = %d } }\n", a2, v8, v9, v10, 0, "?", *(_DWORD *)(a3 + 24));
  }
}

void sub_1A4DCBB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{

  _Unwind_Resume(a1);
}

id _createFieldInfoFromChild(uint64_t *a1, const char *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7, void *a8, _BYTE *a9, int a10)
{
  int v11;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  FILE *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v11 = a6;
  v16 = a9;
  v31 = a5;
  v32 = a6;
  v17 = a7;
  v18 = a8;
  if (!a4 || a4 >= 19)
  {
    if (a4)
    {
      v22 = "has invalid kind";
    }
    else
    {
      *a9 = 1;
      v22 = "has kind SWIFT_UNKNOWN";
    }
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    if (debugSwiftSubfieldIsEnabled::isEnabled)
    {
      if (!a5)
      {
        _debugSwiftAsyncPrintf(a10, "Bailing because field \"%s\" (type %s) %s\n", a2, "?", v22);
        if (a4)
          goto LABEL_22;
        goto LABEL_26;
      }
      vmu_swift_reflection_interop_copyDemangledNameForTypeRef(*a1, a5, v11);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      _debugSwiftAsyncPrintf(a10, "Bailing because field \"%s\" (type %s) %s\n", a2, (const char *)objc_msgSend(v16, "UTF8String"), v22);

    }
    if (a4)
    {
LABEL_22:
      v21 = 0;
      goto LABEL_23;
    }
LABEL_26:
    if (_logSwiftUnknownFieldsIsEnabled(void)::onceToken != -1)
      dispatch_once(&_logSwiftUnknownFieldsIsEnabled(void)::onceToken, &__block_literal_global_454);
    if (_logSwiftUnknownFieldsIsEnabled(void)::isEnabled)
    {
      v24 = (FILE *)*MEMORY[0x1E0C80C10];
      if (a5)
      {
        vmu_swift_reflection_interop_copyDemangledNameForTypeRef(*a1, a5, v11);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v25 = (const char *)objc_msgSend(v16, "UTF8String");
      }
      else
      {
        v25 = "?";
      }
      fprintf(v24, "Found SWIFT_UNKNOWN field \"%s\" (type %s) in class %s\n", a2, v25, (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
      if (a5)

    }
    goto LABEL_22;
  }
  if (a2)
    v19 = a2;
  else
    v19 = "";
  v27 = v19;
  objc_msgSend(v17, "swiftFieldWithName:offset:kind:typeref:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    if (debugSwiftSubfieldIsEnabled::isEnabled)
      _debugSwiftAsyncPrintf(a10, "Found cached field \"%s\"\n", v27);
    v21 = v20;
  }
  else
  {
    if (_createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::dispatchEnumConfigOnceToken != -1)
      dispatch_once(&_createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::dispatchEnumConfigOnceToken, &__block_literal_global_440);
    v28 = 0;
    v29 = 0;
    v30 = 0;
    vmu_swift_reflection_infoForTypeRef(*a1, a5, v11);
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1)
      dispatch_once(&_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken, &__block_literal_global_412);
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
    {
      v26 = nameOfSwiftLayoutKind(v28);
      _debugSwiftAsyncPrintf(a10, "infoForTypeRef() gave { .Kind = %s, .Size = %u, .Alignment = %u, .Stride = %u, .NumFields = %u}\n", v26, HIDWORD(v28), v29, HIDWORD(v29), v30);
    }
    v21 = 0;
    *a9 = 1;
  }

LABEL_23:
  return v21;
}

void sub_1A4DCC3BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DCC53C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCC5B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCCF48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t VMUGetClassDataROofClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a1;
  v8 = a2;
  if (!a3)
  {
    v14 = _classDataRWV0ofClass(v7, v8, a4);
    if (v14)
    {
      if ((*(_WORD *)(v14 + 2) & 0xC008) != 0)
      {
        v11 = *(_QWORD *)(v14 + 8);
        goto LABEL_13;
      }
LABEL_11:
      v13 = _classDataRWAddressofClass(v7, (uint64_t)v8, a4);
      goto LABEL_12;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9)
    goto LABEL_10;
  if ((*(_WORD *)(v9 + 2) & 0xC008) == 0)
    goto LABEL_11;
  v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(_QWORD *)(v9 + 8));
  v11 = v10;
  if ((v10 & 1) != 0)
  {
    v12 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v8 + 2))(v8, v10 & 0xFFFFFFFFFFFFFFFELL, 48);
    if (v12)
    {
      v13 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *v12);
LABEL_12:
      v11 = v13;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
LABEL_13:

  return v11;
}

void sub_1A4DCD168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _swiftFieldsForClass(const void *a1, NSString *a2, libSwiftRemoteMirrorWrapper *a3, VMUClassInfoMap *a4)
{
  id v7;
  int v8;
  const void *v9;
  void *v10;
  VMUClassInfoMap *v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v13 = a2;
  v12 = a4;
  v7 = (id)objc_opt_new();
  v9 = vmu_swift_reflection_interop_lookupMetadata((uint64_t)a3->var0, a1);
  if (v9)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    vmu_swift_reflection_infoForMetadata((uint64_t)a3->var0, (uint64_t)v9, v8);
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    if (debugSwiftSubfieldIsEnabled::isEnabled)
    {
      -[NSString UTF8String](objc_retainAutorelease(v13), "UTF8String");
      _debugSwiftAsyncPrintf(0, "Failed to get info for metadata of class %s\n\n");
    }
    v7 = v7;
    v10 = v7;
  }
  else
  {
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    if (debugSwiftSubfieldIsEnabled::isEnabled)
      _debugSwiftAsyncPrintf(0, "Failed to look up metadata for class %s\n\n", -[NSString UTF8String](objc_retainAutorelease(v13), "UTF8String"));
    v10 = 0;
  }

  return v10;
}

void sub_1A4DCD494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void _destroyLocalIvar(objc_ivar *a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    if (*((_BYTE *)a1 + 32))
    {
      v2 = (void *)*((_QWORD *)a1 + 1);
      if (v2)
      {
        free(v2);
        *((_QWORD *)a1 + 1) = 0;
      }
      v3 = (void *)*((_QWORD *)a1 + 2);
      if (v3)
      {
        free(v3);
        *((_QWORD *)a1 + 2) = 0;
      }
    }
    if (*(_QWORD *)a1)
      free(*(void **)a1);
    free(a1);
  }
}

unint64_t copy_remote_layout_at(unint64_t a1, void *a2)
{
  uint64_t (**v3)(id, void *, _QWORD);
  unsigned int v4;
  size_t v5;
  void *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  size_t v13;

  v3 = a2;
  if (a1)
  {
    v4 = 0;
    LODWORD(v5) = 0;
    v6 = 0;
    v7 = (_DWORD *)MEMORY[0x1E0C85AD8];
    v8 = *MEMORY[0x1E0C85AD8] - ((*MEMORY[0x1E0C85AD8] + 0xFFFFFFFFLL) & a1);
    while (1)
    {
      v9 = v8;
      v10 = (const char *)v3[2](v3, (void *)a1, v8);
      if (!v10)
      {
        if (v6)
          free(v6);
LABEL_9:
        a1 = 0;
        goto LABEL_11;
      }
      v5 = (v5 + v8);
      v11 = reallocf(v6, v5);
      if (!v11)
        goto LABEL_9;
      v6 = v11;
      strncpy((char *)v11 + v4, v10, v8);
      v12 = (v5 - 1);
      if (!*((_BYTE *)v6 + v12))
        break;
      v4 += v8;
      LODWORD(v8) = *v7;
      a1 += v9;
    }
    *((_BYTE *)v6 + v12) = 0;
    v13 = strlen((const char *)v6);
    a1 = (unint64_t)reallocf(v6, v13 + 1);
  }
LABEL_11:

  return a1;
}

void sub_1A4DCD644(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCD9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1A4DCDB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VMUClassInfo;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A4DCE0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

unint64_t VMUGetClassDataExtOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v7 = a1;
  v8 = a2;
  if (a3 && (v9 = _classDataRWV1ofClass(v7, v8, a4)) != 0)
  {
    v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(_QWORD *)(v9 + 8));
    v11 = v10 & (v10 << 63 >> 63) & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1A4DCE240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DCE3C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t maskPointerToMethodList(uint64_t a1, unint64_t a2, VMUTaskMemoryScanner *a3)
{
  VMUTaskMemoryScanner *v5;
  VMUTaskMemoryScanner *v6;

  v5 = a3;
  v6 = v5;
  if (HIBYTE(a2))
  {
    a2 &= 0xFFFFFFFFFFFFFFuLL;
    -[VMUTaskMemoryScanner setClassStructureFieldScanValueAtSourceAddress:toCorrectedAddress:](v5, "setClassStructureFieldScanValueAtSourceAddress:toCorrectedAddress:", a1, a2);
  }

  return a2;
}

void sub_1A4DCE428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCE564(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DCE9F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_QWORD *_createLocalIvar(const char *a1, const char *a2, int a3, int a4, char a5)
{
  _QWORD *v10;
  _DWORD *v11;

  v10 = malloc_type_malloc(0x28uLL, 0x1050040749D65F6uLL);
  v10[1] = a1;
  v10[2] = a2;
  v11 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *v10 = v11;
  *v11 = a3;
  *((_DWORD *)v10 + 7) = a4;
  *((_BYTE *)v10 + 32) = a5;
  return v10;
}

void sub_1A4DCEB00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCEE40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *_decodeNullTerminatedBytes(NSCoder *a1)
{
  NSCoder *v1;
  void *v2;
  unsigned int v4;

  v1 = a1;
  v4 = 0;
  -[NSCoder decodeValueOfObjCType:at:size:](v1, "decodeValueOfObjCType:at:size:", "I", &v4, 4);
  if (v4)
  {
    v2 = malloc_type_calloc(v4 + 1, 1uLL, 0x100004077774924uLL);
    -[NSCoder decodeArrayOfObjCType:count:at:](v1, "decodeArrayOfObjCType:count:at:", "c", v4, v2);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A4DCEF04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCF0B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (v9 != v3)
  _Unwind_Resume(a1);
}

void sub_1A4DCF474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Unwind_Resume(a1);
}

id _formatIvar(VMUFieldInfo *a1, uint64_t a2)
{
  VMUFieldInfo *v3;
  const char *v4;
  const char *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v19;
  id v20;
  id v21;

  v3 = a1;
  v4 = VMUScanTypeKeywordDescription(-[VMUFieldInfo scanType](v3, "scanType"));
  if (*v4)
    v5 = " ";
  else
    v5 = "";
  v6 = -[VMUFieldInfo isCapture](v3, "isCapture");
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    v8 = -[VMUFieldInfo offset](v3, "offset");
    v9 = -[VMUFieldInfo isByref](v3, "isByref");
    v10 = "__block ";
    if (!v9)
      v10 = "";
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%+*d: %s%s%s[capture];"), a2, v8, v10, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = -[VMUFieldInfo offset](v3, "offset");
    -[VMUFieldInfo typeName](v3, "typeName");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (unsigned __int8 *)objc_msgSend(v21, "UTF8String");
    -[VMUFieldInfo ivarName](v3, "ivarName");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    descriptionForTypeEncoding(v13, objc_msgSend(v20, "UTF8String"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUFieldInfo destinationLayout](v3, "destinationLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[VMUFieldInfo destinationLayout](v3, "destinationLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "className");
      v13 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("  [->%@]"), v13);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E4E04720;
    }
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%*u: %s%s%@;%@"), a2, v12, v4, v5, v14, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
  }

  return v11;
}

void sub_1A4DCF6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1A4DCF958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DCFB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void _processExtendedLayout(unint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, uint64_t, _QWORD);
  unsigned int v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void (**v9)(id, uint64_t, uint64_t, _QWORD);

  v3 = a2;
  v9 = v3;
  if (a1 >= 0x1000)
  {
    v4 = *(unsigned __int8 *)a1;
    if (*(_BYTE *)a1)
    {
      v5 = (unsigned __int8 *)(a1 + 1);
      do
      {
        v6 = 0;
        v7 = 1;
        switch(v4 >> 4)
        {
          case 2u:
            goto LABEL_10;
          case 3u:
            v6 = 0;
            v7 = 2;
            goto LABEL_10;
          case 4u:
            v6 = 1;
            goto LABEL_10;
          case 5u:
            v6 = 0;
            v7 = 4;
            goto LABEL_10;
          case 6u:
            v6 = 0;
            v7 = 8;
LABEL_10:
            v9[2](v9, v7, v6, (v4 & 0xF) + 1);
            break;
          default:
            break;
        }
        v8 = *v5++;
        v4 = v8;
      }
      while (v8);
    }
  }
  else
  {
    v3[2](v3, 2, 0, (a1 >> 8) & 0xF);
    v9[2](v9, 1, 1, a1 >> 4);
    v9[2](v9, 4, 0, a1 & 0xF);
  }

}

void sub_1A4DCFCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DCFDD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *VMUClassInfoComplexVariantEvaluatorCombineHashes(_QWORD *result, uint64_t a2)
{
  *result = a2 + 37 * *result;
  return result;
}

void sub_1A4DD06E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4DD08E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DD0B80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DD0BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD0C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD11B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,char a41)
{
  void *v41;
  uint64_t v42;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v42 - 256), 8);

  _Unwind_Resume(a1);
}

void sub_1A4DD1370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD1524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DD16A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4DD176C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD1870(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DD18D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD192C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD19C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DD1E60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DD1F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1A4DD2004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD20E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DD2194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DD222C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD2318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD24D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DD2638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A4DD2708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD27E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DD28D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DD2B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A4DD2BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A4DD2D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  uint64_t v18;

  _Block_object_dispose((const void *)(v18 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4DD2E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DD2ED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DD305C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4DD33FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD349C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD3524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DD3634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A4DD3730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DD384C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A4DD3924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A4DD3A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DD3AB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL22demangleSwiftClassNamePKc_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\((.+) in _([0-9A-Z]+)\\)"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)demangleSwiftClassName(char const*)::s_removeUUIDRegex;
  demangleSwiftClassName(char const*)::s_removeUUIDRegex = v0;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9a-zA-Z]+)\\.([0-9a-zA-Z].+)"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)demangleSwiftClassName(char const*)::s_demodularRegex;
  demangleSwiftClassName(char const*)::s_demodularRegex = v2;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(.+) with unmangled suffix (.+)"), 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)demangleSwiftClassName(char const*)::s_unsuffixRegex;
  demangleSwiftClassName(char const*)::s_unsuffixRegex = v4;

}

const char *nameOfSwiftLayoutKind(int a1)
{
  if ((a1 - 1) > 0x11)
    return "SWIFT_UNKNOWN";
  else
    return off_1E4E022E0[a1 - 1];
}

void ___ZL25_createFieldInfoFromChildP27libSwiftRemoteMirrorWrapperPKcj17swift_layout_kind21swift_typeref_interopP15VMUClassInfoMapjP8NSStringPbj_block_invoke()
{
  VMUMutableFieldInfo *v0;
  void *v1;

  _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanSinglePayloadEnums = getenv("DT_PRECISELY_SCAN_SWIFT_SINGLE_PAYLOAD_ENUMS") != 0;
  _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanMultiPayloadEnums = getenv("DT_DO_NOT_PRECISELY_SCAN_SWIFT_MULTI_PAYLOAD_ENUMS") == 0;
  v0 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("Dummy no payload field"), 0, 0, 0, 0);
  v1 = (void *)swiftEnumDummyNoPayloadSubField;
  swiftEnumDummyNoPayloadSubField = (uint64_t)v0;

}

uint64_t _classDataExtV1ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  v7 = VMUGetClassDataExtOfClass(v5, v6, 1, a3);
  if (v7)
    v8 = (*((uint64_t (**)(id, unint64_t, uint64_t))v6 + 2))(v6, v7 & 0xFFFFFFFFFFFFFFFELL, 48);
  else
    v8 = 0;

  return v8;
}

void sub_1A4DD3CE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DD5200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void VMUMarkObject(void *a1)
{
  unint64_t v1;
  void *v2;
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v1 = a1;
  v2 = (void *)v1;
  if (v1 && (s_markingDisabled & 1) == 0 && (*MEMORY[0x1E0DE7C50] & v1) == 0)
  {
    v3 = (id)v1;
    if (_retainCount_onceToken != -1)
      dispatch_once(&_retainCount_onceToken, &__block_literal_global_11);
    if (objc_msgSend(v3, (SEL)_retainCount_retainCountSelector) == (id)-1)
    {

      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      NSClassFromString(CFSTR("__NSMallocBlock__"));
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_4;
    }
    else
    {

    }
    objc_getAssociatedObject(v3, "__VMUAssociatedObjectsObjcAbandonedMarkerKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      v8 = 0;
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = ___addEntryToMarkingRegion_block_invoke;
      v9[3] = &unk_1E4E024A8;
      v9[4] = &v10;
      v9[5] = v2;
      v9[6] = &v8;
      _singleThreadedMarking(v9);
      v7 = *((unsigned int *)v11 + 6);
      _Block_object_dispose(&v10, 8);
      objc_msgSend(v6, "setEntryIndex:", v7);
      objc_msgSend(v6, "setRegion:", v8);
      objc_setAssociatedObject(v3, "__VMUAssociatedObjectsObjcAbandonedMarkerKey", v6, (void *)0x301);

    }
  }
LABEL_4:

}

void sub_1A4DD59B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _VMUEnumerateMarkedObjects(void *a1)
{
  id v1;
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void (**)(_QWORD, _QWORD))v1;
  if ((s_markingDisabled & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    if (v1)
      v4 = (void *)objc_opt_new();
    else
      v4 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___VMUEnumerateMarkedObjects_block_invoke;
    v15[3] = &unk_1E4E02460;
    v17 = &v18;
    v5 = v4;
    v16 = v5;
    _singleThreadedMarking(v15);
    if (v2)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v6);
            v2[2](v2, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
        }
        while (v7);
      }

    }
    v3 = *((unsigned int *)v19 + 6);

    _Block_object_dispose(&v18, 8);
  }

  return v3;
}

void sub_1A4DD5B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _singleThreadedMarking(void *a1)
{
  void (**v1)(void);
  NSObject *v2;
  dispatch_time_t v3;
  FILE *v4;
  const char *v5;
  pid_t v6;
  void (**v7)(void);
  void (**v8)(void);

  v1 = a1;
  if (_singleThreadedMarking_onceToken != -1)
  {
    v8 = v1;
    dispatch_once(&_singleThreadedMarking_onceToken, &__block_literal_global_29);
    v1 = v8;
  }
  if ((s_markingDisabled & 1) == 0)
  {
    v7 = v1;
    v2 = _singleThreadedMarking_s_markingLock;
    v3 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v2, v3))
    {
      v4 = (FILE *)*MEMORY[0x1E0C80C10];
      v5 = getprogname();
      v6 = getpid();
      fprintf(v4, "%s[%d]: warning: memory marking timeout encountered - marked objects may be incorrect from this point forward\n", v5, v6);
      s_markingDisabled = 1;
    }
    else if ((s_markingDisabled & 1) == 0)
    {
      v7[2]();
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)_singleThreadedMarking_s_markingLock);
    v1 = v7;
  }

}

uint64_t ___removeEntryFromMarkingRegion_block_invoke(uint64_t result)
{
  uint64_t v1;
  mach_vm_address_t v2;
  int v3;
  uint64_t v4;
  uint64_t i;

  v1 = *(unsigned int *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 >= *(_DWORD *)(v2 + 20))
    ___removeEntryFromMarkingRegion_block_invoke_cold_1();
  *(_QWORD *)(v2 + *(unsigned int *)(v2 + 12) + 8 * v1) = 0;
  v3 = *(_DWORD *)(v2 + 28) - 1;
  *(_DWORD *)(v2 + 28) = v3;
  if (!v3)
  {
    v4 = s_currentMarkingContext;
    if (s_currentMarkingContext == v2)
    {
      if (!*(_QWORD *)(v2 + 32))
        return result;
      s_currentMarkingContext = *(_QWORD *)(v2 + 32);
    }
    else
    {
      for (i = *(_QWORD *)(s_currentMarkingContext + 32); i != v2; i = *(_QWORD *)(i + 32))
        v4 = i;
      *(_QWORD *)(v4 + 32) = *(_QWORD *)(v2 + 32);
    }
    return mach_vm_deallocate(*MEMORY[0x1E0C83DA0], v2, *MEMORY[0x1E0C85AD8]);
  }
  return result;
}

SEL ___retainCount_block_invoke()
{
  SEL result;

  result = NSSelectorFromString(CFSTR("retainCount"));
  _retainCount_retainCountSelector = (uint64_t)result;
  return result;
}

_QWORD *___addEntryToMarkingRegion_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  unsigned int *v2;
  _QWORD *v3;
  FILE *v4;
  const char *v5;
  pid_t v6;
  vm_address_t v7;
  unint64_t v8;
  char *v9;
  unsigned int v10;
  unsigned int i;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int **v16;
  vm_address_t address;

  v1 = result;
  v2 = (unsigned int *)s_currentMarkingContext;
  if (!s_currentMarkingContext
    || *(_DWORD *)(s_currentMarkingContext + 28) == *(_DWORD *)(s_currentMarkingContext + 20))
  {
    address = 0;
    v3 = (_QWORD *)MEMORY[0x1E0C85AD8];
    result = (_QWORD *)vm_allocate(*MEMORY[0x1E0C83DA0], &address, *MEMORY[0x1E0C85AD8], 167772161);
    if ((_DWORD)result)
    {
      s_currentMarkingContext = 0;
      v4 = (FILE *)*MEMORY[0x1E0C80C10];
      v5 = getprogname();
      v6 = getpid();
      result = (_QWORD *)fprintf(v4, "%s[%d]: error: memory marking region could not be allocated\n", v5, v6);
      s_markingDisabled = 1;
      return result;
    }
    v7 = address;
    v8 = (unint64_t)(*v3 + 0x7FFFFFFD8) >> 3;
    *(_QWORD *)address = 0x1DE67829AD1A2FBBLL;
    *(_QWORD *)(v7 + 8) = 0x2800000001;
    *(_DWORD *)(v7 + 16) = 8;
    *(_DWORD *)(v7 + 20) = v8;
    *(_QWORD *)(v7 + 24) = 0;
    *(_QWORD *)(v7 + 32) = v2;
    s_currentMarkingContext = v7;
    v2 = (unsigned int *)v7;
  }
  v9 = (char *)v2 + v2[3];
  *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = v2[6];
  v10 = v2[5];
  if (v10)
  {
    for (i = 0; i < v10; ++i)
    {
      v12 = *(_QWORD *)(v1[4] + 8);
      v13 = *(unsigned int *)(v12 + 24);
      if (!*(_QWORD *)&v9[8 * v13])
        break;
      v14 = (_DWORD)v13 + 1 == v10 ? 0 : v13 + 1;
      *(_DWORD *)(v12 + 24) = v14;
      v10 = v2[5];
    }
  }
  v2[6] = *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24);
  v15 = *(unsigned int *)(*(_QWORD *)(v1[4] + 8) + 24);
  if (*(_QWORD *)&v9[8 * v15])
    ___addEntryToMarkingRegion_block_invoke_cold_1();
  v16 = (unsigned int **)v1[6];
  *(_QWORD *)&v9[8 * v15] = v1[5];
  ++v2[7];
  if (v16)
    *v16 = v2;
  return result;
}

char *___singleThreadedMarking_block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  char *result;
  const char *v3;
  FILE *v4;
  const char *v5;
  pid_t v6;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)_singleThreadedMarking_s_markingLock;
  _singleThreadedMarking_s_markingLock = (uint64_t)v0;

  result = getenv("NSZombieEnabled");
  if (result)
  {
    v3 = result;
    if ((*result | 0x20) == 0x79)
    {
      v4 = (FILE *)*MEMORY[0x1E0C80C10];
      v5 = getprogname();
      v6 = getpid();
      result = (char *)fprintf(v4, "%s[%d]: notice: memory marking disabled due to presence of NSZombieEnabled=\"%s\" environment variable\n", v5, v6, v3);
      s_markingDisabled = 1;
    }
  }
  return result;
}

id VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(int a1, uint64_t a2, int a3, int a4, int a5)
{
  if (a1)
    VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(a2);
  else
    VMURegionTypeDescriptionForTagShareProtAndPager(a2, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(unsigned int a1)
{
  char v1;
  void *v2;

  v1 = a1 + 3;
  if ((a1 + 3) <= 0x16u && ((0x7FFFBFu >> v1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E4E02878[v1]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exclave memory tag %hhu"), a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id dispositionDescription(__int16 a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "appendString:", CFSTR("  PRESENT"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "appendString:", CFSTR("  FICTITIOUS"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "appendString:", CFSTR("  REF"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "appendString:", CFSTR("  DIRTY"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "appendString:", CFSTR("  PAGED_OUT"));
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "appendString:", CFSTR("  COPIED"));
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "appendString:", CFSTR("  SPECULATIVE"));
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "appendString:", CFSTR("  EXTERNAL"));
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "appendString:", CFSTR("  CS_VALIDATED"));
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(v3, "appendString:", CFSTR("  CS_NX"));
    if ((a1 & 0x800) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(v3, "appendString:", CFSTR("  CS_TAINTED"));
  if ((a1 & 0x400) != 0)
    goto LABEL_25;
LABEL_12:
  if ((a1 & 0x800) != 0)
LABEL_13:
    objc_msgSend(v3, "appendString:", CFSTR("  REUSABLE"));
  return v3;
}

BOOL collectPhysFootprint()
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  return (!sysctlbyname("vm.self_region_footprint", &v2, &v1, 0, 0) || *__error() == 2) && v2 != 0;
}

id ownedPhysFootprintAdjustmentForMemgraph(void *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  int *v20;
  int *v21;
  uint64_t i;
  char *v23;
  char *v24;
  _QWORD *v25;
  uint64_t v26;
  int *v27;
  id v28;
  int *v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _DWORD *v39;
  _QWORD *v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  if (objc_msgSend(v7, "count") != *a2)
    ownedPhysFootprintAdjustmentForMemgraph_cold_1();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (!v9)
  {
LABEL_10:

    v14 = 0;
    goto LABEL_35;
  }
  v10 = v9;
  v11 = *(_QWORD *)v49;
LABEL_4:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v49 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
    if ((objc_msgSend(v13, "isOwnedUnmappedMemory") & 1) != 0)
      break;
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (!v10)
        goto LABEL_10;
      goto LABEL_4;
    }
  }
  v14 = v13;

  if (!v14)
  {
LABEL_35:
    v37 = 0;
    goto LABEL_41;
  }
  v39 = a2;
  v40 = v14;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v41 = v7;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (!v16)
  {
    v42 = 0;
    goto LABEL_37;
  }
  v17 = v16;
  v42 = 0;
  v18 = *(_QWORD *)v45;
  v19 = &OBJC_IVAR___VMUVMRegion_range;
  v20 = &OBJC_IVAR___VMUVMRegion_user_tag;
  v21 = &OBJC_IVAR___VMUVMRegion_purgeable;
  v43 = a3;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v45 != v18)
        objc_enumerationMutation(v15);
      v23 = *(char **)(*((_QWORD *)&v44 + 1) + 8 * i);
      if (!VMURangeContainsRange(a3, a4, *(_QWORD *)&v23[*v19], *(_QWORD *)&v23[*v19 + 8]))
      {
        v24 = v23;
        v25 = v24;
        if (*(_DWORD *)&v24[*v20] == 87 || *(_DWORD *)&v24[*v21] == 3)
        {

          continue;
        }
        v26 = a4;
        v27 = v19;
        v28 = v15;
        v29 = v20;
        v30 = v21;
        v31 = *((_QWORD *)v24 + 20);

        if (v31)
        {
          v21 = v30;
          if (!*(_DWORD *)((char *)v25 + *v30))
          {
            v20 = v29;
            if (!*((_BYTE *)v25 + 49))
            {
              v15 = v28;
              if ((*((_BYTE *)v25 + 132) & 2) == 0)
              {
                v32 = v25[20] - v25[27];
                v25[23] = v32;
                v33 = v25[20];
                v34 = v25[23];
                v35 = v25[27];
                v36 = v33 - v35 - v32;
                if (v33 < v35 + v34)
                  v36 = 0;
                v42 += v34 + v36;
              }
              goto LABEL_31;
            }
LABEL_30:
            v15 = v28;
LABEL_31:
            v19 = v27;
            a4 = v26;
            a3 = v43;
            continue;
          }
        }
        else
        {
          v21 = v30;
        }
        v20 = v29;
        goto LABEL_30;
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  }
  while (v17);
LABEL_37:

  v14 = v40;
  adjustOwnedMemoryRegionFootprint(v40, v42);
  if (v14[23] + v14[22])
  {
    v37 = 0;
  }
  else
  {
    --*v39;
    v14 = v40;
    v37 = v14;
  }
  v7 = v41;
LABEL_41:

  return v37;
}

void adjustOwnedMemoryRegionFootprint(void *a1, unint64_t a2)
{
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a1;
  v4 = v3;
  v5 = v3[23];
  if (v5 >= a2)
  {
    v3[23] = v5 - a2;
  }
  else
  {
    v6 = a2 - v5;
    v3[23] = 0;
    v7 = v3[22];
    if (v7 >= v6)
    {
      v3[22] = v7 - v6;
    }
    else
    {
      v3[22] = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        adjustOwnedMemoryRegionFootprint_cold_1(v6, v7);
    }
  }

}

void withPeekFunctionForVMUTask(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(a1, "memoryCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __withPeekFunctionForVMUTask_block_invoke;
  v7[3] = &unk_1E4E024D8;
  v8 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A85A995C](v7);
  _withPeekTransformerFunctionForMemoryReader(v6, v3);

}

uint64_t __withPeekFunctionForVMUTask_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "peekAtAddress:size:returnsBuf:", a2, a3, &v4))
    return 0;
  else
    return v4;
}

char *VMUMallocRangeTypeString(int a1)
{
  if ((a1 - 1) >= 7)
    VMUMallocRangeTypeString_cold_1(a1);
  return off_1E4E02930[a1 - 1];
}

void sub_1A4DD89AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void addMallocRegionPageStatistics(void *a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  if (v3 && a2 && *((_BYTE *)v3 + 50) != 3)
  {
    v4 = a2[3];
    a2[2] += v3[2];
    a2[3] = v4 + v3[20];
    v5 = a2[5];
    a2[4] += v3[21];
    a2[5] = v5 + v3[22];
    a2[6] += v3[23];
  }

}

void setTypeIfMallocRegion(void *a1)
{
  _DWORD *v1;
  __CFString *v2;
  unsigned int v3;
  void *v4;
  __CFString *v5;
  unsigned __int8 *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v1 = a1;
  if (!v1[6])
    goto LABEL_26;
  if (*((_QWORD *)v1 + 17))
    goto LABEL_3;
  if (*((_BYTE *)v1 + 232))
  {
    if ((*((_BYTE *)v1 + 238) & 1) != 0)
      v2 = CFSTR("MALLOC (empty)");
    else
      v2 = 0;
  }
  else
  {
    v3 = v1[26] - 2;
    if (v3 > 0xB)
    {
LABEL_3:
      v2 = 0;
      goto LABEL_10;
    }
    v2 = off_1E4E02968[v3];
  }
LABEL_10:
  v10 = (unsigned __int8 *)v1;
  if (v1[36])
  {
    v4 = (void *)MEMORY[0x1A85A9758]();
    VMUidentifyRegionTypeFromUserTag(v10[232], *((_DWORD *)v10 + 26), v10[50], *((_DWORD *)v10 + 6));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isUntaggedRegion"))
    {
      objc_msgSend(v10, "setAsMallocRegion");
      v5 = (__CFString *)(id)VMUmallocOtherRegionLabel;

      v2 = v5;
    }
    v6 = v10;
    if (!*((_DWORD *)v10 + 6) || v10[50] == 3)
      goto LABEL_22;
    if (*((_DWORD *)v10 + 36) != 4 && !v10[232] && *((_DWORD *)v10 + 26) == 1)
    {
      if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("MALLOC metadata")))
      {

        v2 = CFSTR("MALLOC");
      }
      v6 = v10;
    }
    if (*((_QWORD *)v6 + 17))
      goto LABEL_22;
    v7 = *((_DWORD *)v6 + 36);
    if (v7 == 4)
    {
      v8 = CFSTR("metadata");
    }
    else
    {
      if ((v7 & 2) == 0)
      {
LABEL_22:
        objc_autoreleasePoolPop(v4);
        goto LABEL_23;
      }
      v8 = CFSTR("(empty)");
    }
    if ((-[__CFString hasSuffix:](v2, "hasSuffix:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v2 = (__CFString *)v9;
    }
    goto LABEL_22;
  }
LABEL_23:
  if (v2)
    objc_storeStrong((id *)v10 + 4, v2);

  v1 = v10;
LABEL_26:

}

uint64_t recordRegions(void *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v11;
  void *v12;
  mach_error_t v13;
  mach_error_t v14;
  FILE *v15;
  int v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  os_signpost_id_t v27;
  NSObject *v28;
  os_signpost_id_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 *v34;
  __int128 *v35;
  uint64_t Range;
  uint64_t v37;
  __int128 *v38;
  uint64_t v39;
  void *v40;
  void (**v41)(void *, const __CFString *, _QWORD, _QWORD, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t *v48;
  id v49;
  id v50;
  NSObject *v51;
  __int128 *v52;
  uint64_t *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  unint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  dispatch_time_t v65;
  NSObject *v66;
  os_signpost_id_t v67;
  NSObject *v68;
  os_signpost_id_t v69;
  NSObject *v70;
  os_signpost_id_t v71;
  NSObject *v72;
  os_signpost_id_t v73;
  NSObject *v74;
  os_signpost_id_t v75;
  NSObject *v76;
  os_signpost_id_t v77;
  NSObject *v78;
  os_signpost_id_t v79;
  NSObject *v80;
  os_signpost_id_t v81;
  NSObject *v82;
  os_signpost_id_t v83;
  NSObject *v84;
  os_signpost_id_t v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  void *v92;
  _BOOL4 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  __CFString *v102;
  const __CFString *v103;
  void *v104;
  int v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  id *v118;
  void *v119;
  int v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  NSObject *v125;
  os_signpost_id_t v126;
  NSObject *v127;
  os_signpost_id_t v128;
  id v129;
  uint64_t v130;
  id *v131;
  int *v132;
  uint64_t v133;
  id *v134;
  uint64_t v135;
  id v136;
  void *v137;
  char v138;
  void *v139;
  int *v140;
  id v141;
  void *v142;
  uint64_t v143;
  id v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  NSObject *v151;
  os_signpost_id_t v152;
  NSObject *v153;
  os_signpost_id_t v154;
  NSObject *v155;
  os_signpost_id_t v156;
  NSObject *v157;
  os_signpost_id_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  int v163;
  int v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  _DWORD *v172;
  char *v173;
  void *v174;
  mach_error_t v175;
  char v176;
  uint64_t v177;
  int *v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  int v183;
  void *v184;
  uint64_t v185;
  unint64_t v186;
  id v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  int *v194;
  int *v195;
  unint64_t v196;
  int v197;
  int *v198;
  _QWORD *v199;
  void *v200;
  id v201;
  id v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  unint64_t v207;
  VMUVMRegion *v208;
  NSString *type;
  NSString *path;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  unint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t i;
  _QWORD *v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t j;
  void *v234;
  NSObject *v235;
  os_signpost_id_t v236;
  void *context;
  int v239;
  NSMapTable *table;
  _BOOL4 v241;
  void *v242;
  int v243;
  unint64_t v244;
  char *v245;
  uint64_t v246;
  id v247;
  id v248;
  id v250;
  id v251;
  _DWORD *v252;
  _QWORD *v253;
  void *v254;
  uint64_t v255;
  id v256;
  id v257;
  void *v258;
  void *v260;
  void *v261;
  id v262;
  id v263;
  id v264;
  id v265;
  unsigned int v266;
  id v267;
  void *v268;
  unint64_t v269;
  id v270;
  char v271;
  id v272;
  unint64_t v273;
  id v274;
  id obj;
  id obja;
  id objb;
  id objc;
  _OWORD v279[3];
  uint64_t v280;
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
  uint8_t buf[8];
  uint64_t v294;
  void *v295;
  void *v296;
  __int128 *v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  uint64_t v306;

  v306 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v257 = a3;
  v250 = a4;
  v251 = a5;
  v248 = a6;
  v258 = v11;
  objc_msgSend(v11, "memoryCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "startPeeking");

  if (v13)
  {
    v14 = v13;
    v15 = (FILE *)*MEMORY[0x1E0C80C10];
    v16 = objc_msgSend(v11, "pid");
    v266 = v14;
    v17 = mach_error_string(v14);
    fprintf(v15, "*** Can't suspend task %d: %s\n", v16, v17);
    goto LABEL_383;
  }
  +[VMUDebugTimer sharedTimerIfCreated](VMUDebugTimer, "sharedTimerIfCreated");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isCore"))
  {
    v18 = objc_msgSend(v11, "createSymbolicatorWithFlags:andNotification:", 0, 0);
    v20 = v19;
  }
  else
  {
    v21 = v11;
    v18 = objc_msgSend(v21, "createSymbolicatorWithFlags:andNotification:", CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() | 0x20100000, 0);
    v20 = v22;

    v23 = getprogname();
    if (!strcmp(v23, "ReportCrash"))
    {
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if (CSIsNull())
        CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if ((CSIsNull() & 1) == 0)
      {
        CSRelease();
        v20 = 0;
        v18 = 0;
      }
    }
  }
  v24 = v261;
  if ((a7 & 0x10000) != 0)
  {
    v241 = collectPhysFootprint();
    setCollectPhysFootprint(1);
  }
  else
  {
    v241 = 0;
  }
  v270 = (id)v18;
  obj = v20;
  if (v261)
  {
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v261, "signpostID");
      if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v27 = v26;
        if (os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v25, OS_SIGNPOST_INTERVAL_END, v27, "recordRegions", "", buf, 2u);
        }
      }

      v24 = v261;
    }
    objc_msgSend(v24, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "gather VM region data");
    objc_msgSend(v261, "logHandle");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v261, "signpostID");
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "recordRegions", "gather VM region data", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "gather VM region data");
  }
  if (objc_msgSend(v11, "taskType") == 2)
  {
    objc_msgSend(v11, "memoryCache");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v257;
    v32 = v30;
    objc_msgSend(v32, "memoryRegions");
    v33 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v294 = 3221225472;
    v295 = __listKernelCoreRegions_block_invoke;
    v296 = &unk_1E4E02628;
    v34 = (__int128 *)v31;
    v297 = v34;
    enumerate_mapped_memory_core_file_dumped_regions();
    *(_QWORD *)&v302 = v33;
    *((_QWORD *)&v302 + 1) = 3221225472;
    *(_QWORD *)&v303 = __listKernelCoreRegions_block_invoke_2;
    *((_QWORD *)&v303 + 1) = &unk_1E4E01F38;
    v35 = v34;
    *(_QWORD *)&v304 = v35;
    CSSymbolicatorForeachSegmentAtTime();
    *(_QWORD *)&v289 = 0;
    CSSymbolicatorGetAOutSymbolOwner();
    CSSymbolOwnerGetSymbolWithName();
    Range = CSSymbolGetRange();
    objc_msgSend(v32, "peekAtAddress:size:returnsBuf:", Range, v37, &v289);

    *(_QWORD *)&v298 = v33;
    *((_QWORD *)&v298 + 1) = 3221225472;
    *(_QWORD *)&v299 = __listKernelCoreRegions_block_invoke_3;
    *((_QWORD *)&v299 + 1) = &unk_1E4E02650;
    v38 = v35;
    *(_QWORD *)&v300 = v38;
    v39 = MEMORY[0x1A85A995C](&v298);
    v40 = (void *)v39;
    if ((_QWORD)v289)
    {
      v41 = (void (**)(void *, const __CFString *, _QWORD, _QWORD, uint64_t, uint64_t))(v39 + 16);
      (*(void (**)(uint64_t, const __CFString *, _QWORD, _QWORD, _QWORD, _QWORD))(v39 + 16))(v39, CFSTR("MALLOC"), *(_QWORD *)v289, *(_QWORD *)(v289 + 8), 0, 0);
      (*v41)(v40, CFSTR("Zalloc read-only"), *(_QWORD *)(v289 + 16), *(_QWORD *)(v289 + 24), 0, 1);
      (*v41)(v40, CFSTR("MALLOC metadata"), *(_QWORD *)(v289 + 32), *(_QWORD *)(v289 + 40), 4, 0);
      (*v41)(v40, CFSTR("Zalloc bits"), *(_QWORD *)(v289 + 48), *(_QWORD *)(v289 + 56), 4, 0);
      (*v41)(v40, CFSTR("PGZ"), *(_QWORD *)(v289 + 80), *(_QWORD *)(v289 + 88), 0, 0);
    }

  }
  else if (a2)
  {
    v42 = v11;
    v262 = v257;
    if (*MEMORY[0x1E0C85AA0] >= *MEMORY[0x1E0C85AC0])
      v43 = *MEMORY[0x1E0C85AC0];
    else
      v43 = *MEMORY[0x1E0C85AA0];
    if (objc_msgSend(v42, "isTranslated"))
      v44 = -4096;
    else
      v44 = ~v43;
    if ((v44 & a2) != 0)
      v45 = (v44 & a2) - 1;
    else
      v45 = 0;
    *(_QWORD *)buf = a2;
    *(_QWORD *)&v302 = 0;
    getRegionData(v42, buf, &v302, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      v48 = *(uint64_t **)buf;
      v267 = v46;
      if ((unint64_t)v48 <= a2)
      {
        v53 = *(uint64_t **)buf;
        *(_QWORD *)buf += v302;
        getRegionData(v42, buf, &v302, 0);
        v45 = (unint64_t)v53 - 1;
        v254 = v267;
        v267 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v254 = 0;
      }
    }
    else
    {
      v254 = 0;
      v267 = 0;
    }
    *(_QWORD *)buf = v45;
    getRegionData(v42, buf, &v302, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)buf > v45 || (v55 = v54, (v56 = v55) == 0))
    {
      v57 = 0;
      v55 = 0;
      v58 = 0;
      v59 = 50;
      v60 = v45;
      while (1)
      {
        *(_QWORD *)buf = v58;
        getRegionData(v42, buf, &v302, 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56 && *(_QWORD *)buf < v45)
        {
          v61 = v56;

          v55 = v61;
        }
        if ((v57 & (unint64_t)v44) >= (v60 & v44))
          break;
        if (!v56 || (v62 = v302 + *(_QWORD *)buf, (_QWORD)v302 + *(_QWORD *)buf >= v45))
        {
          v62 = v57;
          v60 = v58;
        }
        if (!v59)
        {

          v55 = 0;
          goto LABEL_60;
        }
        v58 = v62 + ((v60 - v62) >> 1);
        --v59;
        v54 = v56;
        v57 = v62;
      }
      if (!v55)
        goto LABEL_60;
    }
    objc_msgSend(v262, "addObject:", v55);
LABEL_60:
    v63 = v267;
    if (v254)
    {
      objc_msgSend(v262, "addObject:", v254);
      v63 = v267;
    }
    if (v63)
    {
      objc_msgSend(v262, "addObject:");
      v63 = v267;
    }

  }
  else
  {
    v49 = v11;
    v50 = v257;
    *(_QWORD *)&v302 = 0;
    *((_QWORD *)&v302 + 1) = &v302;
    *(_QWORD *)&v303 = 0x2020000000;
    BYTE8(v303) = 0;
    if ((a7 & 0x400) != 0)
    {
      dispatch_get_global_queue(2, 0);
      v64 = objc_claimAutoreleasedReturnValue();
      v51 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v64);
      v65 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v51, v65, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v294 = 3221225472;
      v295 = __listAllRegions_block_invoke;
      v296 = &unk_1E4E02678;
      v297 = &v302;
      dispatch_source_set_event_handler(v51, buf);
      dispatch_resume(v51);

      v52 = (__int128 *)*((_QWORD *)&v302 + 1);
    }
    else
    {
      v51 = 0;
      v52 = &v302;
    }
    recursivelyListAllRegions(v49, v50, a7, 0, -1, 0, (_BYTE *)v52 + 24);
    if (*(_BYTE *)(*((_QWORD *)&v302 + 1) + 24))
      objc_msgSend(v50, "removeAllObjects");
    if (v51)
      dispatch_source_cancel(v51);
    _Block_object_dispose(&v302, 8);

  }
  if (!objc_msgSend(v257, "count"))
  {
    CSRelease();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VMURegionIdentifier did not detect any regions in the target task", buf, 2u);
    }
    goto LABEL_330;
  }
  context = (void *)MEMORY[0x1A85A9758]();
  if (v261)
  {
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v261, "signpostID");
      if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v66, OS_SIGNPOST_INTERVAL_END, v67, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "markMachOLibraries");
    objc_msgSend(v261, "logHandle");
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v261, "signpostID");
    if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v68, OS_SIGNPOST_INTERVAL_BEGIN, v69, "recordRegions", "markMachOLibraries", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "markMachOLibraries");
  }
  markMachOLibraries(v258, (uint64_t)v270, (uint64_t)obj, v257, a2, a7);
  CSRelease();
  if (v261)
  {
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v261, "signpostID");
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v70, OS_SIGNPOST_INTERVAL_END, v71, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "markMallocAreas");
    objc_msgSend(v261, "logHandle");
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v261, "signpostID");
    if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v73, "recordRegions", "markMallocAreas", buf, 2u);
    }

    markMallocAreas(v258, v257, v251, (void *)a2, a7, v261);
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v261, "signpostID");
      if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v74, OS_SIGNPOST_INTERVAL_END, v75, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "markStacks");
    objc_msgSend(v261, "logHandle");
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v261, "signpostID");
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v76, OS_SIGNPOST_INTERVAL_BEGIN, v77, "recordRegions", "markStacks", buf, 2u);
    }

    markStacks(v257, v250);
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v261, "signpostID");
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v78, OS_SIGNPOST_INTERVAL_END, v79, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "markIOSurfaces");
    objc_msgSend(v261, "logHandle");
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v261, "signpostID");
    if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v80, OS_SIGNPOST_INTERVAL_BEGIN, v81, "recordRegions", "markIOSurfaces", buf, 2u);
    }

    markIOSurfaces(v258, v257, a7);
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v261, "signpostID");
      if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v82, OS_SIGNPOST_INTERVAL_END, v83, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "markOthers");
    objc_msgSend(v261, "logHandle");
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v261, "signpostID");
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v84, OS_SIGNPOST_INTERVAL_BEGIN, v85, "recordRegions", "markOthers", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "markMallocAreas");
    markMallocAreas(v258, v257, v251, (void *)a2, a7, 0);
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "markStacks");
    markStacks(v257, v250);
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "markIOSurfaces");
    markIOSurfaces(v258, v257, a7);
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "markOthers");
  }
  v86 = v258;
  v87 = v257;
  v268 = v86;
  objc_msgSend(v86, "memoryCache");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)v88, 0, 0);

  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) != 0)
      goto LABEL_127;
    CSSymbolOwnerGetSymbolWithMangledName();
    if ((CSIsNull() & 1) != 0)
      goto LABEL_127;
    v91 = CSSymbolGetRange();
    v89 = 0;
    if (!v91 || v90 < 8)
      goto LABEL_128;
    *(_QWORD *)buf = 0;
    objc_msgSend(v86, "memoryCache");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "peekAtAddress:size:returnsBuf:", v91, 8, buf) == 0;

    if (!v93)
LABEL_127:
      v89 = 0;
    else
      v89 = **(_QWORD **)buf;
LABEL_128:
    CSRelease();
    goto LABEL_129;
  }
  v89 = 0;
LABEL_129:
  v301 = 0u;
  v300 = 0u;
  v299 = 0u;
  v298 = 0u;
  obja = v87;
  v94 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v298, &v302, 16);
  if (v94)
  {
    v271 = 0;
    v95 = *(_QWORD *)v299;
    do
    {
      v96 = 0;
      do
      {
        if (*(_QWORD *)v299 != v95)
          objc_enumerationMutation(obja);
        v97 = *(_QWORD *)(*((_QWORD *)&v298 + 1) + 8 * v96);
        if (!*(_QWORD *)(v97 + 32))
        {
          v98 = (void *)MEMORY[0x1A85A9758]();
          if ((*(_BYTE *)(v97 + 132) & 1) != 0)
          {
            v101 = *(void **)(v97 + 32);
            *(_QWORD *)(v97 + 32) = CFSTR("Submap");

            if (*(_BYTE *)(v97 + 50) == 5)
              v102 = CFSTR("machine-wide VM submap");
            else
              v102 = CFSTR("process-only VM submap");
            objc_storeStrong((id *)(v97 + 40), v102);
          }
          else if (objc_msgSend((id)v97, "isSanitizer"))
          {
            VMUidentifyRegionTypeFromUserTag(*(unsigned __int8 *)(v97 + 232), *(_DWORD *)(v97 + 104), *(unsigned __int8 *)(v97 + 50), *(_DWORD *)(v97 + 24));
            v99 = objc_claimAutoreleasedReturnValue();
            v100 = *(void **)(v97 + 32);
            *(_QWORD *)(v97 + 32) = v99;

          }
          else if (objc_msgSend(v268, "rangeIsInSharedCache:", *(_QWORD *)(v97 + 8), *(_QWORD *)(v97 + 16)))
          {
            if ((objc_msgSend((id)v97, "isUnsharedPmap") & 1) != 0 || (v105 = *(_DWORD *)(v97 + 24), (v105 & 2) != 0))
            {
              objc_storeStrong((id *)(v97 + 32), (id)VMUunusedSharedLibDataLabel);
              if (!*(_QWORD *)(v97 + 40))
                objc_storeStrong((id *)(v97 + 40), (id)VMUunusedSharedLibDataPath);
              *(_BYTE *)(v97 + 132) |= 4u;
            }
            else
            {
              v106 = *(_DWORD *)(v97 + 104);
              if (v106)
              {
                VMUidentifyRegionTypeFromUserTag(*(unsigned __int8 *)(v97 + 232), v106, *(unsigned __int8 *)(v97 + 50), v105);
                v107 = objc_claimAutoreleasedReturnValue();
                v108 = *(void **)(v97 + 32);
                *(_QWORD *)(v97 + 32) = v107;

              }
              else
              {
                objc_storeStrong((id *)(v97 + 32), VMUunusedSharedLibTextLabel[0]);
                if (!*(_QWORD *)(v97 + 40))
                  objc_storeStrong((id *)(v97 + 40), (id)VMUunusedSharedLibTextPath);
              }
            }
          }
          else if (*(_BYTE *)(v97 + 49) == 1)
          {
            v109 = *(void **)(v97 + 32);
            *(_QWORD *)(v97 + 32) = CFSTR("mapped file");

            v110 = *(void **)(v97 + 40);
            *(_QWORD *)(v97 + 40) = 0;

            if ((a7 & 0x40000) == 0)
            {
              objc_msgSend(v268, "memoryCache");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend(v111, "procRegionFileNameForAddress:buffer:bufferSize:", *(_QWORD *)(v97 + 8), buf, 1024);

              if (v112 >= 1)
              {
                buf[v112] = 0;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                VMUSanitizePath(v113);
                v114 = objc_claimAutoreleasedReturnValue();
                v115 = *(void **)(v97 + 40);
                *(_QWORD *)(v97 + 40) = v114;

              }
            }
            if (!*(_QWORD *)(v97 + 40))
            {
              -[__CFString stringByAppendingFormat:](kVMUUnknownMappedFileNamePrefix[0], "stringByAppendingFormat:", CFSTR("%lx"), *(_QWORD *)(v97 + 112));
              v116 = objc_claimAutoreleasedReturnValue();
              v117 = *(void **)(v97 + 40);
              *(_QWORD *)(v97 + 40) = v116;

            }
          }
          else if (objc_msgSend((id)v97, "isNullRegion"))
          {
            v118 = (id *)(v97 + 32);
            if ((v271 & 1) != 0)
              objc_storeStrong(v118, (id)VMUGPUCarveoutRegionLabel);
            else
              objc_storeStrong(v118, (id)VMUcommpageRegionLabel);
            objc_storeStrong((id *)(v97 + 40), (id)VMUreservedVMaddressSpaceString);
            v271 = 1;
          }
          else if (objc_msgSend((id)v97, "isOwnedUnmappedMemory"))
          {
            objc_storeStrong((id *)(v97 + 32), (id)VMUOwnedUnmappedMemoryRegionLabel);
            v119 = *(void **)(v97 + 40);
            *(_QWORD *)(v97 + 40) = CFSTR("owned physical footprint (unmapped)");

          }
          else
          {
            v120 = *(_DWORD *)(v97 + 104);
            if (!v120 && v89 && *(_QWORD *)(v97 + 8) == v89)
            {
              v121 = *(void **)(v97 + 32);
              *(_QWORD *)(v97 + 32) = CFSTR("AttributeGraph Data");

            }
            else
            {
              VMUidentifyRegionTypeFromUserTag(*(unsigned __int8 *)(v97 + 232), v120, *(unsigned __int8 *)(v97 + 50), *(_DWORD *)(v97 + 24));
              v122 = objc_claimAutoreleasedReturnValue();
              v123 = *(void **)(v97 + 32);
              *(_QWORD *)(v97 + 32) = v122;

            }
          }
          if (!*(_QWORD *)(v97 + 40))
          {
            if (*(_DWORD *)(v97 + 24) && *(_BYTE *)(v97 + 50) == 3)
            {
              v103 = (const __CFString *)(id)VMUreservedVMaddressSpaceString;
              v104 = *(void **)(v97 + 40);
            }
            else
            {
              v104 = 0;
              v103 = &stru_1E4E04720;
            }
            *(_QWORD *)(v97 + 40) = v103;

          }
          objc_autoreleasePoolPop(v98);
        }
        ++v96;
      }
      while (v94 != v96);
      v124 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v298, &v302, 16);
      v94 = v124;
    }
    while (v124);
  }

  if (objc_msgSend(v268, "taskType") == 2)
  {
    if (v261)
    {
      if (objc_msgSend(v261, "signpostID"))
      {
        objc_msgSend(v261, "logHandle");
        v125 = objc_claimAutoreleasedReturnValue();
        v126 = objc_msgSend(v261, "signpostID");
        if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v125, OS_SIGNPOST_INTERVAL_END, v126, "recordRegions", "", buf, 2u);
        }

      }
      objc_msgSend(v261, "endEvent:", "recordRegions");
      objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "fixupCoreRegions");
      objc_msgSend(v261, "logHandle");
      v127 = objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v261, "signpostID");
      if (v128 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v127, OS_SIGNPOST_INTERVAL_BEGIN, v128, "recordRegions", "fixupCoreRegions", buf, 2u);
      }

    }
    else
    {
      objc_msgSend(0, "endEvent:", "recordRegions");
      objc_msgSend(0, "startWithCategory:message:", "recordRegions", "fixupCoreRegions");
    }
    v129 = obja;
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v305 = 0u;
    v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v302, buf, 16);
    if (v130)
    {
      v131 = 0;
      v132 = &OBJC_IVAR___VMUVMRegion_user_tag;
      v272 = *(id *)v303;
      while (1)
      {
        v133 = 0;
        v134 = v131;
        v263 = (id)v130;
        do
        {
          if (*(id *)v303 != v272)
            objc_enumerationMutation(v129);
          v135 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * v133);
          v136 = *(id *)(v135 + 32);
          v137 = v136;
          v138 = *(_BYTE *)(v135 + 132);
          if ((v138 & 2) != 0)
          {
            if ((objc_msgSend(v136, "hasSuffix:", CFSTR("DATA")) & 1) != 0)
              goto LABEL_202;
            v138 = *(_BYTE *)(v135 + 132);
          }
          if ((v138 & 2) == 0)
          {
            if (*(_DWORD *)(v135 + *v132))
              goto LABEL_205;
LABEL_202:
            *(_DWORD *)(v135 + 24) |= 2u;
            *(_DWORD *)(v135 + 28) |= 2u;
            if ((*(_BYTE *)(v135 + 132) & 2) == 0)
              goto LABEL_205;
          }
          if (objc_msgSend(v137, "hasSuffix:", CFSTR("DATA_CONST")))
            *(_DWORD *)(v135 + 28) |= 2u;
LABEL_205:
          if ((*(_BYTE *)(v135 + 132) & 2) != 0 && objc_msgSend(v137, "hasSuffix:", CFSTR("TEXT_EXEC")))
          {
            *(_DWORD *)(v135 + 24) |= 4u;
            *(_DWORD *)(v135 + 28) |= 4u;
          }
          if (objc_msgSend(*(id *)(v135 + 40), "isEqualToString:", VMUunusedButDirtySharedLibDataPath))
          {
            if (v134 && (*((_BYTE *)v134 + 132) & 2) != 0)
            {
              v140 = v132;
              v141 = v129;
              v142 = (void *)MEMORY[0x1E0CB3940];
              v143 = VMUunusedSharedLibLabelOrPathPrefix;
              v144 = v134[4];
              v145 = v142;
              v129 = v141;
              v132 = v140;
              v130 = (uint64_t)v263;
              objc_msgSend(v145, "stringWithFormat:", CFSTR("%@%@"), v143, v144);
              v146 = objc_claimAutoreleasedReturnValue();
              v147 = *(void **)(v135 + 32);
              *(_QWORD *)(v135 + 32) = v146;

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), VMUunusedButDirtySharedLibPrefix, v144);
              v148 = objc_claimAutoreleasedReturnValue();
              v149 = *(void **)(v135 + 40);
              *(_QWORD *)(v135 + 40) = v148;

              *(_BYTE *)(v135 + 132) |= 4u;
              *(_DWORD *)(v135 + 24) = *((_DWORD *)v134 + 6);
              *(_DWORD *)(v135 + 28) = *((_DWORD *)v134 + 7);

            }
            else
            {
              v139 = *(void **)(v135 + 40);
              *(_QWORD *)(v135 + 40) = 0;

              *(_BYTE *)(v135 + 132) &= ~2u;
            }
          }
          if (objc_msgSend((id)v135, "isUntaggedRegion"))
          {
            v150 = *(void **)(v135 + 32);
            *(_QWORD *)(v135 + 32) = CFSTR("Unknown core region");

          }
          v131 = (id *)(id)v135;

          ++v133;
          v134 = v131;
        }
        while (v130 != v133);
        v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v302, buf, 16);
        if (!v130)
        {

          break;
        }
      }
    }

  }
  if (v261)
  {
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v151 = objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v261, "signpostID");
      if (v152 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v151, OS_SIGNPOST_INTERVAL_END, v152, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "coalesceIdenticalRegions");
    objc_msgSend(v261, "logHandle");
    v153 = objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v261, "signpostID");
    if (v154 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v153, OS_SIGNPOST_INTERVAL_BEGIN, v154, "recordRegions", "coalesceIdenticalRegions", buf, 2u);
    }

    coalesceIdenticalRegions(obja, a7);
    if (objc_msgSend(v261, "signpostID"))
    {
      objc_msgSend(v261, "logHandle");
      v155 = objc_claimAutoreleasedReturnValue();
      v156 = objc_msgSend(v261, "signpostID");
      if (v156 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v155))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v155, OS_SIGNPOST_INTERVAL_END, v156, "recordRegions", "", buf, 2u);
      }

    }
    objc_msgSend(v261, "endEvent:", "recordRegions");
    objc_msgSend(v261, "startWithCategory:message:", "recordRegions", "collectVMpageStatistics");
    objc_msgSend(v261, "logHandle");
    v157 = objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend(v261, "signpostID");
    if (v158 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v157, OS_SIGNPOST_INTERVAL_BEGIN, v158, "recordRegions", "collectVMpageStatistics", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "coalesceIdenticalRegions");
    coalesceIdenticalRegions(obja, a7);
    objc_msgSend(0, "endEvent:", "recordRegions");
    objc_msgSend(0, "startWithCategory:message:", "recordRegions", "collectVMpageStatistics");
  }
  v247 = v268;
  v159 = obja;
  table = (NSMapTable *)v251;
  objb = v159;
  v269 = objc_msgSend(v159, "count");
  v246 = VMUGetFlagsForAllVMRegionStatistics() & a7;
  if (v246)
  {
    v252 = malloc_type_calloc(0x400uLL, 4uLL, 0x100004052888210uLL);
    v242 = (void *)objc_opt_new();
  }
  else
  {
    v242 = 0;
    v252 = 0;
  }
  if (v269)
  {
    v239 = 0;
    v243 = 0;
    v160 = 0;
    v244 = 1024;
    v245 = 0;
    while (1)
    {
      objc_msgSend(objb, "objectAtIndex:", v160);
      v161 = objc_claimAutoreleasedReturnValue();
      v162 = (char *)v161;
      if ((*(_BYTE *)(v161 + 132) & 1) != 0 || *(_BYTE *)(v161 + 50) == 3)
        goto LABEL_326;
      if ((a7 & 0x10000) != 0)
      {
        v163 = objc_msgSend(v247, "rangeIsInSharedCache:", *(_QWORD *)(v161 + 8), *(_QWORD *)(v161 + 16)) ^ 1;
        if ((v243 & 1) == v163)
        {
          v164 = v163 | v243;
          setCollectPhysFootprint((v163 | v243) & 1);
          v243 = v164 ^ 1;
        }
      }
      *((_QWORD *)v162 + 20) = 0;
      *((_QWORD *)v162 + 21) = 0;
      *((_QWORD *)v162 + 22) = 0;
      *((_QWORD *)v162 + 23) = 0;
      *((_QWORD *)v162 + 12) = 0;
      *((_QWORD *)v162 + 8) = 0;
      *((_QWORD *)v162 + 9) = 0;
      *((_QWORD *)v162 + 10) = 0;
      *((_QWORD *)v162 + 11) = 0;
      if (!v246)
        goto LABEL_322;
      if (*MEMORY[0x1E0C85AA8] >= *MEMORY[0x1E0C85AD8])
        v165 = *MEMORY[0x1E0C85AD8];
      else
        v165 = *MEMORY[0x1E0C85AA8];
      if (*MEMORY[0x1E0C85AA0] >= *MEMORY[0x1E0C85AC0])
        v166 = *MEMORY[0x1E0C85AC0];
      else
        v166 = *MEMORY[0x1E0C85AA0];
      v167 = *((_QWORD *)v162 + 1);
      v168 = (char *)(v167 & ~v166);
      v255 = v166;
      v169 = (v167 + v166 + *((_QWORD *)v162 + 2)) & ~v166;
      v273 = v165;
      v170 = (v169 - (unint64_t)v168) / v165;
      v171 = v170;
      if (v170 > v244)
      {
        free(v252);
        v252 = malloc_type_malloc(4 * v170, 0x100004052888210uLL);
        v244 = v170;
      }
      *(_QWORD *)buf = v170;
      v172 = v252;
      v173 = v168;
      if (v168 == v245)
      {
        *v252 = v239;
        v172 = v252 + 1;
        v173 = &v245[v273];
        v171 = v170 - 1;
        *(_QWORD *)buf = v170 - 1;
      }
      if (!v171)
        goto LABEL_264;
      objc_msgSend(v247, "memoryCache");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = objc_msgSend(v174, "machVMPageRangeQueryWithAddress:size:dispositions:dispositionsCount:", v173, v169 - (_QWORD)v173, v172, buf);

      if (!v175)
        break;
      mach_error("collectVMpageStatistics: error in mach_vm_page_range_query", v175);
LABEL_326:

      if (++v160 >= v269)
        goto LABEL_327;
    }
    if (*((_QWORD *)v162 + 2) + *((_QWORD *)v162 + 1) < v169)
    {
      v245 = (char *)(v169 - v273);
      v239 = v252[v170 - 1];
    }
LABEL_264:
    if (v273 <= v169 - (unint64_t)v168)
    {
      v176 = 0;
      if (v170 <= 1)
        v177 = 1;
      else
        v177 = v170;
      v178 = v252;
      do
      {
        if ((v176 & 1) != 0)
        {
          objc_msgSend(objb, "objectAtIndex:", ++v160);
          v179 = objc_claimAutoreleasedReturnValue();

          v162 = (char *)v179;
        }
        v180 = *((_QWORD *)v162 + 1);
        if ((unint64_t)v168 <= v180)
          v181 = *((_QWORD *)v162 + 1);
        else
          v181 = (unint64_t)v168;
        v168 += v273;
        if ((unint64_t)v168 >= *((_QWORD *)v162 + 2) + v180)
          v182 = *((_QWORD *)v162 + 2) + v180;
        else
          v182 = (unint64_t)v168;
        v183 = *v178;
        if ((*v178 & 0x18) == 0
          || !objc_msgSend(*((id *)v162 + 4), "hasPrefix:", VMUunusedSharedLibLabelPrefix))
        {
          v176 = 0;
          goto LABEL_301;
        }
        v264 = (id)VMUunusedButDirtySharedLibDataPath;
        v184 = (void *)*((_QWORD *)v162 + 5);
        if (v184)
        {
          if ((objc_msgSend(v184, "hasPrefix:", VMUunusedSharedLibPathPrefix) & 1) == 0
            && (objc_msgSend(*((id *)v162 + 5), "hasPrefix:", VMUunusedButDirtyPrefix) & 1) == 0)
          {
            objc_msgSend(v242, "objectForKeyedSubscript:", *((_QWORD *)v162 + 5));
            v185 = objc_claimAutoreleasedReturnValue();

            v264 = (id)v185;
            if (!v185)
            {
              objc_msgSend((id)VMUunusedButDirtyPrefix, "stringByAppendingString:", *((_QWORD *)v162 + 5));
              v264 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v242, "setObject:forKeyedSubscript:", v264, *((_QWORD *)v162 + 5));
            }
          }
        }
        v186 = *((_QWORD *)v162 + 1);
        if ((v181 & v255) == 0 && v181 > v186)
        {
          objc_msgSend(v162, "breakAtLength:", v181 - v186);
          v191 = objc_claimAutoreleasedReturnValue();
          v190 = (char *)v191;
          if (!v191)
            goto LABEL_299;
          *(_BYTE *)(v191 + 132) |= 8u;
          objc_storeStrong((id *)(v191 + 40), v264);
          objc_msgSend(objb, "insertObject:atIndex:", v190, ++v160);
          v190 = v190;

          v176 = 0;
          ++v269;
          v162 = v190;
        }
        else if ((v182 & v255) != 0 || v182 >= *((_QWORD *)v162 + 2) + v186)
        {
          v162[132] |= 8u;
          v189 = v264;
          v176 = 0;
          v190 = (char *)*((_QWORD *)v162 + 5);
          *((_QWORD *)v162 + 5) = v189;
        }
        else
        {
          objc_msgSend(v162, "breakAtLength:", v182 - v186);
          v192 = objc_claimAutoreleasedReturnValue();
          v190 = (char *)v192;
          if (!v192)
          {
LABEL_299:
            v176 = 0;
            goto LABEL_300;
          }
          v162[132] |= 8u;
          objc_storeStrong((id *)v162 + 5, v264);
          objc_msgSend(objb, "insertObject:atIndex:", v190, v160 + 1);
          ++v269;
          v176 = 1;
        }
LABEL_300:

LABEL_301:
        v193 = v182 - v181;
        if ((v183 & 1) != 0)
        {
          *((_QWORD *)v162 + 20) += v193;
          ++*((_QWORD *)v162 + 8);
          if ((v183 & 8) != 0)
          {
            v194 = &OBJC_IVAR___VMUVMRegion_dirty_size;
            v195 = &OBJC_IVAR___VMUVMRegion_pages_dirtied;
            goto LABEL_306;
          }
        }
        else if ((v183 & 0x10) != 0)
        {
          v194 = &OBJC_IVAR___VMUVMRegion_swapped_out_size;
          v195 = &OBJC_IVAR___VMUVMRegion_pages_swapped_out;
LABEL_306:
          *(_QWORD *)&v162[*v194] += v193;
          ++*(_QWORD *)&v162[*v195];
        }
        if ((v183 & 0x20) != 0)
        {
          *((_QWORD *)v162 + 21) += v193;
          ++*((_QWORD *)v162 + 9);
        }
        if ((v183 & 0x800) != 0)
          *((_QWORD *)v162 + 27) += v193;
        ++v178;
        --v177;
      }
      while (v177);
    }
    if ((a7 & 0x10) != 0)
    {
      v196 = *((_QWORD *)v162 + 20);
      if (*((_QWORD *)v162 + 2) < v196)
        v196 = *((_QWORD *)v162 + 2);
      v197 = *((_DWORD *)v162 + 13);
      switch(v197)
      {
        case 2:
          v198 = &OBJC_IVAR___VMUVMRegion_purgable_empty_size;
          v196 = *((_QWORD *)v162 + 2);
          goto LABEL_321;
        case 1:
          v198 = &OBJC_IVAR___VMUVMRegion_purgable_vol_size;
          goto LABEL_321;
        case 0:
          v198 = &OBJC_IVAR___VMUVMRegion_purgable_non_vol_size;
LABEL_321:
          *(_QWORD *)&v162[*v198] += v196;
          break;
      }
    }
LABEL_322:
    if ((a7 & 0x100) == 0 && *((_DWORD *)v162 + 37) != -1)
    {
      v199 = NSMapGet(table, *((const void **)v162 + 5));
      if (v199)
      {
        addMallocRegionPageStatistics(v162, v199);
        ++v199[7];
      }
    }
    goto LABEL_326;
  }
LABEL_327:
  if (v252)
    free(v252);

  objc_autoreleasePoolPop(context);
LABEL_330:
  objc_msgSend(v258, "memoryCache");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = objc_msgSend(v200, "stopPeeking");

  if (!a2)
  {
    v256 = v258;
    v201 = v257;
    v265 = v248;
    v260 = v201;
    if (objc_msgSend(v201, "count"))
    {
      v202 = v201;
      if (v265)
      {
        objc_msgSend(v265, "objectForKeyedSubscript:", CFSTR("page_table"));
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v204 = objc_msgSend(v203, "unsignedLongLongValue");
          if (v204)
          {
            objc_msgSend(v202, "lastObject");
            v205 = objc_claimAutoreleasedReturnValue();
            v206 = (void *)v205;
            if (v205)
            {
              v207 = *(_QWORD *)(v205 + 16) + *(_QWORD *)(v205 + 8);
              if (!__CFADD__(v207, v204))
              {
                v208 = objc_alloc_init(VMUVMRegion);
                v208->range.location = v207;
                v208->range.length = v204;
                v208->resident_size = v204;
                v208->dirty_size = v204;
                v208->user_tag = -2;
                type = v208->type;
                v208->type = (NSString *)CFSTR("page table in kernel");

                path = v208->path;
                v208->path = (NSString *)CFSTR("charged to process physical footprint");

                v208->prot = 3;
                v208->maxProt = 3;
                v208->share_mode = 2;
                v208->purgeable = 3;
                objc_msgSend(v202, "addObject:", v208);

              }
            }

          }
        }

      }
      VMUGatherOwnedVmObjects(v256);
      objc = (id)objc_claimAutoreleasedReturnValue();
      if (objc && objc_msgSend(objc, "count"))
      {
        v291 = 0u;
        v292 = 0u;
        v289 = 0u;
        v290 = 0u;
        objc_msgSend(v202, "reverseObjectEnumerator");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v289, buf, 16);
        if (v212)
        {
          v213 = *(_QWORD *)v290;
LABEL_344:
          v214 = 0;
          while (1)
          {
            if (*(_QWORD *)v290 != v213)
              objc_enumerationMutation(v211);
            v215 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * v214);
            if ((objc_msgSend(v215, "isOwnedUnmappedMemory") & 1) != 0)
              break;
            if (v212 == ++v214)
            {
              v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v289, buf, 16);
              if (v212)
                goto LABEL_344;
              goto LABEL_373;
            }
          }
          v253 = v215;

          if (!v253)
            goto LABEL_374;
          v287 = 0u;
          v288 = 0u;
          v285 = 0u;
          v286 = 0u;
          v274 = v202;
          v216 = 0;
          v217 = objc_msgSend(v274, "countByEnumeratingWithState:objects:count:", &v285, &v302, 16);
          if (v217)
          {
            v218 = *(_QWORD *)v286;
            do
            {
              for (i = 0; i != v217; ++i)
              {
                if (*(_QWORD *)v286 != v218)
                  objc_enumerationMutation(v274);
                v220 = *(_QWORD **)(*((_QWORD *)&v285 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v220[28]);
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(objc, "objectForKeyedSubscript:", v221);
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                v223 = v222;
                if (v222)
                {
                  *(_QWORD *)&v301 = 0;
                  v300 = 0u;
                  v299 = 0u;
                  v298 = 0u;
                  objc_msgSend(v222, "getBytes:length:", &v298, 56);
                  objc_msgSend(objc, "removeObjectForKey:", v221);
                  *(_QWORD *)&v281 = 0;
                  *(_QWORD *)&v279[0] = 0;
                  VMUFootprintForVmObject((uint64_t)&v298, &v281, v279);
                  v220[23] = v281;
                  v220[22] = *(_QWORD *)&v279[0];
                  v224 = v281;
                  v225 = *(_QWORD *)&v279[0];
                  VMUVMLedgerNameForTag(((unint64_t)v301 >> 1) & 7);
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v226)
                  {
                    v227 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ (%@)"), v220[4], v226);
                    v228 = (void *)v220[4];
                    v220[4] = v227;

                  }
                  v216 += v224 + v225;
                }

              }
              v217 = objc_msgSend(v274, "countByEnumeratingWithState:objects:count:", &v285, &v302, 16);
            }
            while (v217);
          }

          adjustOwnedMemoryRegionFootprint(v253, v216);
          if (v253[23] + v253[22])
          {
            v283 = 0u;
            v284 = 0u;
            v281 = 0u;
            v282 = 0u;
            objc_msgSend(objc, "objectEnumerator");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            v230 = 0;
            v231 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v281, &v298, 16);
            if (v231)
            {
              v232 = *(_QWORD *)v282;
              do
              {
                for (j = 0; j != v231; ++j)
                {
                  if (*(_QWORD *)v282 != v232)
                    objc_enumerationMutation(v229);
                  v234 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * j);
                  v280 = 0;
                  memset(v279, 0, sizeof(v279));
                  objc_msgSend(v234, "getBytes:length:", v279, 56);
                  v230 += *((_QWORD *)&v279[0] + 1);
                }
                v231 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v281, &v298, 16);
              }
              while (v231);
            }

            v211 = v253;
            v253[2] = v230;
            v253[20] = 0;
          }
          else
          {
            objc_msgSend(v274, "removeObject:", v253);
            v211 = v253;
          }
        }
LABEL_373:

      }
LABEL_374:

    }
  }
  setCollectPhysFootprint(v241);
  if (v261 && objc_msgSend(v261, "signpostID"))
  {
    objc_msgSend(v261, "logHandle");
    v235 = objc_claimAutoreleasedReturnValue();
    v236 = objc_msgSend(v261, "signpostID");
    if (v236 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v235))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v235, OS_SIGNPOST_INTERVAL_END, v236, "recordRegions", "", buf, 2u);
    }

  }
  objc_msgSend(v261, "endEvent:", "recordRegions");

LABEL_383:
  return v266;
}

void sub_1A4DDBDF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void appendMallocZoneTextLine(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;

  v25 = a1;
  objc_msgSend(v25, "appendFormat:", CFSTR("%-*s"), a3, a4);
  objc_msgSend(v25, "appendFormat:", CFSTR(" %10s"), a5);
  if ((a2 & 4) != 0)
    objc_msgSend(v25, "appendFormat:", CFSTR(" %10s"), a6);
  if ((a2 & 8) != 0)
    objc_msgSend(v25, "appendFormat:", CFSTR(" %10s"), a7);
  v20 = v25;
  if ((a2 & 0x800) != 0)
  {
    objc_msgSend(v25, "appendFormat:", CFSTR(" %10s"), a8);
    v20 = v25;
  }
  if ((a2 & 0x400000) != 0)
  {
    objc_msgSend(v20, "appendFormat:", CFSTR(" %10s"), a9);
    objc_msgSend(v25, "appendFormat:", CFSTR(" %10s %10s %10s %7s"), a10, a11, a12, a13);
  }
  else
  {
    objc_msgSend(v20, "appendFormat:", CFSTR(" %10s %10s %10s %7s"), a10, a11, a12, a13);
    objc_msgSend(v25, "appendFormat:", CFSTR(" %7s"), a14, v21, v22, v23);
  }
  objc_msgSend(v25, "appendString:", CFSTR("\n"));

}

void appendMallocZoneStatsLine(void *a1, int a2, unsigned int a3, char a4, unsigned int a5, uint64_t a6, unint64_t *a7)
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *context;
  id v26;

  v26 = a1;
  context = (void *)MEMORY[0x1A85A9758]();
  v21 = pageCountString(a7[2], a3, a4);
  v20 = pageCountString(a7[3], a3, a4);
  v19 = pageCountString(a7[6], a3, a4);
  v10 = pageCountString(a7[5], a3, a4);
  v11 = pageCountString(a7[5] + a7[6], a3, a4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%10qu"), a7[1]);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "UTF8String");
  v14 = memorySizeString(*a7);
  v15 = memorySizeString(a7[9]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%3llu%%"), a7[8]);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "UTF8String");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%7llu"), a7[7]);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  appendMallocZoneTextLine(v26, a2, a5, a6, v21, v20, v19, v10, v11, v13, v14, v15, v17, objc_msgSend(v18, "UTF8String"));

  objc_autoreleasePoolPop(context);
}

int *setCollectPhysFootprint(int a1)
{
  int *result;
  FILE *v2;
  int *v3;
  int v4;

  v4 = a1;
  result = (int *)sysctlbyname("vm.self_region_footprint", 0, 0, &v4, 4uLL);
  if ((_DWORD)result)
  {
    result = __error();
    if (*result != 2)
    {
      v2 = (FILE *)*MEMORY[0x1E0C80C10];
      v3 = __error();
      return (int *)fprintf(v2, "Error setting sysctl: %s. %d.\n", "vm.self_region_footprint", *v3);
    }
  }
  return result;
}

void markMachOLibraries(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, __int16 a6)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t i;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];
  char v35;

  v9 = a1;
  v10 = a4;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "range");

  objc_msgSend(v10, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "range");

  v27 = (void *)objc_opt_new();
  v25 = (void *)objc_opt_new();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  CSSymbolicatorIsKernelSymbolicator();
  if ((a6 & 0x400) == 0 && (!a5 || objc_msgSend(v9, "addressIsInSharedCache:", a5)))
    CSSymbolicatorCreateForTaskSharedCache();
  CSIsNull();
  v30 = v27;
  v31 = v25;
  v32 = v9;
  v33 = v10;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  v29 = v30;
  v26 = v31;
  v28 = v32;
  v13 = v33;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    for (i = 0; i < v14; ++i)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v17 = v16[1];
      if ((v17 & 0xFFF) == 0)
      {
        v18 = v16[2];
        v19 = v18 + v17;
        v20 = (v18 + v17) & 0xFFF;
        if (v20)
        {
          if (i == v14 - 1)
          {
            v16[2] = v18 - v20 + 4096;
          }
          else
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", i + 1);
            v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            v23 = v21[1];
            if ((v23 ^ v19) >= 0x1000)
            {
              v16[2] = v16[2] - v20 + 4096;
            }
            else if (!v21[4])
            {
              if (v21[2] + v23 <= (unint64_t)(v16[1] + v16[2] + 4096 - v20))
              {
                objc_msgSend(v16, "addInfoFromRegion:", v21);
                objc_msgSend(v13, "removeObjectAtIndex:", i + 1);
                --v14;
              }
              else
              {
                objc_msgSend(v21, "breakAtLength:");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  objc_msgSend(v16, "addInfoFromRegion:", v22);
                  objc_msgSend(v13, "replaceObjectAtIndex:withObject:", i + 1, v24);
                }

              }
            }

          }
        }
      }

    }
  }

  _Block_object_dispose(v34, 8);
}

void sub_1A4DDE370(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void __listKernelCoreRegions_block_invoke(uint64_t a1, uint64_t a2)
{
  char *v4;

  v4 = (char *)objc_opt_new();
  *(_OWORD *)(v4 + 8) = *(_OWORD *)a2;
  *((_DWORD *)v4 + 6) = *(_DWORD *)(a2 + 32);
  *((_DWORD *)v4 + 7) = *(_DWORD *)(a2 + 36);
  v4[50] = 2;
  *((_DWORD *)v4 + 13) = 3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __listKernelCoreRegions_block_invoke_2(uint64_t a1)
{
  unint64_t Range;
  id *v3;
  id *v4;
  id *v5;

  Range = CSRegionGetRange();
  v5 = 0;
  findRegionForAddress(*(void **)(a1 + 32), Range, (void **)&v5);
  v3 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 132) |= 2u;
    if (!v3[4])
    {
      v4 = v3;
      objc_storeStrong(v3 + 5, (id)VMUunusedButDirtySharedLibDataPath);
      v3 = v4;
    }
  }

}

void __listKernelCoreRegions_block_invoke_3(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, int a5, int a6)
{
  void *v10;
  unint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  int v32;

  v10 = a2;
  v27 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v12 = 0;
    v13 = a4 - a3;
    if (a6)
      v14 = 1;
    else
      v14 = 3;
    v15 = (_QWORD *)MEMORY[0x1E0C85AD8];
    v32 = a5;
    v30 = v10;
    v31 = a3;
    v29 = v13;
    v28 = v14;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      if (VMURangeIntersectsRange(a3, v13, *(_QWORD *)(v16 + 8), *(_QWORD *)(v16 + 16)))
      {
        *(_DWORD *)(v16 + 104) = 1;
        objc_storeStrong((id *)(v16 + 32), v10);
        *(_DWORD *)(v16 + 28) = 3;
        *(_DWORD *)(v16 + 24) = v14;
        if (a5)
        {
          *(_DWORD *)(v16 + 144) = a5;
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = CFSTR("zalloc (no zone)");

        }
        v18 = *(_QWORD *)(v16 + 16) >> *MEMORY[0x1E0C85AC8];
        if (v18 >= 2)
        {
          v19 = v18 - 1;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18 - 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)v16;
          v22 = v19;
          do
          {
            objc_msgSend(v21, "breakAtLength:", *v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v20, "addObject:", v23);
              v24 = v23;

              v21 = v24;
            }

            --v22;
          }
          while (v22);
          v25 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v12 + 1, v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "insertObjects:atIndexes:", v20, v26);

          v12 += v19;
          a5 = v32;
          v10 = v30;
          a3 = v31;
          v13 = v29;
          v14 = v28;
        }
      }

      ++v12;
    }
    while (v12 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }

}

uint64_t __listAllRegions_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __markMachOLibraries_block_invoke_3(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  v7 = 0;
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  CSSymbolOwnerForeachSegment();

  _Block_object_dispose(v6, 8);
}

void sub_1A4DDE868(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __markMachOLibraries_block_invoke_4(uint64_t a1)
{
  void *v2;
  unint64_t Range;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v2 = (void *)MEMORY[0x1A85A9758]();
  Range = CSRegionGetRange();
  v5 = v4;
  if (VMURangeIntersectsRange(Range, v4, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)))
  {
    getBinarySegmentName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("__LINKEDIT")) & 1) == 0)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Range);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if ((v9 & 1) == 0)
      {
        objc_msgSend((id)VMUunusedSharedLibLabelOrPathPrefix, "stringByAppendingString:", v6);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      objc_msgSend(*(id *)(a1 + 40), "member:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
        v11 = v6;
      }
      v12 = *(_QWORD *)(a1 + 64);
      if (!*(_QWORD *)(*(_QWORD *)(v12 + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByResolvingSymlinksInPath");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        v12 = *(_QWORD *)(a1 + 64);
        if ((v9 & 1) == 0)
        {
          objc_msgSend((id)VMUunusedSharedLibLabelOrPathPrefix, "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)(v12 + 8) + 40));
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v19 = *(void **)(v18 + 40);
          *(_QWORD *)(v18 + 40) = v17;

          v12 = *(_QWORD *)(a1 + 64);
        }
      }
      setTypeAndPath(*(void **)(a1 + 48), *(void **)(a1 + 56), Range, v5, v11, *(void **)(*(_QWORD *)(v12 + 8) + 40), v9, v9);

    }
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __markMallocAreas_block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD *v12;

  v6 = a4;
  v12 = 0;
  findRegionForAddress(*(void **)(a1 + 32), a2, (void **)&v12);
  v7 = v12;
  if (v12)
  {
    if (!v12[5])
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(" zone structure"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v7[5];
      v7[5] = v8;

      if (*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(v7, "description");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("Setting region name in %s based on malloc zone structure address for  %s\n", "markMallocAreas_block_invoke", (const char *)objc_msgSend(v10, "UTF8String"));

      }
    }
  }

  return 0;
}

void __destructor_8_s0_s56_s64_sb72(id *a1)
{

}

void ___markRegionsForMallocZones_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  int v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___markRegionsForMallocZones_block_invoke_2;
  v5[3] = &unk_1E4E027B8;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v11;
  v8 = v4;
  v10 = *(_BYTE *)(a1 + 48);
  v6 = v3;
  v9 = a2;
  VMUTask_foreach_malloc_zone(v6, v5);

  _Block_object_dispose(v11, 8);
}

void sub_1A4DDEBF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___markRegionsForMallocZones_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, void (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)), void *a4)
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, id, uint64_t, uint64_t, int);
  void *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;

  v8 = a4;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3010000000;
  v41 = &unk_1A4E39779;
  v42 = xmmword_1A4E21BE0;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 48) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v9 + 56) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 64), a4);
  v11 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = ___markRegionsForMallocZones_block_invoke_3;
  v33[3] = &unk_1E4E02768;
  v37 = *(_QWORD *)(a1 + 48);
  v35 = &v38;
  v12 = v8;
  v13 = *(_QWORD *)(a1 + 40);
  v34 = v12;
  v36 = v13;
  v14 = (void *)MEMORY[0x1A85A995C](v33);
  v23 = v11;
  v24 = 3221225472;
  v25 = ___markRegionsForMallocZones_block_invoke_4;
  v26 = &unk_1E4E02790;
  v31 = *(_QWORD *)(a1 + 48);
  v29 = &v38;
  v15 = v14;
  v28 = v15;
  v16 = v12;
  v17 = *(_QWORD *)(a1 + 40);
  v27 = v16;
  v30 = v17;
  v32 = *(_BYTE *)(a1 + 64);
  v18 = MEMORY[0x1A85A995C](&v23);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(v19 + 72);
  *(_QWORD *)(v19 + 72) = v18;

  v21 = (*a3)(objc_msgSend(*(id *)(a1 + 32), "taskPort", v23, v24, v25, v26), *(_QWORD *)(a1 + 48), 6, a2, *(_QWORD *)(a1 + 56), _mallocEnumerationHandler);
  if (v39[4] != 0x7FFFFFFFFFFFFFFFLL)
    (*((void (**)(id, const __CFString *))v15 + 2))(v15, CFSTR("Range remaining after enumeration"));

  _Block_object_dispose(&v38, 8);
  return v21;
}

void sub_1A4DDEE00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void ___markRegionsForMallocZones_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *v3;
  id *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "splitOutRange:fromRegionIndex:regions:newZoneName:reason:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 48), **(_QWORD **)(a1 + 56), *(_QWORD *)(a1 + 32), a2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_storeStrong(v3 + 5, *(id *)(a1 + 32));
    v3 = v4;
    *((_DWORD *)v4 + 37) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = xmmword_1A4E21BE0;

}

void ___markRegionsForMallocZones_block_invoke_4(uint64_t a1, id a2, uint64_t a3, uint64_t a4, int a5)
{
  id *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  id v14;
  int v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  id *v25;

  v9 = (id *)*(id *)(*(_QWORD *)(a1 + 64) + 56);
  v10 = v9;
  if (a5 != 1)
  {
    if (a5)
      ___markRegionsForMallocZones_block_invoke_4_cold_1();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(_QWORD *)(v11 + 40);
    if (v12 && (id)(*(_QWORD *)(v11 + 32) + v12) != a2)
    {
      v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      v25 = v9;
LABEL_28:
      v13();
LABEL_29:
      v10 = v25;
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  v14 = v9[5];
  v25 = v10;
  if (!v14)
  {
    v16 = 0;
LABEL_14:
    v22 = v16;
    objc_storeStrong(v25 + 5, *(id *)(a1 + 32));
    *((_DWORD *)v25 + 37) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = xmmword_1A4E21BE0;
    if (objc_msgSend(v25, "isUntaggedRegion"))
    {
      objc_msgSend(v25, "setAsMallocRegion");
      objc_storeStrong(v25 + 4, (id)VMUmallocOtherRegionLabel);
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(v25, "description");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("ISSUE:  Region user_tag should already be set; setting to VM_MEMORY_MALLOC in %s based on enumeration range for  %s\n",
          "_markRegionsForMallocZones_block_invoke_4",
          (const char *)objc_msgSend(v23, "UTF8String"));

      }
    }
    if (*(_BYTE *)(a1 + 72))
    {
      if ((objc_msgSend(v22, "isEqualToString:", v25[5]) & 1) == 0)
      {
        objc_msgSend(v25, "description");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("Setting region name in %s based on enumeration range for  %s\n", "_markRegionsForMallocZones_block_invoke_4", (const char *)objc_msgSend(v24, "UTF8String"));

        if (v22)
          printf("    Old region name was %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
      }
    }

    goto LABEL_29;
  }
  v15 = objc_msgSend(v14, "hasSuffix:", CFSTR(" zone structure"));
  v10 = v25;
  v16 = v25[5];
  if (v15)
    goto LABEL_14;
  if (v16 != *(id *)(a1 + 32))
  {
    v17 = v25[1];
    v18 = (unint64_t)v17 + (_QWORD)v25[2];
    if ((unint64_t)a2 + a3 < v18)
      v18 = (unint64_t)a2 + a3;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(_QWORD *)(v19 + 32);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v18 - (_QWORD)a2;
      *(_QWORD *)(v19 + 32) = a2;
    }
    else
    {
      if (a2 > v17)
        v17 = a2;
      if ((id)(*(_QWORD *)(v19 + 40) + v20) != v17)
        ___markRegionsForMallocZones_block_invoke_4_cold_2();
      v21 = v18 - v20;
    }
    *(_QWORD *)(v19 + 40) = v21;
    if ((char *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
                + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)) == (char *)v25[1] + (_QWORD)v25[2])
    {
      v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_28;
    }
  }
LABEL_30:

}

void _mallocEnumerationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v6;
  void **v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  if (a5)
  {
    v6 = 0;
    v18 = a5;
    v7 = (void **)(a2 + 56);
    do
    {
      v8 = (unint64_t *)(a4 + 16 * v6);
      v9 = *v8;
      v10 = v8[1];
      v11 = *v8 + v10;
      if (__CFADD__(*v8, v10))
      {
        NSLog(CFSTR("Error in enumerating malloc zone %@ - allocation is excessively large: %#llx-%#llx[%llu].%s\n"), *(_QWORD *)(a2 + 64), v9, v11, v10, *(_QWORD *)(a2 + 40));
        if (!*(_BYTE *)(a2 + 32))
LABEL_23:
          abort();
      }
      v12 = v9;
      if (*(_QWORD *)(a2 + 24))
      {
        if (!VMURangeIntersectsRange(v9, v10, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16)))
          goto LABEL_21;
        if (v9 <= *(_QWORD *)(a2 + 8))
          v12 = *(_QWORD *)(a2 + 8);
        else
          v12 = v9;
      }
      (*(void (**)(void))(*(_QWORD *)(a2 + 72) + 16))();
      if (v12 < v11)
      {
        while (1)
        {
          if (!*v7 || v12 - *((_QWORD *)*v7 + 1) >= *((_QWORD *)*v7 + 2))
          {
            *(_QWORD *)(a2 + 48) = findRegionForAddress(*(void **)a2, v12, v7);
            if (!*(_QWORD *)(a2 + 56))
              break;
          }
          (*(void (**)(void))(*(_QWORD *)(a2 + 72) + 16))();
          v12 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 16) + *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8);
          if (v12 >= v11)
            goto LABEL_21;
          v13 = *(_QWORD *)(a2 + 48) + 1;
          *(_QWORD *)(a2 + 48) = v13;
          if (v13 >= objc_msgSend(*(id *)a2, "count"))
          {
            v14 = 0;
          }
          else
          {
            objc_msgSend(*(id *)a2, "objectAtIndexedSubscript:", *(_QWORD *)(a2 + 48));
            v14 = objc_claimAutoreleasedReturnValue();
          }
          v15 = *v7;
          *v7 = (void *)v14;

        }
        v16 = *(_QWORD *)(a2 + 64);
        VMURangeDescription(v9, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Error in enumerating malloc zone %@ - allocation is not in a VM region: %@ %s\n"), v16, v17, *(_QWORD *)(a2 + 40));

        if (!*(_BYTE *)(a2 + 32))
          goto LABEL_23;
      }
LABEL_21:
      ++v6;
    }
    while (v6 != v18);
  }
}

void ___getRegionMallocStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v14[3];
  int v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___getRegionMallocStatistics_block_invoke_2;
  v7[3] = &unk_1E4E02830;
  v10 = v14;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v11 = v6;
  v13 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 32);
  v12 = a2;
  VMUTask_foreach_malloc_zone(v4, v7);

  _Block_object_dispose(v14, 8);
}

void sub_1A4DDF42C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___getRegionMallocStatistics_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, void (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)), void *a4)
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;

  v8 = a4;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = malloc_type_calloc(1uLL, 0x50uLL, 0x10000404247E4FDuLL);
  NSMapInsertKnownAbsent(*(NSMapTable **)(a1 + 32), v8, v9);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 48) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v10 + 56) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 64), a4);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___getRegionMallocStatistics_block_invoke_3;
  v20[3] = &unk_1E4E02808;
  v13 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v23 = v9;
  v24 = v12;
  v21 = v8;
  v22 = v13;
  v25 = *(_BYTE *)(a1 + 72);
  v14 = v8;
  v15 = MEMORY[0x1A85A995C](v20);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(v16 + 72);
  *(_QWORD *)(v16 + 72) = v15;

  v18 = (*a3)(objc_msgSend(*(id *)(a1 + 40), "taskPort"), *(_QWORD *)(a1 + 56), 7, a2, *(_QWORD *)(a1 + 64), _mallocEnumerationHandler);
  return v18;
}

void ___getRegionMallocStatistics_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int64x2_t v7;
  id v8;
  id v9;
  id v10;

  if (a5 == 1)
  {
    v8 = *(id *)(*(_QWORD *)(a1 + 56) + 56);
    if (*((_DWORD *)v8 + 37) == -1 || !*((_QWORD *)v8 + 5))
    {
      *((_DWORD *)v8 + 37) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v10 = v8;
      objc_storeStrong((id *)v8 + 5, *(id *)(a1 + 32));
      v8 = v10;
      if (*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(v10, "description");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("Setting region name in %s based on enumeration for  %s\n", "_getRegionMallocStatistics_block_invoke_3", (const char *)objc_msgSend(v9, "UTF8String"));

        v8 = v10;
      }
    }
    if (*((_DWORD *)v8 + 37) == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if ((a4 & 1) != 0)
        ++*((_QWORD *)v8 + 17);
      *((_DWORD *)v8 + 36) |= a4;
    }

  }
  else
  {
    if (a5)
      ___getRegionMallocStatistics_block_invoke_3_cold_1();
    if ((a4 & 1) != 0)
    {
      v7 = vdupq_n_s64(1uLL);
      v7.i64[0] = a3;
      *(int64x2_t *)*(_QWORD *)(a1 + 48) = vaddq_s64(*(int64x2_t *)*(_QWORD *)(a1 + 48), v7);
    }
  }
}

BOOL _copy_remote_mangled_symbol_value(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, void *a6)
{
  const void *v8;

  v8 = (const void *)_map_remote_mangled_symbol_value(a1, a2, a3, a4, a5);
  if (v8)
    memcpy(a6, v8, a5);
  else
    bzero(a6, a5);
  return v8 != 0;
}

uint64_t _map_remote_mangled_symbol_value(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  uint64_t Range;
  uint64_t v8;

  v6 = a1;
  CSSymbolOwnerGetSymbolWithMangledName();
  Range = CSSymbolGetRange();
  if (Range)
    v8 = v6[2](v6, Range, a5);
  else
    v8 = 0;

  return v8;
}

void printFigSubclassInfo(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FILE **v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  if ((printFigSubclassInfo_printedHeader & 1) == 0)
  {
    if (getenv("DT_PRINT_FIG_SUBCLASSES"))
    {
      printFigSubclassInfo_printIt = 1;
      v7 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%-36s  %-60s  %s\n", "CFType", "Fig Subclass", "FigBaseClass symbol name");
      fprintf(*v7, "%-36s  %-60s  %s\n", "======", "============", "========================");
    }
    printFigSubclassInfo_printedHeader = 1;
  }
  if (printFigSubclassInfo_printIt == 1)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "%-36s  %-60s  %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));

}

uint64_t closureContextMayHaveGenericCaptures(uint64_t a1, void *a2)
{
  uint64_t result;
  int v4;
  _QWORD v5[2];
  _QWORD v6[2];
  uint64_t v7;

  v6[0] = 0;
  v6[1] = 0;
  v7 = 0;
  result = objc_msgSend(a2, "copyRange:to:", a1, 24, v6);
  if ((_DWORD)result)
  {
    LODWORD(v5[1]) = 0;
    v5[0] = 0;
    v4 = objc_msgSend(a2, "copyRange:to:", v7, 12, v5);
    result = 0;
    if (v4)
      return *(_QWORD *)((char *)v5 + 4) != 0;
  }
  return result;
}

void sub_1A4DE2674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

#error "1A4DE6478: call analysis failed (funcsize=51)"

void sub_1A4DE64B4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A4DE6A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4DE6F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DE7364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  __destructor_8_sb16_s24_s32_w56_w64((id *)va);
  _Unwind_Resume(a1);
}

void __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id WeakRetained;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = MEMORY[0x1A85A995C](*(_QWORD *)(a2 + 16));
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;

  objc_storeStrong((id *)(a1 + 24), *(id *)(a2 + 24));
  objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 32));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a2 + 56));
  objc_storeWeak((id *)(a1 + 56), WeakRetained);
  v6 = objc_loadWeakRetained((id *)(a2 + 64));
  objc_storeWeak((id *)(a1 + 64), v6);

}

uint64_t _query_data_layout_function(uint64_t a1, int a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  switch(a2)
  {
    case 0:
    case 1:
      *a4 = 8;
      goto LABEL_10;
    case 2:
      v6 = -1;
      goto LABEL_8;
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "vmuTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "isExclaveCore");

      *a4 = 0;
      goto LABEL_10;
    case 4:
      v9 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v9, "vmuTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isExclaveCore");

      v6 = 4096;
      if (!v11)
        v6 = 0x100000000;
LABEL_8:
      *(_QWORD *)a4 = v6;
      goto LABEL_10;
    case 5:
      v12 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v12, "vmuTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v13, "isExclaveCore") ^ 1;

LABEL_10:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t _read_bytes_function(uint64_t a1, void *key, unint64_t a3, _QWORD *a4)
{
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  id WeakRetained;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  int v17;
  FILE *v18;
  id v19;
  void *v20;
  int v21;
  FILE *v22;
  unint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  ++*(_DWORD *)(a1 + 48);
  if (a4)
    *a4 = 0;
  v7 = NSMapGet(*(NSMapTable **)(a1 + 24), key);
  if (!v7)
  {
LABEL_8:
    v11 = *(unsigned __int8 *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v13 = WeakRetained;
    if (!v11)
    {
      objc_msgSend(WeakRetained, "memoryCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mapAddress:size:returnedAddress:returnedSize:", key, a3, &v25, &v24);

      v21 = *(_DWORD *)(a1 + 44);
      if (v25)
      {
        if ((v21 & 0xFFFFFFFE) == 2)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx[%llu] --> %#llx[%llu]  READ_BYTES CACHE MISS (UNVALIDATED)\n");
      }
      else if ((v21 - 1) <= 2)
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx[%llu] FAIL! READ_BYTES (UNVALIDATED) COULD NOT MAP\n");
      }
      goto LABEL_28;
    }
    v14 = (id *)objc_msgSend(WeakRetained, "validateAddressRangeForSwiftRemoteMirror:allowUnusedSplitLibs:", key, a3, 1);

    if (!v14)
    {
      if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx[%llu] FAIL! READ_BYTES REGION NOT FOUND\n");
      goto LABEL_28;
    }
    objc_msgSend(*v14, "range");
    v15 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v15, "memoryCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mapAddress:size:returnedAddress:returnedSize:", key, a3, &v25, &v24);

    v17 = *(_DWORD *)(a1 + 44);
    if (v25)
    {
      if ((v17 & 0xFFFFFFFE) == 2)
      {
        v18 = (FILE *)*MEMORY[0x1E0C80C10];
        objc_msgSend(*v14, "description");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v19, "UTF8String");
        fprintf(v18, "%#llx[%llu] --> %#llx[%llu] in %s  READ_BYTES CACHE MISS (VALIDATED)  -------------\n");
LABEL_25:

      }
    }
    else if ((v17 - 1) <= 2)
    {
      v22 = (FILE *)*MEMORY[0x1E0C80C10];
      objc_msgSend(*v14, "description");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "UTF8String");
      fprintf(v22, "%#llx[%llu] FAIL! READ_BYTES COULD NOT MAP, ALTHOUGH FOUND REGION %s\n");
      goto LABEL_25;
    }
LABEL_28:
    if (!v7)
    {
      v7 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      NSMapInsert(*(NSMapTable **)(a1 + 24), key, v7);
    }
    v8 = v25;
    *v7 = v25;
    v7[1] = v24;
    return v8;
  }
  VMUClearCrashReporterInfo();
  v8 = *v7;
  if (*v7)
  {
    v9 = v7[1];
    v24 = v9;
    v25 = v8;
    v10 = *(_DWORD *)(a1 + 44);
    if (v9 < a3)
    {
      if ((v10 - 1) <= 2)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx[%llu] --> %#llx[%llu]  FAIL! READ_BYTES CACHE HIT, BUT NEED TO MAP MORE\n", key, a3, v8, v9);
      goto LABEL_8;
    }
    if (v10 == 3)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx[%llu] --> %#llx[%llu]  READ_BYTES CACHE HIT\n", key, a3, v8, v9);
  }
  else
  {
    if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx[%llu] --> 0x0[0]  NOT FOUND  READ_BYTES CACHE HIT\n", key, a3);
    return 0;
  }
  return v8;
}

size_t _get_string_length(uint64_t a1, const void *a2)
{
  void *v4;
  size_t v5;
  id WeakRetained;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  char *v13;
  size_t v14;
  int v15;
  FILE *v16;
  id v17;
  size_t v18;
  _QWORD *v19;
  size_t v20;
  uint64_t v21;
  size_t __n;
  char *__s1;

  __n = 0;
  __s1 = 0;
  ++*(_DWORD *)(a1 + 52);
  v4 = NSMapGet(*(NSMapTable **)(a1 + 32), a2);
  if (v4)
  {
    if (v4 == (void *)0xFFFFFFFFLL)
      v5 = 0;
    else
      v5 = (size_t)v4;
    if (*(_DWORD *)(a1 + 44) == 3)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx --> %llu  STRING_LENGTH CACHE HIT\n", a2, v5);
    return v5;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = (id *)objc_msgSend(WeakRetained, "validateAddressRangeForSwiftRemoteMirror:allowUnusedSplitLibs:", a2, 0, 1);

  if (v7)
  {
    v8 = objc_msgSend(*v7, "range");
    v10 = v9 - (_QWORD)a2 + v8;
    v11 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v11, "memoryCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mapAddress:size:returnedAddress:returnedSize:", a2, v10, &__s1, &__n);

    v13 = __s1;
    if (__s1)
    {
      v5 = __n;
      v14 = strnlen(__s1, __n);
      v15 = *(_DWORD *)(a1 + 44);
      if (v14 == v5)
      {
        if ((v15 - 1) <= 2)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx  FAIL! STRING_LENGTH DID NOT FIND NULL TERMINATOR IN %llu BYTES FOR STRING LENGTH OF %.*s\n", a2, v5, v5, v13);
      }
      else
      {
        v18 = v14;
        if ((v15 & 0xFFFFFFFE) == 2)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx --> %llu  STRING_LENGTH CACHE MISS OF %s\n", a2, v14, v13);
        v5 = v18;
      }
      goto LABEL_20;
    }
    if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
    {
      v16 = (FILE *)*MEMORY[0x1E0C80C10];
      objc_msgSend(*v7, "description");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v16, "%#llx FAIL! STRING_LENGTH COULD NOT MAP, ALTHOUGH FOUND REGION %s\n", a2, (const char *)objc_msgSend(v17, "UTF8String"));

    }
  }
  else if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "%#llx  FAIL! NO VM REGION FOR STRING LENGTH\n", a2);
  }
  v5 = 0;
LABEL_20:
  if (!NSMapGet(*(NSMapTable **)(a1 + 24), a2))
  {
    v19 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v20 = __n;
    *v19 = __s1;
    v19[1] = v20;
    NSMapInsert(*(NSMapTable **)(a1 + 24), a2, v19);
  }
  if (v5)
    v21 = v5;
  else
    v21 = 0xFFFFFFFFLL;
  NSMapInsert(*(NSMapTable **)(a1 + 32), a2, (const void *)v21);
  return v5;
}

uint64_t _get_symbol_address(uint64_t a1, const char *a2)
{
  _BOOL4 v4;
  id WeakRetained;
  void *v6;
  uint64_t SymbolWithName;
  uint64_t *v8;
  uint64_t v9;
  uint64_t SymbolWithNameAtTime;
  uint64_t *v11;
  uint64_t v12;
  const char *Name;
  uint64_t Range;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v20 = 0;
  v21 = 0;
  v19 = &unk_1A4E39779;
  if (isatty(0))
    v4 = isatty(2) != 0;
  else
    v4 = 0;
  if (!strncmp(a2, "objc", 4uLL))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "libobjcSymbolOwner");
LABEL_14:

    goto LABEL_15;
  }
  if (!strncmp(a2, "swift", 5uLL) || !strncmp(a2, "_swift_debug", 0xCuLL))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "vmuTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isExclaveCore"))
    {
LABEL_12:
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      goto LABEL_13;
    }
LABEL_10:
    CSSymbolicatorGetSymbolOwner();
LABEL_13:

    goto LABEL_14;
  }
  if (!strncmp(a2, "_swift_concurrency", 0x12uLL))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "vmuTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isExclaveCore"))
      goto LABEL_12;
    goto LABEL_10;
  }
LABEL_15:
  if (!CSIsNull())
  {
    SymbolWithName = CSSymbolOwnerGetSymbolWithName();
    v8 = v17;
    v17[4] = SymbolWithName;
    v8[5] = v9;
  }
  if (CSIsNull())
  {
    CSSymbolicatorForeachSymbolOwnerAtTime();
    if (CSIsNull())
    {
      SymbolWithNameAtTime = CSSymbolicatorGetSymbolWithNameAtTime();
      v11 = v17;
      v17[4] = SymbolWithNameAtTime;
      v11[5] = v12;
      if ((CSIsNull() & 1) == 0)
      {
        CSSymbolGetSymbolOwner();
        Name = (const char *)CSSymbolOwnerGetName();
        if (((CSIsNull() | !v4) & 1) == 0)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "Symbolication.framework _get_symbol_owner found requested symbol %s in unexpected non-Swift library %s\n", a2, Name);
      }
    }
  }
  if ((CSIsNull() & 1) != 0)
  {
    if (v4)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Symbolication.framework _get_symbol_owner did not find requested symbol %s\n", a2);
    Range = 0;
  }
  else
  {
    Range = CSSymbolGetRange();
  }
  _Block_object_dispose(&v16, 8);
  return Range;
}

void sub_1A4DE7DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __destructor_8_sb16_s24_s32_w56_w64(id *a1)
{

  objc_destroyWeak(a1 + 7);
  objc_destroyWeak(a1 + 8);
}

uint64_t ___get_symbol_address_block_invoke(uint64_t a1)
{
  uint64_t result;
  const char *Name;
  uint64_t SymbolWithName;
  uint64_t v5;
  uint64_t v6;

  result = CSIsNull();
  if ((_DWORD)result)
  {
    Name = (const char *)CSSymbolOwnerGetName();
    result = strncmp(Name, "libswift", 8uLL);
    if (!(_DWORD)result)
    {
      SymbolWithName = CSSymbolOwnerGetSymbolWithName();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_QWORD *)(v5 + 32) = SymbolWithName;
      *(_QWORD *)(v5 + 40) = v6;
      result = CSIsNull();
      if ((result & 1) == 0)
      {
        if (*(_BYTE *)(a1 + 48))
          return fprintf((FILE *)*MEMORY[0x1E0C80C10], "Symbolication.framework _get_symbol_owner found requested symbol %s in unexpected Swift library %s\n", *(const char **)(a1 + 40), Name);
      }
    }
  }
  return result;
}

uint64_t btref_decode_unslide(void *a1, unsigned int a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unsigned int v10;
  int v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((a2 & 0xC000003E) != 0)
    return 0;
  v16 = v5;
  v17 = v6;
  v10 = 12 - __clz(a2);
  if (!(a2 >> 20))
    v10 = 0;
  v15 = *(_QWORD *)(a4 + 8 * v10 + 88) + a2;
  objc_msgSend(a1, "peekAtAddress:size:returnsBuf:");
  v11 = *(_DWORD *)(v15 + 4);
  result = v11 & 0xF;
  if ((v11 & 0xF) != 0)
  {
    v12 = (int *)(v15 + 12);
    v13 = v11 & 0xF;
    do
    {
      v14 = *v12++;
      *a3++ = v14 + a5;
      --v13;
    }
    while (v13);
  }
  return result;
}

void sub_1A4DECB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id descriptionForCallstackFrames(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t Name;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  v17 = v3;
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(v4, "stringByAppendingString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_DWORD *)(a1 + 40))
    {
      v8 = 0;
      do
      {
        CSSymbolicatorGetSymbolWithAddressAtTime();
        CSSymbolGetSymbolOwner();
        CSSymbolicatorGetSectionWithAddressAtTime();
        Name = CSSymbolGetName();
        if (Name)
          v10 = (const char *)Name;
        else
          v10 = "symbol name not found";
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * v8);
        v12 = CSSymbolOwnerGetName();
        v13 = CSRegionGetName();
        objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\t[%3d] %#08.8qx  {%s.%s + %#qx} %s\n"), v8, v11, v12, v13, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * v8) - CSRegionGetRange(), v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = *(_QWORD *)(a1 + 32);
        if (v14)
        {
          objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\t\tframe pointer %#llx\n"), *(_QWORD *)(v14 + 8 * v8));
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v15;
        }
        ++v8;
        v7 = v5;
      }
      while (v8 < *(unsigned int *)(a1 + 40));
    }
    else
    {
      v5 = v7;
    }
  }

  return v5;
}

__CFString *VMUPlatformNameForPlatform(uint64_t a1)
{
  if ((a1 - 1) < 0x18)
    return off_1E4E02EF0[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown-%u"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *VMUPlatformNameForTask()
{
  uint64_t v0;

  v0 = CSPlatformForTask();
  return VMUPlatformNameForPlatform(v0);
}

BOOL VMUProcessIsAnalyzable(_BOOL8 result)
{
  pid_t v1;

  if (result)
  {
    v1 = result;
    return !kill(result, 0) || !getuid() && getpgid(v1) > 0;
  }
  return result;
}

uint64_t pidFromHint(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  pid_t v6;
  uint64_t v7;
  uint64_t v8;
  VMUProcInfo *v9;
  uint64_t v10;
  uint64_t v11;
  VMUProcInfo *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL haveSufficientAccessToProcess;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  VMUProcInfo *v25;
  uint64_t v26;
  FILE *v27;
  id v28;
  FILE **v29;
  void *v30;
  uint64_t v32;
  id v33;
  id v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length"))
  {
    v5 = 0;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "rangeOfCharacterFromSet:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(v2, "integerValue");
    goto LABEL_40;
  }
  v36 = v2;
  v32 = MEMORY[0x1A85A9758]();
  v6 = getpid();
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  +[VMUProcInfo getProcessIds](VMUProcInfo, "getProcessIds");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_26;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v38;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
      v14 = (void *)MEMORY[0x1A85A9758]();
      v15 = objc_msgSend(v13, "integerValue");
      if (v6 == (_DWORD)v15)
      {
        v9 = v12;
        goto LABEL_22;
      }
      v9 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", v15);

      -[VMUProcInfo procTableName](v9, "procTableName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUProcInfo name](v9, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", v36) & 1) != 0
        || objc_msgSend(v16, "isEqualToString:", v36))
      {
        haveSufficientAccessToProcess = _haveSufficientAccessToProcess(v15);
        v19 = v34;
        if (!haveSufficientAccessToProcess)
          goto LABEL_21;
      }
      else
      {
        objc_msgSend(v17, "rangeOfString:", v36);
        if (!v20)
        {
          objc_msgSend(v16, "rangeOfString:", v36);
          if (!v21)
            goto LABEL_21;
        }
        v22 = _haveSufficientAccessToProcess(v15);
        v19 = v33;
        if (!v22)
          goto LABEL_21;
      }
      objc_msgSend(v19, "addObject:", v9);
LABEL_21:

      v12 = v9;
LABEL_22:
      objc_autoreleasePoolPop(v14);
      ++v11;
    }
    while (v8 != v11);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v8);
LABEL_26:

  v23 = objc_msgSend(v34, "count");
  if (!v23)
  {
    v26 = objc_msgSend(v33, "count");
    v2 = v36;
    v24 = (void *)v32;
    if (v26)
    {
      if (v26 == 1)
      {
        objc_msgSend(v33, "lastObject");
        v25 = (VMUProcInfo *)objc_claimAutoreleasedReturnValue();

        v5 = -[VMUProcInfo pid](v25, "pid");
        v27 = (FILE *)*MEMORY[0x1E0C80C10];
        -[VMUProcInfo name](v25, "name");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v27, "Found process %d (%s) from partial name %s\n", v5, (const char *)objc_msgSend(v28, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));

LABEL_32:
        v9 = v25;
        goto LABEL_39;
      }
      if (isatty(0) && isatty(2))
      {
        v29 = (FILE **)MEMORY[0x1E0C80C10];
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "You have access to multiple processes that match the partial name %s:\n", (const char *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));
        v30 = v33;
        goto LABEL_34;
      }
    }
    v5 = 0;
    goto LABEL_39;
  }
  v2 = v36;
  v24 = (void *)v32;
  if (v23 == 1)
  {
    objc_msgSend(v34, "lastObject");
    v25 = (VMUProcInfo *)objc_claimAutoreleasedReturnValue();

    v5 = -[VMUProcInfo pid](v25, "pid");
    goto LABEL_32;
  }
  v29 = (FILE **)MEMORY[0x1E0C80C10];
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "You have access to multiple processes named %s:\n", (const char *)objc_msgSend(objc_retainAutorelease(v36), "UTF8String"));
  v30 = v34;
LABEL_34:
  v5 = choosePid(v30);
  fputc(10, *v29);
LABEL_39:

  objc_autoreleasePoolPop(v24);
LABEL_40:

LABEL_41:
  return v5;
}

BOOL _haveSufficientAccessToProcess(_BOOL8 a1)
{
  ipc_space_t *v1;
  int v2;
  _BOOL8 v3;

  if (!VMUProcessIsAnalyzable(a1))
    return 0;
  v1 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v2 = task_read_for_pid();
  v3 = v2 == 0;
  if (!v2)
    mach_port_deallocate(*v1, 0);
  return v3;
}

uint64_t choosePid(void *a1)
{
  id v1;
  uint64_t v2;
  unsigned int v3;
  void *v4;
  id v5;
  FILE *v6;
  int v7;
  id v8;
  const char *v9;
  FILE **v10;
  FILE *i;
  void *v13;
  uint64_t v14;
  FILE **v15;
  const char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned int v30;
  char v31[128];
  char __str[8];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v25 = objc_msgSend(v1, "count");
  if (v25)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    do
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v2);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v3 > 0x19)
        __strlcpy_chk();
      else
        snprintf(__str, 3uLL, "%c)", v3 + 97);
      v6 = (FILE *)*MEMORY[0x1E0C80C10];
      v7 = objc_msgSend(v5, "pid");
      objc_msgSend(v5, "userAppName");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v6, "    %s %5d %s\n", __str, v7, (const char *)objc_msgSend(v8, "UTF8String"));

      v2 = ++v3;
      v4 = v5;
    }
    while (v25 > v3);
  }
  else
  {
    v5 = 0;
  }
  if (isatty(0) && isatty(2))
  {
    v9 = "Which process? (letter or PID) ";
    v10 = (FILE **)MEMORY[0x1E0C80C18];
    while (1)
    {
      fwrite(v9, 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      for (i = *v10; !fgets(__str, 8, i); clearerr(i))
      {
        if (!ferror(i) || *__error() != 4)
          exit(0);
      }
      if (__str[0] >= 97 && __str[1] == 10 && __str[0] - 97 < v25)
      {
        objc_msgSend(v1, "objectAtIndexedSubscript:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "pid");

        if ((_DWORD)v14)
          break;
      }
      v30 = 0;
      if (sscanf(__str, "%d", &v30) == 1)
      {
        v15 = v10;
        v16 = v9;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = v1;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v18)
        {
          v19 = v18;
          LODWORD(v14) = 0;
          v20 = *(_QWORD *)v27;
          do
          {
            v21 = 0;
            v22 = v5;
            do
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              v5 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v21);

              v23 = objc_msgSend(v5, "pid");
              if (v23 == v30)
                v14 = v30;
              else
                v14 = v14;
              ++v21;
              v22 = v5;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          }
          while (v19);
        }
        else
        {
          v14 = 0;
        }

        v5 = 0;
        v9 = v16;
        v10 = v15;
        if ((_DWORD)v14)
          break;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id psName(uint64_t a1)
{
  VMUProcInfo *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", a1);
  -[VMUProcInfo userAppName](v1, "userAppName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _CRGetOSVersionDictionary()
{
  if (_CRGetOSVersionDictionary_onceToken != -1)
    dispatch_once(&_CRGetOSVersionDictionary_onceToken, &__block_literal_global_16);
  return _CRGetOSVersionDictionary__osVersionDict;
}

CFStringRef _CRCopyProcessNameForPID(int a1)
{
  const char *v2;
  int v3;
  int v4;
  char *v5;
  char buffer[1025];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = buffer;
  bzero(buffer, 0x401uLL);
  v3 = proc_name(a1, buffer, 0x400u);
  if (v3 < 0 || (buffer[v3] = 0, (v3 - 15) <= 0xFFFFFFF1))
  {
    v2 = buffer;
    v4 = proc_pidpath(a1, buffer, 0x400u);
    if ((v4 & 0x80000000) == 0)
    {
      buffer[v4] = 0;
      v5 = strrchr(buffer, 47);
      if (v5)
        v2 = v5 + 1;
    }
  }
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0x8000100u);
}

CFStringRef _CRCopyExecutablePathForPID(int a1)
{
  int v2;
  char buffer[1025];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x401uLL);
  v2 = proc_pidpath(a1, buffer, 0x400u);
  if ((v2 & 0x80000000) == 0)
    buffer[v2] = 0;
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buffer, 0x8000100u);
}

CFStringRef _CRCopyExecutablePathAndNameForPIDDetectingInconsistencies(int a1, CFStringRef *a2, _BYTE *a3, CFStringRef *a4, _BYTE *a5)
{
  _BYTE *v5;
  char *v10;
  int v11;
  char *v12;
  int v13;
  int v14;
  const __CFAllocator *v15;
  CFStringRef result;
  char __s1[1025];
  char buffer[1025];
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  *a5 = 0;
  v10 = buffer;
  bzero(buffer, 0x401uLL);
  v11 = proc_pidpath(a1, buffer, 0x400u);
  if ((v11 & 0x80000000) == 0)
    buffer[v11] = 0;
  v12 = strrchr(buffer, 47);
  if (v12)
    v10 = v12 + 1;
  bzero(__s1, 0x401uLL);
  v13 = proc_name(a1, __s1, 0x400u);
  if (v13 < 0)
    goto LABEL_9;
  __s1[v13] = 0;
  if ((v13 - 15) > 0xFFFFFFF1)
  {
    v14 = strcmp(__s1, v10);
    v5 = a3;
    v10 = __s1;
    if (!v14)
    {
      v10 = __s1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v13 || strncmp(__s1, v10, 0xFuLL))
  {
LABEL_9:
    *a3 = 1;
LABEL_11:
    *v5 = 1;
  }
LABEL_12:
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *a2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buffer, 0x8000100u);
  result = CFStringCreateWithCString(v15, v10, 0x8000100u);
  *a4 = result;
  return result;
}

_DWORD *VMUCreateRootNodeMarkingMap(void *a1)
{
  id v1;
  int v2;
  _DWORD *v3;
  uint64_t v4;
  _QWORD v6[5];

  v1 = a1;
  v2 = objc_msgSend(v1, "nodeNamespaceSize");
  v3 = malloc_type_calloc(1uLL, ((v2 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  v4 = MEMORY[0x1E0C809B0];
  *v3 = v2;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __VMUCreateRootNodeMarkingMap_block_invoke;
  v6[3] = &__block_descriptor_40_e25_v44__0I8___Qb60b4__12_B36l;
  v6[4] = v3;
  objc_msgSend(v1, "enumerateObjectsWithBlock:", v6);

  return v3;
}

void VMUWithRootNodeMarkingMap(void *a1, void *a2)
{
  void (**v3)(id, _DWORD *);
  _DWORD *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (v3)
  {
    v4 = VMUCreateRootNodeMarkingMap(v5);
    v3[2](v3, v4);
    if (v4)
      free(v4);
  }

}

uint64_t VMULiteZoneIndex(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;

  v1 = a1;
  if (objc_msgSend(v1, "zoneCount"))
  {
    v2 = 0;
    LODWORD(v3) = -1;
    do
    {
      objc_msgSend(v1, "zoneNameForIndex:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone")))
        v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper")) ^ 1;
      else
        v5 = 0;

      if (v5)
        v3 = v2;
      else
        v3 = v3;
      v2 = (v2 + 1);
    }
    while (v2 < objc_msgSend(v1, "zoneCount"));
  }
  else
  {
    v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

void VMUEnumerateVMAnnotatedMallocObjectsWithBlock(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD *v10;
  int v11;
  _QWORD v12[3];
  int v13;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    v6 = objc_msgSend(v3, "nodeCount");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __VMUEnumerateVMAnnotatedMallocObjectsWithBlock_block_invoke;
    v7[3] = &unk_1E4E03040;
    v10 = v12;
    v11 = v6;
    v8 = v3;
    v9 = v5;
    objc_msgSend(v8, "enumerateRegionsWithBlock:", v7);

    _Block_object_dispose(v12, 8);
  }

}

void sub_1A4DEF7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DF2ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DF31B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DF4E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4DF5558(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4DF5C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *VMUScanTypeScanDescription(unsigned int a1)
{
  if (a1 > 8)
    return "";
  else
    return off_1E4E032D8[a1];
}

const char *VMUScanTypeKeywordDescription(int a1)
{
  if ((a1 - 2) > 6)
    return "";
  else
    return off_1E4E03320[a1 - 2];
}

const char *VMUScanTypeAsString(unsigned int a1)
{
  if (a1 > 8)
    return "Unknown";
  else
    return off_1E4E03358[a1];
}

uint64_t VMUScanningMaskForAllReferences()
{
  return 318;
}

uint64_t VMUScanningMaskForOwningReferences()
{
  return 46;
}

BOOL VMUIsOwningReference(char a1)
{
  return ((1 << a1) & 0x26) != 0;
}

BOOL task_get_malloc_zones_array_address_and_count(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, _QWORD *a6)
{
  id v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t Range;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  _QWORD *v23;
  _QWORD *v24;
  char __str[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  *a4 = 0;
  *a5 = 0;
  if (objc_msgSend(v9, "isExclaveCore"))
  {
    CSSymbolicatorGetSymbolOwner();
    if (CSIsNull())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected 1 binary in ExclaveCore target, but found %zu"), CSSymbolicatorGetSymbolOwnerCountAtTime());
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        v11 = 0;
        goto LABEL_13;
      }
LABEL_18:
      v11 = 0;
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if (!CSIsNull())
    goto LABEL_11;
  v23 = a6;
  objc_msgSend(v9, "processDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForEnvVar:", CFSTR("DYLD_IMAGE_SUFFIX"));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");

  if (v14)
  {
    snprintf(__str, 0x7FuLL, "libsystem_malloc%s.dylib", v14);
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  a6 = v23;
  if (!CSIsNull())
  {
LABEL_11:
    CSSymbolOwnerGetSymbolWithMangledName();
    Range = CSSymbolGetRange();
    CSSymbolOwnerGetSymbolWithMangledName();
    v16 = CSSymbolGetRange();
    *(_QWORD *)__str = 0;
    objc_msgSend(v9, "memoryCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "peekAtAddress:size:returnsBuf:", v16, 4, __str);

    if (!(_DWORD)v18)
    {
      v19 = **(_DWORD **)__str;
      *a5 = **(_DWORD **)__str;
      if (!v19)
      {
        v11 = 1;
        goto LABEL_21;
      }
      v24 = 0;
      objc_msgSend(v9, "memoryCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "peekAtAddress:size:returnsBuf:", Range, 8, &v24);

      v11 = (_DWORD)v21 == 0;
      if (!(_DWORD)v21)
      {
        *a4 = *v24;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error %d reading zones_address at %qx"), v21, Range);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!a6)
        goto LABEL_21;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error %d reading num_zones at %qx"), v18, v16);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (a6)
    {
LABEL_13:
      *a6 = v10;
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (!v23)
    goto LABEL_18;
  v11 = 0;
  *v23 = CFSTR("couldn't find libsystem_malloc dylib in target task");
LABEL_21:

  return v11;
}

uint64_t get_local_zone_count()
{
  malloc_get_all_zones();
  return 0;
}

void unregister_new_local_zones()
{
  malloc_get_all_zones();
}

void task_foreach_malloc_zone(uint64_t a1, void *a2)
{
  id v3;
  VMUTask *v4;

  v3 = a2;
  v4 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", a1);
  VMUTask_foreach_malloc_zone(v4, v3);

}

void VMUTask_foreach_malloc_zone(void *a1, void *a2)
{
  id v3;
  char *v4;
  id v5;
  char v6;
  uint64_t FlagsForNListOnlyData;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  BOOL malloc_zones_array_address_and_count;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  CFUUIDBytes *CFUUIDBytes;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char *v52;
  char *v53;
  const __CFString *v54;
  char *v55;
  void *v56;
  id v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  id v63;
  const char *v64;
  const char *v65;
  uint64_t *Range;
  uint64_t v67;
  id v68;
  CFUUIDBytes *v69;
  CFUUIDRef v70;
  CFUUIDRef v71;
  void *v72;
  char v73;
  const __CFString *v74;
  uint64_t Name;
  __CFString *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  const char *v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  char *__s1;
  char *__s1a;
  id v92;
  id v93;
  id v94;
  char *Path;
  char *v96;
  uint64_t (**v97)(id, _QWORD, uint64_t, id);
  _QWORD *v98;
  CFUUIDRef cf2;
  id v100;
  void *v101;
  unsigned int (**v102)(void);
  uint64_t (**v103)(void);
  void (**v104)(_QWORD, _QWORD);
  void *v105;
  uint64_t v106;
  unsigned int v107;
  _QWORD v108[4];
  id v109;
  unsigned int (**v110)(void);
  uint64_t *v111;
  uint64_t *v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  id v117[4];
  id v118;
  id v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  int v128;

  v3 = a1;
  v97 = a2;
  v4 = getenv("SYMBOLICATION_LOG_ZONE_INTROSPECTION_LOOKUP");
  if (v4 && !strcmp(v4, "YES"))
    logZoneIntrospectionLookup = 1;
  v5 = v3;
  v107 = 0;
  v6 = objc_msgSend(v5, "isExclave");
  FlagsForNListOnlyData = 0;
  if ((v6 & 1) == 0)
    FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
  v8 = objc_msgSend(v5, "createSymbolicatorWithFlags:andNotification:", FlagsForNListOnlyData, 0);
  v10 = v9;
  if (!CSIsNull())
  {
    v108[0] = 0;
    v117[0] = 0;
    malloc_zones_array_address_and_count = task_get_malloc_zones_array_address_and_count(v5, v8, v10, v108, &v107, v117);
    v14 = v117[0];
    if (malloc_zones_array_address_and_count)
    {
      v11 = v107;
      if (v107)
      {
        v115[0] = 0;
        objc_msgSend(v5, "memoryCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v108[0];
        v17 = objc_msgSend(v15, "peekAtAddress:size:returnsBuf:", v108[0], 8 * v11, v115);

        if (!(_DWORD)v17)
        {
          v18 = (char *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
          v12 = v18;
          v19 = 0;
          v20 = v115[0];
          do
          {
            *(_QWORD *)&v18[v19] = *(_QWORD *)(v20 + v19);
            v19 += 8;
          }
          while (8 * v11 != v19);
          goto LABEL_17;
        }
        NSLog(CFSTR("*** task_malloc_get_all_zones: error %d reading zones at %qx\n"), v17, v16);
        CSRelease();
      }
      else
      {
        CSRelease();
        NSLog(CFSTR("*** task_malloc_get_all_zones: target has no active zones\n"));
        v11 = 0;
      }
      v12 = 0;
    }
    else
    {
      CSRelease();
      NSLog(CFSTR("*** task_malloc_get_all_zones: %@\n"), v14);
      v12 = 0;
      v11 = v107;
    }
LABEL_17:

    goto LABEL_18;
  }
  NSLog(CFSTR("*** task_malloc_get_all_zones: can't get target task symbolicator\n"));
  v11 = 0;
  v12 = 0;
LABEL_18:

  v21 = CSIsNull();
  if (v12 && (v21 & 1) == 0 && v11)
  {
    v22 = 0;
    v23 = 0x1E0CB3000uLL;
    v94 = v5;
    v98 = v12;
    while (1)
    {
      v24 = (void *)MEMORY[0x1A85A9758]();
      v25 = v12[v22];
      v106 = 0;
      objc_msgSend(v5, "memoryCache");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "peekAtAddress:size:returnsBuf:", v25, 200, &v106);

      if (!(_DWORD)v27)
        break;
      NSLog(CFSTR("*** Symbolication:  Can't read zone 0x%qx (error %d)\n"), v25, v27);
LABEL_133:
      objc_autoreleasePoolPop(v24);
      if (++v22 >= v11)
        goto LABEL_140;
    }
    v28 = v106;
    v29 = v5;
    v30 = v29;
    if (*(_QWORD *)(v28 + 72)
      && (objc_msgSend(v29, "memoryCache"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "peekStringAtAddress:", *(_QWORD *)(v28 + 72)),
          v31,
          v32))
    {
      objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("%s_0x%qx"), v32, v25);
    }
    else
    {
      objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("unnamed_zone_0x%qx"), v25, v89);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v23 + 2368), "stringWithFormat:", CFSTR("preparing to enumerate %@\n"), v33);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    VMUSetCrashReporterInfo(v105);
    v34 = v106;
    v35 = v30;
    v36 = v33;
    v124 = 0;
    v125 = &v124;
    v126 = 0x2020000000;
    v127 = 0;
    v120 = 0;
    v121 = &v120;
    v122 = 0x2020000000;
    v123 = 0;
    v101 = v24;
    if (remoteZoneIntrospection_onceToken != -1)
      dispatch_once(&remoteZoneIntrospection_onceToken, &__block_literal_global_17);
    v37 = MEMORY[0x1E0C809B0];
    v117[0] = (id)MEMORY[0x1E0C809B0];
    v117[1] = (id)3221225472;
    v117[2] = __remoteZoneIntrospection_block_invoke_2;
    v117[3] = &unk_1E4E033F0;
    v38 = v35;
    v118 = v38;
    v39 = v36;
    v119 = v39;
    v40 = (void *)MEMORY[0x1A85A995C](v117);
    v115[0] = v37;
    v115[1] = 3221225472;
    v115[2] = __remoteZoneIntrospection_block_invoke_3;
    v115[3] = &unk_1E4E03418;
    v41 = v40;
    v116 = v41;
    v42 = (void *)MEMORY[0x1A85A995C](v115);
    v113[0] = v37;
    v113[1] = 3221225472;
    v113[2] = __remoteZoneIntrospection_block_invoke_4;
    v113[3] = &unk_1E4E03418;
    v100 = v41;
    v114 = v100;
    v103 = (uint64_t (**)(void))MEMORY[0x1A85A995C](v113);
    v108[0] = v37;
    v108[1] = 3221225472;
    v108[2] = __remoteZoneIntrospection_block_invoke_5;
    v108[3] = &unk_1E4E03440;
    v102 = v42;
    v110 = v102;
    v43 = v39;
    v109 = v43;
    v111 = &v120;
    v112 = &v124;
    v104 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A995C](v108);
    if (objc_msgSend(v38, "isExclave"))
    {
      if (remoteZoneIntrospection_exclaveIntrospectionDetailsToken != -1)
        dispatch_once(&remoteZoneIntrospection_exclaveIntrospectionDetailsToken, &__block_literal_global_57);
      v44 = v105;
      v45 = &remoteZoneIntrospection_exclaveIntrospectionDetails;
      if ((remoteZoneIntrospection_getExclaveIntrospectionSucceeded & 1) == 0)
      {
        ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("Failed to find xzm zone introspection structure"));
        v46 = 0;
        v44 = v105;
LABEL_128:

        _Block_object_dispose(&v120, 8);
        _Block_object_dispose(&v124, 8);

        v87 = v44;
        if (v46)
        {
          VMUSetCrashReporterInfo(v87);
          v108[0] = 0;
          LODWORD(v117[0]) = 0;
          malloc_get_all_zones();
          v88 = v97[2](v97, v25, v46, v43);
          if ((_DWORD)v88)
            NSLog(CFSTR("*** Symbolication:  Can't read pointers from zone %@ (error %d)\n"), v43, v88);
          VMUClearCrashReporterInfo();
          unregister_new_local_zones();
        }

        v11 = v107;
        v12 = v98;
        v23 = 0x1E0CB3000;
        v24 = v101;
        goto LABEL_133;
      }
LABEL_127:
      v46 = *v45;
      goto LABEL_128;
    }
    v47 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, *(_QWORD *)(v34 + 96));
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
    if (CFUUIDBytes)
      cf2 = CFUUIDCreateFromUUIDBytes(0, *CFUUIDBytes);
    else
      cf2 = 0;
    v49 = remoteZoneIntrospection_analysisProcessLibmallocAddr;
    if (v49 == CSSymbolOwnerGetBaseAddress()
      && remoteZoneIntrospection_analysisProcessLibmallocUUID
      && cf2
      && CFEqual((CFTypeRef)remoteZoneIntrospection_analysisProcessLibmallocUUID, cf2)
      && *MEMORY[0x1E0C83ED0])
    {
      v50 = 0;
      while (-[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, *(_QWORD *)(*(_QWORD *)(*MEMORY[0x1E0C83FC0] + 8 * v50) + 96)) != v47)
      {
        if (++v50 >= (unint64_t)*MEMORY[0x1E0C83ED0])
          goto LABEL_46;
      }
      v58 = 0;
      v125[3] = v47;
      goto LABEL_108;
    }
LABEL_46:
    Path = (char *)CSSymbolOwnerGetPath();
    if (!CSSymbolOwnerGetName())
    {
      ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("couldn't get framework name associated with the malloc zone"));
      v58 = 0;
      goto LABEL_108;
    }
    CSSymbolicatorGetFlagsForNListOnlyData();
    CSSymbolicatorCreateWithTaskFlagsAndNotification();
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) == 0)
    {
      if (logZoneIntrospectionLookup == 1)
      {
        v59 = objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
        v60 = CSSymbolOwnerGetPath();
        NSLog(CFSTR("zone %s - using analysis tool's' %s to look for zone introspect struct for target process's %s\n"), v59, v60, Path);
      }
LABEL_79:
      if ((CSIsNull() & 1) != 0)
      {
        v58 = 0;
        goto LABEL_108;
      }
      v64 = (const char *)CSSymbolOwnerGetPath();
      v93 = 0;
      if (Path)
      {
        v65 = v64;
        if (v64)
        {
          if (!strcmp(Path, v64))
          {
            v93 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s in analysis process, for %s in target process"), v65, Path);
            v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            Path = (char *)objc_msgSend(v93, "UTF8String");
          }
        }
      }
      CSSymbolOwnerGetSymbolWithAddress();
      if (!CSSymbolGetMangledName())
      {
        ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("couldn't get introspect structure symbol name from %s"));
        goto LABEL_106;
      }
      CSSymbolOwnerGetSymbolWithMangledName();
      if (CSIsNull())
      {
        v89 = (uint64_t)Path;
        ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("couldn't find introspect structure symbol %s in %s"));
LABEL_106:
        v58 = 0;
LABEL_107:

LABEL_108:
        v44 = v105;
        if (!v125[3])
          goto LABEL_147;
        CSSymbolOwnerGetSymbolWithAddress();
        Name = CSSymbolGetName();
        if (Name)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
          v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v76 = CFSTR("<no symbol>");
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        VMUSanitizePath(v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = -[__CFString rangeOfString:](v76, "rangeOfString:", CFSTR("("));
        if (v80)
        {
          -[__CFString substringToIndex:](v76, "substringToIndex:", v79);
          v81 = objc_claimAutoreleasedReturnValue();

          v76 = (__CFString *)v81;
        }
        v82 = objc_msgSend(v43, "rangeOfString:", CFSTR("_0x"));
        if (v82 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v83 = v43;
        }
        else
        {
          objc_msgSend(v43, "substringToIndex:", v82);
          v83 = (id)objc_claimAutoreleasedReturnValue();
        }
        v84 = v83;
        v85 = "";
        if (v58)
          v85 = " -- loaded from target process";
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enumerating %@ by calling %@ in %@%s\n"), v83, v76, v78, v85);
        v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v44 = v86;
        if (logZoneIntrospectionLookup == 1)
          NSLog(CFSTR("%@"), v86);

        if (!v125[3])
        {
LABEL_147:
          if (!*((_BYTE *)v121 + 24))
            ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("unknown"));
        }
        CSRelease();
        if (cf2)
          CFRelease(cf2);
        v45 = v125 + 3;
        v5 = v94;
        goto LABEL_127;
      }
      Range = (uint64_t *)CSSymbolGetRange();
      if (Range)
      {
        __s1a = (char *)Range;
        if (*Range)
        {
          v67 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, *Range);
          CSSymbolOwnerGetSymbolWithAddress();
          if (!CSSymbolIsFunction() || CSSymbolGetRange() != v67)
          {
            v89 = v67;
            ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("introspect structure %s for the malloc zone has invalid enumerator function address %#llx in %s"));
            goto LABEL_106;
          }
          if (!v102[2]())
          {
LABEL_139:
            v125[3] = (uint64_t)__s1a;
            v58 = 1;
            goto LABEL_107;
          }
          v68 = v38;
          if ((CSIsNull() & 1) == 0)
          {
            v69 = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
            if (v69)
            {
              v70 = CFUUIDCreateFromUUIDBytes(0, *v69);
              v71 = v70;
              if (cf2 && v70)
              {
                if (!CFEqual(v70, cf2))
                {
                  v96 = (char *)CSSymbolOwnerGetName();
                  objc_msgSend(v68, "memoryCache");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = objc_msgSend(v72, "isDriverKit");

                  if ((v73 & 1) == 0)
                    NSLog(CFSTR("%s in target process is different than in analysis process, which can cause problems analyzing memory.  You may need to relaunch the target process and analysis process to get the new version of the framework.  The dyld shared cache may also be out of date, which could affect system performance.  To update the dyld shared cache, run 'sudo update_dyld_shared_cache' and reboot.\n\n"), v96);
                }
                goto LABEL_137;
              }
              if (v70)
LABEL_137:
                CFRelease(v71);
            }
          }

          goto LABEL_139;
        }
        v74 = CFSTR("introspect structure %s for the malloc zone has no enumerator function in %s");
      }
      else
      {
        v74 = CFSTR("couldn't get address of introspect structure symbol %s in %s");
      }
      v89 = (uint64_t)Path;
      ((void (**)(_QWORD, const __CFString *))v104)[2](v104, v74);
      goto LABEL_106;
    }
    if ((v103[2]() & 1) == 0)
    {
      *((_BYTE *)v121 + 24) = 1;
      goto LABEL_79;
    }
    v51 = v43;
    __s1 = (char *)CSSymbolOwnerGetPath();
    CSSymbolOwnerGetName();
    v92 = v51;
    v52 = __s1;
    v53 = strstr(__s1, "libclang_rt.asan");
    v54 = CFSTR("for security, cannot load non-system library %s");
    if (v53)
      goto LABEL_51;
    v55 = strstr(__s1, "libclang_rt.tsan");
    v54 = CFSTR("for security, cannot load non-system library %s");
    if (v55)
      goto LABEL_51;
    if (strncmp(__s1, "/System/", 8uLL) && strncmp(__s1, "/usr/", 5uLL))
    {
      v61 = getprogname();
      if (!strcmp(v61, "ReportCrash"))
      {
        v54 = CFSTR("for security, cannot load non-system library %s from unsafe path into ReportCrash");
        v52 = __s1;
LABEL_51:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v54, v52);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      }
      if ((dyld_process_is_restricted() & 1) != 0 || !getuid())
      {
        v128 = 0;
        getpid();
        if (csops() || (v128 & 0x2000) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("for security, cannot load non-system library %s"), __s1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
          v57 = v56;

          if (v57)
            goto LABEL_76;
LABEL_68:
          if (dlopen(__s1, 389))
          {
            if (logZoneIntrospectionLookup == 1)
              NSLog(CFSTR("loaded %s for %@ introspection\n"), __s1, v92);
            CSRelease();
            CSSymbolicatorGetFlagsForNListOnlyData();
            CSSymbolicatorCreateWithTaskFlagsAndNotification();
            CSSymbolicatorGetSymbolOwnerWithNameAtTime();
            if (!CSIsNull())
            {
              v57 = 0;
              goto LABEL_76;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("couldn't create symbolicator for %s"), __s1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), dlerror());
            v62 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v57 = v62;
LABEL_76:

          v63 = v57;
          if (CSIsNull())
            ((void (**)(_QWORD, const __CFString *))v104)[2](v104, CFSTR("%@"));

          goto LABEL_79;
        }
      }
    }

    goto LABEL_68;
  }
LABEL_140:
  if (v12)
    free(v12);
  if ((CSIsNull() & 1) == 0)
    CSRelease();

}

void sub_1A4DF7BA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void task_enumerate_malloc_blocks(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD v4[6];
  int v5;
  int v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __task_enumerate_malloc_blocks_block_invoke;
  v4[3] = &__block_descriptor_56_e82_i32__0Q8__malloc_introspection_t_________________________________I_16__NSString_24l;
  v5 = a1;
  v6 = a3;
  v4[4] = a2;
  v4[5] = a4;
  task_foreach_malloc_zone(a1, v4);
}

id task_get_malloc_ptrs_by_zone(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  int v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __task_get_malloc_ptrs_by_zone_block_invoke;
  v10[3] = &unk_1E4E033C8;
  v11 = v3;
  v13 = a1;
  v5 = v4;
  v12 = v5;
  v6 = v3;
  task_foreach_malloc_zone(a1, v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

uint64_t __task_get_malloc_ptrs_by_zone_block_invoke(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, VMURangeArray *, uint64_t, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), uint64_t (*)(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)), void *a4)
{
  id v7;
  VMUNonOverlappingRangeArray *v8;
  uint64_t v9;
  VMURangeArray *v10;

  v7 = a4;
  if (!*(_QWORD *)(a1 + 32)
    || (v8 = objc_alloc_init(VMUNonOverlappingRangeArray),
        v9 = (*a3)(*(unsigned int *)(a1 + 48), &v8->super, 6, a2, task_peek_natural_size, nonOverlappingRecorder),
        -[VMUNonOverlappingRangeArray sortAndMergeRanges](v8, "sortAndMergeRanges"),
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7),
        v8,
        !(_DWORD)v9))
  {
    v10 = objc_alloc_init(VMURangeArray);
    v9 = (*a3)(*(unsigned int *)(a1 + 48), v10, 1, a2, task_peek_natural_size, ptrsRecorder);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7);

  }
  return v9;
}

uint64_t nonOverlappingRecorder(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)
{
  int v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (a5)
  {
    v5 = a5;
    do
    {
      --v5;
      v8 = *a4;
      v9 = a4[1];
      a4 += 2;
      result = objc_msgSend(a2, "addOrExtendRange:", v8, v9);
    }
    while (v5);
  }
  return result;
}

uint64_t ptrsRecorder(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)
{
  int v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (a5)
  {
    v5 = a5;
    do
    {
      --v5;
      v8 = *a4;
      v9 = a4[1];
      a4 += 2;
      result = objc_msgSend(a2, "addRange:", v8, v9);
    }
    while (v5);
  }
  return result;
}

id task_get_malloc_ptrs(uint64_t a1)
{
  void *v2;
  _QWORD v4[6];
  int v5;
  int v6;

  v2 = (void *)objc_opt_new();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __task_enumerate_malloc_blocks_block_invoke;
  v4[3] = &__block_descriptor_56_e82_i32__0Q8__malloc_introspection_t_________________________________I_16__NSString_24l;
  v5 = a1;
  v6 = 1;
  v4[4] = v2;
  v4[5] = ptrsRecorder;
  task_foreach_malloc_zone(a1, v4);
  return v2;
}

id task_find_all_malloc_regions(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  void *v10;
  uint64_t (*v11)(uint64_t, void *, uint64_t, uint64_t *, int);
  int v12;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __VMUTask_enumerate_malloc_blocks_block_invoke;
  v8 = &unk_1E4E034B0;
  v9 = v1;
  v10 = v2;
  v12 = 6;
  v11 = nonOverlappingRecorder;
  v3 = v1;
  withPeekFunctionForVMUTask(v3, &v5);

  objc_msgSend(v2, "sortAndMergeRanges", v5, v6, v7, v8);
  return v2;
}

void __remoteZoneIntrospection_block_invoke()
{
  CFUUIDBytes *CFUUIDBytes;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  CSSymbolicatorGetFlagsForNListOnlyData();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
    remoteZoneIntrospection_analysisProcessLibmallocUUID = (uint64_t)CFUUIDCreateFromUUIDBytes(0, *CFUUIDBytes);
  remoteZoneIntrospection_analysisProcessLibmallocAddr = CSSymbolOwnerGetBaseAddress();
  CSRelease();
  v1 = objc_opt_new();
  v2 = (void *)remoteZoneIntrospection_previouslySeenTasksAndZones;
  remoteZoneIntrospection_previouslySeenTasksAndZones = v1;

  v3 = objc_opt_new();
  v4 = (void *)remoteZoneIntrospection_previouslySeenTasksAndZonesLock;
  remoteZoneIntrospection_previouslySeenTasksAndZonesLock = v3;

}

uint64_t __remoteZoneIntrospection_block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend((id)remoteZoneIntrospection_previouslySeenTasksAndZonesLock, "lock");
  if ((objc_msgSend(*(id *)(a1 + 32), "isCore") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "coreFilePath");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(a1 + 32), "taskPort"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)remoteZoneIntrospection_previouslySeenTasksAndZones, "containsObject:", v5);
  if ((v6 & 1) == 0 && a2)
    objc_msgSend((id)remoteZoneIntrospection_previouslySeenTasksAndZones, "addObject:", v5);
  objc_msgSend((id)remoteZoneIntrospection_previouslySeenTasksAndZonesLock, "unlock");

  return v6 ^ 1u;
}

uint64_t __remoteZoneIntrospection_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __remoteZoneIntrospection_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __remoteZoneIntrospection_block_invoke_5(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  FILE *v13;
  id v14;

  v10 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Can't examine target process's malloc zone %@, so memory analysis will be incomplete or incorrect.\n"), a1[4]);
    objc_msgSend(v12, "appendFormat:", CFSTR("Reason: %@\n\n"), v11);
    v13 = (FILE *)*MEMORY[0x1E0C80C10];
    v14 = objc_retainAutorelease(v12);
    fputs((const char *)objc_msgSend(v14, "UTF8String"), v13);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __remoteZoneIntrospection_block_invoke_5_cold_1((uint64_t)v14);

  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;

}

void *__remoteZoneIntrospection_block_invoke_56()
{
  const char *v0;
  char *v1;
  void *result;

  v0 = "/System/Library/PrivateFrameworks/libmalloc_exclaves_introspector.framework/libmalloc_exclaves_introspector";
  if (os_variant_has_internal_content())
  {
    v1 = getenv("SYMBOLICATION_EXCLAVES_INTROSPECTOR_FRAMEWORK_PATH");
    if (v1)
      v0 = v1;
  }
  result = dlopen(v0, 133);
  if (result)
  {
    result = dlsym(result, "xzm_malloc_zone_introspect");
    remoteZoneIntrospection_exclaveIntrospectionDetails = (uint64_t)result;
    if (result)
      remoteZoneIntrospection_getExclaveIntrospectionSucceeded = 1;
  }
  return result;
}

uint64_t VMUOAHRuntimeLocation()
{
  if (findOahFuncs_onceToken != -1)
    dispatch_once(&findOahFuncs_onceToken, &__block_literal_global_18);
  return oahRuntimeLocation;
}

id VMURegisterNameForIndex(uint64_t a1)
{
  if (a1 > 0x22)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown register index %u>"), a1);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", VMURegisterNameForIndex_regNames[a1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

void *__findOahFuncs_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/liboah.dylib", 1);
  if (result)
  {
    v1 = result;
    oahFuncs = (uint64_t)dlsym(result, "oah_get_x86_thread_state");
    result = dlsym(v1, "oah_get_runtime_location");
    qword_1EE78B7C8 = (uint64_t)result;
    if (result)
    {
      result = (void *)((uint64_t (*)(void))result)();
      oahRuntimeLocation = (uint64_t)result;
    }
  }
  return result;
}

uint64_t _compareSizeCount(int a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v9 = a4;
  v10 = a5;
  if (a1)
    v11 = a3;
  else
    v11 = a2;
  if (v11 <= 0)
  {
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (a1)
        v14 = a2;
      else
        v14 = a3;
      if (v14 > 0)
        goto LABEL_5;
      if ((v14 & 0x8000000000000000) == 0)
      {
        v12 = objc_msgSend(v9, "compare:", v10);
        goto LABEL_6;
      }
    }
    v12 = 1;
    goto LABEL_6;
  }
LABEL_5:
  v12 = -1;
LABEL_6:

  return v12;
}

void sub_1A4DFD2E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DFD63C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A4DFDBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1A4DFDD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DFDDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A4DFDFE8(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Unwind_Resume(a1);
}

void sub_1A4DFE08C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DFE12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DFE3B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DFE520(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4DFE69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A4DFE724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4DFE870(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void sub_1A4DFE9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1A4DFEA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4DFEC30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4DFECCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4DFEFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::pair<VMUFieldInfo * {__strong},unsigned int>>(uint64_t a1, id *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  void **v12;
  _QWORD *v13;
  unint64_t v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;

  v7 = objc_msgSend(*a2, "hash");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      v13 = *v12;
      if (*v12)
      {
        do
        {
          v14 = v13[1];
          if (v14 == v8)
          {
            v15 = (id)v13[2];
            if (v15 == *a2 || (objc_msgSend(v15, "isEqual:") & 1) != 0)
              return v13;
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9)
                v14 %= v9;
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3)
              break;
          }
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
    }
  }
  v16 = (_QWORD *)(a1 + 16);
  v13 = operator new(0x20uLL);
  *v13 = 0;
  v13[1] = v8;
  v17 = *a3;
  *a3 = 0;
  v13[2] = v17;
  *((_DWORD *)v13 + 6) = *((_DWORD *)a3 + 2);
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    v20 = 1;
    if (v9 >= 3)
      v20 = (v9 & (v9 - 1)) != 0;
    v21 = v20 | (2 * v9);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v23);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v24 = *(_QWORD *)a1;
  v25 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v25)
  {
    *v13 = *v25;
LABEL_39:
    *v25 = v13;
    goto LABEL_40;
  }
  *v13 = *v16;
  *v16 = v13;
  *(_QWORD *)(v24 + 8 * v3) = v16;
  if (*v13)
  {
    v26 = *(_QWORD *)(*v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9)
        v26 %= v9;
    }
    else
    {
      v26 &= v9 - 1;
    }
    v25 = (_QWORD *)(*(_QWORD *)a1 + 8 * v26);
    goto LABEL_39;
  }
LABEL_40:
  ++*(_QWORD *)(a1 + 24);
  return v13;
}

void sub_1A4DFF340(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},std::pair<VMUClassInfo * {__strong},unsigned int>>(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = v6;
  v13 = *a3;
  *a3 = 0;
  v10[2] = v13;
  *((_DWORD *)v10 + 6) = *((_DWORD *)a3 + 2);
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    v16 = 1;
    if (v7 >= 3)
      v16 = (v7 & (v7 - 1)) != 0;
    v17 = v16 | (2 * v7);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v19);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *v10 = *v21;
LABEL_38:
    *v21 = v10;
    goto LABEL_39;
  }
  *v10 = *v12;
  *v12 = v10;
  *(_QWORD *)(v20 + 8 * v3) = v12;
  if (*v10)
  {
    v22 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7)
        v22 %= v7;
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_1A4DFF590(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,unsigned int>>(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = v6;
  v10[2] = *(_QWORD *)a3;
  *((_DWORD *)v10 + 6) = *(_DWORD *)(a3 + 8);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_1A4DFF7B8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
    v5 = *(_QWORD *)&v2 <= v3 ? v3 % *(_QWORD *)&v2 : *a2;
  else
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>(uint64_t a1, unint64_t *a2, _QWORD *a3, _DWORD *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  _QWORD *v12;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8)
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v12 = operator new(0x20uLL);
  *v12 = 0;
  v12[1] = v8;
  v12[2] = *a3;
  *((_DWORD *)v12 + 6) = *a4;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v19);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v12 = *v21;
LABEL_38:
    *v21 = v12;
    goto LABEL_39;
  }
  *v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  *(_QWORD *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    v22 = *(_QWORD *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9)
        v22 %= v9;
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_1A4DFFA9C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},VMUClassInfo * {__strong}&,unsigned int &>(uint64_t a1, unint64_t *a2, id *a3, _DWORD *a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v9 <= v8)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v11)
    {
      v12 = *v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8)
              return v12;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v14 = (_QWORD *)(a1 + 16);
  v12 = operator new(0x20uLL);
  *v12 = 0;
  v12[1] = v8;
  v12[2] = *a3;
  *((_DWORD *)v12 + 6) = *a4;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *v12 = *v22;
LABEL_38:
    *v22 = v12;
    goto LABEL_39;
  }
  *v12 = *v14;
  *v14 = v12;
  *(_QWORD *)(v21 + 8 * v4) = v14;
  if (*v12)
  {
    v23 = *(_QWORD *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v12;
}

void sub_1A4DFFCE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::find<unsigned long long>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::piecewise_construct_t const&,std::tuple<VMUFieldInfo * const {__strong}&>,std::tuple<>>(uint64_t a1, id *a2, uint64_t a3, id **a4)
{
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  _QWORD *v14;
  unint64_t v15;
  id v16;
  _QWORD *v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;

  v8 = objc_msgSend(*a2, "hash");
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v4 = v8;
      if (v8 >= v10)
        v4 = v8 % v10;
    }
    else
    {
      v4 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v13)
    {
      v14 = *v13;
      if (*v13)
      {
        do
        {
          v15 = v14[1];
          if (v15 == v9)
          {
            v16 = (id)v14[2];
            if (v16 == *a2 || (objc_msgSend(v16, "isEqual:") & 1) != 0)
              return v14;
          }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10)
                v15 %= v10;
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v4)
              break;
          }
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
    }
  }
  v17 = (_QWORD *)(a1 + 16);
  v14 = operator new(0x20uLL);
  *v14 = 0;
  v14[1] = v9;
  v14[2] = **a4;
  *((_DWORD *)v14 + 6) = 0;
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v10 || (float)(v19 * (float)v10) < v18)
  {
    v20 = 1;
    if (v10 >= 3)
      v20 = (v10 & (v10 - 1)) != 0;
    v21 = v20 | (2 * v10);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v23);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v24 = *(_QWORD *)a1;
  v25 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v25)
  {
    *v14 = *v25;
LABEL_39:
    *v25 = v14;
    goto LABEL_40;
  }
  *v14 = *v17;
  *v17 = v14;
  *(_QWORD *)(v24 + 8 * v4) = v17;
  if (*v14)
  {
    v26 = *(_QWORD *)(*v14 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v26 >= v10)
        v26 %= v10;
    }
    else
    {
      v26 &= v10 - 1;
    }
    v25 = (_QWORD *)(*(_QWORD *)a1 + 8 * v26);
    goto LABEL_39;
  }
LABEL_40:
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_1A4E0000C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::find<VMUFieldInfo * {__strong}>(_QWORD *a1, id *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  id v13;

  v4 = objc_msgSend(*a2, "hash");
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(_QWORD **)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = (_QWORD *)*v10;
  if (*v10)
  {
    do
    {
      v12 = v11[1];
      if (v12 == v6)
      {
        v13 = (id)v11[2];
        if (v13 == *a2 || (objc_msgSend(v13, "isEqual:") & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v12 >= *(_QWORD *)&v5)
            v12 %= *(_QWORD *)&v5;
        }
        else
        {
          v12 &= *(_QWORD *)&v5 - 1;
        }
        if (v12 != v9)
          return 0;
      }
      v11 = (_QWORD *)*v11;
    }
    while (v11);
  }
  return v11;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::find<SwiftFieldKey>(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *i;
  unint64_t v12;
  char v14;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v14, a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4 ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(_QWORD *)(a2 + 32) ^ *(int *)(a2 + 40);
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4 ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(_QWORD *)(a2 + 32) ^ *(int *)(a2 + 40);
    if (v6 >= *(_QWORD *)&v5)
      v9 = v6 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v6;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  for (i = *v10; i; i = *(unsigned __int8 **)i)
  {
    v12 = *((_QWORD *)i + 1);
    if (v12 == v6)
    {
      if (SwiftFieldKey::operator==(i + 16, (unsigned __int8 *)a2))
        return i;
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(_QWORD *)&v5)
          v12 %= *(_QWORD *)&v5;
      }
      else
      {
        v12 &= *(_QWORD *)&v5 - 1;
      }
      if (v12 != v9)
        return 0;
    }
  }
  return i;
}

BOOL SwiftFieldKey::operator==(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v8;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  v6 = a2;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)))
      return 0;
  }
  else if (a1[23])
  {
    v8 = a1;
    while (*v8 == *a2)
    {
      ++v8;
      ++a2;
      if (!--v2)
        goto LABEL_16;
    }
    return 0;
  }
LABEL_16:
  if (*((_DWORD *)a1 + 6) == *((_DWORD *)v6 + 6)
    && *((_DWORD *)a1 + 7) == *((_DWORD *)v6 + 7)
    && *((_QWORD *)a1 + 4) == *((_QWORD *)v6 + 4))
  {
    return *((_DWORD *)a1 + 10) == *((_DWORD *)v6 + 10);
  }
  return 0;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__emplace_unique_key_args<SwiftFieldKey,std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v26, a2) ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(_QWORD *)(a2 + 32);
  v9 = *(int *)(a2 + 40);
  v10 = v8 ^ v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v8 ^ v9;
      if (v10 >= v11)
        v4 = v10 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if (SwiftFieldKey::operator==(i + 16, (unsigned __int8 *)a2))
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1A4E00594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

__n128 std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;
  __n128 result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)v10 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  result = *(__n128 *)((char *)v10 + 24);
  *((_DWORD *)v8 + 14) = *((_DWORD *)v10 + 10);
  *(__n128 *)(v8 + 40) = result;
  *((_DWORD *)v8 + 16) = 0;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1A4E00654(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node(a1, *(id **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_impl<std::pair<VMUMutableClassInfo * {__strong},unsigned int>>(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *inserted;
  char v7;

  v4 = operator new(0x20uLL);
  v5 = *a2;
  *a2 = 0;
  v4[1] = v5;
  v4[2] = v5;
  *((_DWORD *)v4 + 6) = *((_DWORD *)a2 + 2);
  *v4 = 0;
  inserted = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique(a1, v4);
  if ((v7 & 1) == 0)
  {

    operator delete(v4);
  }
  return inserted;
}

void sub_1A4E007B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = a2;
  v5 = a2 + 2;
  v4 = a2[2];
  *(v5 - 1) = v4;
  v6 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *i;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  _BOOL8 v12;
  size_t v13;
  unint64_t v14;
  size_t v15;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
      v5 = v3 <= a2 ? a2 % v3 : a2;
    else
      v5 = (v3 - 1) & a2;
    v6 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v5);
    if (v6)
    {
      for (i = (_QWORD *)*v6; i; i = (_QWORD *)*i)
      {
        v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3)
            return i;
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3)
              v8 %= v3;
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5)
            break;
        }
      }
    }
  }
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    v11 = 2 * v3;
    v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    v13 = v12 | v11;
    v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14)
      v15 = v14;
    else
      v15 = v13;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v15);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_perform[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  _QWORD *v5;
  unint64_t v6;

  v2 = (int8x8_t)result[1];
  v3 = a2[1];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v5 = *(_QWORD **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(_QWORD *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v2)
        v6 %= *(_QWORD *)&v2;
    }
    else
    {
      v6 &= *(_QWORD *)&v2 - 1;
    }
    v5 = (_QWORD *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

id descriptionForTypeEncoding(unsigned __int8 *a1, uint64_t a2)
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __descriptionForTypeEncoding_block_invoke;
  v4[3] = &unk_1E4E03878;
  v4[4] = &v5;
  v4[5] = a2;
  _parse_type(a1, 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A4E00B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void _parse_type(unsigned __int8 *a1, int a2, void *a3)
{
  void *v5;
  unsigned __int8 v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  _BYTE *v11;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t i;
  unsigned __int8 *v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  void *v21;
  const __CFString *v22;
  const char *v23;
  uint64_t v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  BOOL v28;
  const char *v29;
  const char *v30;
  int v31;
  void (*v32)(void);
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;

  v35 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a1)
      goto LABEL_128;
  }
  else
  {
    v5 = 0;
    if (!a1)
      goto LABEL_128;
  }
  v6 = *a1;
  if (*a1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 1;
    while (1)
    {
      if (v6 > 0x5Au)
      {
        if (v6 == 91)
        {
          if (!v8 && a2)
          {
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v16 = a1 + 1;
          v17 = a1[1];
          if ((v17 - 48) > 9)
          {
            v18 = 0;
            v19 = a1 + 1;
            if (a2)
              goto LABEL_40;
          }
          else
          {
            v18 = 0;
            v19 = a1 + 1;
            do
            {
              v18 = v17 + 10 * v18 - 48;
              v20 = *++v19;
              v17 = v20;
            }
            while ((v20 - 48) < 0xA);
            if (a2)
LABEL_40:
              objc_msgSend(v8, "appendFormat:", CFSTR("[%.*s]"), v19 - v16, v16);
          }
          a1 = v19 - 1;
          v9 *= v18;
          goto LABEL_71;
        }
        if (v6 != 123)
          goto LABEL_42;
      }
      else if (v6 != 40)
      {
        if (v6 == 64)
        {
          v10 = a1[1];
          if (v10 == 34)
          {
            v24 = 0;
            v25 = a1 + 2;
            v26 = a1[2];
            v27 = v26;
            if (a1[2])
            {
              do
              {
                if (v27 == 34)
                  break;
                v27 = a1[v24++ + 3];
              }
              while (v27);
            }
            a1 += v24 + 2;
            if (a2)
            {
              v28 = v26 == 60;
              v29 = "";
              v30 = "id ";
              if (!v28)
              {
                v30 = "";
                v29 = "*";
              }
              objc_msgSend(v5, "appendFormat:", CFSTR("%s%.*s%s"), v30, v24, v25, v29);
            }
          }
          else if (v10 == 63)
          {
            if (a2)
              objc_msgSend(v5, "appendString:", CFSTR("id?"));
            ++a1;
          }
          else if (a2)
          {
            objc_msgSend(v5, "appendString:", CFSTR("id"));
          }
          goto LABEL_71;
        }
LABEL_42:
        if ((char)v6 > 92)
        {
          switch(v6)
          {
            case ']':
              goto LABEL_71;
            case '^':
              ++v7;
              goto LABEL_71;
            case 'b':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("bitfield:");
              break;
            case 'c':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("char");
              break;
            case 'd':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("double");
              break;
            case 'f':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("float");
              break;
            case 'i':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("int32_t");
              break;
            case 'l':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("long");
              break;
            case 'q':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("int64_t");
              break;
            case 'r':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("const ");
              break;
            case 's':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("short");
              break;
            case 'v':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("void");
              break;
            default:
              goto LABEL_105;
          }
        }
        else if ((char)v6 <= 57)
        {
          switch(v6)
          {
            case '#':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("Class");
              break;
            case '%':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("atomic ");
              break;
            case '*':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("char*");
              break;
            default:
LABEL_105:
              if (a2)
                objc_msgSend(v5, "appendFormat:", CFSTR("%c"), (char)v6);
              goto LABEL_71;
          }
        }
        else
        {
          switch(v6)
          {
            case '?':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("?");
              break;
            case '@':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("id");
              break;
            case 'A':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("_Atomic ");
              break;
            case 'B':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("BOOL");
              break;
            case 'C':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("unsigned char");
              break;
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'J':
            case 'K':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'R':
              goto LABEL_105;
            case 'I':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("uint32_t");
              break;
            case 'L':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("ulong");
              break;
            case 'Q':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("uint64_t");
              break;
            case 'S':
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("ushort");
              break;
            default:
              if (v6 != 58)
                goto LABEL_105;
              if (!a2)
                goto LABEL_71;
              v21 = v5;
              v22 = CFSTR("SEL");
              break;
          }
        }
        objc_msgSend(v21, "appendString:", v22);
        goto LABEL_71;
      }
      v11 = a1 + 1;
      v12 = 1;
      ++a1;
      while (1)
      {
        v13 = *a1;
        v14 = 1;
        if (v13 > 0x7A)
          break;
        if (v13 == 40)
          goto LABEL_26;
        if (v13 == 41)
          goto LABEL_25;
        if (!*a1)
          goto LABEL_28;
LABEL_27:
        ++a1;
      }
      if (v13 != 123)
      {
        if (v13 != 125)
          goto LABEL_27;
LABEL_25:
        v14 = -1;
      }
LABEL_26:
      v12 += v14;
      if (v12)
        goto LABEL_27;
LABEL_28:
      for (i = 0; ; ++i)
      {
        if (!v11[i])
          goto LABEL_124;
        if (v11[i] == 61)
          break;
        if (&v11[i] >= a1)
        {
          if (*a1 && v11[i])
            goto LABEL_51;
LABEL_124:
          v32 = (void (*)(void))v35[2];
          goto LABEL_127;
        }
      }
      if (!*a1)
        goto LABEL_124;
LABEL_51:
      if (a2)
      {
        v23 = "struct";
        if (v6 == 40)
          v23 = "union";
        if (*v11 == 63)
          objc_msgSend(v5, "appendFormat:", CFSTR("<unnamed %s>"), v23, v33, v34);
        else
          objc_msgSend(v5, "appendFormat:", CFSTR("%s %.*s"), v23, i, v11);
      }
LABEL_71:
      v31 = *++a1;
      v6 = v31;
      if (!v31)
      {
        for (; v7; --v7)
        {
          if (a2)
            objc_msgSend(v5, "appendString:", CFSTR("*"));
        }
        goto LABEL_126;
      }
    }
  }
  v8 = 0;
LABEL_126:
  v32 = (void (*)(void))v35[2];
LABEL_127:
  v32();

LABEL_128:
}

void __descriptionForTypeEncoding_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  __CFString *v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a5;
  if (a6)
  {
    NSLog(CFSTR("error: '%@' for ivar: %s"), a6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = &stru_1E4E04720;
    if (v9)
      v11 = v9;
    v12 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ %s%@"), v15, *(_QWORD *)(a1 + 40), v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

uint64_t typeEncodingDescribesReferencedAllocation(uint64_t result)
{
  int v1;
  unsigned int v2;
  BOOL v3;
  unint64_t v4;

  if (result)
  {
    v1 = *(unsigned __int8 *)result;
    if (!*(_BYTE *)result)
      return 0;
    if ((v1 == 114 || v1 == 65) && (v1 = *(unsigned __int8 *)(result + 1), !*(_BYTE *)(result + 1)))
    {
      return 0;
    }
    else
    {
      v2 = v1 - 64;
      v3 = v2 > 0x31;
      v4 = (0x1EFFFFFFFFFFEuLL >> v2) & 1;
      if (v3)
        return 1;
      else
        return v4;
    }
  }
  return result;
}

id descriptionForTypeOfReferencedAllocation(char *a1, _DWORD *a2)
{
  char *v2;
  int v3;
  int v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  void *v10;
  void *v12;
  char *v13;
  int v14;
  void *v15;
  unsigned int v16;
  __CFString *v17;
  int v18;
  int v19;
  char *v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  id v28;
  __CFString *v29;
  int v30;
  __CFString *v31;
  uint64_t v32;
  id v33;
  id v34;

  if (a1)
  {
    v2 = a1;
    v3 = *a1;
    if (*a1)
    {
      if (v3 != 114 && (v5 = *a1, v3 != 65) || (v5 = a1[1], a1[1]))
      {
        v6 = v5 - 64;
        v7 = v6 > 0x31;
        v8 = (1 << v6) & 0x2100000000001;
        if (v7 || v8 == 0)
        {
          if (v3 == 114 || v3 == 65)
            v2 = a1 + 1;
          v12 = (void *)objc_opt_new();
          *a2 = 16;
          if (*v2 == 94)
          {
            do
            {
              v13 = v2;
              v14 = *++v2;
              if (v14 != 94)
                break;
              objc_msgSend(v12, "appendString:", CFSTR("[]"));
              v13 = v2;
            }
            while (*v2 == 94);
          }
          else
          {
            v13 = v2;
          }
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v13, strlen(v13), 4, 0);
          v16 = *v13;
          if (v16 <= 0x50)
          {
            if (*v13 <= 0x29u)
            {
              if (v16 != 35)
              {
                if (v16 != 40)
                  goto LABEL_81;
LABEL_28:
                objc_msgSend(v12, "setString:", &stru_1E4E04720);
LABEL_29:
                v17 = CFSTR("malloc");
                goto LABEL_82;
              }
              v17 = CFSTR("Class");
LABEL_82:
              -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", v12);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              return v10;
            }
            if (v16 == 42)
            {
LABEL_65:
              v17 = CFSTR("char[]");
              goto LABEL_82;
            }
            if (v16 == 58)
            {
              v17 = CFSTR("SEL");
              goto LABEL_82;
            }
            goto LABEL_81;
          }
          if (*v13 <= 0x5Du)
          {
            if (v16 != 81 && v16 != 91)
              goto LABEL_81;
            goto LABEL_28;
          }
          if (v16 == 123)
          {
            if (!strncmp(v13, "{vector<", 8uLL)
              || !strncmp(v13, "{shared_ptr<", 0xCuLL)
              || !strncmp(v13, "{unique_ptr<", 0xCuLL))
            {
              v21 = strchr(v13, 44);
              if (v21 || (v21 = strchr(v13, 62)) != 0)
              {
                objc_msgSend(v15, "substringWithRange:", 1, &v21[~(unint64_t)v13]);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringByAppendingString:", CFSTR(">"));
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                objc_msgSend(v15, "substringWithRange:", 1, &strchr(v13, 60)[~(unint64_t)v13]);
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              *a2 = 2;
              goto LABEL_82;
            }
            if (!strncmp(v13, "{unordered_map<", 0x10uLL))
            {
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v15);
              objc_msgSend(v25, "setScanLocation:", 1);
              v34 = 0;
              v26 = objc_msgSend(v25, "scanUpToString:intoString:", CFSTR(","), &v34);
              v27 = v34;
              v28 = 0;
              v29 = 0;
              if (v26)
              {
                objc_msgSend(v25, "setScanLocation:", objc_msgSend(v25, "scanLocation") + 1);
                v33 = 0;
                v30 = objc_msgSend(v25, "scanUpToString:intoString:", CFSTR(","), &v33);
                v28 = v33;
                if (v30)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@>"), v27, v28);
                  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v29 = 0;
                }
              }
              v31 = CFSTR("unordered_map");
              if (v29)
                v31 = v29;
              v17 = v31;
              *a2 = 2;

              goto LABEL_82;
            }
          }
          else
          {
            if (v16 != 94)
              goto LABEL_81;
            v18 = v13[1];
            if (!v13[1])
              goto LABEL_81;
            v19 = v13[2];
            if (!v13[2])
            {
              if (v18 > 80)
              {
                switch(v13[1])
                {
                  case 'c':
                    goto LABEL_65;
                  case 'd':
                    v17 = CFSTR("double[]");
                    goto LABEL_82;
                  case 'e':
                  case 'g':
                  case 'h':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                  case 'r':
                  case 't':
                  case 'u':
                    goto LABEL_81;
                  case 'f':
                    v17 = CFSTR("float[]");
                    goto LABEL_82;
                  case 'i':
                    v17 = CFSTR("int32_t[]");
                    goto LABEL_82;
                  case 'l':
                    v17 = CFSTR("long[]");
                    goto LABEL_82;
                  case 'q':
                    v17 = CFSTR("int64_t[]");
                    goto LABEL_82;
                  case 's':
                    v17 = CFSTR("short[]");
                    goto LABEL_82;
                  case 'v':
                    goto LABEL_29;
                  default:
                    if (v18 == 81)
                    {
                      v17 = CFSTR("uint64_t[]");
                    }
                    else
                    {
                      if (v18 != 83)
                        goto LABEL_81;
                      v17 = CFSTR("ushort[]");
                    }
                    break;
                }
                goto LABEL_82;
              }
              if (v18 > 57)
              {
                v17 = CFSTR("id[]");
                switch(v18)
                {
                  case ':':
                    v17 = CFSTR("SEL[]");
                    goto LABEL_82;
                  case ';':
                  case '<':
                  case '=':
                  case '>':
                  case '?':
                  case 'A':
                    goto LABEL_81;
                  case '@':
                    goto LABEL_82;
                  case 'B':
                    v17 = CFSTR("BOOL[]");
                    goto LABEL_82;
                  case 'C':
                    v17 = CFSTR("uchar[]");
                    goto LABEL_82;
                  default:
                    if (v18 == 73)
                    {
                      v17 = CFSTR("uint32_t[]");
                    }
                    else
                    {
                      if (v18 != 76)
                        goto LABEL_81;
                      v17 = CFSTR("ulong[]");
                    }
                    break;
                }
                goto LABEL_82;
              }
              if (v18 == 35)
              {
                v17 = CFSTR("Class[]");
                goto LABEL_82;
              }
              if (v18 != 42)
                goto LABEL_81;
              v17 = CFSTR("char*[]");
              goto LABEL_82;
            }
            if (v18 == 64)
            {
              if (v19 == 34)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13 + 3);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v23, "hasSuffix:", CFSTR("\"")))
                {
                  objc_msgSend(v23, "substringToIndex:", objc_msgSend(v23, "length") - 1);
                  v24 = objc_claimAutoreleasedReturnValue();

                  v23 = (void *)v24;
                }
                if (objc_msgSend(v23, "length"))
                {
                  objc_msgSend(v23, "stringByAppendingString:", CFSTR("*[]"));
                  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v17 = 0;
                }

                goto LABEL_82;
              }
              goto LABEL_81;
            }
            if (v13[1] != 123)
            {
LABEL_81:
              v17 = 0;
              goto LABEL_82;
            }
            if (v19 != 63)
            {
              v20 = strchr(v13, 61);
              if (v20 || (v20 = strchr(v13, 125)) != 0)
              {
                objc_msgSend(v15, "substringWithRange:", 2, v20 - v13 - 2);
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (-[__CFString length](v17, "length"))
                {
                  if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("__CFString")))
                  {

                    v17 = CFSTR("CFString");
                    goto LABEL_82;
                  }
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("struct %@"), v17);
                  v32 = objc_claimAutoreleasedReturnValue();

                  v17 = (__CFString *)v32;
                }
                if (v17)
                  goto LABEL_82;
              }
            }
          }
          objc_msgSend(v12, "setString:", &stru_1E4E04720);
          v17 = CFSTR("struct");
          goto LABEL_82;
        }
      }
    }
  }
  v10 = 0;
  return v10;
}

id descriptionOfValueAtAddressWithTypeEncoding(uint64_t a1, unsigned __int8 *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (a1 && a2)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__8;
    v21 = __Block_byref_object_dispose__8;
    v22 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __descriptionOfValueAtAddressWithTypeEncoding_block_invoke;
    v11[3] = &unk_1E4E038A0;
    v13 = &v17;
    v14 = a1;
    v12 = v7;
    v15 = a2;
    v16 = a3;
    _parse_type(a2, 0, v11);
    v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

void sub_1A4E019F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __descriptionOfValueAtAddressWithTypeEncoding_block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  int v47;
  unint64_t v48;
  char *v49;
  int v50;
  _BYTE *v51;
  char *v52;
  char *v53;
  char *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  __CFString *v58;
  char *v59;
  void *v60;
  double v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  mach_vm_address_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  int v84;
  __int16 v85;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
    goto LABEL_96;
  if (a2 <= 82)
  {
    if (a2 > 57)
    {
      switch(a2)
      {
        case '?':
        case '@':
          goto LABEL_15;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'J':
        case 'K':
          goto LABEL_35;
        case 'B':
          if (**(_BYTE **)(a1 + 48))
            v13 = "YES";
          else
            v13 = "NO";
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v13, v80, v81, v82);
          goto LABEL_93;
        case 'C':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u %c"), **(unsigned __int8 **)(a1 + 48), **(unsigned __int8 **)(a1 + 48), v81, v82);
          goto LABEL_93;
        case 'I':
          v64 = (void *)MEMORY[0x1E0CB3940];
          v65 = **(unsigned int **)(a1 + 48);
          goto LABEL_88;
        case 'L':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), **(_QWORD **)(a1 + 48), v80, v81, v82);
          goto LABEL_93;
        default:
          if (a2 == 58)
          {
            v66 = task_peek_string(objc_msgSend(*(id *)(a1 + 32), "task"), **(_QWORD **)(a1 + 48));
            if (!v66)
              goto LABEL_96;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@selector(%s)"), v66, v80, v81, v82);
          }
          else
          {
            if (a2 != 81)
              goto LABEL_35;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), **(_QWORD **)(a1 + 48), v80, v81, v82);
          }
          break;
      }
      goto LABEL_93;
    }
    if (a2 != 35)
    {
      if (a2 == 40)
      {
        printf("    UNION TYPE ENCODING: %s\n", *(const char **)(a1 + 56));
      }
      else if (a2 == 42)
      {
LABEL_15:
        v14 = **(_QWORD **)(a1 + 48);
        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "taggedPointerMask");

          if ((v16 & v14) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "labelForTaggedPointer:", v14);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v20 = *(void **)(v19 + 40);
            *(_QWORD *)(v19 + 40) = v18;

            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tagged pointer %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v23 = *(void **)(v22 + 40);
              *(_QWORD *)(v22 + 40) = v21;

            }
          }
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
          {
            objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "classInfoForObjectWithRange:", v14, 1024);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "className");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = (void *)MEMORY[0x1E0CB3940];
            if (v26)
            {
              objc_msgSend(v25, "className");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@ %p>"), v28, v14);
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v31 = *(void **)(v30 + 40);
              *(_QWORD *)(v30 + 40) = v29;

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v14);
              v68 = objc_claimAutoreleasedReturnValue();
              v69 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v28 = *(void **)(v69 + 40);
              *(_QWORD *)(v69 + 40) = v68;
            }

            objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "labelForMallocBlock:", v14, 1024);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v71);
              v72 = objc_claimAutoreleasedReturnValue();
              v73 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v74 = *(void **)(v73 + 40);
              *(_QWORD *)(v73 + 40) = v72;

            }
          }
          goto LABEL_96;
        }
        goto LABEL_31;
      }
LABEL_35:
      v45 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v39 = *(void **)(v45 + 40);
      *(_QWORD *)(v45 + 40) = 0;
      goto LABEL_95;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString classInfoForMemory:length:](v40, "classInfoForMemory:length:", *(_QWORD *)(a1 + 48), 1024);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString className](v41, "className");
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_33:
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = v42;

    goto LABEL_96;
  }
  if (a2 > 98)
  {
    switch(a2)
    {
      case 'c':
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d %c"), **(char **)(a1 + 48), **(char **)(a1 + 48), v81, v82);
        goto LABEL_93;
      case 'd':
        v60 = (void *)MEMORY[0x1E0CB3940];
        v61 = **(double **)(a1 + 48);
        goto LABEL_79;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_35;
      case 'f':
        v60 = (void *)MEMORY[0x1E0CB3940];
        v61 = **(float **)(a1 + 48);
LABEL_79:
        objc_msgSend(v60, "stringWithFormat:", CFSTR("%g"), *(_QWORD *)&v61, v80, v81, v82);
        goto LABEL_93;
      case 'i':
        v62 = (void *)MEMORY[0x1E0CB3940];
        v63 = **(unsigned int **)(a1 + 48);
        goto LABEL_84;
      case 'l':
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), **(_QWORD **)(a1 + 48), v80, v81, v82);
        goto LABEL_93;
      case 'q':
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), **(_QWORD **)(a1 + 48), v80, v81, v82);
        goto LABEL_93;
      case 's':
        v62 = (void *)MEMORY[0x1E0CB3940];
        v63 = **(__int16 **)(a1 + 48);
LABEL_84:
        objc_msgSend(v62, "stringWithFormat:", CFSTR("%d"), v63, v80, v81, v82);
        goto LABEL_93;
      default:
        if (a2 != 123)
          goto LABEL_35;
        v46 = *(const char **)(a1 + 56);
        if (!strncmp(v46, "{CGRect=", 8uLL))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x:%g y:%g w:%g h:%g"), **(_QWORD **)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));
          goto LABEL_93;
        }
        v47 = strncmp(v46, "{_NSRange=", 0xAuLL);
        v48 = *(_QWORD *)(a1 + 48);
        if (!v47)
        {
          if (*(_QWORD *)v48 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v40 = CFSTR("NSNotFound");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)v48);
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (*(_QWORD *)(v48 + 8) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v41 = CFSTR("NSNotFound");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(v48 + 8));
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ location:%@  length:%@ }"), v40, v41);
          v42 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }
        v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
        v49 = strchr(*(char **)(a1 + 56), 61);
        if (!v49)
          goto LABEL_112;
        v51 = v49 + 1;
        v50 = v49[1];
        break;
    }
    while (1)
    {
      if (v50 != 34)
        goto LABEL_109;
      v52 = v51 + 1;
      v53 = strchr(v52, 34);
      if (!v53 || (v54 = v53, v55 = v53[1], !memchr("LiIcCqQsSfdB@*?#:^", v55, 0x13uLL)))
      {
        v50 = *v52;
LABEL_109:
        if (v50 == 125)
        {
          objc_msgSend(v83, "appendString:", CFSTR("}"));
          v75 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v76 = v83;
          v77 = *(void **)(v75 + 40);
          *(_QWORD *)(v75 + 40) = v76;
        }
        else
        {
LABEL_112:
          v78 = *(const char **)(a1 + 56);
          if (strncmp(v78, "{RefCounts<swift::", 0x12uLL))
            printf("    FAILED STRUCTURE TYPE ENCODING: %s\n", v78);
          v79 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v77 = *(void **)(v79 + 40);
          *(_QWORD *)(v79 + 40) = 0;
        }

        goto LABEL_96;
      }
      v56 = 0;
      v84 = v55;
      if (v55 > 82)
        break;
      if (v55 <= 65)
      {
        if (v55 > 57)
        {
          if (v55 != 58 && v55 != 64)
            goto LABEL_70;
        }
        else if (v55 != 35 && v55 != 42)
        {
          goto LABEL_70;
        }
      }
      else
      {
        if (v55 <= 75)
        {
          if ((v55 - 66) < 2)
          {
LABEL_56:
            v56 = 1;
          }
          else if (v55 == 73)
          {
LABEL_51:
            v56 = 4;
          }
LABEL_70:
          v85 = v84;
          descriptionOfValueAtAddressWithTypeEncoding(v48, &v85, *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 32));
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          goto LABEL_71;
        }
        if (v55 != 76 && v55 != 81)
          goto LABEL_70;
      }
LABEL_65:
      if (!HIDWORD(v48))
      {
        v57 = 8;
        v58 = &stru_1E4E04720;
        goto LABEL_71;
      }
      v56 = 8;
      v57 = 8;
      v58 = &stru_1E4E04720;
      if ((v48 & 7) == 0)
        goto LABEL_70;
LABEL_71:
      objc_msgSend(v83, "appendFormat:", CFSTR(" %.*s:%@ "), v54 - v52, v52, v58);
      v51 = v54 + 2;
      if (v84 == 94)
      {
        if (*v51 == 123)
        {
          v59 = strchr(v54 + 2, 125);
          if (!v59)
          {

            goto LABEL_112;
          }
          v51 = v59 + 1;
        }
        else
        {
          v51 = v54 + 3;
        }
      }
      v48 += v57;

      v50 = *v51;
    }
    switch(v55)
    {
      case 'c':
        goto LABEL_56;
      case 'd':
      case 'l':
      case 'q':
        goto LABEL_65;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_70;
      case 'f':
      case 'i':
        goto LABEL_51;
      case 's':
        goto LABEL_69;
      default:
        if (v55 == 83)
        {
LABEL_69:
          v56 = 2;
        }
        else if (v55 == 94)
        {
          goto LABEL_65;
        }
        break;
    }
    goto LABEL_70;
  }
  if (a2 == 83)
  {
    v64 = (void *)MEMORY[0x1E0CB3940];
    v65 = **(unsigned __int16 **)(a1 + 48);
LABEL_88:
    objc_msgSend(v64, "stringWithFormat:", CFSTR("%u"), v65, v80, v81, v82);
LABEL_93:
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_94;
  }
  if (a2 != 94)
    goto LABEL_35;
  v32 = **(_QWORD **)(a1 + 48);
  if (!v32)
  {
LABEL_31:
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v39 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = CFSTR("0x0");
LABEL_95:

    goto LABEL_96;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "symbolForAddress:", v32);

  if ((CSIsNull() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p %s"), v32, CSSymbolGetName());
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    CSSymbolGetSymbolOwner();
    if ((CSIsNull() & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR(" (in %s)"), CSSymbolOwnerGetName());
      v37 = objc_claimAutoreleasedReturnValue();
LABEL_94:
      v67 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v39 = *(void **)(v67 + 40);
      *(_QWORD *)(v67 + 40) = v37;
      goto LABEL_95;
    }
  }
LABEL_96:

}

uint64_t pointerScanSizeForTypeEncoding(unsigned __int8 *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  _QWORD v9[6];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a2;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = a2;
    if ((a2 & 0x80000000) != 0
      || ((v5 = 0, a2 < 8) ? (v6 = a3) : (v6 = 0), a2 >= 4 && (v6 & 1) == 0))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __pointerScanSizeForTypeEncoding_block_invoke;
      v9[3] = &unk_1E4E038C8;
      v9[4] = &v11;
      v9[5] = a4;
      v10 = a3;
      _parse_type(a1, 0, v9);
      v7 = *((_DWORD *)v12 + 6);
      if (v7 >= (int)v4)
        v5 = v4;
      else
        v5 = v7;
    }
    _Block_object_dispose(&v11, 8);
    return v5;
  }
  return v4;
}

void sub_1A4E02480(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __pointerScanSizeForTypeEncoding_block_invoke(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;
  int v7;
  int v8;
  char v9;

  if (a6)
    return result;
  v6 = *(_BYTE **)(result + 40);
  if (v6)
    *v6 = a2;
  v7 = 0;
  if (a2 <= 80)
  {
    if (a2 <= 65)
    {
      if (a2 > 57)
      {
        if (a2 != 58 && a2 != 64)
          return result;
      }
      else if (a2 != 35 && a2 != 42)
      {
        return result;
      }
      goto LABEL_22;
    }
    if ((a2 - 66) >= 2)
    {
      if (a2 != 73)
      {
        if (a2 != 76)
          return result;
LABEL_22:
        if (*(_BYTE *)(result + 48))
          v9 = 3;
        else
          v9 = 2;
        v7 = a3 << v9;
        goto LABEL_35;
      }
LABEL_26:
      if (*(_BYTE *)(result + 48))
        v7 = 0;
      else
        v7 = 4 * a3;
    }
LABEL_35:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v7;
    return result;
  }
  switch(a2)
  {
    case '^':
    case 'l':
      goto LABEL_22;
    case '_':
    case 'a':
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      return result;
    case 'b':
    case 'd':
    case 'f':
    case 's':
      goto LABEL_35;
    case 'c':
      if (*(_BYTE *)(result + 48))
        v8 = -8;
      else
        v8 = -4;
      v7 = v8 & a3;
      goto LABEL_35;
    case 'i':
      goto LABEL_26;
    case 'q':
      goto LABEL_32;
    default:
      if (a2 == 81)
      {
LABEL_32:
        if (*(_BYTE *)(result + 48))
          v7 = 8 * a3;
        else
          v7 = 0;
        goto LABEL_35;
      }
      if (a2 == 83)
        goto LABEL_35;
      break;
  }
  return result;
}

uint64_t getStructureLayoutDescription(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t (**v4)(id, uint64_t, _QWORD);
  uint64_t v5;
  uint64_t Range;
  uint64_t v7;

  v4 = a4;
  CSSymbolOwnerGetSymbolWithName();
  if ((CSIsNull() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    Range = CSSymbolGetRange();
    v5 = v4[2](v4, Range, v7);
  }

  return v5;
}

const char *VMUVMRegionShareModeName(int a1)
{
  if ((a1 - 1) > 6)
    return "   ";
  else
    return off_1E4E03928[(char)(a1 - 1)];
}

uint64_t VMUPurgeableDisplayCharacter(unsigned int a1)
{
  unsigned int v1;

  v1 = 0x5845564Eu >> (8 * a1);
  if (a1 >= 4)
    LOBYTE(v1) = 63;
  return v1 & 0x7F;
}

uint64_t VMUSortIndexForLibraryPath(void *a1)
{
  id v1;
  void *v2;
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)MEMORY[0x1A85A9758]();
    v3 = objc_retainAutorelease(v1);
    v4 = (char *)objc_msgSend(v3, "UTF8String");
    if ((_isApplicationUI__tried & 1) == 0)
    {
      if (!regcomp(&_isApplicationUI__localPreg, "/(AppKit|UIKit(Core))\\.framework|/libswiftAppKit.dylib", 5))
        _isApplicationUI__createdSuccessfully = 1;
      _isApplicationUI__tried = 1;
    }
    if (_isApplicationUI__createdSuccessfully == 1 && !regexec(&_isApplicationUI__localPreg, v4, 0, 0, 0))
    {
      v5 = 1;
    }
    else
    {
      if ((_isFoundation__tried & 1) == 0)
      {
        if (!regcomp(&_isFoundation__localPreg, "/Foundation.framework|/libswiftFoundation.dylib", 5))
          _isFoundation__createdSuccessfully = 1;
        _isFoundation__tried = 1;
      }
      if (_isFoundation__createdSuccessfully == 1 && !regexec(&_isFoundation__localPreg, v4, 0, 0, 0))
      {
        v5 = 2;
      }
      else
      {
        if ((_isCoreFoundation__tried & 1) == 0)
        {
          if (!regcomp(&_isCoreFoundation__localPreg, "/CoreFoundation.framework", 5))
            _isCoreFoundation__createdSuccessfully = 1;
          _isCoreFoundation__tried = 1;
        }
        if (_isCoreFoundation__createdSuccessfully == 1 && !regexec(&_isCoreFoundation__localPreg, v4, 0, 0, 0))
        {
          v5 = 3;
        }
        else
        {
          if ((_isDatabase__tried & 1) == 0)
          {
            if (!regcomp(&_isDatabase__localPreg, "/CoreData\\.framework/|/libsql[^/]*\\.dylib|/libswiftCoreData.dylib", 5))_isDatabase__createdSuccessfully = 1;
            _isDatabase__tried = 1;
          }
          if (_isDatabase__createdSuccessfully == 1 && !regexec(&_isDatabase__localPreg, v4, 0, 0, 0))
          {
            v5 = 4;
          }
          else if (_isWeb(v4))
          {
            v5 = 5;
          }
          else if (_isNetworkIO(v4))
          {
            v5 = 6;
          }
          else if (_isGraphics(v4))
          {
            v5 = 7;
          }
          else if (_isAudio(v4))
          {
            v5 = 8;
          }
          else if (_isSecurity(v4))
          {
            v5 = 9;
          }
          else if (_isLanguage(v4))
          {
            v5 = 10;
          }
          else if (_isSystem(v4))
          {
            v5 = 11;
          }
          else if (_isFramework(v4))
          {
            v5 = 12;
          }
          else
          {
            v15 = 0u;
            v16 = 0u;
            v13 = 0u;
            v14 = 0u;
            v6 = objc_msgSend(&unk_1E4E20778, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            if (v6)
            {
              v7 = v6;
              v8 = *(_QWORD *)v14;
              v9 = 12;
              while (2)
              {
                v10 = 0;
                v11 = v9;
                v9 += v7;
                do
                {
                  if (*(_QWORD *)v14 != v8)
                    objc_enumerationMutation(&unk_1E4E20778);
                  if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10)) & 1) != 0)
                  {
                    v5 = (v11 + v10 + 1);
                    goto LABEL_57;
                  }
                  ++v10;
                }
                while (v7 != v10);
                v7 = objc_msgSend(&unk_1E4E20778, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
                if (v7)
                  continue;
                break;
              }
            }
            v5 = 0;
          }
        }
      }
    }
LABEL_57:
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL _isWeb(char *a1)
{
  if ((_isWeb__tried & 1) == 0)
  {
    if (!regcomp(&_isWeb__localPreg, "/(Web(Kit|Core)|JavaScriptCore)\\.framework/", 5))
      _isWeb__createdSuccessfully = 1;
    _isWeb__tried = 1;
  }
  return _isWeb__createdSuccessfully == 1 && regexec(&_isWeb__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isNetworkIO(char *a1)
{
  if ((_isNetworkIO__tried & 1) == 0)
  {
    if (!regcomp(&_isNetworkIO__localPreg, "/(CFNetwork|IO)\\.framework/", 5))
      _isNetworkIO__createdSuccessfully = 1;
    _isNetworkIO__tried = 1;
  }
  return _isNetworkIO__createdSuccessfully == 1 && regexec(&_isNetworkIO__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isGraphics(char *a1)
{
  if ((_isGraphics__tried & 1) == 0)
  {
    if (!regcomp(&_isGraphics__localPreg, "/(Core(Text|UI|Graphics|Video|Image|Media(IOServices)?|PDF)|ATS|ColorSync|ImageIO|Metal(Kit)?|OpenGL|Quartz(Core)?|QTKit|VideoToolbox|OpenCL|QD|IOSurface)\\.framework|/libswiftCore(Graphics|Image).dylib", 5))_isGraphics__createdSuccessfully = 1;
    _isGraphics__tried = 1;
  }
  return _isGraphics__createdSuccessfully == 1 && regexec(&_isGraphics__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isAudio(char *a1)
{
  if ((_isAudio__tried & 1) == 0)
  {
    if (!regcomp(&_isAudio__localPreg, "/(Speech[^/]*\\.framework|[^/]*(A|a)udio[^/]*\\.(framework|component|bundle|kext)|AppleHDA.kext)/", 5))_isAudio__createdSuccessfully = 1;
    _isAudio__tried = 1;
  }
  return _isAudio__createdSuccessfully == 1 && regexec(&_isAudio__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isSecurity(char *a1)
{
  if ((_isSecurity__tried & 1) == 0)
  {
    if (!regcomp(&_isSecurity__localPreg, "/(Security(Foundation|Interface|HI)?|Kerberos(Helper)?|TrustEvaluationAgent)\\.framework/|/lib(crypto|ssl|sasl2)[^/]*\\.dylib|/sasl2/", 5))_isSecurity__createdSuccessfully = 1;
    _isSecurity__tried = 1;
  }
  return _isSecurity__createdSuccessfully == 1 && regexec(&_isSecurity__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isLanguage(char *a1)
{
  if ((_isLanguage__tried & 1) == 0)
  {
    if (!regcomp(&_isLanguage__localPreg, "/(JavaVM|Ruby|Python|Tcl|Tk)\\.framework/|/ruby/|/lib(tcl|tk|python|perl|swiftCore|swiftObjectiveC|c\\+\\+abi)[^/]*\\.dylib", 5))_isLanguage__createdSuccessfully = 1;
    _isLanguage__tried = 1;
  }
  return _isLanguage__createdSuccessfully == 1 && regexec(&_isLanguage__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isSystem(char *a1)
{
  if ((_isSystem__tried & 1) == 0)
  {
    if (!regcomp(&_isSystem__localPreg, "/usr/lib/((lib[^/]*\\.dylib)|dyld|system)|/libswift(Darwin|Dispatch).dylib", 5))_isSystem__createdSuccessfully = 1;
    _isSystem__tried = 1;
  }
  return _isSystem__createdSuccessfully == 1 && regexec(&_isSystem__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isFramework(char *a1)
{
  if ((_isFramework__tried & 1) == 0)
  {
    if (!regcomp(&_isFramework__localPreg, "/System/Library/(Private)?Frameworks/[^/]*\\.framework/", 5))
      _isFramework__createdSuccessfully = 1;
    _isFramework__tried = 1;
  }
  return _isFramework__createdSuccessfully == 1 && regexec(&_isFramework__localPreg, a1, 0, 0, 0) == 0;
}

void sub_1A4E06770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __destructor_8_s8_s16_s24_sb48((id *)va);
  _Unwind_Resume(a1);
}

id visit(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if (*(_BYTE *)a1)
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v4 = 0;
  for (i = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4 * a2);
        (_DWORD)i != -1;
        i = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 4 * i))
  {
    visit(a1, i);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v11 = 0;
      goto LABEL_19;
    }
    v7 = (void *)v6;
    if (v4)
      objc_msgSend(v4, "addObject:", v6);

  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  (*(void (**)(uint64_t *__return_ptr, _QWORD, char *, uint64_t))(a1 + 56))(&v14, *(_QWORD *)(a1 + 16), sel_nodeDetails_, a2);
  if (v15 >> 60 == 5 || v15 >> 60 == 2)
  {
    v9 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 24), "nonSubmapRegionContainingAddress:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(_QWORD, char *, uint64_t))(a1 + 64))(*(_QWORD *)(a1 + 16), sel_stackIDForNode_, a2);
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v11;
}

void __destructor_8_s8_s16_s24_sb48(id *a1)
{

}

void sub_1A4E06F04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E077A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E09A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 176), 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E0A234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 192), 8);
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Unwind_Resume(a1);
}

id VMUDirectedGraphErrorWithExtraUserInfo(unsigned int a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v11 = a2;
  v12 = a3;
  if (v12)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v12, &a9);
  else
    v13 = 0;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D50]);
  if (v11)
    objc_msgSend(v14, "addEntriesFromDictionary:", v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VMUDirectedGraphDomain"), a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_1A4E0B094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t nsfilehandle_write(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = (void *)MEMORY[0x1E0C99D50];
  v8 = a1;
  objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "writeData:error:", v9, a4);

  return v10;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1A4E0D384(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 1141, a4);
}

const char *VMUGraphNodeTypeDescription(unsigned int a1)
{
  if (a1 > 5)
    return "";
  else
    return off_1E4E04028[a1];
}

BOOL VMUGraphNodeType_IsVMRegion(int a1)
{
  return a1 == 2 || a1 == 5;
}

BOOL VMUGraphNodeType_IsRoot(int a1)
{
  return (a1 - 2) < 3;
}

uint64_t VMUGraphNodeType_IsAddressValid(unsigned int a1)
{
  return (a1 > 4) | (6u >> a1) & 1;
}

void sub_1A4E1089C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E11268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E128E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E12AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E13984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t *sortNodesInMap(unint64_t *result, void *__base, size_t __nel)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  _QWORD __compar[7];

  if (__nel >= 2)
  {
    __compar[5] = v3;
    __compar[6] = v4;
    v5 = result[2];
    if (v5 < *result)
      goto LABEL_7;
    v6 = result + 4;
    v7 = 2;
    do
    {
      v8 = v7;
      if (__nel == v7)
        break;
      v9 = *v6;
      v6 += 2;
      ++v7;
      v10 = v9 >= v5;
      v5 = v9;
    }
    while (v10);
    if (v8 < __nel)
    {
LABEL_7:
      __compar[0] = MEMORY[0x1E0C809B0];
      __compar[1] = 3221225472;
      __compar[2] = __sortNodesInMap_block_invoke;
      __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
      __compar[4] = result;
      return (unint64_t *)mergesort_b(__base, __nel, 4uLL, __compar);
    }
  }
  return result;
}

void sub_1A4E13DFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id _subgraphWithPaths(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7;
  void *v8;
  int v9;
  _DWORD *v10;
  size_t v11;
  void *v12;
  size_t v13;
  void *v14;
  id v15;
  int v16;
  unint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  BOOL (*v24)(uint64_t, uint64_t, int, unsigned int, _BYTE *);
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _DWORD *v30;
  char v31;
  int __pattern4;

  v7 = a1;
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = objc_msgSend(v7, "edgeNamespaceSize");
  v10 = malloc_type_calloc(1uLL, ((v9 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v10 = v9;
  v11 = 4 * objc_msgSend(v7, "nodeNamespaceSize");
  v12 = malloc_type_malloc(v11, 0x100004052888210uLL);
  __pattern4 = -1;
  memset_pattern4(v12, &__pattern4, v11);
  v13 = 4 * objc_msgSend(v7, "nodeNamespaceSize");
  v14 = malloc_type_malloc(v13, 0x100004052888210uLL);
  __pattern4 = -1;
  memset_pattern4(v14, &__pattern4, v13);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = ___subgraphWithPaths_block_invoke_2;
  v25 = &unk_1E4E04008;
  v15 = v7;
  v26 = v15;
  v27 = v12;
  v28 = v14;
  v29 = a3;
  v30 = v10;
  v31 = a4;
  objc_msgSend(v15, "breadthFirstSearch:nodeVisitBlock:edgeVisitBlock:", a2, &__block_literal_global_172, &v22);
  v16 = *v10;
  v17 = (*v10 + 7);
  if (v17 >= 8)
  {
    v18 = v10 + 1;
    v19 = v17 >> 3;
    if (v17 >> 3 <= 1)
      v19 = 1;
    do
    {
      *v18 = ~*v18;
      ++v18;
      --v19;
    }
    while (v19);
  }
  v20 = v16 & 7;
  if (v20)
    *((_BYTE *)v10 + (v17 >> 3) + 3) ^= -1 << v20;
  objc_msgSend(v8, "removeMarkedEdges:", v10, v22, v23, v24, v25);
  if (v12)
    free(v12);
  if (v14)
    free(v14);
  free(v10);

  return v8;
}

void sub_1A4E142D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __sortNodesInMap_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL4 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 16 * *a2);
  v5 = *(_QWORD *)(v3 + 16 * *a3);
  v6 = v4 >= v5;
  v7 = v4 > v5;
  if (v6)
    return v7;
  else
    return 0xFFFFFFFFLL;
}

uint64_t ___subgraphWithPaths_block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (((a3 + 1) & 0xFE) != 0)
    return 2;
  else
    return (a3 + 1);
}

BOOL ___subgraphWithPaths_block_invoke_2(uint64_t a1, uint64_t a2, int a3, unsigned int a4, _BYTE *a5)
{
  _BOOL8 result;
  int v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  _DWORD *v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  char v20;

  if (*a5)
    return 0;
  v8 = a2;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "referenceInfoWithName:", a2);
    LOBYTE(v10) = v20;
  }
  result = VMUIsOwningReference((char)v10);
  if (result)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v11 + 4 * a4) = a3;
    v13 = a4;
    *(_DWORD *)(v12 + 4 * a4) = v8;
    v14 = *(unsigned int **)(a1 + 56);
    if (*v14 <= (unint64_t)a4)
    {
      return 1;
    }
    else
    {
      result = 1;
      if ((((unint64_t)*((unsigned __int8 *)v14 + ((unint64_t)a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
      {
        do
        {
          v15 = *(_DWORD **)(a1 + 64);
          v16 = *(unsigned int *)(*(_QWORD *)(a1 + 48) + 4 * v13);
          if (*v15 > v16)
          {
            v17 = (v16 >> 3) + 4;
            v18 = *((unsigned __int8 *)v15 + v17);
            v19 = 1 << (v16 & 7);
            if ((v19 & v18) != 0)
              return *(_BYTE *)(a1 + 72) == 0;
            *((_BYTE *)v15 + v17) = v18 | v19;
            v11 = *(_QWORD *)(a1 + 40);
          }
          v13 = *(unsigned int *)(v11 + 4 * v13);
        }
        while ((_DWORD)v13 != -1);
        return *(_BYTE *)(a1 + 72) == 0;
      }
    }
  }
  return result;
}

uint64_t shouldGetLabelForObject(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  v4 = v3;
  v5 = 1;
  if (v3 && a2)
  {
    objc_msgSend(v3, "className");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
    objc_msgSend(v6, "rangeOfString:options:", CFSTR("String"), 1);
    if (!v7)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("NSPathStore2")) & 1) != 0)
        v5 = 1;
      else
        v5 = objc_msgSend(v4, "isDerivedFromStackBacktrace");
    }

  }
  return v5;
}

uint64_t totalSizeOfRanges(NSMapTable *a1)
{
  uint64_t v1;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, a1);
  value = 0;
  key = 0;
  v1 = 0;
  if (NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    v1 = 0;
    do
      v1 += (uint64_t)value;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value));
  }
  NSEndMapTableEnumeration(&enumerator);
  return v1;
}

void sub_1A4E159B8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

void sub_1A4E18230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

_DWORD *vmu_create_backtrace_uniquing_table(unsigned int a1, int a2)
{
  _DWORD *v4;
  _DWORD *v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  mach_vm_address_t address;

  v4 = malloc_type_calloc(1uLL, 0x108uLL, 0x1080040AD5D41FBuLL);
  v5 = v4;
  if ((a2 & 2) != 0)
    v6 = 24;
  else
    v6 = 16;
  v4[10] = v6;
  if (a1)
  {
    if (a1 <= 0x400)
      v7 = 1024;
    else
      v7 = a1;
    v8 = (v6 * v7);
    v9 = *MEMORY[0x1E0C85AD8];
    v10 = (((unint64_t)(v8 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8])
                       / *MEMORY[0x1E0C85AD8]);
  }
  else
  {
    v9 = *MEMORY[0x1E0C85AD8];
    v10 = 512;
  }
  v11 = (v9 * v10 / v6) & 0xFFFFFFFFFFFFFFELL;
  *((_QWORD *)v4 + 1) = v10;
  *((_QWORD *)v4 + 2) = v11;
  *((_QWORD *)v4 + 3) = v9 * v10;
  if (v11 >= 0xFFFFFFFF)
    vmu_create_backtrace_uniquing_table_cold_1();
  address = 0;
  if (mach_vm_allocate(*MEMORY[0x1E0C83DA0], &address, v9 * v10, 167772161))
    vmu_create_backtrace_uniquing_table_cold_2();
  *(_QWORD *)v5 = address;
  *((_QWORD *)v5 + 4) = 0;
  v5[14] = ((a2 & 6) == 0) | a2;
  v5[11] = 10;
  v12 = *((_QWORD *)v5 + 2);
  if (v12 >= 0x401)
  {
    v13 = 10;
    do
    {
      v12 >>= 2;
      v13 += 3;
    }
    while (v12 > 0x400);
    v5[11] = v13;
  }
  pthread_rwlock_init((pthread_rwlock_t *)(v5 + 16), 0);
  return v5;
}

char *vmu_create_backtrace_uniquing_table_from_archive(unint64_t a1, int a2, uint64_t a3)
{
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;

  v6 = (char *)malloc_type_calloc(1uLL, 0x108uLL, 0x1080040AD5D41FBuLL);
  *((_DWORD *)v6 + 14) = a2;
  if ((a2 & 2) != 0)
    v7 = 24;
  else
    v7 = 16;
  *((_DWORD *)v6 + 10) = v7;
  *(_QWORD *)v6 = a3;
  v8 = (a1 / v7) & 0xFFFFFFFFFFFFFFELL;
  *((_QWORD *)v6 + 2) = v8;
  *((_QWORD *)v6 + 3) = a1;
  if (v8 >= 0xFFFFFFFF)
    vmu_create_backtrace_uniquing_table_from_archive_cold_1();
  v9 = v6;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 4) = 0;
  *((_DWORD *)v6 + 11) = 0;
  pthread_rwlock_init((pthread_rwlock_t *)(v6 + 64), 0);
  return v9;
}

void vmu_destroy_backtrace_uniquing_table(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], *(_QWORD *)a1, *(_QWORD *)(a1 + 24));
  else
    free(*(void **)a1);
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 64));
  free((void *)a1);
}

uint64_t vmu_context_for_uniqued_stack(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 56) & 2) != 0)
    return *(_QWORD *)a1 + *(unsigned int *)(a1 + 40) * a2 + 16;
  else
    return 0;
}

uint64_t vmu_enter_stack_in_backtrace_uniquing_table(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  pthread_rwlock_t *v13;
  int v14;
  uint64_t result;
  uint64_t v16;
  int v17;
  uint64_t v18;
  mach_vm_size_t v19;
  unint64_t v20;
  unint64_t v21;
  pthread_rwlock_t *v22;
  mach_vm_address_t v23;
  mach_vm_size_t v24;
  mach_vm_address_t v25;
  int v26;
  uint64_t i;
  uint64_t v28;
  mach_vm_address_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  mach_vm_address_t address[514];

  v5 = MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5);
  address[512] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(v5 + 8))
    return 0;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  v37 = 0;
  v13 = (pthread_rwlock_t *)(v5 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 64));
  v14 = _enter_frames_in_table_while_locked(v12, &v37, v10, v9);
  pthread_rwlock_unlock(v13);
  if (v14)
  {
    result = 1;
  }
  else
  {
    v35 = v10;
    v36 = v9;
    while (1)
    {
      v16 = 4 * *(_QWORD *)(v12 + 8);
      v17 = *(_DWORD *)(v12 + 44);
      pthread_rwlock_wrlock(v13);
      v18 = *(_QWORD *)(v12 + 16);
      v19 = *MEMORY[0x1E0C85AD8] * v16;
      v20 = v19 / *(unsigned int *)(v12 + 40);
      v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
      if (HIDWORD(v20))
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "can't expand backtrace uniquing table from %llu nodes to %llu nodes (exceeds maximum %u)\n", v18, v21, -1);
        goto LABEL_34;
      }
      v22 = v13;
      v23 = *(_QWORD *)v12;
      v24 = *(_QWORD *)(v12 + 24);
      address[0] = 0;
      if (mach_vm_allocate(*MEMORY[0x1E0C83DA0], address, v19, 167772161))
        vmu_create_backtrace_uniquing_table_cold_2();
      v25 = address[0];
      if (!address[0])
        break;
      *(_QWORD *)v12 = address[0];
      *(_QWORD *)(v12 + 8) = v16;
      *(_QWORD *)(v12 + 16) = v21;
      *(_QWORD *)(v12 + 24) = v19;
      *(_QWORD *)(v12 + 32) = v18;
      *(_DWORD *)(v12 + 44) = v17 + 3;
      v26 = *(_DWORD *)(v12 + 56);
      if ((v26 & 1) != 0)
      {
        *(_QWORD *)(v12 + 48) = 0;
      }
      else if ((v26 & 4) != 0)
      {
        if (mach_vm_copy(*MEMORY[0x1E0C83DA0], v23, v24, v25))
          printf("(VMUBacktraceUniquing) expandUniquingTable(): VMCopyFailed");
      }
      else if ((v26 & 2) != 0)
      {
        *(_QWORD *)(v12 + 48) = 0;
        if (v18)
        {
          for (i = 0; i != v18; ++i)
          {
            v28 = *(unsigned int *)(v12 + 40);
            v29 = v23 + i * v28;
            v30 = *(_QWORD *)(v29 + 16);
            if (v30)
            {
              v31 = *(_DWORD *)(v29 + 8);
              if (v31 == -1)
              {
                v33 = 0;
              }
              else
              {
                v32 = 0;
                do
                {
                  address[v32] = *(_QWORD *)v29;
                  v33 = v32 + 1;
                  v29 = v23 + (v31 * v28);
                  v31 = *(_DWORD *)(v29 + 8);
                  ++v32;
                }
                while (v31 != -1);
              }
              address[v33] = *(_QWORD *)v29;
              v38 = 0;
              if (_enter_frames_in_table_while_locked(v12, &v38, (uint64_t)address, v33 + 1))
                *(_QWORD *)(*(_QWORD *)v12 + v38 * *(unsigned int *)(v12 + 40) + 16) = v30;
              else
                fwrite("unable to reinsert node when expanding backtrace uniquing table - bad hashing function?\n", 0x58uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
            }
          }
        }
      }
      if (mach_vm_deallocate(*MEMORY[0x1E0C83DA0], v23, v24))
        printf("(VMUBacktraceUniquing) expandUniquingTable(): mach_vm_deallocate failed. [%p]\n", *(const void **)v12);
      v13 = v22;
      pthread_rwlock_unlock(v22);
      pthread_rwlock_wrlock(v22);
      v34 = _enter_frames_in_table_while_locked(v12, &v37, v35, v36);
      pthread_rwlock_unlock(v22);
      if (v34)
      {
        result = 1;
        goto LABEL_35;
      }
    }
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "failed to expand uniquing table to %llu bytes\n", v19);
    v13 = v22;
LABEL_34:
    pthread_rwlock_unlock(v13);
    result = 0;
    v37 = -1;
  }
LABEL_35:
  *v11 = v37;
  return result;
}

uint64_t vmu_remove_stack_from_backtrace_uniquing_table(uint64_t a1, unint64_t a2)
{
  pthread_rwlock_t *v4;
  int v5;
  int v6;
  size_t v7;
  _DWORD *v8;
  int v9;
  int v10;
  int v12;

  if (a2 >= 0xFFFFFFFF)
    vmu_remove_stack_from_backtrace_uniquing_table_cold_1();
  v4 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  v5 = *(_DWORD *)(a1 + 52);
  v6 = a2;
  while (1)
  {
    v7 = *(unsigned int *)(a1 + 40);
    v8 = (_DWORD *)(*(_QWORD *)a1 + (v7 * v6));
    v10 = v8[2];
    v9 = v8[3];
    if (!*(_QWORD *)v8 && v10 == 0)
      break;
    if (v9 != -1)
    {
      v12 = v9 - 1;
      v8[3] = v12;
      if (!v12)
      {
        bzero(v8, v7);
        --*(_DWORD *)(a1 + 48);
        if (v6 == a2)
          --*(_DWORD *)(a1 + 52);
      }
    }
    v6 = v10;
    if (v10 == -1)
      goto LABEL_14;
  }
  if (v9)
    vmu_remove_stack_from_backtrace_uniquing_table_cold_3();
LABEL_14:
  if ((v5 - *(_DWORD *)(a1 + 52)) >= 2)
    vmu_remove_stack_from_backtrace_uniquing_table_cold_2();
  return pthread_rwlock_unlock(v4);
}

uint64_t vmu_stack_frames_for_uniqued_stack(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  int v6;
  pthread_rwlock_t *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  int v15;

  if (a2 >= 0xFFFFFFFF)
    vmu_stack_frames_for_uniqued_stack_cold_1();
  v6 = a2;
  v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 64));
  if (a4)
  {
    v9 = 0;
    v10 = *(_DWORD *)(a1 + 40);
    v11 = v6;
    while (1)
    {
      if (*(_QWORD *)(a1 + 24) <= (unint64_t)(v10 + v10 * v11))
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "(VMUBacktraceUniquing): Invalid parent node %#x\n");
        goto LABEL_15;
      }
      v12 = (uint64_t *)(*(_QWORD *)a1 + (v10 * v11));
      v13 = *v12;
      v11 = *((_DWORD *)v12 + 2);
      if (!v13 && v11 == 0)
        break;
      *(_QWORD *)(a3 + 8 * v9) = v13;
      v15 = v9++;
      if (a4 - 1 == v15 || v11 == -1)
        goto LABEL_15;
    }
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "(VMUBacktraceUniquing): Invalid PC 0x%llx at frame %u for stackID %llu\n");
  }
  else
  {
    v9 = 0;
  }
LABEL_15:
  pthread_rwlock_unlock(v8);
  return v9;
}

_QWORD *vmu_enumerate_backtrace_uniquing_table(_QWORD *result, uint64_t a2)
{
  unint64_t v2;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[2];
  if (v2)
  {
    v4 = result;
    v5 = 0;
    v6 = *result;
    do
    {
      v7 = v6 + v5 * *((unsigned int *)v4 + 10);
      if (*(_QWORD *)v7 || *(_DWORD *)(v7 + 8))
      {
        result = (_QWORD *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
        v2 = v4[2];
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

uint64_t vmu_print_backtrace_uniquing_table(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  FILE **v6;
  uint64_t v7;
  int v8;
  BOOL v9;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = 0;
    v4 = *(_QWORD *)result;
    v5 = *(_DWORD *)(result + 56);
    v6 = (FILE **)MEMORY[0x1E0C80C10];
    do
    {
      v7 = v4 + v3 * *(unsigned int *)(v2 + 40);
      v8 = *(_DWORD *)(v7 + 8);
      if (*(_QWORD *)v7)
        v9 = 0;
      else
        v9 = v8 == 0;
      if (!v9)
      {
        fprintf(*v6, "%8llu  address %#llx  parent %u", v3, *(_QWORD *)v7, v8);
        if ((v5 & 2) != 0)
          fprintf(*v6, "  context %#llx", *(_QWORD *)(v7 + 16));
        result = fputc(10, *v6);
        v1 = *(_QWORD *)(v2 + 16);
      }
      ++v3;
    }
    while (v3 < v1);
  }
  return result;
}

uint64_t _enter_frames_in_table_while_locked(uint64_t a1, _QWORD *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  _DWORD *v18;
  int v19;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(int *)(a1 + 44);
  v7 = (v4 - v5) / ((2 * v6) | 1uLL);
  v8 = a4;
  v9 = -1;
  while (1)
  {
    v10 = v9;
    if ((int)v8 < 1)
      break;
    if ((_DWORD)v6)
    {
      --v8;
      v11 = *(_QWORD *)(a3 + 8 * v8);
      v9 = ((16 * v9) ^ (v11 >> 2)) % (v4 - v5 - 1) + v5;
      v12 = (v6 - 1) * v7 + 1;
      v13 = v6;
      while (1)
      {
        v14 = *(_QWORD *)a1 + *(_DWORD *)(a1 + 40) * v9;
        if (!*(_QWORD *)v14 && !*(_DWORD *)(v14 + 8))
          break;
        if (*(_QWORD *)v14 == v11 && *(_DWORD *)(v14 + 8) == v10)
        {
          v19 = *(_DWORD *)(v14 + 12);
          v18 = (_DWORD *)(v14 + 12);
          v17 = v19;
          if (v19 == -1)
            goto LABEL_19;
          goto LABEL_18;
        }
        v15 = v9 + v12;
        if (v4 <= v15)
          v16 = v5 - v4;
        else
          v16 = 0;
        v12 -= v7;
        v9 = v15 + v16;
        if (!--v13)
          return 0;
      }
      *(_QWORD *)v14 = v11;
      *(_DWORD *)(v14 + 8) = v10;
      *(_DWORD *)(v14 + 12) = 1;
      ++*(_DWORD *)(a1 + 48);
      if (v8)
        goto LABEL_19;
      v17 = *(_DWORD *)(a1 + 52);
      v18 = (_DWORD *)(a1 + 52);
LABEL_18:
      *v18 = v17 + 1;
LABEL_19:
      if (v13 >= 1)
        continue;
    }
    return 0;
  }
  *a2 = v9;
  return 1;
}

void VMUGatherOwnedVmObjects_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "VMUGatherOwnedVmObjects returned buffer should be large enough to describe its own length.\n", a5, a6, a7, a8, 0);
}

void VMUGatherOwnedVmObjects_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "VMUGatherOwnedVmObjects returned buffer should be large enough to have the data for all the entries.\n", a5, a6, a7, a8, 0);
}

void _nextField(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, a1, a3, "Out-of-bound access in VMUSimpleDeserializer.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void ___removeEntryFromMarkingRegion_block_invoke_cold_1()
{
  __assert_rtn("_removeEntryFromMarkingRegion_block_invoke", "VMUMemoryMarking.m", 106, "entryIndex < region->entry_capacity");
}

void ___addEntryToMarkingRegion_block_invoke_cold_1()
{
  __assert_rtn("_addEntryToMarkingRegion_block_invoke", "VMUMemoryMarking.m", 95, "entries[entryIndex] == 0");
}

void ownedPhysFootprintAdjustmentForMemgraph_cold_1()
{
  __assert_rtn("ownedPhysFootprintAdjustmentForMemgraph", "VMUVMRegionIdentifier.m", 709, "regions.count == *regionCountInOut");
}

void adjustOwnedMemoryRegionFootprint_cold_1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1 - a2;
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Footprint changed while analyzing – attempting to adjust more owned unmapped physical footprint than is present in the process by %llu bytes", (uint8_t *)&v2, 0xCu);
}

void VMUMallocRangeTypeString_cold_1(int a1)
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Unexpected range type value %x from malloc zone enumerator\n", a1);
  abort();
}

void ___markRegionsForMallocZones_block_invoke_4_cold_1()
{
  __assert_rtn("_markRegionsForMallocZones_block_invoke_4", "VMUVMRegionIdentifier.m", 1478, "0");
}

void ___markRegionsForMallocZones_block_invoke_4_cold_2()
{
  __assert_rtn("_markRegionsForMallocZones_block_invoke_4", "VMUVMRegionIdentifier.m", 1466, "VMUMaxRange(newVMRangeForZone) == rangeStartInRegion");
}

void ___getRegionMallocStatistics_block_invoke_3_cold_1()
{
  __assert_rtn("_getRegionMallocStatistics_block_invoke_3", "VMUVMRegionIdentifier.m", 1575, "0");
}

void __remoteZoneIntrospection_block_invoke_5_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void vmu_create_backtrace_uniquing_table_cold_1()
{
  __assert_rtn("vmu_create_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 112, "uniquing_table->numNodes < MAX_UNIQUING_TABLE_NODES");
}

void vmu_create_backtrace_uniquing_table_cold_2()
{
  printf("(VMUBacktraceUniquing) allocate_pages(): virtual memory exhausted! (XRBacktraceRepository)");
  abort();
}

void vmu_create_backtrace_uniquing_table_from_archive_cold_1()
{
  __assert_rtn("vmu_create_backtrace_uniquing_table_from_archive", "VMUBacktraceUniquing.c", 143, "uniquing_table->numNodes < MAX_UNIQUING_TABLE_NODES");
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_1()
{
  __assert_rtn("vmu_remove_stack_from_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 395, "uniqued_stack < MAX_UNIQUING_TABLE_NODES");
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_2()
{
  __assert_rtn("vmu_remove_stack_from_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 424, "old_backtraces_contained - uniquing_table->backtraces_contained <= 1");
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_3()
{
  __assert_rtn("vmu_remove_stack_from_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 408, "node->refcount == 0");
}

void vmu_stack_frames_for_uniqued_stack_cold_1()
{
  __assert_rtn("vmu_stack_frames_for_uniqued_stack", "VMUBacktraceUniquing.c", 437, "uniqued_stack < MAX_UNIQUING_TABLE_NODES");
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

uint64_t CFLog()
{
  return MEMORY[0x1E0C98808]();
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

uint64_t CSArchitectureGetCurrent()
{
  return MEMORY[0x1E0D19F48]();
}

uint64_t CSArchitectureIs64Bit()
{
  return MEMORY[0x1E0D19F70]();
}

uint64_t CSArchitectureIsArm()
{
  return MEMORY[0x1E0D19F80]();
}

uint64_t CSArchitectureIsArm64()
{
  return MEMORY[0x1E0D19F88]();
}

uint64_t CSArchitectureIsX86_64()
{
  return MEMORY[0x1E0D19FA0]();
}

uint64_t CSDemangleSymbolName()
{
  return MEMORY[0x1E0D19FB0]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x1E0D19FB8]();
}

uint64_t CSPlatformForTask()
{
  return MEMORY[0x1E0D19FC8]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x1E0D19FE8]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x1E0D1A000]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1E0D1A018]();
}

uint64_t CSRetain()
{
  return MEMORY[0x1E0D1A028]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x1E0D1A040]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x1E0D1A050]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x1E0D1A058]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x1E0D1A060]();
}

uint64_t CSSymbolGetMangledName()
{
  return MEMORY[0x1E0D1A078]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1E0D1A088]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1E0D1A090]();
}

uint64_t CSSymbolGetSymbolOwner()
{
  return MEMORY[0x1E0D1A098]();
}

uint64_t CSSymbolIsFunction()
{
  return MEMORY[0x1E0D1A0A0]();
}

uint64_t CSSymbolIsUnnamed()
{
  return MEMORY[0x1E0D1A0A8]();
}

uint64_t CSSymbolOwnerCreateSparseDataWithBlock()
{
  return MEMORY[0x1E0D1A0B0]();
}

uint64_t CSSymbolOwnerForeachSection()
{
  return MEMORY[0x1E0D1A0C8]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x1E0D1A0D0]();
}

uint64_t CSSymbolOwnerForeachSymbol()
{
  return MEMORY[0x1E0D1A0E0]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x1E0D1A0F0]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x1E0D1A100]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x1E0D1A108]();
}

uint64_t CSSymbolOwnerGetContentForRange()
{
  return MEMORY[0x1E0D1A118]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x1E0D1A130]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x1E0D1A140]();
}

uint64_t CSSymbolOwnerGetRegionWithName()
{
  return MEMORY[0x1E0D1A148]();
}

uint64_t CSSymbolOwnerGetSegmentWithAddress()
{
  return MEMORY[0x1E0D1A150]();
}

uint64_t CSSymbolOwnerGetSourceInfoWithAddress()
{
  return MEMORY[0x1E0D1A158]();
}

uint64_t CSSymbolOwnerGetSymbolCount()
{
  return MEMORY[0x1E0D1A160]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x1E0D1A168]();
}

uint64_t CSSymbolOwnerGetSymbolWithMangledName()
{
  return MEMORY[0x1E0D1A170]();
}

uint64_t CSSymbolOwnerGetSymbolWithName()
{
  return MEMORY[0x1E0D1A178]();
}

uint64_t CSSymbolOwnerGetVersion()
{
  return MEMORY[0x1E0D1A188]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x1E0D1A1B0]();
}

uint64_t CSSymbolOwnerSetPathForSymbolication()
{
  return MEMORY[0x1E0D1A1B8]();
}

uint64_t CSSymbolOwnerUsesCPlusPlus()
{
  return MEMORY[0x1E0D1A1C0]();
}

uint64_t CSSymbolicatorCreateForTaskSharedCache()
{
  return MEMORY[0x1E0D1A1C8]();
}

uint64_t CSSymbolicatorCreateNonFaultingWithSignatureAndGroupKey()
{
  return MEMORY[0x1E0D1A1D0]();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return MEMORY[0x1E0D1A1D8]();
}

uint64_t CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification()
{
  return MEMORY[0x1E0D1A1E8]();
}

uint64_t CSSymbolicatorCreateWithCoreFilePathAndFlags()
{
  return MEMORY[0x1E0D1A1F0]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x1E0D1A200]();
}

uint64_t CSSymbolicatorCreateWithPathAndArchitecture()
{
  return MEMORY[0x1E0D1A218]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x1E0D1A228]();
}

uint64_t CSSymbolicatorCreateWithSymbolOwners()
{
  return MEMORY[0x1E0D1A248]();
}

uint64_t CSSymbolicatorCreateWithTask()
{
  return MEMORY[0x1E0D1A250]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x1E0D1A258]();
}

uint64_t CSSymbolicatorFixupFrames()
{
  return MEMORY[0x1E0D1A268]();
}

uint64_t CSSymbolicatorForceFullSymbolExtraction()
{
  return MEMORY[0x1E0D1A270]();
}

uint64_t CSSymbolicatorForeachSegmentAtTime()
{
  return MEMORY[0x1E0D1A278]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x1E0D1A280]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x1E0D1A290]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x1E0D1A2A8]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x1E0D1A2C0]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x1E0D1A2C8]();
}

uint64_t CSSymbolicatorGetFlagsForNListOnlyData()
{
  return MEMORY[0x1E0D1A2D8]();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return MEMORY[0x1E0D1A2E0]();
}

uint64_t CSSymbolicatorGetSectionWithAddressAtTime()
{
  return MEMORY[0x1E0D1A2F0]();
}

uint64_t CSSymbolicatorGetSourceInfoWithAddressAtTime()
{
  return MEMORY[0x1E0D1A300]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x1E0D1A318]();
}

uint64_t CSSymbolicatorGetSymbolOwnerCountAtTime()
{
  return MEMORY[0x1E0D1A320]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return MEMORY[0x1E0D1A330]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x1E0D1A340]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x1E0D1A350]();
}

uint64_t CSSymbolicatorGetSymbolWithMangledNameFromSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x1E0D1A358]();
}

uint64_t CSSymbolicatorGetSymbolWithNameAtTime()
{
  return MEMORY[0x1E0D1A360]();
}

uint64_t CSSymbolicatorGetTask()
{
  return MEMORY[0x1E0D1A368]();
}

uint64_t CSSymbolicatorGetTaskIsTranslated()
{
  return MEMORY[0x1E0D1A370]();
}

uint64_t CSSymbolicatorIsKernelSymbolicator()
{
  return MEMORY[0x1E0D1A378]();
}

uint64_t CSTaskHasStarted()
{
  return MEMORY[0x1E0D1A380]();
}

uint64_t CSTaskIs64Bit()
{
  return MEMORY[0x1E0D1A388]();
}

uint64_t CSTaskIsTranslated()
{
  return MEMORY[0x1E0D1A390]();
}

uint64_t CSUUIDCFUUIDBytesToString()
{
  return MEMORY[0x1E0D1A398]();
}

uint64_t CSUUIDStringToCFUUIDBytes()
{
  return MEMORY[0x1E0D1A3A0]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x1E0CB29A0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1E0CB29B0](retstr, table);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BD0](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BD8](table, pointer);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DB8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1E0CB2F88](enumerator, key, value);
}

void NSResetMapTable(NSMapTable *table)
{
  MEMORY[0x1E0CB3160](table);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1E0CBBA48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1E0C9A0C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFStringGetLength2()
{
  return MEMORY[0x1E0C9A530]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E4DFF6F0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4DFF6F8(__sz);
}

uint64_t __CFGenericTypeID()
{
  return MEMORY[0x1E0C9A958]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1E0DE7AB8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

uint64_t clear_mapped_memory()
{
  return MEMORY[0x1E0D1A3A8]();
}

void clearerr(FILE *a1)
{
  MEMORY[0x1E0C82648](a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

uint64_t create_mapped_memory_cache_for_core_file_with_label()
{
  return MEMORY[0x1E0D1A3B0]();
}

uint64_t create_sampling_context_for_task_pid_symbolicator()
{
  return MEMORY[0x1E0D1A3C0]();
}

uint64_t csops()
{
  return MEMORY[0x1E0C82B68]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1E0DE92C8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

uint64_t destroy_sampling_context()
{
  return MEMORY[0x1E0D1A3D0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

uint64_t dispatch_queue_name_for_serial_number()
{
  return MEMORY[0x1E0D1A3D8]();
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1E0C83108]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1E0C83118]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1E0C83120]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1E0C83128]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1E0C83130]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1E0C83138]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1E0C83148]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1E0C83188]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1E0C83190]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x1E0C83198]();
}

uint64_t enumerate_mapped_memory_cache()
{
  return MEMORY[0x1E0D1A3E0]();
}

uint64_t enumerate_mapped_memory_core_file_dumped_regions()
{
  return MEMORY[0x1E0D1A3E8]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1E0C83390](a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

tree *__cdecl find_node(const char *a1, tree *a2)
{
  return (tree *)MEMORY[0x1E0D1A3F0](a1, a2);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1E0C83428](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1E0C83738](*(_QWORD *)&a1, a2, a3, a4, a5);
}

pid_t getpgid(pid_t a1)
{
  return MEMORY[0x1E0C83750](*(_QWORD *)&a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C837E0](mhp, segname, sectname, size);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C837F0](mhp, segname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838B8](*(_QWORD *)&host, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B28](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B38](v);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t ledger()
{
  return MEMORY[0x1E0C83B58]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1E0C83C68]();
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x1E0C83C78](str, *(_QWORD *)&error_value);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return MEMORY[0x1E0C83CA8](*(_QWORD *)&host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1E0C83D98](*(_QWORD *)&task);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C83DC0](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_copy(vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return MEMORY[0x1E0C83DC8](*(_QWORD *)&target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x1E0C83DE0](*(_QWORD *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1E0C83DF0](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1E0C83E08](*(_QWORD *)&target_task, address, size, nesting_depth, info, infoCnt);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1E0C83E28](deadline);
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  return (const char *)MEMORY[0x1E0C83E30](*(_QWORD *)&type, *(_QWORD *)&subtype);
}

BOOL macho_cpu_type_for_arch_name(const char *archName, cpu_type_t *type, cpu_subtype_t *subtype)
{
  return MEMORY[0x1E0C83E40](archName, type, subtype);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1E0C83EA0]();
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1E0C83EB0](size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
  MEMORY[0x1E0C83FB0](zone);
}

uint64_t map_new_node()
{
  return MEMORY[0x1E0D1A400]();
}

uint64_t mapped_memory_core_file_get_addressing_mask()
{
  return MEMORY[0x1E0D1A408]();
}

uint64_t mapped_memory_core_file_get_architecture()
{
  return MEMORY[0x1E0D1A410]();
}

uint64_t mapped_memory_core_file_get_argslen()
{
  return MEMORY[0x1E0D1A418]();
}

uint64_t mapped_memory_core_file_get_dirty_flags()
{
  return MEMORY[0x1E0D1A420]();
}

uint64_t mapped_memory_core_file_get_dyld_shared_cache_range()
{
  return MEMORY[0x1E0D1A428]();
}

uint64_t mapped_memory_core_file_get_exclave_vm_flags_for_address()
{
  return MEMORY[0x1E0D1A430]();
}

uint64_t mapped_memory_core_file_get_ledger_alternate_accounting()
{
  return MEMORY[0x1E0D1A438]();
}

uint64_t mapped_memory_core_file_get_ledger_alternate_compressed()
{
  return MEMORY[0x1E0D1A440]();
}

uint64_t mapped_memory_core_file_get_ledger_graphics_footprint()
{
  return MEMORY[0x1E0D1A448]();
}

uint64_t mapped_memory_core_file_get_ledger_graphics_footprint_compressed()
{
  return MEMORY[0x1E0D1A450]();
}

uint64_t mapped_memory_core_file_get_ledger_internal()
{
  return MEMORY[0x1E0D1A458]();
}

uint64_t mapped_memory_core_file_get_ledger_internal_compressed()
{
  return MEMORY[0x1E0D1A460]();
}

uint64_t mapped_memory_core_file_get_ledger_iokit_mapped()
{
  return MEMORY[0x1E0D1A468]();
}

uint64_t mapped_memory_core_file_get_ledger_media_footprint()
{
  return MEMORY[0x1E0D1A470]();
}

uint64_t mapped_memory_core_file_get_ledger_media_footprint_compressed()
{
  return MEMORY[0x1E0D1A478]();
}

uint64_t mapped_memory_core_file_get_ledger_network_nonvolatile()
{
  return MEMORY[0x1E0D1A480]();
}

uint64_t mapped_memory_core_file_get_ledger_network_nonvolatile_compressed()
{
  return MEMORY[0x1E0D1A488]();
}

uint64_t mapped_memory_core_file_get_ledger_neural_footprint()
{
  return MEMORY[0x1E0D1A490]();
}

uint64_t mapped_memory_core_file_get_ledger_neural_footprint_compressed()
{
  return MEMORY[0x1E0D1A498]();
}

uint64_t mapped_memory_core_file_get_ledger_page_table()
{
  return MEMORY[0x1E0D1A4A0]();
}

uint64_t mapped_memory_core_file_get_ledger_phys_footprint()
{
  return MEMORY[0x1E0D1A4A8]();
}

uint64_t mapped_memory_core_file_get_ledger_phys_footprint_lifetime_max()
{
  return MEMORY[0x1E0D1A4B0]();
}

uint64_t mapped_memory_core_file_get_ledger_purgable_nonvolatile()
{
  return MEMORY[0x1E0D1A4B8]();
}

uint64_t mapped_memory_core_file_get_ledger_purgable_nonvolatile_compressed()
{
  return MEMORY[0x1E0D1A4C0]();
}

uint64_t mapped_memory_core_file_get_ledger_tagged_footprint()
{
  return MEMORY[0x1E0D1A4C8]();
}

uint64_t mapped_memory_core_file_get_ledger_tagged_footprint_compressed()
{
  return MEMORY[0x1E0D1A4D0]();
}

uint64_t mapped_memory_core_file_get_ledger_wired_mem()
{
  return MEMORY[0x1E0D1A4D8]();
}

uint64_t mapped_memory_core_file_get_owned_vm_objects()
{
  return MEMORY[0x1E0D1A4E0]();
}

uint64_t mapped_memory_core_file_get_parent_proc_name()
{
  return MEMORY[0x1E0D1A4E8]();
}

uint64_t mapped_memory_core_file_get_parent_proc_path()
{
  return MEMORY[0x1E0D1A4F0]();
}

uint64_t mapped_memory_core_file_get_pid()
{
  return MEMORY[0x1E0D1A4F8]();
}

uint64_t mapped_memory_core_file_get_ppid()
{
  return MEMORY[0x1E0D1A500]();
}

uint64_t mapped_memory_core_file_get_proc_argc()
{
  return MEMORY[0x1E0D1A508]();
}

uint64_t mapped_memory_core_file_get_proc_flags()
{
  return MEMORY[0x1E0D1A510]();
}

uint64_t mapped_memory_core_file_get_proc_name()
{
  return MEMORY[0x1E0D1A518]();
}

uint64_t mapped_memory_core_file_get_proc_path()
{
  return MEMORY[0x1E0D1A520]();
}

uint64_t mapped_memory_core_file_get_proc_starttime_sec()
{
  return MEMORY[0x1E0D1A528]();
}

uint64_t mapped_memory_core_file_get_proc_starttime_usec()
{
  return MEMORY[0x1E0D1A530]();
}

uint64_t mapped_memory_core_file_get_udata_ptrs()
{
  return MEMORY[0x1E0D1A538]();
}

uint64_t mapped_memory_core_file_get_userstack()
{
  return MEMORY[0x1E0D1A540]();
}

uint64_t mapped_memory_core_file_has_info_for_memory_analysis()
{
  return MEMORY[0x1E0D1A548]();
}

uint64_t mapped_memory_core_file_is_exclave()
{
  return MEMORY[0x1E0D1A550]();
}

uint64_t mapped_memory_core_file_is_exclavecore()
{
  return MEMORY[0x1E0D1A558]();
}

uint64_t mapped_memory_core_file_mach_vm_page_range_query()
{
  return MEMORY[0x1E0D1A560]();
}

uint64_t mapped_memory_core_file_mach_vm_purgable_control()
{
  return MEMORY[0x1E0D1A568]();
}

uint64_t mapped_memory_core_file_mach_vm_region_recurse_submap_64()
{
  return MEMORY[0x1E0D1A570]();
}

uint64_t mapped_memory_core_file_mach_vm_region_recurse_submap_short_64()
{
  return MEMORY[0x1E0D1A578]();
}

uint64_t mapped_memory_core_file_region_filename()
{
  return MEMORY[0x1E0D1A580]();
}

uint64_t mapped_memory_is_64_bit()
{
  return MEMORY[0x1E0D1A588]();
}

uint64_t mapped_memory_resume_target()
{
  return MEMORY[0x1E0D1A598]();
}

uint64_t mapped_memory_suspend_target()
{
  return MEMORY[0x1E0D1A5A0]();
}

uint64_t mapped_memory_task_threads()
{
  return MEMORY[0x1E0D1A5A8]();
}

uint64_t mapped_memory_thread_get_state()
{
  return MEMORY[0x1E0D1A5B0]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x1E0C840D8](__base, __nel, __width, __compar);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1E0C840E0](__base, __nel, __width, __compar);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

uint64_t msl_coldest_frame_is_threadid()
{
  return MEMORY[0x1E0D46E08]();
}

uint64_t msl_copy_disk_stack_logs()
{
  return MEMORY[0x1E0D46E10]();
}

uint64_t msl_disk_stack_logs_enumerate_from_buffer()
{
  return MEMORY[0x1E0D46E18]();
}

uint64_t msl_disk_stack_logs_enumerate_from_task_with_block()
{
  return MEMORY[0x1E0D46E20]();
}

uint64_t msl_get_frames_for_address()
{
  return MEMORY[0x1E0D46E28]();
}

uint64_t msl_payload_create_from_index()
{
  return MEMORY[0x1E0D46E30]();
}

uint64_t msl_payload_for_vm_region_in_task()
{
  return MEMORY[0x1E0D46E38]();
}

uint64_t msl_payload_from_lite_zone_ptr()
{
  return MEMORY[0x1E0D46E40]();
}

uint64_t msl_payload_get_allocation_timestamp()
{
  return MEMORY[0x1E0D46E48]();
}

uint64_t msl_payload_get_invalid()
{
  return MEMORY[0x1E0D46E50]();
}

uint64_t msl_payload_get_uniquing_table_index()
{
  return MEMORY[0x1E0D46E58]();
}

uint64_t msl_payload_is_invalid()
{
  return MEMORY[0x1E0D46E60]();
}

uint64_t msl_payload_version_from_task()
{
  return MEMORY[0x1E0D46E68]();
}

uint64_t msl_start_reading()
{
  return MEMORY[0x1E0D46E70]();
}

uint64_t msl_stop_reading()
{
  return MEMORY[0x1E0D46E78]();
}

uint64_t msl_uniquing_table_copy_from_serialized()
{
  return MEMORY[0x1E0D46E88]();
}

uint64_t msl_uniquing_table_copy_from_task()
{
  return MEMORY[0x1E0D46E90]();
}

uint64_t msl_uniquing_table_enumerate()
{
  return MEMORY[0x1E0D46E98]();
}

uint64_t msl_uniquing_table_get_frames_from_table()
{
  return MEMORY[0x1E0D46EA0]();
}

uint64_t msl_uniquing_table_get_frames_from_task()
{
  return MEMORY[0x1E0D46EA8]();
}

uint64_t msl_uniquing_table_release()
{
  return MEMORY[0x1E0D46EB0]();
}

uint64_t msl_uniquing_table_serialize()
{
  return MEMORY[0x1E0D46EB8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1E0C84968]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1E0C84AF8](*(_QWORD *)&t, x);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x1E0C84BF8](*(_QWORD *)&pid, flags);
}

uint64_t proc_list_uptrs()
{
  return MEMORY[0x1E0C84C00]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C60](*(_QWORD *)&pid, address, buffer, *(_QWORD *)&buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C85080](a1, a2, *(_QWORD *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x1E0C85088](*(_QWORD *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1E0C85090](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x1E0C85098](a1);
}

uint64_t release_core_file_mapped_memory_cache()
{
  return MEMORY[0x1E0D1A5B8]();
}

uint64_t sample_remote_thread_with_dispatch_queue_regular_and_swift_async()
{
  return MEMORY[0x1E0D1A5C0]();
}

uint64_t sampling_context_clear_cache()
{
  return MEMORY[0x1E0D1A5C8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

uint64_t set_mapped_memory_cache_region_info_block()
{
  return MEMORY[0x1E0D1A5D0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1E0C857B0](a1, a2, a3);
}

uint64_t task_get_mapped_memory_cache_with_label()
{
  return MEMORY[0x1E0D1A5D8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t task_lookup_mapped_memory_cache()
{
  return MEMORY[0x1E0D1A5E0]();
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1E0C85840](*(_QWORD *)&task, *(_QWORD *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1E0C85858]();
}

uint64_t task_release_mapped_memory_cache()
{
  return MEMORY[0x1E0D1A5E8]();
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x1E0C85880](*(_QWORD *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1E0C85898](*(_QWORD *)&target_task, suspend_token);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1E0C858A0](*(_QWORD *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1E0C858F0](*(_QWORD *)&target_act, *(_QWORD *)&flavor, old_state, old_stateCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

uint64_t thread_name_for_thread_port()
{
  return MEMORY[0x1E0D1A5F0]();
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

kern_return_t thread_resume(thread_read_t target_act)
{
  return MEMORY[0x1E0C85910](*(_QWORD *)&target_act);
}

kern_return_t thread_suspend(thread_read_t target_act)
{
  return MEMORY[0x1E0C85940](*(_QWORD *)&target_act);
}

uint64_t unmap_node()
{
  return MEMORY[0x1E0D1A5F8]();
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

uint64_t vm_tag_is_malloc()
{
  return MEMORY[0x1E0D1A600]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

uint64_t xpc_inspect_copy_description()
{
  return MEMORY[0x1E0C86550]();
}

