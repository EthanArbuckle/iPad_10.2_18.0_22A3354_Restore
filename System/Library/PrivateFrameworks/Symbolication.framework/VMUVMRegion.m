@implementation VMUVMRegion

- (BOOL)isStack
{
  int v2;

  if (self->isExclaveRegion)
    v2 = 12;
  else
    v2 = 30;
  return self->user_tag == v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->path, 0);
  objc_storeStrong((id *)&self->type, 0);
}

- (id)breakAtLength:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  if (self->range.length <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VMUVMRegion breakAtLength:].cold.1(a3, self);
    v5 = 0;
  }
  else
  {
    v5 = objc_opt_new();
    v6 = self->range.length - a3;
    *(_QWORD *)(v5 + 8) = self->range.location + a3;
    *(_QWORD *)(v5 + 16) = v6;
    self->range.length = a3;
    *(_DWORD *)(v5 + 24) = self->prot;
    *(_DWORD *)(v5 + 28) = self->maxProt;
    objc_storeStrong((id *)(v5 + 32), self->type);
    objc_storeStrong((id *)(v5 + 40), self->path);
    *(_BYTE *)(v5 + 48) = self->summarized;
    *(_BYTE *)(v5 + 49) = self->external_pager;
    *(_BYTE *)(v5 + 50) = self->share_mode;
    *(_DWORD *)(v5 + 52) = self->purgeable;
    *(_OWORD *)(v5 + 160) = 0u;
    *(_OWORD *)(v5 + 176) = 0u;
    self->virtual_pages = 0;
    *(_QWORD *)(v5 + 88) = 0;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_DWORD *)(v5 + 104) = self->user_tag;
    *(_QWORD *)(v5 + 112) = self->object_id;
    *(_DWORD *)(v5 + 128) = self->nesting_depth;
    v7 = *(_BYTE *)(v5 + 132) & 0xFE | *((_BYTE *)self + 132) & 1;
    *(_BYTE *)(v5 + 132) = v7;
    v8 = v7 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 132) >> 1) & 1));
    *(_BYTE *)(v5 + 132) = v8;
    v9 = v8 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 132) >> 2) & 1));
    *(_BYTE *)(v5 + 132) = v9;
    v10 = v9 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 132) >> 3) & 1));
    *(_BYTE *)(v5 + 132) = v10;
    *(_BYTE *)(v5 + 132) = v10 & 0xEF | *((_BYTE *)self + 132) & 0x10;
    *(_QWORD *)(v5 + 136) = self->mallocBlockCount;
    *(_DWORD *)(v5 + 144) = self->mallocTypeFlag;
    *(_DWORD *)(v5 + 236) = self->exclaveFlags;
    *(_BYTE *)(v5 + 232) = self->isExclaveRegion;
    *(_DWORD *)(v5 + 148) = self->zone_index;
  }
  return (id)v5;
}

- (VMUVMRegion)init
{
  VMUVMRegion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUVMRegion;
  result = -[VMUVMRegion init](&v3, sel_init);
  if (result)
    result->zone_index = -1;
  return result;
}

- (BOOL)hasSameInfoAsRegion:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = *(_QWORD *)&self->prot == v4[3]
    && self->share_mode == *((unsigned __int8 *)v4 + 50)
    && self->user_tag == *((_DWORD *)v4 + 26)
    && self->purgeable == *((_DWORD *)v4 + 13)
    && self->object_id == v4[14];

  return v5;
}

- (BOOL)isSanitizer
{
  return !self->isExclaveRegion && self->user_tag == 99;
}

- (BOOL)isUnsharedPmap
{
  return !self->isExclaveRegion && self->user_tag == 35;
}

- (BOOL)isOwnedUnmappedMemory
{
  return !self->isExclaveRegion && self->user_tag == -1;
}

- (BOOL)isSubmap
{
  return *((_BYTE *)self + 132) & 1;
}

- (BOOL)isNullRegion
{
  return !self->user_tag && !self->prot && self->maxProt == 0;
}

- (void)addInfoFromRegion:(id)a3
{
  unint64_t shared_now_private_size;
  unint64_t dirty_size;
  unint64_t purgable_non_vol_size;
  unint64_t pages_resident;
  unint64_t pages_swapped_out;

  self->range.length += *((_QWORD *)a3 + 2);
  shared_now_private_size = self->shared_now_private_size;
  self->resident_size += *((_QWORD *)a3 + 20);
  self->shared_now_private_size = shared_now_private_size + *((_QWORD *)a3 + 21);
  dirty_size = self->dirty_size;
  self->swapped_out_size += *((_QWORD *)a3 + 22);
  self->dirty_size = dirty_size + *((_QWORD *)a3 + 23);
  purgable_non_vol_size = self->purgable_non_vol_size;
  self->purgable_vol_size += *((_QWORD *)a3 + 24);
  self->purgable_non_vol_size = purgable_non_vol_size + *((_QWORD *)a3 + 25);
  self->purgable_empty_size += *((_QWORD *)a3 + 26);
  pages_resident = self->pages_resident;
  self->virtual_pages += *((_QWORD *)a3 + 7);
  self->pages_resident = pages_resident + *((_QWORD *)a3 + 8);
  pages_swapped_out = self->pages_swapped_out;
  self->pages_shared_now_private += *((_QWORD *)a3 + 9);
  self->pages_swapped_out = pages_swapped_out + *((_QWORD *)a3 + 10);
  self->pages_dirtied += *((_QWORD *)a3 + 11);
  ++self->coalesced_region_count;
}

- (BOOL)isAnalysisToolRegion
{
  return !self->isExclaveRegion && self->user_tag == 10;
}

- (_VMURange)range
{
  unint64_t length;
  unint64_t location;
  _VMURange result;

  length = self->range.length;
  location = self->range.location;
  result.length = length;
  result.location = location;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 2);
}

- (VMUVMRegion)initWithVMRegionData:(_VMUVMRegionData *)a3 encodedVersion:(int64_t)a4 simpleSerializer:(id)a5 error:(id *)a6
{
  id v10;
  char *v11;
  VMUVMRegion *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  uint64_t v27;
  objc_super v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VMUVMRegion;
  v11 = -[VMUVMRegion init](&v28, sel_init);
  if (!v11)
    goto LABEL_6;
  v27 = 0;
  if (!a6)
    a6 = (id *)&v27;
  if (a4 == 1)
  {
    fwrite("Memory graph file content is obsolete development version, no longer supported\n", 0x4FuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    exit(1);
  }
  if (objc_msgSend((id)objc_opt_class(), "version", v27) < a4)
    goto LABEL_6;
  if (!a3)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("The provided memory graph file is corrupted");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = (const __CFString **)v32;
    v24 = &v31;
LABEL_14:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("VMUVMRegionDomain"), 1, v25);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  *(_OWORD *)(v11 + 8) = *(_OWORD *)&a3->var0;
  *((_DWORD *)v11 + 6) = a3->var3;
  *((_DWORD *)v11 + 7) = a3->var4;
  if (!v10)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("The provided memory graph file is corrupted");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v30;
    v24 = &v29;
    goto LABEL_14;
  }
  v13 = objc_msgSend(v10, "copyDeserializedStringWithID:error:", a3->var5, a6);
  v14 = (void *)*((_QWORD *)v11 + 4);
  *((_QWORD *)v11 + 4) = v13;

  if (*a6)
    goto LABEL_15;
  v15 = objc_msgSend(v10, "copyDeserializedStringWithID:error:", a3->var6, a6);
  v16 = (void *)*((_QWORD *)v11 + 5);
  *((_QWORD *)v11 + 5) = v15;

  if (*a6)
    goto LABEL_15;
  *((_DWORD *)v11 + 26) = a3->var7;
  *((_DWORD *)v11 + 32) = a3->var8;
  *((_QWORD *)v11 + 12) = a3->var9;
  *((_DWORD *)v11 + 13) = a3->var10;
  *((_QWORD *)v11 + 14) = a3->var11;
  v11[49] = a3->var12;
  v11[50] = a3->var13;
  *((_QWORD *)v11 + 17) = a3->var15;
  *((_DWORD *)v11 + 36) = a3->var16;
  *((_DWORD *)v11 + 37) = a3->var2;
  v17 = v11[132] & 0xFE | *((_BYTE *)a3 + 68) & 1;
  v11[132] = v17;
  v18 = v17 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)a3 + 68) >> 1) & 1));
  v11[132] = v18;
  v19 = v18 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)a3 + 68) >> 2) & 1));
  v11[132] = v19;
  v20 = v19 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)a3 + 68) >> 3) & 1));
  v11[132] = v20;
  v11[132] = v20 & 0xEF | *((_BYTE *)a3 + 68) & 0x10;
  *((_QWORD *)v11 + 20) = a3->var23;
  *((_QWORD *)v11 + 21) = a3->var24;
  *((_QWORD *)v11 + 22) = a3->var25;
  *((_QWORD *)v11 + 23) = a3->var26;
  *((_QWORD *)v11 + 24) = a3->var27;
  *((_QWORD *)v11 + 25) = a3->var28;
  *((_QWORD *)v11 + 26) = a3->var29;
  *((_DWORD *)v11 + 38) = 1;
LABEL_6:
  v12 = v11;
LABEL_16:

  return v12;
}

- (void)setVMRegionDataExtra:(_VMUVMRegionDataExtra *)a3
{
  self->offset = a3->var0;
  self->reusable_size = a3->var1;
}

- (void)setVMRegionExclaveFlagsData:(_VMUVMRegionExclaveFlagsData *)a3
{
  self->exclaveFlags = a3->var0;
  self->isExclaveRegion = 1;
}

- (void)getVMRegionData:(_VMUVMRegionData *)a3 withSimpleSerializer:(id)a4
{
  NSString *type;
  id v7;
  unint64_t ref_count;
  unint64_t object_id;

  *(_VMURange *)&a3->var0 = self->range;
  a3->var3 = self->prot;
  a3->var4 = self->maxProt;
  type = self->type;
  v7 = a4;
  a3->var5 = objc_msgSend(v7, "serializeString:", type);
  LODWORD(type) = objc_msgSend(v7, "serializeString:", self->path);

  a3->var6 = type;
  a3->var7 = self->user_tag;
  ref_count = self->ref_count;
  a3->var8 = self->nesting_depth;
  a3->var9 = ref_count;
  object_id = self->object_id;
  a3->var10 = self->purgeable;
  a3->var11 = object_id;
  a3->var12 = self->external_pager;
  a3->var13 = self->share_mode;
  a3->var15 = self->mallocBlockCount;
  a3->var16 = self->mallocTypeFlag;
  a3->var2 = self->zone_index;
  LODWORD(object_id) = *((_DWORD *)a3 + 17) & 0xFFFFFFFE | *((_BYTE *)self + 132) & 1;
  *((_DWORD *)a3 + 17) = object_id;
  LODWORD(object_id) = object_id & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 132) >> 1) & 1));
  *((_DWORD *)a3 + 17) = object_id;
  LODWORD(object_id) = object_id & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 132) >> 2) & 1));
  *((_DWORD *)a3 + 17) = object_id;
  LODWORD(object_id) = object_id & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 132) >> 3) & 1));
  *((_DWORD *)a3 + 17) = object_id;
  *((_DWORD *)a3 + 17) = object_id & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 132) >> 4) & 1));
  a3->var23 = self->resident_size;
  a3->var24 = self->shared_now_private_size;
  a3->var25 = self->swapped_out_size;
  a3->var26 = self->dirty_size;
  a3->var27 = self->purgable_vol_size;
  a3->var28 = self->purgable_non_vol_size;
  a3->var29 = self->purgable_empty_size;
}

- (void)getVMRegionDataExtra:(_VMUVMRegionDataExtra *)a3
{
  a3->var0 = self->offset;
  a3->var1 = self->reusable_size;
}

- (void)getVMRegionExclaveFlagsData:(_VMUVMRegionExclaveFlagsData *)a3
{
  a3->var0 = self->exclaveFlags;
}

+ (id)columnHeadersWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "columnHeadersWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:", a3, a4, 1, 0);
}

+ (id)columnHeadersWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4 memorySizeDivisor:(unsigned int)a5 hasFractionalPageSizes:(BOOL)a6
{
  _BOOL4 v6;
  __int16 v7;
  _BOOL4 v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  const char *v18;
  void *v19;

  v6 = a6;
  v7 = a3;
  v8 = a5 > 1;
  v9 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10 = !v8 || !v6;
  v11 = 6;
  if (v8 && v6)
    v12 = 8;
  else
    v12 = 6;
  if (!v10)
    v11 = 8;
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%*s"), v11, "VSIZE");
  v14 = v13;
  if ((v7 & 4) != 0)
  {
    objc_msgSend(v13, "appendFormat:", CFSTR(" %*s"), v12, "RSDNT");
    if ((v7 & 8) == 0)
    {
LABEL_8:
      if ((v7 & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v14, "appendFormat:", CFSTR(" %*s"), v12, "DIRTY");
  if ((v7 & 0x800) != 0)
LABEL_9:
    objc_msgSend(v14, "appendFormat:", CFSTR(" %*s"), v12, "SWAP");
LABEL_10:
  v15 = maxVMAddressWidth_addressWidth;
  if (!maxVMAddressWidth_addressWidth)
  {
    v16 = flsll(0xFC0000000);
    v17 = v16 + 3;
    if (v16 < -3)
      v17 = v16 + 6;
    v15 = (v17 >> 2);
    maxVMAddressWidth_addressWidth = v17 >> 2;
  }
  if ((v7 & 0x10) != 0)
    v18 = " PURGE  ";
  else
    v18 = "";
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%-*s %*s-%-*s [%@] %s/%s %s%s  %s"), 24, "REGION TYPE", v15, "START ", v15, " END", v14, "PRT", "MAX", "SHRMOD", v18, "REGION DETAIL");

  return v19;
}

- (id)descriptionWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  return -[VMUVMRegion descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:](self, "descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:", a3, a4, 1, 0);
}

- (BOOL)isIOSurface
{
  return !self->isExclaveRegion && self->user_tag == 88;
}

- (BOOL)isKernelPageTableMemory
{
  return !self->isExclaveRegion && self->user_tag == -2;
}

- (BOOL)isMallocHeapRelated
{
  if (!self->isExclaveRegion)
    return vm_tag_is_malloc();
  if ((self->exclaveFlags & 0x10000) != 0)
    return 1;
  return self->user_tag == 13;
}

- (void)setAsMallocRegion
{
  self->user_tag = 1;
}

- (BOOL)ignoreRegionDuringScanning
{
  return !self->isExclaveRegion && self->user_tag == 10;
}

- (BOOL)willNotHoldPointers
{
  _BOOL4 v2;
  unsigned int user_tag;
  BOOL v4;
  BOOL v5;
  uint64_t v6;

  if (self->isExclaveRegion)
  {
    return (BYTE2(self->exclaveFlags) >> 2) & 1;
  }
  else
  {
    user_tag = self->user_tag;
    v4 = user_tag == 100;
    if (user_tag == 88)
      v4 = 1;
    v5 = user_tag > 0x3D;
    v6 = (1 << user_tag) & 0x3000000080300000;
    LOBYTE(v2) = !v5 && v6 != 0 || v4;
  }
  return v2;
}

- (BOOL)isActivityTracing
{
  return !self->isExclaveRegion && self->user_tag == 78;
}

- (BOOL)isFoundation
{
  return !self->isExclaveRegion && self->user_tag == 41;
}

- (BOOL)isJavascriptJitExecutableAllocator
{
  return !self->isExclaveRegion && self->user_tag == 64;
}

- (id)descriptionWithOptions:(unint64_t)a3 maximumLength:(unint64_t)a4 memorySizeDivisor:(unsigned int)a5 hasFractionalPageSizes:(BOOL)a6
{
  void *v11;
  NSString *path;
  __CFString *v13;
  __CFString *v14;
  _BOOL4 v15;
  uint64_t v16;
  VMUVMRegion *v17;
  NSString *type;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  char v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  int v32;
  char v33;
  __CFString *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  id v38;
  void *v39;
  const __CFString *v40;
  __CFString *v41;
  BOOL v42;
  const __CFString *v43;
  const __CFString *v44;
  id v45;
  uint64_t purgeable;
  uint64_t v47;
  __CFString *v48;
  __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  __CFString *v58;
  void *v59;
  uint64_t v60;
  int v61;
  char v62;
  __CFString *v63;
  void *v64;
  int v65;
  char v66;
  __CFString *v67;
  void *v68;
  int v69;
  char v70;
  __CFString *v71;
  void *v72;
  __CFString *v73;
  void *v74;
  unint64_t location;
  int v76;
  int v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  unsigned int v81;
  const char *v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v11 = (void *)MEMORY[0x1A85A9758](self, a2);
  path = self->path;
  if (!path)
  {
    v14 = &stru_1E4E04720;
    goto LABEL_23;
  }
  if ((a3 & 2) != 0)
  {
    -[NSString lastPathComponent](path, "lastPathComponent");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = path;
  }
  v14 = v13;
  v15 = -[VMUVMRegion isIOSurface](self, "isIOSurface");
  if ((a3 & 1) == 0 && v15)
  {
    v16 = getPathWidth_nonPathLength;
    if (!getPathWidth_nonPathLength)
    {
      v17 = objc_alloc_init(VMUVMRegion);
      type = v17->type;
      v17->type = (NSString *)&stru_1E4E04720;

      -[VMUVMRegion descriptionWithOptions:maximumLength:](v17, "descriptionWithOptions:maximumLength:", a3, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      getPathWidth_nonPathLength = objc_msgSend(v19, "length");

      v16 = getPathWidth_nonPathLength;
    }
    v20 = v16 + 16;
    v21 = a4 - v16;
    if (v20 <= a4)
      v22 = v21;
    else
      v22 = 16;
    if (v22 < -[__CFString length](v14, "length"))
    {
      v23 = -[__CFString length](v14, "length") - v22 + 3;
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString substringFromIndex:](v14, "substringFromIndex:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("...%@"), v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v14 = (__CFString *)v26;
    }
  }
  if ((a3 & 0x80000) != 0)
  {
    v27 = -[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("/System/Library/Frameworks/"));
    v28 = v27;
    v29 = v14;
    if (v27)
    {
      -[__CFString substringFromIndex:](v14, "substringFromIndex:", objc_msgSend(CFSTR("/System/Library/Frameworks/"), "length"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/S/L/F/"), "stringByAppendingString:", v30);
      v29 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    }
    v31 = v29;

    if ((v28 & 1) != 0)
      goto LABEL_19;
    v32 = -[__CFString hasPrefix:](v31, "hasPrefix:", CFSTR("/System/Library/PrivateFrameworks/"));
    v33 = v32;
    v34 = v31;
    if (v32)
    {
      -[__CFString substringFromIndex:](v31, "substringFromIndex:", objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/"), "length"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/S/L/PF/"), "stringByAppendingString:", v35);
      v34 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    }
    v14 = v34;

    if ((v33 & 1) == 0)
    {
      v61 = -[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("/System/Library/"));
      v62 = v61;
      v63 = v14;
      if (v61)
      {
        -[__CFString substringFromIndex:](v14, "substringFromIndex:", objc_msgSend(CFSTR("/System/Library/"), "length"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("/S/L/"), "stringByAppendingString:", v64);
        v63 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

      }
      v31 = v63;

      if ((v62 & 1) == 0)
      {
        v65 = -[__CFString hasPrefix:](v31, "hasPrefix:", CFSTR("/usr/lib/system/"));
        v66 = v65;
        v67 = v31;
        if (v65)
        {
          -[__CFString substringFromIndex:](v31, "substringFromIndex:", objc_msgSend(CFSTR("/usr/lib/system/"), "length"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("/u/l/s/"), "stringByAppendingString:", v68);
          v67 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

        }
        v14 = v67;

        if ((v66 & 1) != 0)
          goto LABEL_23;
        v69 = -[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("/usr/lib/"));
        v70 = v69;
        v71 = v14;
        if (v69)
        {
          -[__CFString substringFromIndex:](v14, "substringFromIndex:", objc_msgSend(CFSTR("/usr/lib/"), "length"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("/u/l/"), "stringByAppendingString:", v72);
          v71 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

        }
        v31 = v71;

        if ((v70 & 1) == 0)
        {
          v73 = v31;
          if (-[__CFString hasPrefix:](v31, "hasPrefix:", CFSTR("/private/var/mobile/")))
          {
            -[__CFString substringFromIndex:](v31, "substringFromIndex:", objc_msgSend(CFSTR("/private/var/mobile/"), "length"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("~mobile/"), "stringByAppendingString:", v74);
            v73 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

          }
          v14 = v73;

          goto LABEL_23;
        }
      }
LABEL_19:
      v14 = v31;
    }
  }
LABEL_23:
  if (a5 > 1 && a6)
    v36 = 8;
  else
    v36 = 6;
  if ((a3 & 0x200) != 0)
    v37 = 0;
  else
    v37 = v36;
  v38 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v39 = v38;
  if ((a3 & 0x200) != 0)
    objc_msgSend(v38, "appendString:", CFSTR("V="));
  objc_msgSend(v39, "appendFormat:", CFSTR("%*s"), v37, pageCountString(self->range.length, a5, a6));
  if ((a3 & 4) != 0)
  {
    if ((a3 & 0x200) != 0)
      v43 = CFSTR(" R=");
    else
      v43 = CFSTR(" ");
    objc_msgSend(v39, "appendString:", v43);
    objc_msgSend(v39, "appendFormat:", CFSTR("%*s"), v37, pageCountString(self->resident_size, a5, a6));
    if ((a3 & 8) == 0)
    {
LABEL_33:
      if ((a3 & 0x800) == 0)
        goto LABEL_38;
      goto LABEL_34;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_33;
  }
  if ((a3 & 0x200) != 0)
    v44 = CFSTR(" D=");
  else
    v44 = CFSTR(" ");
  objc_msgSend(v39, "appendString:", v44);
  objc_msgSend(v39, "appendFormat:", CFSTR("%*s"), v37, pageCountString(self->dirty_size, a5, a6));
  if ((a3 & 0x800) != 0)
  {
LABEL_34:
    if ((a3 & 0x200) != 0)
      v40 = CFSTR(" S=");
    else
      v40 = CFSTR(" ");
    objc_msgSend(v39, "appendString:", v40);
    objc_msgSend(v39, "appendFormat:", CFSTR("%*s"), v37, pageCountString(self->swapped_out_size, a5, a6));
  }
LABEL_38:
  v41 = &stru_1E4E04720;
  if ((a3 & 0x10) != 0)
  {
    if (self->purgeable == 3)
    {
      if (-[NSString length](self->path, "length"))
        v42 = (a3 & 0x80000) == 0;
      else
        v42 = 0;
      if (v42)
        v41 = CFSTR("        ");
      else
        v41 = &stru_1E4E04720;
    }
    else
    {
      v45 = objc_alloc(MEMORY[0x1E0CB3940]);
      purgeable = self->purgeable;
      if (purgeable > 3)
        v47 = 63;
      else
        v47 = dword_1A4E21D20[purgeable];
      v41 = (__CFString *)objc_msgSend(v45, "initWithFormat:", CFSTR(" PURGE=%c"), v47);
    }
  }
  v48 = (__CFString *)self->type;
  if (!v48)
    v48 = &stru_1E4E04720;
  v49 = v48;
  if ((unint64_t)-[__CFString length](v49, "length") >= 0x19)
  {
    -[__CFString substringToIndex:](v49, "substringToIndex:", 24);
    v50 = objc_claimAutoreleasedReturnValue();

    v49 = (__CFString *)v50;
  }
  if ((a3 & 0x2000) == 0)
  {
    if ((a3 & 0x200) == 0)
    {
      v51 = maxVMAddressWidth_addressWidth;
      if (!maxVMAddressWidth_addressWidth)
      {
        v52 = flsll(0xFC0000000);
        v53 = v52 + 3;
        if (v52 < -3)
          v53 = v52 + 6;
        v51 = (v53 >> 2);
        maxVMAddressWidth_addressWidth = v53 >> 2;
      }
      if (-[VMUVMRegion isOwnedUnmappedMemory](self, "isOwnedUnmappedMemory"))
      {
        v54 = (void *)MEMORY[0x1E0CB3940];
        v55 = "unmapped";
      }
      else
      {
        if (!-[VMUVMRegion isKernelPageTableMemory](self, "isKernelPageTableMemory"))
        {
          location = self->range.location;
          if (location < 0xFC0000001)
          {
            v60 = 24;
          }
          else
          {
            v76 = flsll(location);
            v77 = v76 + 3;
            if (v76 < -3)
              v77 = v76 + 6;
            v78 = (v77 >> 2);
            if ((int)v78 < (int)v51)
              -[VMUVMRegion descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:].cold.1();
            v60 = (v51 - v78 + 24);
            location = self->range.location;
            v51 = v78;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%*llx"), v51, location);
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%-*llx"), v51, self->range.length + self->range.location);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
        v54 = (void *)MEMORY[0x1E0CB3940];
        v55 = "kernel";
      }
      objc_msgSend(v54, "stringWithFormat:", CFSTR("%*s"), v51, v55);
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%-*s"), v51, v55);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 24;
LABEL_103:
      v79 = (void *)MEMORY[0x1E0CB3940];
      v80 = -[__CFString UTF8String](objc_retainAutorelease(v49), "UTF8String");
      v81 = self->share_mode - 1;
      if (v81 > 6)
        v82 = "   ";
      else
        v82 = off_1E4E03928[(char)v81];
      objc_msgSend(v79, "stringWithFormat:", CFSTR("%-*s %@-%@ [%@] %s/%s SM=%s%@  %@"), v60, v80, v58, v59, v39, off_1E4E038E8[self->prot & 7], off_1E4E038E8[self->maxProt & 7], v82, v41, v14);
      goto LABEL_107;
    }
    if (-[VMUVMRegion isOwnedUnmappedMemory](self, "isOwnedUnmappedMemory"))
    {
      v58 = CFSTR("unmapped");
    }
    else
    {
      if (!-[VMUVMRegion isKernelPageTableMemory](self, "isKernelPageTableMemory"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), self->range.location);
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), self->range.length + self->range.location);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_100;
      }
      v58 = CFSTR("kernel");
    }
    v59 = v58;
LABEL_100:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  %@-%@ [%@] %s/%s  %@"), -[__CFString UTF8String](objc_retainAutorelease(v49), "UTF8String"), v58, v59, v39, off_1E4E038E8[self->prot & 7], off_1E4E038E8[self->maxProt & 7], v14, v84, v85, v86);
LABEL_107:
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_108;
  }
  if (-[__CFString isEqualToString:](v49, "isEqualToString:", CFSTR("__DATA")))
  {
    -[__CFString lastPathComponent](v14, "lastPathComponent");
    v56 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v56;
  }
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v49, v14);
LABEL_108:

  objc_autoreleasePoolPop(v11);
  return v57;
}

- (id)description
{
  return -[VMUVMRegion descriptionWithOptions:maximumLength:](self, "descriptionWithOptions:maximumLength:", 513, 0);
}

- (unint64_t)address
{
  return self->range.location;
}

- (unint64_t)length
{
  return self->range.length;
}

- (id)type
{
  return self->type;
}

- (id)path
{
  return self->path;
}

- (unsigned)protection
{
  return self->prot;
}

- (unsigned)maxProtection
{
  return self->maxProt;
}

- (BOOL)isWired
{
  return (*((unsigned __int8 *)self + 132) >> 4) & 1;
}

- (unint64_t)dirtyLength
{
  unint64_t v2;
  unint64_t purgable_vol_size;
  BOOL v4;
  unint64_t v5;

  v2 = self->swapped_out_size + self->dirty_size;
  purgable_vol_size = self->purgable_vol_size;
  v4 = v2 >= purgable_vol_size;
  v5 = v2 - purgable_vol_size;
  if (v4)
    return v5;
  else
    return 0;
}

- (BOOL)isUntaggedRegion
{
  unsigned int user_tag;

  user_tag = self->user_tag;
  if (!self->isExclaveRegion)
    return !user_tag && !self->external_pager && self->share_mode != 5;
  return !user_tag && !self->external_pager;
}

- (BOOL)isRootRegion
{
  return (*((_BYTE *)self + 132) & 6) != 0 || -[VMUVMRegion isStack](self, "isStack");
}

- (BOOL)isSpecialPhysFootprintRegion
{
  return -[VMUVMRegion isOwnedUnmappedMemory](self, "isOwnedUnmappedMemory")
      || -[VMUVMRegion isKernelPageTableMemory](self, "isKernelPageTableMemory");
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  void **v5;
  BOOL v6;

  v4 = (char *)a3;
  v5 = (void **)v4;
  v6 = *(_OWORD *)&self->range == *(_OWORD *)(v4 + 8)
    && sameString(self->type, *((void **)v4 + 4))
    && sameString(self->path, v5[5])
    && -[VMUVMRegion hasSameInfoAsRegion:](self, "hasSameInfoAsRegion:", v5);

  return v6;
}

- (id)splitOutRange:(_VMURange)a3 fromRegionIndex:(unint64_t)a4 regions:(id)a5 newZoneName:(id)a6 reason:(id)a7
{
  unint64_t length;
  unint64_t location;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v22;
  VMUVMRegion *v23;
  uint64_t v26;

  length = a3.length;
  location = a3.location;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
  if ((VMUVMRegion *)objc_claimAutoreleasedReturnValue() != self)
    -[VMUVMRegion splitOutRange:fromRegionIndex:regions:newZoneName:reason:].cold.1();

  v16 = VMUIntersectionRange(location, length, self->range.location, self->range.length);
  if (location == v16 && length == v17)
  {
    v18 = location;
  }
  else
  {
    length = v17;
    v18 = v16;
  }
  v19 = self->range.location;
  v20 = self->range.length;
  if (v18 == v19 && v20 == length)
  {
    v23 = self;
    goto LABEL_15;
  }
  if (v18 == v19)
  {
    -[VMUVMRegion breakAtLength:](self, "breakAtLength:", length);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v13, "insertObject:atIndex:", v22, a4 + 1);
    v23 = self;
LABEL_13:

    goto LABEL_15;
  }
  if (v20 + v19 == v18 + length)
  {
    -[VMUVMRegion breakAtLength:](self, "breakAtLength:", v20 - length);
    v23 = (VMUVMRegion *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v13, "insertObject:atIndex:", v23, a4 + 1);
  }
  else
  {
    if (v18 <= v19 || v18 + length >= v20 + v19)
    {
      v23 = 0;
      goto LABEL_15;
    }
    -[VMUVMRegion breakAtLength:](self, "breakAtLength:", v18 - v19);
    v26 = objc_claimAutoreleasedReturnValue();
    v23 = (VMUVMRegion *)v26;
    if (v26)
    {
      objc_msgSend(v13, "insertObject:atIndex:", v26, a4 + 1);
      -[VMUVMRegion breakAtLength:](v23, "breakAtLength:", length);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v13, "insertObject:atIndex:", v22, a4 + 2);
      goto LABEL_13;
    }
  }
LABEL_15:

  return v23;
}

- (void)descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:.cold.1()
{
  __assert_rtn("-[VMUVMRegion descriptionWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:]", "VMUVMRegion.m", 561, "newAddressWidth >= addressWidth");
}

- (void)breakAtLength:(unint64_t)a1 .cold.1(unint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = memorySizeString(a1);
  objc_msgSend(a2, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = 134218498;
  v7 = a1;
  v8 = 2080;
  v9 = v4;
  v10 = 2080;
  v11 = objc_msgSend(v5, "UTF8String");
  _os_log_error_impl(&dword_1A4D79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ignoring request to break region at excess length %llu (%s) for %s\n", (uint8_t *)&v6, 0x20u);

}

- (void)splitOutRange:fromRegionIndex:regions:newZoneName:reason:.cold.1()
{
  __assert_rtn("-[VMUVMRegion splitOutRange:fromRegionIndex:regions:newZoneName:reason:]", "VMUVMRegion.m", 796, "regions[regionIndex] == self");
}

@end
