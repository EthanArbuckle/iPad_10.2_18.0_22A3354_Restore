@implementation FPKernelProcess

- (FPKernelProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  FPKernelProcess *v3;
  FPKernelProcess *v4;
  uint64_t v5;
  NSMutableDictionary *mapsAuxData;
  uint64_t v7;
  NSMutableDictionary *otherAuxData;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FPKernelProcess;
  v3 = -[FPProcess initWithBsdInfo:](&v10, "initWithBsdInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v3->super._idleExitStatus = 1;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    mapsAuxData = v4->_mapsAuxData;
    v4->_mapsAuxData = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    otherAuxData = v4->_otherAuxData;
    v4->_otherAuxData = (NSMutableDictionary *)v7;

  }
  return v4;
}

- (unint64_t)_gatherPageSize
{
  return vm_kernel_page_size;
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  mach_port_t v5;
  kern_return_t v6;
  mach_error_t v7;
  FILE *v8;
  id v9;
  FPKernelProcess *v10;
  const char *v11;
  char *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  mach_zone_name_array_t v17;
  mach_zone_info_array_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t *p_mzi_collectable;
  FPMemoryMultiRegion *v23;
  char *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  kern_return_t v31;
  mach_error_t v32;
  FILE *v33;
  id v34;
  const char *v35;
  char *v36;
  mach_memory_info_array_t v37;
  uint64_t v38;
  id v39;
  id *p_isa;
  uint64_t v41;
  int FlagsForNListOnlyData;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *i;
  void *v54;
  void *v55;
  void **p_cache;
  uint64_t v57;
  uint64_t flags;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  __CFString *v62;
  FPMemoryRegion *v63;
  FPAuxData *v64;
  FPMemoryRegion *v65;
  FPMemoryRegion *v66;
  FPMemoryRegion *v67;
  const __CFString *v68;
  id v69;
  uint64_t flags_low;
  __CFString *v71;
  void *v72;
  uint64_t SourceInfoWithAddressAtTime;
  uint64_t v74;
  uint64_t v75;
  uint64_t Path;
  NSString *v77;
  void *v78;
  kern_return_t v79;
  mach_error_t v80;
  FILE *v81;
  id v82;
  const char *v83;
  char *v84;
  kern_return_t v85;
  mach_error_t v86;
  FILE *v87;
  id v88;
  const char *v89;
  char *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  FPAuxData *v95;
  FPAuxData *v96;
  FPAuxData *v97;
  uint64_t v98;
  void *v99;
  unsigned int v100;
  mach_zone_name_array_t v101;
  void *v102;
  FPKernelProcess *v103;
  uint64_t v104;
  uint64_t v105;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt[2];
  mach_zone_name_array_t names;
  mach_zone_info_array_t info;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  rusage_info_t buffer[2];
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
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;

  names = 0;
  info = 0;
  memory_info = 0;
  *(_QWORD *)infoCnt = 0;
  memory_infoCnt = 0;
  v5 = mach_host_self();
  v6 = mach_memory_info(v5, &names, &infoCnt[1], &info, infoCnt, &memory_info, &memory_infoCnt);
  if (v6)
  {
    v7 = v6;
    v8 = __stderrp;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPProcess displayString](self, "displayString")));
    v10 = self;
    v11 = (const char *)objc_msgSend(v9, "UTF8String");
    v12 = mach_error_string(v7);
    fprintf(v8, "%s: mach_memory_info: %s\n", v11, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess displayString](v10, "displayString"));
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), v13, mach_error_string(v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    -[NSMutableArray addObject:](v10->super._errors, "addObject:", v15);
    goto LABEL_3;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = names;
  v18 = info;
  v19 = infoCnt[1];
  v20 = v16;
  v103 = self;
  if (self && (_DWORD)v19)
  {
    v21 = 0;
    p_mzi_collectable = &v18->mzi_collectable;
    do
    {
      v23 = objc_alloc_init(FPMemoryMultiRegion);
      v24 = strnstr(v17->mzn_name, "kalloc", 0x50uLL);
      v25 = objc_alloc((Class)NSString);
      if (v24)
      {
        v26 = objc_msgSend(v25, "initWithFormat:", CFSTR("kalloc.%llu"), *(p_mzi_collectable - 4));
        -[FPMemoryRegion setName:](v23, "setName:", v26);

        -[FPMemoryMultiRegion setAuxDataName:](v23, "setAuxDataName:", CFSTR("kalloc"));
      }
      else
      {
        v27 = objc_msgSend(v25, "initWithFormat:", CFSTR("%.*s"), 80, v17);
        -[FPMemoryRegion setName:](v23, "setName:", v27);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FPMemoryRegion name](v23, "name"));

      if (!v28)
        -[FPMemoryRegion setName:](v23, "setName:", CFSTR("unknown"));
      v29 = *(p_mzi_collectable - 6);
      v30 = *p_mzi_collectable >> 1;
      -[FPMemoryRegion setDirtySize:](v23, "setDirtySize:", v29 - v30);
      -[FPMemoryRegion setReclaimableSize:](v23, "setReclaimableSize:", v30);
      if (v23)
      {
        v23->super._size = v29;
        v23->super._object_id = v21 | 0x200000000;
      }
      -[FPMemoryMultiRegion setTotalRegions:](v23, "setTotalRegions:", v29 / *(p_mzi_collectable - 4));
      -[FPMemoryMultiRegion setRegionSize:](v23, "setRegionSize:", *(p_mzi_collectable - 4));
      objc_msgSend(v20, "addObject:", v23);

      ++v21;
      p_mzi_collectable += 8;
      ++v17;
    }
    while (v19 != v21);
  }

  v31 = vm_deallocate(mach_task_self_, (vm_address_t)info, (unint64_t)infoCnt[0] << 6);
  if (v31)
  {
    v32 = v31;
    v33 = __stderrp;
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPProcess displayString](v103, "displayString")));
    v35 = (const char *)objc_msgSend(v34, "UTF8String");
    v36 = mach_error_string(v32);
    fprintf(v33, "%s: vm_deallocate: %s\n", v35, v36);

  }
  v37 = memory_info;
  v38 = memory_infoCnt;
  v101 = names;
  v100 = infoCnt[1];
  v39 = v20;
  v15 = v39;
  p_isa = (id *)&v103->super.super.isa;
  if (v103)
  {
    v102 = v39;
    v41 = objc_opt_self(FPKernelProcess);
    FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData(v41);
    v43 = CSSymbolicatorCreateWithMachKernelFlagsAndNotification(FlagsForNListOnlyData | 0x100002u, 0);
    v104 = v44;
    v105 = v43;
    v45 = objc_opt_self(FPKernelProcess);
    v46 = (id)OSKextCopyLoadedKextInfo(0, 0);
    objc_opt_self(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v46, "count")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "OSBundleLoadTag"));
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v99 = v46;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectEnumerator"));
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v111, buffer, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(_QWORD *)v112 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i);
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v48));
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v54, v55);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v111, buffer, 16);
      }
      while (v51);
    }

    p_isa = (id *)&v103->super.super.isa;
    p_cache = FPSharedCache.cache;
    if ((_DWORD)v38)
    {
      v57 = 0;
      while (1)
      {
        flags = v37->flags;
        v59 = v37->flags & 0x9FF;
        if (v59 == 3)
          v60 = 48;
        else
          v60 = 16;
        v61 = *(uint64_t *)((char *)&v37->flags + v60);
        if (!(v37->site | v61))
          goto LABEL_53;
        if (v59 == 3)
          break;
        if ((flags & 0x1000) == 0)
        {
          v65 = objc_alloc_init(FPMemoryRegion);
          v66 = v65;
          if ((flags & 0x900) != 0x100 || (v37->flags & 0x200) != 0 || v37->site == 24)
          {
            -[FPMemoryRegion setCleanSize:](v65, "setCleanSize:", v61);
            -[FPMemoryRegion setDirtySize:](v66, "setDirtySize:", 0);
            if ((v37->flags & 0x200) != 0)
            {
              v67 = v66;
              v68 = CFSTR("(hidden)");
LABEL_41:
              -[FPMemoryRegion setDetailedName:](v67, "setDetailedName:", v68);
            }
            else if (v37->site == 24)
            {
              v67 = v66;
              v68 = CFSTR("(user wired)");
              goto LABEL_41;
            }
            if (v66)
            {
LABEL_43:
              *((_BYTE *)v66 + 8) = *((_BYTE *)v66 + 8) & 0xFE | BYTE1(flags) & 1;
              -[FPMemoryRegion setSwappedSize:](v66, "setSwappedSize:", 0);
              -[FPMemoryRegion setReclaimableSize:](v66, "setReclaimableSize:", 0);
              v66->_user_tag = v57;
              v66->_size = v61;
              v66->_object_id = v57 | (unint64_t)&_mh_execute_header;
              goto LABEL_44;
            }
          }
          else
          {
            -[FPMemoryRegion setDirtySize:](v65, "setDirtySize:", v61);
            -[FPMemoryRegion setCleanSize:](v66, "setCleanSize:", 0);
            if (v66)
              goto LABEL_43;
          }
          objc_msgSend(0, "setSwappedSize:", 0);
          objc_msgSend(0, "setReclaimableSize:", 0);
LABEL_44:
          v63 = v66;
          v69 = v47;
          objc_opt_self(p_cache + 53);
          flags_low = LOBYTE(v37->flags);
          v71 = sub_10000D464((uint64_t)(p_cache + 53), (uint64_t *)v37, v69, v105, v104, (uint64_t)v101, v100);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);

          if (v72)
          {
            -[FPMemoryRegion setName:](v63, "setName:", v72);
            if (flags_low == 2)
            {
              SourceInfoWithAddressAtTime = CSSymbolicatorGetSourceInfoWithAddressAtTime(v105, v104, v37->site, 0x8000000000000000);
              v75 = v74;
              if ((CSIsNull() & 1) == 0)
              {
                Path = CSSourceInfoGetPath(SourceInfoWithAddressAtTime, v75);
                if (Path)
                {
                  v77 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%s:%d)"), Path, CSSourceInfoGetLineNumber(SourceInfoWithAddressAtTime, v75));
                  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
                  -[FPMemoryRegion setDetailedName:](v63, "setDetailedName:", v78);

                }
              }
            }

            objc_msgSend(v102, "addObject:", v63);
            p_isa = (id *)&v103->super.super.isa;
          }
          else
          {

          }
          p_cache = (void **)(FPSharedCache + 16);
LABEL_52:

        }
LABEL_53:
        ++v57;
        ++v37;
        if (v38 == v57)
          goto LABEL_57;
      }
      v62 = sub_10000D464((uint64_t)(p_cache + 53), (uint64_t *)v37, v47, v105, v104, 0, 0);
      v63 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue(v62);
      v64 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", v61, 0);
      objc_msgSend(p_isa[12], "setObject:forKeyedSubscript:", v64, v63);

      goto LABEL_52;
    }
LABEL_57:
    CSRelease(v105, v104);

    v15 = v102;
  }

  v79 = vm_deallocate(mach_task_self_, (vm_address_t)names, 80 * infoCnt[1]);
  if (v79)
  {
    v80 = v79;
    v81 = __stderrp;
    v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "displayString")));
    v83 = (const char *)objc_msgSend(v82, "UTF8String");
    v84 = mach_error_string(v80);
    fprintf(v81, "%s: vm_deallocate: %s\n", v83, v84);

  }
  v85 = vm_deallocate(mach_task_self_, (vm_address_t)memory_info, 176 * memory_infoCnt);
  if (v85)
  {
    v86 = v85;
    v87 = __stderrp;
    v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "displayString")));
    v89 = (const char *)objc_msgSend(v88, "UTF8String");
    v90 = mach_error_string(v86);
    fprintf(v87, "%s: vm_deallocate: %s\n", v89, v90);

  }
  objc_msgSend(p_isa, "setMemoryRegions:", v15);
  if (p_isa)
  {
    if (qword_100038A38 != -1)
      dispatch_once(&qword_100038A38, &stru_100029E98);
    *(_QWORD *)&v111 = qword_100038A30;
    if ((qword_100038A30 & 0x8000000000000000) == 0)
    {
      v91 = *((_QWORD *)&xmmword_100038A10 + 1);
      if ((*((_QWORD *)&xmmword_100038A10 + 1) & 0x8000000000000000) == 0)
      {
        v92 = malloc_type_malloc(56 * qword_100038A30, 0x100004021716A34uLL);
        if ((ledger(1, (int)objc_msgSend(p_isa, "pid"), v92, &v111) & 0x80000000) != 0)
        {
          free(v92);
        }
        else
        {
          if (v91 >= (uint64_t)v111)
          {
            v98 = _os_assert_log(0, v93, v94);
            _os_crash(v98);
            __break(1u);
          }
          v95 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", *((_QWORD *)v92 + 7 * v91) & ~(*((uint64_t *)v92 + 7 * v91) >> 63), 0);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v103->_otherAuxData, "setObject:forKeyedSubscript:", v95, CFSTR("billed footprint"));

          free(v92);
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          v117 = 0u;
          *(_OWORD *)buffer = 0u;
          v116 = 0u;
          if (!proc_pid_rusage(v103->super._pid, 6, buffer))
          {
            v96 = [FPAuxData alloc];
            v97 = -[FPAuxData initWithValue:shouldAggregate:](v96, "initWithValue:shouldAggregate:", (_QWORD)v130, 0);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v103->_otherAuxData, "setObject:forKeyedSubscript:", v97, CFSTR("billed footprint peak"));

          }
        }
      }
    }
  }
LABEL_3:

}

- (BOOL)_populateTask
{
  return 1;
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  NSMutableDictionary *mapsAuxData;
  void *v4;
  uint64_t v5;
  const __CFString *v7;
  NSMutableDictionary *v8;

  mapsAuxData = self->_mapsAuxData;
  v7 = CFSTR("Maps");
  v8 = mapsAuxData;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  if (-[NSMutableDictionary count](self->_otherAuxData, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fp_mergeWithData:forceAggregate:", self->_otherAuxData, 1));

    v4 = (void *)v5;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherAuxData, 0);
  objc_storeStrong((id *)&self->_mapsAuxData, 0);
}

@end
