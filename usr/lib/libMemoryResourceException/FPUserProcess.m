@implementation FPUserProcess

- (FPUserProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  FPUserProcess *v5;
  NSMutableArray *v6;
  NSMutableArray *images;
  objc_super v9;

  self->super._pid = a3->pbi_pid;
  -[FPUserProcess _gatherIsTranslated](self, "_gatherIsTranslated");
  v9.receiver = self;
  v9.super_class = (Class)FPUserProcess;
  v5 = -[FPProcess initWithBsdInfo:](&v9, sel_initWithBsdInfo_, a3);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    images = v5->_images;
    v5->_images = v6;

    -[FPUserProcess _gatherPhysFootprint](v5, "_gatherPhysFootprint");
    -[FPUserProcess _gatherLedgers](v5, "_gatherLedgers");
    -[FPUserProcess _gatherIdleExitStatus](v5, "_gatherIdleExitStatus");
  }
  return v5;
}

- (void)dealloc
{
  mach_port_name_t task;
  objc_super v4;

  task = self->_task;
  if (task)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], task);
  v4.receiver = self;
  v4.super_class = (Class)FPUserProcess;
  -[FPUserProcess dealloc](&v4, sel_dealloc);
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  char v4;
  void *v6;
  id v7;
  FILE *v8;
  NSMutableArray *images;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *ownedVmObjects;
  id v13;
  id *v14;
  id v15;
  BOOL v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  FPMemoryRegion *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  NSMutableDictionary *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSMutableArray *warnings;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  FPMemoryRegion *v47;
  FPUserProcess *v48;
  FPMemoryRegion *v49;
  id *v50;
  _BOOL4 v51;
  _BOOL4 v52;
  id v53;
  FPUserProcess *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  id *v68;
  id v69;
  uint64_t *v70;
  uint64_t *v71;
  unint64_t v72;
  unint64_t v73;
  BOOL v74;
  BOOL v75;
  BOOL v76;
  BOOL v77;
  BOOL v78;
  BOOL v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v4 = a3;
  v91 = *MEMORY[0x24BDAC8D0];
  v53 = a4;
  v54 = self;
  -[FPProcess memoryRegions](self, "memoryRegions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_43;
  if (!-[FPUserProcess _configurePageSize](self, "_configurePageSize"))
  {
    self->_bailedOut = 1;
    v8 = (FILE *)*MEMORY[0x24BDAC8D8];
    -[FPProcess displayString](self, "displayString");
    images = (NSMutableArray *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v8, "%s: skipping due to an error configuring page size for analysis\n", (const char *)-[NSMutableArray UTF8String](images, "UTF8String"));
    goto LABEL_42;
  }
  if (-[FPProcess hiddenFromDisplay](self, "hiddenFromDisplay"))
  {
    v7 = v53;
    if (!self)
      goto LABEL_41;
  }
  else
  {
    v10 = (void *)MEMORY[0x2199B3174]();
    -[FPUserProcess _gatherImageData](self, "_gatherImageData");
    objc_autoreleasePoolPop(v10);
    -[FPUserProcess _gatherPhysFootprint](self, "_gatherPhysFootprint");
    -[FPUserProcess _gatherOwnedVmObjects](self, "_gatherOwnedVmObjects");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    ownedVmObjects = self->_ownedVmObjects;
    self->_ownedVmObjects = v11;

    v13 = v53;
  }
  v14 = sub_213462948((id *)[FPImageEnumerator alloc], self->_images);
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = -[FPProcess hiddenFromDisplay](self, "hiddenFromDisplay");
  v52 = -[FPProcess breakDownPhysFootprint](self, "breakDownPhysFootprint");
  v17 = +[FPFootprint isSharingAnalysisDisabled](FPFootprint, "isSharingAnalysisDisabled");
  v51 = -[FPUserProcess doOwnedAccountingAdjustments](self, "doOwnedAccountingAdjustments");
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = sub_213459488;
  v84 = sub_213459498;
  v85 = 0;
  v18 = -[FPSharedCache baseAddress](self->super._sharedCache, "baseAddress");
  v19 = -[FPSharedCache mappedSize](self->super._sharedCache, "mappedSize");
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = sub_2134594A0;
  v66[3] = &unk_24CFC8888;
  v72 = v18;
  v73 = v19;
  v74 = v16;
  v66[4] = self;
  v55 = v15;
  v67 = v55;
  v75 = v52;
  v50 = v14;
  v68 = v50;
  v70 = &v80;
  v76 = (v4 & 2) != 0;
  v77 = (v4 & 4) != 0;
  v78 = v51;
  v69 = v53;
  v71 = &v86;
  v79 = v17;
  -[FPUserProcess enumerateRegions:](self, "enumerateRegions:", v66);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_ownedVmObjects, "objectEnumerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v90, 16);
  if (!v21)
    goto LABEL_24;
  v22 = *(_QWORD *)v63;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v63 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      v58 = 0u;
      objc_msgSend(v24, "getBytes:length:", &v58, 56);
      v25 = objc_alloc_init(FPMemoryRegion);
      -[FPMemoryRegion setObject_id:](v25, "setObject_id:", (_QWORD)v58);
      -[FPMemoryRegion setOwnedExclusivelyByParentProcess:](v25, "setOwnedExclusivelyByParentProcess:", 1);
      -[FPMemoryRegion setUser_tag:](v25, "setUser_tag:", 0xFFFFFFFFLL);
      +[FPMemoryRegion vmLedgerNameForTag:](FPMemoryRegion, "vmLedgerNameForTag:", ((unint64_t)v61 >> 1) & 7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPMemoryRegion categoryNameForTag:](FPMemoryRegion, "categoryNameForTag:", 0xFFFFFFFFLL);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ (%@)"), v27, v26);
        -[FPMemoryRegion setName:](v25, "setName:", v28);

      }
      else
      {
        -[FPMemoryRegion setName:](v25, "setName:", v27);
      }
      -[FPMemoryRegion setSize:](v25, "setSize:", *((_QWORD *)&v58 + 1));
      -[FPMemoryRegion setStart:](v25, "setStart:", -1);
      -[FPMemoryRegion setShare_mode:](v25, "setShare_mode:", 4);
      v56 = 0;
      v29 = (v61 >> 4) & 3;
      if (v29 != 3 && v29)
      {
        v32 = 0;
        v57 = 0;
        v31 = *((_QWORD *)&v59 + 1);
        v30 = v59 - *((_QWORD *)&v59 + 1);
        if ((v61 & 1) == 0)
        {
LABEL_19:
          v33 = &v56;
          goto LABEL_22;
        }
      }
      else
      {
        v30 = v60;
        v31 = v59 - v60;
        v32 = *((_QWORD *)&v60 + 1);
        v57 = *((_QWORD *)&v60 + 1);
        if ((v61 & 1) == 0)
          goto LABEL_19;
      }
      v56 = v31 + v32;
      v33 = &v57;
      v31 = 0;
LABEL_22:
      *v33 = 0;
      -[FPMemoryRegion setSwappedSize:](v25, "setSwappedSize:", v57);
      -[FPMemoryRegion setDirtySize:](v25, "setDirtySize:", v31);
      -[FPMemoryRegion setCleanSize:](v25, "setCleanSize:", v56);
      -[FPMemoryRegion setReclaimableSize:](v25, "setReclaimableSize:", v30);
      -[FPMemoryRegion setWired:](v25, "setWired:", *((_QWORD *)&v59 + 1) != 0);
      objc_msgSend(v55, "addObject:", v25);

    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v90, 16);
  }
  while (v21);
LABEL_24:

  v34 = v54->_ownedVmObjects;
  v54->_ownedVmObjects = 0;

  v35 = (void *)v81[5];
  if (v35)
  {
    if (v51)
    {
      v36 = objc_msgSend(v35, "dirtySize");
      if (v36 >= v87[3])
      {
        objc_msgSend((id)v81[5], "setDirtySize:", objc_msgSend((id)v81[5], "dirtySize") - v87[3]);
      }
      else
      {
        v37 = objc_msgSend((id)v81[5], "dirtySize");
        v87[3] -= v37;
        objc_msgSend((id)v81[5], "setDirtySize:", 0);
        v38 = objc_msgSend((id)v81[5], "swappedSize");
        v39 = v87;
        v40 = (void *)v81[5];
        if (v38 >= v87[3])
        {
          v45 = objc_msgSend((id)v81[5], "swappedSize") - v39[3];
        }
        else
        {
          v41 = objc_msgSend((id)v81[5], "swappedSize");
          v42 = v87[3] - v41;
          v87[3] = v42;
          warnings = v54->super._warnings;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Footprint changed while analyzing – unmapped owned physical footprint may be over-counted by %llu bytes"), v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](warnings, "addObject:", v44);

          v45 = 0;
          v40 = (void *)v81[5];
        }
        objc_msgSend(v40, "setSwappedSize:", v45);
      }
    }
    v46 = objc_msgSend((id)v81[5], "dirtySize");
    if (v46 + objc_msgSend((id)v81[5], "swappedSize"))
    {
      objc_msgSend((id)v81[5], "setStart:", -1);
      objc_msgSend(v55, "addObject:", v81[5]);
    }
  }
  if (v52 && v54->_ledgers[0])
  {
    v47 = objc_alloc_init(FPMemoryRegion);
    -[FPMemoryRegion setSize:](v47, "setSize:", v54->_ledgers[0]);
    -[FPMemoryRegion setDirtySize:](v47, "setDirtySize:", v54->_ledgers[0]);
    -[FPMemoryRegion setStart:](v47, "setStart:", -1);
    -[FPMemoryRegion setName:](v47, "setName:", CFSTR("page table"));
    -[FPMemoryRegion setObject_id:](v47, "setObject_id:", -1);
    -[FPMemoryRegion setShare_mode:](v47, "setShare_mode:", 2);
    objc_msgSend(v55, "addObject:", v47);

  }
  v48 = v54;
  if ((os_variant_has_internal_content() & v52) == 1 && v54->_ledgers[3])
  {
    v49 = objc_alloc_init(FPMemoryRegion);
    -[FPMemoryRegion setCleanSize:](v49, "setCleanSize:", v54->_ledgers[3]);
    -[FPMemoryRegion setStart:](v49, "setStart:", -1);
    -[FPMemoryRegion setName:](v49, "setName:", CFSTR("Conclave"));
    -[FPMemoryRegion setObject_id:](v49, "setObject_id:", -1);
    -[FPMemoryRegion setShare_mode:](v49, "setShare_mode:", 2);
    objc_msgSend(v55, "addObject:", v49);

    v48 = v54;
  }
  -[FPProcess setMemoryRegions:](v48, "setMemoryRegions:", v55);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

LABEL_41:
  images = v54->_images;
  v54->_images = 0;
LABEL_42:

LABEL_43:
}

- (BOOL)_configurePageSize
{
  return 1;
}

- (id)_gatherOwnedVmObjects
{
  size_t v3;
  unint64_t *v4;
  void *v5;
  unint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id result;
  size_t v12;
  size_t v13;

  if (-[FPUserProcess doOwnedAccountingAdjustments](self, "doOwnedAccountingAdjustments"))
  {
    v13 = 0;
    if (!sysctlbyname("vm.get_owned_vmobjects", 0, &v13, &self->_task, 4uLL))
    {
      v3 = v13;
      if (v13)
      {
        v4 = 0;
        v12 = 0;
        do
        {
          v3 += 896;
          v4 = (unint64_t *)malloc_type_realloc(v4, v3, 0xC79432ACuLL);
          v12 = v3;
          if (sysctlbyname("vm.get_owned_vmobjects", v4, &v12, &self->_task, 4uLL))
          {
            sub_213458220((id *)&self->super.super.isa, CFSTR("vm.get_owned_vmobjects"));
            free(v4);
            goto LABEL_17;
          }
        }
        while (v3 == v12);
        if (v12)
        {
          if (v12 <= 7)
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
          }
          else if (v12 - 8 >= 56 * *v4)
          {
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", *v4);
            if (*v4)
            {
              v6 = 0;
              v7 = (uint64_t *)(v4 + 1);
              do
              {
                v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v7, 56);
                v9 = *v7;
                v7 += 7;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v10);

                ++v6;
              }
              while (v6 < *v4);
            }
            free(v4);
            return v5;
          }
          _os_assert_log();
          result = (id)_os_crash();
          __break(1u);
          return result;
        }
        free(v4);
      }
      return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
    }
    if (*__error() != 2)
      sub_213458220((id *)&self->super.super.isa, CFSTR("vm.get_owned_vmobjects"));
  }
LABEL_17:
  v5 = 0;
  return v5;
}

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t cachedDispositionAddress;
  int cachedDisposition;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  mach_vm_offset_t v17;
  char v18;
  FPMemoryRegion *v19;
  FPMemoryRegion *pendingUnusedSharedRegion;
  FPMemoryRegion *v21;
  BOOL result;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[4];
  FPMemoryRegion *v29;
  FPUserProcess *v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v5 = a3;
  v6 = -[FPProcess pageSize](self, "pageSize");
  v7 = objc_msgSend(v5, "start") & -(uint64_t)v6;
  v8 = (v6 + objc_msgSend(v5, "end") - 1) & -(uint64_t)v6;
  v9 = v7 != objc_msgSend(v5, "start");
  v26 = objc_msgSend(v5, "end");
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (objc_msgSend(v5, "dirtySize"))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else if (!objc_msgSend(v5, "swappedSize"))
  {
    v25 = v9;
    cachedDispositionAddress = self->_cachedDispositionAddress;
    v27 = (v8 - v7) / v6;
    if (v7 != cachedDispositionAddress)
    {
      v17 = v7;
      goto LABEL_13;
    }
    cachedDisposition = self->_cachedDisposition;
    v23 = v39;
    v24 = v43;
    v12 = v5;
    v13 = objc_msgSend(v12, "start");
    v14 = objc_msgSend(v12, "size");
    v15 = v6 - v13 + (v13 & -(uint64_t)v6);
    if (v14 < v15)
      v15 = objc_msgSend(v12, "size");
    v17 = v7 + v6;
    --v27;
    v16 = v24 + 3;
    if ((cachedDisposition & 8) == 0 && (cachedDisposition & 0x81) != 1)
    {
      if ((cachedDisposition & 0x10) == 0)
      {
LABEL_12:

LABEL_13:
        if (objc_msgSend(v5, "unusedSharedCacheRegion", v23))
        {
          if (v7 == cachedDispositionAddress)
          {
            objc_msgSend(v5, "setDirtySize:", v43[3]);
            objc_msgSend(v5, "setSwappedSize:", v39[3]);
          }
          v18 = 1;
          if (v8 == v26 || !v27)
            goto LABEL_21;
          v19 = (FPMemoryRegion *)v5;
          pendingUnusedSharedRegion = self->_pendingUnusedSharedRegion;
          self->_pendingUnusedSharedRegion = v19;
          v18 = 1;
        }
        else
        {
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = sub_213458658;
          v28[3] = &unk_24CFC8838;
          v35 = v7 == cachedDispositionAddress;
          v36 = v25;
          v37 = v8 != v26;
          v21 = (FPMemoryRegion *)v5;
          v31 = &v42;
          v32 = &v38;
          v29 = v21;
          v30 = self;
          v33 = v6;
          v34 = v8;
          v18 = sub_21345892C(self, v17, v27, v28);
          -[FPMemoryRegion setSwappedSize:](v21, "setSwappedSize:", v39[3]);
          -[FPMemoryRegion setDirtySize:](v21, "setDirtySize:", v43[3]);
          pendingUnusedSharedRegion = v29;
        }

LABEL_21:
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);

        return v18;
      }
      v16 = v23 + 3;
    }
    *v16 += v15;
    goto LABEL_12;
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

- (void)enumerateRegions:(id)a3
{
  unint64_t v4;
  mach_vm_address_t v5;
  unint64_t v6;
  mach_vm_size_t v7;
  _QWORD *v8;
  mach_vm_size_t v9;
  unint64_t v10;
  unint64_t v11;
  mach_vm_size_t v12;
  mach_vm_address_t v13;
  void *v14;
  mach_vm_address_t v15;
  kern_return_t v17;
  mach_vm_address_t v18;
  BOOL v19;
  kern_return_t v20;
  mach_error_t v21;
  _BOOL4 v22;
  int v23;
  void *v24;
  __CFString *v25;
  unint64_t v26;
  unint64_t v27;
  mach_vm_size_t v28;
  id v29;
  mach_port_t v30;
  natural_t nesting_depth[2];
  mach_vm_size_t v32;
  mach_vm_address_t v33;
  int v34[4];
  __int128 v35;
  int v36;
  int v37[21];
  mach_msg_type_number_t v38;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[4];
  __int128 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  memset(v37, 0, 76);
  v36 = 0;
  *(_OWORD *)v34 = 0u;
  v35 = 0u;
  v32 = 0;
  v33 = 0;
  v4 = -[FPSharedCache baseAddress](self->super._sharedCache, "baseAddress");
  v5 = -[FPSharedCache slide](self->super._sharedCache, "slide");
  v27 = -[FPSharedCache mappedSize](self->super._sharedCache, "mappedSize");
  v26 = -[FPSharedCache slide](self->super._sharedCache, "slide");
  v6 = -[FPSharedCache baseAddress](self->super._sharedCache, "baseAddress");
  v7 = v6 - -[FPSharedCache slide](self->super._sharedCache, "slide");
  -[NSMutableArray firstObject](self->_images, "firstObject");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v8[3] + v8[2];
  else
LABEL_53:
    v9 = 0;
  v28 = v4 - v5;
  v38 = 0;
  *(_QWORD *)nesting_depth = 0;
  v30 = 0;

  size = 0;
  v45 = 0;
  *(_OWORD *)info = 0u;
  v44 = 0u;
  object_name = 0;
  v10 = -[FPProcess pageSize](self, "pageSize");
  if (v7)
  {
    v11 = v10;
    v12 = v7;
    v13 = v9;
    do
    {
      address = (v12 >> 1) + (v9 >> 1);
      infoCnt = 9;
      if (mach_vm_region(self->_task, &address, &size, 9, info, &infoCnt, &object_name))
        break;
      if (size + address <= v7)
      {
        v9 = size + address;
        v13 = address;
      }
      else
      {
        if (v9 == address)
          break;
        v12 = (v12 >> 1) + (v9 >> 1) - v11;
      }
    }
    while (v12 > v9 && v12 - v9 > 0x1000000);
  }
  else
  {
    v13 = 0;
  }
  v4 = 0;
  v5 = v27 + v28 + v26;
  while (1)
  {
    v14 = (void *)MEMORY[0x2199B3174]();
    nesting_depth[1] = -1;
    v38 = 9;
    v15 = v33;
    if (v13 - 1 >= v33 || v5 <= v33)
      goto LABEL_23;
    v17 = mach_vm_region(self->_task, &v33, &v32, 9, v34, &v38, &v30);
    if (v17)
      break;
    v18 = v33;
    if (v33 < v15)
    {
      v33 = v15;
LABEL_23:
      v18 = v15;
    }
    if (v18 < v13 || (v28 < v32 + v18 ? (v19 = v18 >= v5) : (v19 = 1), v19))
    {
      v38 = 19;
      v7 = 96;
      v20 = mach_vm_region_recurse(self->_task, &v33, &v32, &nesting_depth[1], v37, &v38);
      v21 = v20;
      if (v38 <= 0x12)
        *(_QWORD *)&v37[17] = v37[14];
      if (v20 == 1 || (v4 & (v37[5] != -1)) != 0)
        goto LABEL_46;
      if (v20)
      {
        v25 = CFSTR("mach_vm_region_recurse");
        goto LABEL_50;
      }
      v22 = v37[5] == -1;
      if (mach_vm_purgable_control(self->_task, v33, 1, (int *)nesting_depth))
        nesting_depth[0] = 3;
      if (v37[12])
      {
        _os_assert_log();
        v8 = (_QWORD *)_os_crash();
        __break(1u);
        goto LABEL_53;
      }
      v4 = v22 | v4;
      if (BYTE2(v37[11])
        && -[FPUserProcess _isAlive](self, "_isAlive")
        && (v23 = proc_regionfilename(self->super._pid, v33, info, 0x400u)) != 0)
      {
        *((_BYTE *)info + v23) = 0;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", info);
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
      v37[2] = v34[2];
      *(_QWORD *)v37 = *(_QWORD *)v34;
      *(_QWORD *)&v37[3] = *(_QWORD *)((char *)&v35 + 4);
      memset(&v37[5], 0, 24);
      v37[11] = 16842752;
      v37[12] = v35;
      v37[13] = HIDWORD(v35);
      v37[14] = 1;
      LOWORD(v37[15]) = v36;
      v37[16] = 0;
      *(_QWORD *)&v37[17] = 1;
      nesting_depth[0] = 3;
    }
    if (((*((uint64_t (**)(id, mach_vm_address_t, mach_vm_size_t, int *, _QWORD, void *, _QWORD, _QWORD))v29
           + 2))(v29, v33, v32, v37, nesting_depth[0], v24, 0, 0) & 1) != 0)goto LABEL_47;
    v33 += v32;
    objc_autoreleasePoolPop(v14);

  }
  v21 = v17;
  if (v17 == 1)
  {
LABEL_46:
    v24 = 0;
LABEL_47:

    goto LABEL_51;
  }
  v25 = CFSTR("mach_vm_region");
LABEL_50:
  sub_213458F14(self, v21, v25);
LABEL_51:
  objc_autoreleasePoolPop(v14);

}

- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  mach_vm_offset_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  int v21;
  int v22;
  char v23;
  _QWORD v24[4];
  _QWORD v25[4];
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = -[FPProcess pageSize](self, "pageSize");
  v8 = objc_msgSend(v6, "start");
  v9 = objc_msgSend(v6, "end");
  v10 = objc_msgSend(v6, "wired");
  if (objc_msgSend(v6, "ownedExclusivelyByParentProcess"))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    v11 = v8 & -(uint64_t)v7;
    v12 = ((v7 + v9 - 1) & -(uint64_t)v7) - v11;
    if (a4 == 1)
      v13 = 1;
    else
      v13 = 2048;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3010000000;
    v26 = 0;
    v27 = 0;
    v25[3] = &unk_21346A2CD;
    v14 = v12 / v7;
    v26 = objc_msgSend(v6, "offset");
    v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_213459294;
    v16[3] = &unk_24CFC8860;
    v21 = 8;
    v22 = v13;
    v18 = v24;
    v19 = v25;
    v23 = v10;
    v15 = v6;
    v17 = v15;
    v20 = v7;
    sub_21345892C(self, v11, v14, v16);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v25, 8);

  }
}

- (BOOL)_populateTask
{
  mach_error_t v2;

  -[FPProcess pid](self, "pid");
  v2 = task_read_for_pid();
  if (v2)
    mach_error("task_read_for_pid", v2);
  return v2 == 0;
}

- (void)_setIdleExitStatusFromDirtyFlags:(unsigned int)a3
{
  int v3;

  if ((a3 & 4) != 0)
    v3 = 3;
  else
    v3 = 2;
  if ((~a3 & 3) != 0)
    v3 = 1;
  self->super._idleExitStatus = v3;
}

- (void)_gatherIdleExitStatus
{
  uint32_t flags;

  if (-[FPUserProcess _isAlive](self, "_isAlive"))
  {
    flags = 0;
    proc_get_dirty(-[FPProcess pid](self, "pid"), &flags);
    -[FPUserProcess _setIdleExitStatusFromDirtyFlags:](self, "_setIdleExitStatusFromDirtyFlags:", flags);
  }
}

- (void)_gatherPhysFootprint
{
  unint64_t v3;
  _OWORD v4[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (-[FPUserProcess _isAlive](self, "_isAlive"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
    memset(v4, 0, sizeof(v4));
    if (!proc_pid_rusage(self->super._pid, 6, (rusage_info_t *)v4))
    {
      v3 = v16;
      self->_ledgers[1] = *((_QWORD *)&v5 + 1);
      self->_ledgers[2] = v3;
    }
  }
}

- (unint64_t)physFootprint
{
  return self->_ledgers[1];
}

- (void)_gatherLedgers
{
  FPUserProcess *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = self;
  if (-[FPProcess breakDownPhysFootprint](self, "breakDownPhysFootprint") && -[FPUserProcess _isAlive](v2, "_isAlive"))
  {
    if (qword_254B9C618 != -1)
      dispatch_once(&qword_254B9C618, &unk_24CFC9418);
    v5 = qword_254B9C610;
    if ((qword_254B9C610 & 0x8000000000000000) == 0)
    {
      v3 = xmmword_254B9C5F0;
      if ((xmmword_254B9C5F0 & 0x8000000000000000) == 0)
      {
        v4 = malloc_type_malloc(56 * qword_254B9C610, 0x100004021716A34uLL);
        -[FPProcess pid](v2, "pid");
        if ((ledger() & 0x80000000) != 0)
        {
          sub_213458220((id *)&v2->super.super.isa, CFSTR("Unable to retrieve ledger entry info"));
LABEL_14:
          free(v4);
          return;
        }
        if (v3 >= v5)
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
        }
        else
        {
          v2 = (FPUserProcess *)((char *)v2 + 104);
          v2->super.super.isa = (Class)(*((_QWORD *)v4 + 7 * v3) & ~(*((uint64_t *)v4 + 7 * v3) >> 63));
          if (qword_254B9C618 == -1)
            goto LABEL_10;
        }
        dispatch_once(&qword_254B9C618, &unk_24CFC9418);
LABEL_10:
        if ((qword_254B9C610 & 0x8000000000000000) == 0 && qword_254B9C608 >= 1)
          v2->super._sharedCache = (FPSharedCache *)(*((_QWORD *)v4 + 7 * qword_254B9C608) & ~(*((uint64_t *)v4
                                                                                               + 7 * qword_254B9C608) >> 63));
        goto LABEL_14;
      }
    }
  }
}

- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  FPSharedCache *v4;
  FPSharedCache *sharedCache;

  +[FPSharedCache sharedCacheForDyldSnapshot:](FPSharedCache, "sharedCacheForDyldSnapshot:", a3);
  v4 = (FPSharedCache *)objc_claimAutoreleasedReturnValue();
  sharedCache = self->super._sharedCache;
  self->super._sharedCache = v4;

}

- (void)_gatherImageData
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[3];
  char v8;
  mach_error_t v9;

  v9 = 0;
  if (dyld_process_create_for_task())
  {
    v9 = 0;
    v3 = dyld_process_snapshot_create_for_process();
    dyld_process_dispose();
    if (v3)
    {
      -[FPUserProcess _gatherSharedCacheFromDyldSnapshot:](self, "_gatherSharedCacheFromDyldSnapshot:", v3);
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x2020000000;
      v8 = 0;
      v5[0] = 0;
      v5[1] = v5;
      v5[2] = 0x3032000000;
      v5[3] = sub_213459488;
      v5[4] = sub_213459498;
      v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v4 = MEMORY[0x24BDAC760];
      dyld_process_snapshot_for_each_image();
      dyld_process_snapshot_dispose();
      -[NSMutableArray sortUsingComparator:](self->_images, "sortUsingComparator:", &unk_24CFC8918, v4, 3221225472, sub_21345A4C4, &unk_24CFC88D8, self, v5, v7);
      _Block_object_dispose(v5, 8);

      _Block_object_dispose(v7, 8);
    }
  }
  else
  {
    sub_213458F14(self, v9, CFSTR("dyld_process_create_for_task"));
  }
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  int v3;
  unint64_t *ledgers;
  BOOL v5;
  unsigned int v6;
  id v7;
  FPAuxData *v8;
  FPAuxData *v9;
  FPAuxData *v10;

  v3 = -[FPProcess idleExitStatus](self, "idleExitStatus");
  ledgers = self->_ledgers;
  if (self->_ledgers[1])
    v5 = 0;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = v3;
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v6)
    {
      v8 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", v6, 0);
      -[FPAuxData setFormatter:](v8, "setFormatter:", &unk_24CFC8958);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("dirty"));

    }
    if (ledgers[1])
    {
      v9 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", ledgers[1], 0);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("phys_footprint"));

      v10 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", ledgers[2], 0);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("phys_footprint_peak"));

    }
  }
  return v7;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  int v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  __CFString *v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v51;
  id v52;
  void *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  char __str[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = v8;
  if (a3 == 100)
  {
    v17 = v8;
    if (self)
    {
      v69 = 0;
      objc_msgSend(v17, "ioAccelMemoryInfoDetailsAtAddress:for:error:", a4, -[FPProcess pid](self, "pid"), &v69);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v69;
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "localizedDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPProcess _addGlobalError:](self, "_addGlobalError:", v21);

      }
      if (v18)
      {
        v62 = v9;
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFC97B8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFCA7D8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFCA7B8);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFCA6D8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFCA7F8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFCA818);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", 0x24CFCA778);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "unsignedLongLongValue"))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v24, "unsignedLongLongValue"));
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = CFSTR("-");
        }
        v58 = v25;
        v59 = v24;
        if ((objc_msgSend(v25, "BOOLValue") & 1) != 0)
        {
          v32 = CFSTR("Wired");
        }
        else
        {
          v33 = objc_msgSend(v63, "BOOLValue");
          v32 = CFSTR("Normal");
          if (v33)
            v32 = CFSTR("Purgeable");
        }
        v54 = (__CFString *)v32;
        v60 = v20;
        v61 = v17;
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v35 = v26;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, __str, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v66 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(v34, "appendString:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, __str, 16);
          }
          while (v37);
        }

        v53 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v22, "unsignedLongLongValue");
        NSLocalizedFileSizeDescription();
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v51 = objc_msgSend(v52, "UTF8String");
        objc_msgSend(v23, "unsignedLongLongValue");
        NSLocalizedFileSizeDescription();
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v41 = objc_msgSend(v40, "UTF8String");
        objc_msgSend(v64, "unsignedLongLongValue");
        NSLocalizedFileSizeDescription();
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v43 = objc_msgSend(v42, "UTF8String");
        v44 = objc_retainAutorelease(v56);
        v57 = v22;
        v45 = v44;
        v46 = -[__CFString UTF8String](v44, "UTF8String");
        v47 = -[__CFString UTF8String](v54, "UTF8String");
        v55 = v23;
        v48 = v47;
        v49 = objc_retainAutorelease(v34);
        objc_msgSend(v53, "stringWithFormat:", CFSTR("Size:%s Resident:%s Dirty:%s IOSurfaceID:%s State:%s %s"), v51, v41, v43, v46, v48, objc_msgSend(v49, "UTF8String"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v61;
        v9 = v62;
        v20 = v60;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    if (a3 == 88 && self)
    {
      v10 = v8;
      objc_msgSend(v10, "ioSurfaceExtendedInfoDetailsAtAddress:for:", a4, -[FPProcess pid](self, "pid"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v16 = 0;
LABEL_22:

        goto LABEL_38;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", 0x24CFCB6F8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", 0x24CFCA758);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntValue");

      if ((v15 & 0x80000000) != 0)
      {
        if (__maskrune(HIBYTE(v15), 0x800uLL))
          goto LABEL_7;
      }
      else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * HIBYTE(v15) + 60) & 0x800) != 0)
      {
LABEL_7:
        __str[0] = HIBYTE(v15);
        __str[1] = BYTE2(v15);
        __str[2] = BYTE1(v15);
        __str[3] = v15;
        __str[4] = 0;
LABEL_19:
        v27 = objc_alloc(MEMORY[0x24BDD16A8]);
        objc_msgSend(v11, "objectForKeyedSubscript:", 0x24CFCA718);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "unsignedIntValue");
        objc_msgSend(v11, "objectForKeyedSubscript:", 0x24CFCA738);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("SID: %#x  %ux%u (%s)"), v13, v29, objc_msgSend(v30, "unsignedIntValue"), __str);

        objc_msgSend(v11, "objectForKeyedSubscript:", 0x24CFCA6F8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "length"))
          objc_msgSend(v16, "appendFormat:", CFSTR("  '%@'"), v31);

        goto LABEL_22;
      }
      snprintf(__str, 5uLL, "%4d", v15);
      goto LABEL_19;
    }
    v16 = 0;
  }
LABEL_38:

  return v16;
}

- (void)addLedgerData:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t *ledgers;
  unint64_t v5;

  ledgers = self->_ledgers;
  v5 = 4;
  if (a4 < 4)
    v5 = a4;
  memcpy(ledgers, a3, 8 * v5);
}

- (unsigned)task
{
  return self->_task;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUnusedSharedRegion, 0);
  objc_storeStrong((id *)&self->_ownedVmObjects, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
