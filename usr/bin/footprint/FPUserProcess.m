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
  v5 = -[FPProcess initWithBsdInfo:](&v9, "initWithBsdInfo:", a3);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
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
    mach_port_deallocate(mach_task_self_, task);
  v4.receiver = self;
  v4.super_class = (Class)FPUserProcess;
  -[FPUserProcess dealloc](&v4, "dealloc");
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  unsigned int v4;
  void *v5;
  FPUserProcess *v6;
  id v7;
  FILE *v8;
  NSMutableArray *images;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *ownedVmObjects;
  id v13;
  int v14;
  int v15;
  id *v16;
  id v17;
  unsigned __int8 v18;
  char v19;
  FPSharedCache *sharedCache;
  __int128 v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FPMemoryRegion *v27;
  FPMemoryRegion *v28;
  id v29;
  void *v30;
  __CFString *v31;
  void *v32;
  id v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  NSMutableDictionary *v40;
  void *v41;
  FPUserProcess *v42;
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSMutableArray *warnings;
  void *v51;
  char *v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  FPMemoryRegion *v57;
  FPMemoryRegion *v58;
  FPMemoryRegion *v59;
  id *v60;
  unsigned int v61;
  unsigned int v62;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  id *v78;
  id v79;
  uint64_t *v80;
  uint64_t *v81;
  __int128 v82;
  unsigned __int8 v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE v99[128];

  v4 = a3;
  v64 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess memoryRegions](self, "memoryRegions"));

  if (!v5)
  {
    v6 = self;
    if (!-[FPUserProcess _configurePageSize](self, "_configurePageSize"))
    {
      self->_bailedOut = 1;
      v8 = __stderrp;
      images = (NSMutableArray *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPProcess displayString](self, "displayString")));
      fprintf(v8, "%s: skipping due to an error configuring page size for analysis\n", (const char *)-[NSMutableArray UTF8String](images, "UTF8String"));
LABEL_62:

      goto LABEL_63;
    }
    if (-[FPProcess hiddenFromDisplay](self, "hiddenFromDisplay"))
    {
      v7 = v64;
      if (!self)
      {
LABEL_61:

        images = self->_images;
        self->_images = 0;
        goto LABEL_62;
      }
    }
    else
    {
      v10 = objc_autoreleasePoolPush();
      -[FPUserProcess _gatherImageData](self, "_gatherImageData");
      objc_autoreleasePoolPop(v10);
      -[FPUserProcess _gatherPhysFootprint](self, "_gatherPhysFootprint");
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[FPUserProcess _gatherOwnedVmObjects](self, "_gatherOwnedVmObjects"));
      v6 = self;
      ownedVmObjects = self->_ownedVmObjects;
      self->_ownedVmObjects = v11;

      v13 = v64;
    }
    v14 = (v4 >> 1) & 1;
    v15 = (v4 >> 2) & 1;
    v16 = sub_10000DF28((id *)[FPImageEnumerator alloc], v6->_images);
    v17 = objc_alloc_init((Class)NSMutableArray);
    v18 = -[FPProcess hiddenFromDisplay](v6, "hiddenFromDisplay");
    v62 = -[FPProcess breakDownPhysFootprint](v6, "breakDownPhysFootprint");
    objc_opt_self(FPFootprint);
    v19 = byte_100038A08;
    v61 = -[FPUserProcess doOwnedAccountingAdjustments](v6, "doOwnedAccountingAdjustments");
    v95 = 0;
    v96 = &v95;
    v97 = 0x2020000000;
    v98 = 0;
    v89 = 0;
    v90 = &v89;
    v91 = 0x3032000000;
    v92 = sub_10000AA00;
    v93 = sub_10000AA10;
    v94 = 0;
    sharedCache = v6->super._sharedCache;
    if (sharedCache)
      v21 = *(_OWORD *)&sharedCache->_baseAddress;
    else
      v21 = 0uLL;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10000AA18;
    v76[3] = &unk_100029180;
    v82 = v21;
    v83 = v18;
    v76[4] = self;
    v65 = v17;
    v77 = v65;
    v84 = v62;
    v60 = v16;
    v78 = v60;
    v80 = &v89;
    v85 = v14;
    v86 = v15;
    v87 = v61;
    v79 = v64;
    v81 = &v95;
    v88 = v19;
    -[FPUserProcess enumerateRegions:](self, "enumerateRegions:", v76);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_ownedVmObjects, "objectEnumerator"));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v99, 16);
    if (!v23)
    {
LABEL_32:

      v40 = self->_ownedVmObjects;
      self->_ownedVmObjects = 0;

      v41 = (void *)v90[5];
      v42 = self;
      if (v41)
      {
        if (v61)
        {
          v43 = objc_msgSend(v41, "dirtySize");
          if ((unint64_t)v43 >= v96[3])
          {
            objc_msgSend((id)v90[5], "setDirtySize:", (char *)objc_msgSend((id)v90[5], "dirtySize") - v96[3]);
          }
          else
          {
            v44 = objc_msgSend((id)v90[5], "dirtySize");
            v96[3] -= (uint64_t)v44;
            objc_msgSend((id)v90[5], "setDirtySize:", 0);
            v45 = objc_msgSend((id)v90[5], "swappedSize");
            v46 = v96;
            v47 = (void *)v90[5];
            if ((unint64_t)v45 >= v96[3])
            {
              v52 = (char *)objc_msgSend((id)v90[5], "swappedSize") - v46[3];
            }
            else
            {
              v48 = objc_msgSend((id)v90[5], "swappedSize");
              v49 = v96[3] - (_QWORD)v48;
              v96[3] = v49;
              warnings = self->super._warnings;
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Footprint changed while analyzing – unmapped owned physical footprint may be over-counted by %llu bytes"), v49));
              -[NSMutableArray addObject:](warnings, "addObject:", v51);

              v52 = 0;
              v47 = (void *)v90[5];
              v42 = self;
            }
            objc_msgSend(v47, "setSwappedSize:", v52);
          }
        }
        v53 = objc_msgSend((id)v90[5], "dirtySize");
        if ((char *)objc_msgSend((id)v90[5], "swappedSize") + (_QWORD)v53)
        {
          v54 = v90;
          v55 = v90[5];
          if (v55)
          {
            *(_QWORD *)(v55 + 80) = -1;
            v56 = v54[5];
          }
          else
          {
            v56 = 0;
          }
          objc_msgSend(v65, "addObject:", v56);
        }
      }
      if (v62 && v42->_ledgers[0])
      {
        v57 = objc_alloc_init(FPMemoryRegion);
        v58 = v57;
        if (v57)
          v57->_size = v42->_ledgers[0];
        -[FPMemoryRegion setDirtySize:](v57, "setDirtySize:", v42->_ledgers[0]);
        if (v58)
          v58->_start = -1;
        -[FPMemoryRegion setName:](v58, "setName:", CFSTR("page table"));
        if (v58)
        {
          v58->_object_id = -1;
          v58->_share_mode = 2;
        }
        objc_msgSend(v65, "addObject:", v58);

        v42 = self;
      }
      if ((os_variant_has_internal_content("com.apple.footprint") & v62) == 1 && v42->_ledgers[3])
      {
        v59 = objc_alloc_init(FPMemoryRegion);
        -[FPMemoryRegion setCleanSize:](v59, "setCleanSize:", v42->_ledgers[3]);
        if (v59)
          v59->_start = -1;
        -[FPMemoryRegion setName:](v59, "setName:", CFSTR("Conclave"));
        if (v59)
        {
          v59->_object_id = -1;
          v59->_share_mode = 2;
        }
        objc_msgSend(v65, "addObject:", v59);

        v42 = self;
      }
      -[FPProcess setMemoryRegions:](v42, "setMemoryRegions:", v65);

      _Block_object_dispose(&v89, 8);
      _Block_object_dispose(&v95, 8);

      goto LABEL_61;
    }
    v24 = *(_QWORD *)v73;
LABEL_12:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v73 != v24)
        objc_enumerationMutation(v22);
      v26 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v25);
      v71 = 0;
      v69 = 0u;
      v70 = 0u;
      v68 = 0u;
      objc_msgSend(v26, "getBytes:length:", &v68, 56);
      v27 = objc_alloc_init(FPMemoryRegion);
      v28 = v27;
      if (v27)
      {
        v27->_object_id = v68;
        *((_BYTE *)v27 + 8) |= 8u;
        v27->_user_tag = -1;
      }
      v29 = sub_100005F8C((uint64_t)FPMemoryRegion, ((unint64_t)v71 >> 1) & 7);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = sub_100005DE8((uint64_t)FPMemoryRegion, 0xFFFFFFFFLL);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (v30)
      {
        v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@ (%@)"), v32, v30);
        -[FPMemoryRegion setName:](v28, "setName:", v33);

      }
      else
      {
        -[FPMemoryRegion setName:](v28, "setName:", v32);
      }
      if (v28)
      {
        v34 = *((_QWORD *)&v68 + 1);
        v28->_start = -1;
        v28->_size = v34;
        v28->_share_mode = 4;
      }
      v66 = 0;
      v35 = (v71 >> 4) & 3;
      if (v35 != 3 && v35)
      {
        v38 = 0;
        v67 = 0;
        v37 = *((_QWORD *)&v69 + 1);
        v36 = v69 - *((_QWORD *)&v69 + 1);
        if ((v71 & 1) != 0)
        {
LABEL_27:
          v66 = v37 + v38;
          v39 = &v67;
          v37 = 0;
          goto LABEL_28;
        }
      }
      else
      {
        v36 = v70;
        v37 = v69 - v70;
        v38 = *((_QWORD *)&v70 + 1);
        v67 = *((_QWORD *)&v70 + 1);
        if ((v71 & 1) != 0)
          goto LABEL_27;
      }
      v39 = &v66;
LABEL_28:
      *v39 = 0;
      -[FPMemoryRegion setSwappedSize:](v28, "setSwappedSize:", v67);
      -[FPMemoryRegion setDirtySize:](v28, "setDirtySize:", v37);
      -[FPMemoryRegion setCleanSize:](v28, "setCleanSize:", v66);
      -[FPMemoryRegion setReclaimableSize:](v28, "setReclaimableSize:", v36);
      if (v28)
        *((_BYTE *)v28 + 8) = *((_BYTE *)v28 + 8) & 0xFE | (*((_QWORD *)&v69 + 1) != 0);
      objc_msgSend(v65, "addObject:", v28);

      if (v23 == (id)++v25)
      {
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v99, 16);
        if (!v23)
          goto LABEL_32;
        goto LABEL_12;
      }
    }
  }
LABEL_63:

}

- (BOOL)_configurePageSize
{
  return 1;
}

- (id)_gatherOwnedVmObjects
{
  size_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id result;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  size_t v17;

  if (-[FPUserProcess doOwnedAccountingAdjustments](self, "doOwnedAccountingAdjustments"))
  {
    v17 = 0;
    if (!sysctlbyname("vm.get_owned_vmobjects", 0, &v17, &self->_task, 4uLL))
    {
      v3 = v17;
      if (v17)
      {
        v4 = 0;
        v16 = 0;
        do
        {
          v3 += 896;
          v4 = (unint64_t *)malloc_type_realloc(v4, v3, 0xC79432ACuLL);
          v16 = v3;
          if (sysctlbyname("vm.get_owned_vmobjects", v4, &v16, &self->_task, 4uLL))
          {
            sub_1000097B8((id *)&self->super.super.isa, CFSTR("vm.get_owned_vmobjects"));
            free(v4);
            goto LABEL_17;
          }
        }
        while (v3 == v16);
        if (v16)
        {
          if (v16 <= 7)
          {
            v14 = _os_assert_log(0, v5, v6);
            _os_crash(v14);
            __break(1u);
          }
          else if (v16 - 8 >= 56 * *v4)
          {
            v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", *v4);
            if (*v4)
            {
              v8 = 0;
              v9 = (uint64_t *)(v4 + 1);
              do
              {
                v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v9, 56);
                v11 = *v9;
                v9 += 7;
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v12);

                ++v8;
              }
              while (v8 < *v4);
            }
            free(v4);
            return v7;
          }
          v15 = _os_assert_log(0, v5, v6);
          result = (id)_os_crash(v15);
          __break(1u);
          return result;
        }
        free(v4);
      }
      return objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
    }
    if (*__error() != 2)
      sub_1000097B8((id *)&self->super.super.isa, CFSTR("vm.get_owned_vmobjects"));
  }
LABEL_17:
  v7 = 0;
  return v7;
}

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_vm_offset_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t cachedDispositionAddress;
  mach_vm_offset_t v19;
  unint64_t v20;
  BOOL v21;
  int cachedDisposition;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  FPMemoryRegion *v26;
  char v27;
  FPMemoryRegion *pendingUnusedSharedRegion;
  FPMemoryRegion *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  _QWORD v38[4];
  FPMemoryRegion *v39;
  FPUserProcess *v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v5 = a3;
  v6 = -[FPProcess pageSize](self, "pageSize");
  v7 = v6;
  if (!v5)
    goto LABEL_29;
  v8 = v5[10];
  v9 = -(uint64_t)v6;
  v10 = v8 & -(uint64_t)v6;
  if (v8 == -1)
  {
    v12 = (v6 - 2) & v9;
    v13 = v10 != -1;
    v11 = -1;
  }
  else
  {
    v11 = v5[11] + v8;
    v12 = (v6 + v11 - 1) & v9;
    v13 = v10 != v8;
  }
  while (1)
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    if (objc_msgSend(v5, "dirtySize"))
    {
      v31 = _os_assert_log(0, v14, v15);
      _os_crash(v31);
      __break(1u);
      goto LABEL_28;
    }
    if (!objc_msgSend(v5, "swappedSize"))
      break;
LABEL_28:
    v32 = _os_assert_log(0, v16, v17);
    _os_crash(v32);
    __break(1u);
LABEL_29:
    v13 = 0;
    v10 = 0;
    v12 = 0;
    v11 = 0;
    v9 = -(uint64_t)v7;
  }
  v36 = v12 != v11;
  v37 = v13;
  cachedDispositionAddress = self->_cachedDispositionAddress;
  v19 = v10;
  v20 = (v12 - v10) / v7;
  v21 = v10 == cachedDispositionAddress;
  if (v10 == cachedDispositionAddress)
  {
    v34 = v11;
    v35 = v12;
    cachedDisposition = self->_cachedDisposition;
    v23 = v53 + 3;
    v33 = v49;
    v24 = v5;
    if (v5)
    {
      v25 = v7 - v24[10] + (v24[10] & v9);
      if (v24[11] < v25)
        v25 = v24[11];
    }
    else
    {
      v25 = 0;
    }
    v19 = v10 + v7;
    --v20;
    if ((cachedDisposition & 8) != 0 || (cachedDisposition & 0x81) == 1)
    {
LABEL_15:
      *v23 += v25;
    }
    else if ((cachedDisposition & 0x10) != 0)
    {
      v23 = v33 + 3;
      goto LABEL_15;
    }

    v11 = v34;
    v12 = v35;
    v21 = v10 == cachedDispositionAddress;
  }
  if (!v5 || (v5[1] & 4) == 0)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100009BEC;
    v38[3] = &unk_100029130;
    v45 = v21;
    v46 = v37;
    v47 = v36;
    v26 = v5;
    v41 = &v52;
    v42 = &v48;
    v39 = v26;
    v40 = self;
    v43 = v7;
    v44 = v12;
    v27 = sub_100009EC8(self, v19, v20, v38);
    -[FPMemoryRegion setSwappedSize:](v26, "setSwappedSize:", v49[3]);
    -[FPMemoryRegion setDirtySize:](v26, "setDirtySize:", v53[3]);
    pendingUnusedSharedRegion = v39;
    goto LABEL_25;
  }
  if (v10 == cachedDispositionAddress)
  {
    objc_msgSend(v5, "setDirtySize:", v53[3]);
    objc_msgSend(v5, "setSwappedSize:", v49[3]);
  }
  v27 = 1;
  if (v12 != v11 && v20)
  {
    v29 = v5;
    pendingUnusedSharedRegion = self->_pendingUnusedSharedRegion;
    self->_pendingUnusedSharedRegion = v29;
    v27 = 1;
LABEL_25:

  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v27;
}

- (void)enumerateRegions:(id)a3
{
  FPSharedCache *sharedCache;
  mach_vm_size_t v5;
  _QWORD *v6;
  mach_vm_size_t v7;
  unint64_t v8;
  unint64_t v9;
  mach_vm_size_t v10;
  mach_vm_address_t v11;
  unsigned __int8 v12;
  mach_vm_address_t v13;
  void *v14;
  mach_vm_address_t v15;
  kern_return_t v17;
  mach_vm_address_t v18;
  BOOL v19;
  kern_return_t v20;
  mach_error_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  id v26;
  __CFString *v27;
  uint64_t v28;
  unint64_t mappedSize;
  unint64_t slide;
  id v31;
  mach_port_t v32;
  natural_t nesting_depth[2];
  mach_vm_size_t v34;
  mach_vm_address_t v35;
  int v36[4];
  __int128 v37;
  int v38;
  int v39[21];
  mach_msg_type_number_t v40;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[4];
  __int128 v46;
  int v47;

  v31 = a3;
  memset(v39, 0, 76);
  v38 = 0;
  *(_OWORD *)v36 = 0u;
  v37 = 0u;
  v34 = 0;
  v35 = 0;
  sharedCache = self->super._sharedCache;
  if (sharedCache)
  {
    mappedSize = sharedCache->_mappedSize;
    slide = sharedCache->_slide;
    v5 = sharedCache->_baseAddress - slide;
  }
  else
  {
LABEL_55:
    mappedSize = 0;
    slide = 0;
    v5 = 0;
  }
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_images, "firstObject"));
  if (v6)
    v7 = v6[3] + v6[2];
  else
    v7 = 0;
  v40 = 0;
  *(_QWORD *)nesting_depth = 0;
  v32 = 0;

  size = 0;
  v47 = 0;
  *(_OWORD *)info = 0u;
  v46 = 0u;
  object_name = 0;
  v8 = -[FPProcess pageSize](self, "pageSize");
  if (v5)
  {
    v9 = v8;
    v10 = v5;
    v11 = v7;
    do
    {
      address = (v10 >> 1) + (v7 >> 1);
      infoCnt = 9;
      if (mach_vm_region(self->_task, &address, &size, 9, info, &infoCnt, &object_name))
        break;
      if (size + address <= v5)
      {
        v7 = size + address;
        v11 = address;
      }
      else
      {
        if (v7 == address)
          break;
        v10 = (v10 >> 1) + (v7 >> 1) - v9;
      }
    }
    while (v10 > v7 && v10 - v7 > 0x1000000);
  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
  v13 = v5 + slide + mappedSize;
  while (1)
  {
    v14 = objc_autoreleasePoolPush();
    nesting_depth[1] = -1;
    v40 = 9;
    v15 = v35;
    if (v11 - 1 >= v35 || v13 <= v35)
      goto LABEL_25;
    v17 = mach_vm_region(self->_task, &v35, &v34, 9, v36, &v40, &v32);
    if (v17)
      break;
    v18 = v35;
    if (v35 < v15)
    {
      v35 = v15;
LABEL_25:
      v18 = v15;
    }
    if (v18 < v11 || (v5 < v34 + v18 ? (v19 = v18 >= v13) : (v19 = 1), v19))
    {
      v40 = 19;
      v20 = mach_vm_region_recurse(self->_task, &v35, &v34, &nesting_depth[1], v39, &v40);
      v21 = v20;
      if (v40 <= 0x12)
        *(_QWORD *)&v39[17] = v39[14];
      if (v20 == 1 || (v12 & (v39[5] != -1)) != 0)
        goto LABEL_48;
      if (v20)
      {
        v27 = CFSTR("mach_vm_region_recurse");
        goto LABEL_52;
      }
      v22 = v39[5] == -1;
      if (mach_vm_purgable_control(self->_task, v35, 1, (int *)nesting_depth))
        nesting_depth[0] = 3;
      if (v39[12])
      {
        v28 = _os_assert_log(0, v23, v24);
        _os_crash(v28);
        __break(1u);
        goto LABEL_55;
      }
      v12 |= v22;
      if (BYTE2(v39[11])
        && -[FPUserProcess _isAlive](self, "_isAlive")
        && (v25 = proc_regionfilename(self->super._pid, v35, info, 0x400u)) != 0)
      {
        *((_BYTE *)info + v25) = 0;
        v26 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", info);
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
      v39[2] = v36[2];
      *(_QWORD *)v39 = *(_QWORD *)v36;
      *(_QWORD *)&v39[3] = *(_QWORD *)((char *)&v37 + 4);
      memset(&v39[5], 0, 24);
      v39[11] = 16842752;
      v39[12] = v37;
      v39[13] = HIDWORD(v37);
      v39[14] = 1;
      LOWORD(v39[15]) = v38;
      v39[16] = 0;
      *(_QWORD *)&v39[17] = 1;
      nesting_depth[0] = 3;
    }
    if (((*((uint64_t (**)(id, mach_vm_address_t, mach_vm_size_t, int *, _QWORD, id, _QWORD, _QWORD))v31 + 2))(v31, v35, v34, v39, nesting_depth[0], v26, 0, 0) & 1) != 0)goto LABEL_49;
    v35 += v34;
    objc_autoreleasePoolPop(v14);

  }
  v21 = v17;
  if (v17 == 1)
  {
LABEL_48:
    v26 = 0;
LABEL_49:

    goto LABEL_53;
  }
  v27 = CFSTR("mach_vm_region");
LABEL_52:
  sub_10000A484(self, v21, v27);
LABEL_53:
  objc_autoreleasePoolPop(v14);

}

- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4
{
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_vm_offset_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  int v25;
  int v26;
  char v27;
  _QWORD v28[4];
  _QWORD v29[6];

  v6 = a3;
  v9 = -[FPProcess pageSize](self, "pageSize");
  if (v6)
  {
    if ((v6[8] & 8) == 0)
    {
      v10 = v6[8] & 1;
      v11 = *((_QWORD *)v6 + 10);
      if (v11 == -1)
        v12 = -1;
      else
        v12 = *((_QWORD *)v6 + 11) + v11;
      goto LABEL_6;
    }
    v19 = _os_assert_log(0, v7, v8);
    _os_crash(v19);
    __break(1u);
  }
  v12 = 0;
  v10 = 0;
  v11 = 0;
LABEL_6:
  v13 = (v9 + v12 - 1) & -(uint64_t)v9;
  v14 = v11 & -(uint64_t)v9;
  if (a4 == 1)
    v15 = 1;
  else
    v15 = 2048;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3010000000;
  v29[3] = &unk_100026CCF;
  v16 = (v13 - v14) / v9;
  if (v6)
    v17 = *((_QWORD *)v6 + 9);
  else
    v17 = 0;
  v29[4] = v17;
  v29[5] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000A80C;
  v20[3] = &unk_100029158;
  v25 = 8;
  v26 = v15;
  v22 = v28;
  v23 = v29;
  v27 = v10;
  v18 = v6;
  v21 = v18;
  v24 = v9;
  sub_100009EC8(self, v14, v16, v20);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);

}

- (BOOL)_populateTask
{
  mach_error_t v2;

  v2 = task_read_for_pid(mach_task_self_, -[FPProcess pid](self, "pid"), &self->_task);
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = self;
  if (-[FPProcess breakDownPhysFootprint](self, "breakDownPhysFootprint") && -[FPUserProcess _isAlive](v2, "_isAlive"))
  {
    if (qword_100038A38 != -1)
      dispatch_once(&qword_100038A38, &stru_100029E98);
    v8 = qword_100038A30;
    if ((qword_100038A30 & 0x8000000000000000) == 0)
    {
      v3 = xmmword_100038A10;
      if ((xmmword_100038A10 & 0x8000000000000000) == 0)
      {
        v4 = malloc_type_malloc(56 * qword_100038A30, 0x100004021716A34uLL);
        if ((ledger(1, -[FPProcess pid](v2, "pid"), v4, &v8) & 0x80000000) != 0)
        {
          sub_1000097B8((id *)&v2->super.super.isa, CFSTR("Unable to retrieve ledger entry info"));
LABEL_14:
          free(v4);
          return;
        }
        if (v3 >= v8)
        {
          v7 = _os_assert_log(0, v5, v6);
          _os_crash(v7);
          __break(1u);
        }
        else
        {
          v2 = (FPUserProcess *)((char *)v2 + 104);
          v2->super.super.isa = (Class)(*((_QWORD *)v4 + 7 * v3) & ~(*((uint64_t *)v4 + 7 * v3) >> 63));
          if (qword_100038A38 == -1)
            goto LABEL_10;
        }
        dispatch_once(&qword_100038A38, &stru_100029E98);
LABEL_10:
        if ((qword_100038A30 & 0x8000000000000000) == 0 && qword_100038A28 >= 1)
          v2->super._sharedCache = (FPSharedCache *)(*((_QWORD *)v4 + 7 * qword_100038A28) & ~(*((uint64_t *)v4
                                                                                               + 7 * qword_100038A28) >> 63));
        goto LABEL_14;
      }
    }
  }
}

- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  id *v4;
  FPSharedCache *v5;
  FPSharedCache *sharedCache;

  v4 = sub_1000064D8((uint64_t)FPSharedCache, (uint64_t)a3);
  v5 = (FPSharedCache *)objc_claimAutoreleasedReturnValue(v4);
  sharedCache = self->super._sharedCache;
  self->super._sharedCache = v5;

}

- (void)_gatherImageData
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  mach_error_t v6;
  __CFString *v7;
  _QWORD v8[7];
  _QWORD v9[5];
  id v10;
  _QWORD v11[3];
  char v12;
  mach_error_t v13;

  v13 = 0;
  v3 = dyld_process_create_for_task(self->_task, &v13);
  if (!v3)
  {
    v6 = v13;
    v7 = CFSTR("dyld_process_create_for_task");
LABEL_7:
    sub_10000A484(self, v6, v7);
    return;
  }
  v4 = v3;
  v13 = 0;
  v5 = dyld_process_snapshot_create_for_process(v3, &v13);
  dyld_process_dispose(v4);
  if (v5)
  {
    -[FPUserProcess _gatherSharedCacheFromDyldSnapshot:](self, "_gatherSharedCacheFromDyldSnapshot:", v5);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = sub_10000AA00;
    v9[4] = sub_10000AA10;
    v10 = objc_alloc_init((Class)NSMutableSet);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000BAE0;
    v8[3] = &unk_1000291D0;
    v8[4] = self;
    v8[5] = v9;
    v8[6] = v11;
    dyld_process_snapshot_for_each_image(v5, v8);
    dyld_process_snapshot_dispose(v5);
    -[NSMutableArray sortUsingComparator:](self->_images, "sortUsingComparator:", &stru_100029210);
    _Block_object_dispose(v9, 8);

    _Block_object_dispose(v11, 8);
    return;
  }
  v6 = v13;
  if (v13)
  {
    v7 = CFSTR("dyld_process_snapshot_create_for_process");
    goto LABEL_7;
  }
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  unsigned int v3;
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
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    if (v6)
    {
      v8 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", v6, 0);
      -[FPAuxData setFormatter:](v8, "setFormatter:", &stru_100029250);
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
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
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
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  unsigned int v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  __CFString *v47;
  __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  __CFString *v56;
  void *v57;
  __CFString *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  char __str[128];

  v8 = a5;
  v9 = v8;
  if (a3 == 100)
  {
    v17 = v8;
    if (self)
    {
      v71 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ioAccelMemoryInfoDetailsAtAddress:for:error:", a4, -[FPProcess pid](self, "pid"), &v71));
      v19 = v71;
      v20 = v19;
      if (v19)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
        -[FPProcess _addGlobalError:](self, "_addGlobalError:", v21);

      }
      if (v18)
      {
        v64 = v9;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Size")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ResidentSize")));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DirtySize")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SurfaceID")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("IsWired")));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("IsPurgeable")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Descriptions")));
        if (objc_msgSend(v24, "unsignedLongLongValue"))
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v24, "unsignedLongLongValue")));
        else
          v58 = CFSTR("-");
        v60 = v25;
        v61 = v24;
        if ((objc_msgSend(v25, "BOOLValue") & 1) != 0)
        {
          v32 = CFSTR("Wired");
        }
        else
        {
          v33 = objc_msgSend(v65, "BOOLValue");
          v32 = CFSTR("Normal");
          if (v33)
            v32 = CFSTR("Purgeable");
        }
        v56 = (__CFString *)v32;
        v62 = v20;
        v63 = v17;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v35 = v26;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, __str, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v68 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(v34, "appendString:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, __str, 16);
          }
          while (v37);
        }

        v40 = NSLocalizedFileSizeDescription(objc_msgSend(v22, "unsignedLongLongValue"), 0, 22020096);
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v40));
        v54 = objc_msgSend(v55, "UTF8String");
        v41 = NSLocalizedFileSizeDescription(objc_msgSend(v23, "unsignedLongLongValue"), 0, 22020096);
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v41));
        v43 = objc_msgSend(v42, "UTF8String");
        v44 = NSLocalizedFileSizeDescription(objc_msgSend(v66, "unsignedLongLongValue"), 0, 22020096);
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v44));
        v46 = objc_msgSend(v45, "UTF8String");
        v47 = objc_retainAutorelease(v58);
        v59 = v22;
        v48 = v47;
        v49 = -[__CFString UTF8String](v47, "UTF8String");
        v50 = -[__CFString UTF8String](v56, "UTF8String");
        v57 = v23;
        v51 = v50;
        v52 = objc_retainAutorelease(v34);
        v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Size:%s Resident:%s Dirty:%s IOSurfaceID:%s State:%s %s"), v54, v43, v46, v49, v51, objc_msgSend(v52, "UTF8String")));

        v17 = v63;
        v9 = v64;
        v20 = v62;
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ioSurfaceExtendedInfoDetailsAtAddress:for:", a4, -[FPProcess pid](self, "pid")));

      if (!v11)
      {
        v16 = 0;
LABEL_22:

        goto LABEL_38;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("surfaceID")));
      v13 = objc_msgSend(v12, "unsignedIntValue");

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PixelFormat")));
      v15 = objc_msgSend(v14, "unsignedIntValue");

      if ((v15 & 0x80000000) != 0)
      {
        if (__maskrune(HIBYTE(v15), 0x800uLL))
          goto LABEL_7;
      }
      else if ((_DefaultRuneLocale.__runetype[HIBYTE(v15)] & 0x800) != 0)
      {
LABEL_7:
        __str[0] = HIBYTE(v15);
        __str[1] = BYTE2(v15);
        __str[2] = BYTE1(v15);
        __str[3] = v15;
        __str[4] = 0;
LABEL_19:
        v27 = objc_alloc((Class)NSMutableString);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Width")));
        v29 = objc_msgSend(v28, "unsignedIntValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Height")));
        v16 = objc_msgSend(v27, "initWithFormat:", CFSTR("SID: %#x  %ux%u (%s)"), v13, v29, objc_msgSend(v30, "unsignedIntValue"), __str);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Name")));
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
