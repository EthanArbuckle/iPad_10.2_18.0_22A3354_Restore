@implementation VMUProcessLedger

+ (id)ledgerForVMUTask:(id)a3
{
  id v4;
  uint64_t v5;
  kern_return_t v6;
  void *v7;
  mach_vm_size_t v9;
  mach_vm_address_t kcd_addr_begin;

  v4 = a3;
  if (objc_msgSend(v4, "isCore"))
  {
    +[VMUProcessLedger _getProcessLedgerForCore:](VMUProcessLedger, "_getProcessLedgerForCore:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v5;
    goto LABEL_8;
  }
  v9 = 0;
  kcd_addr_begin = 0;
  v6 = task_map_corpse_info_64(*MEMORY[0x1E0C83DA0], objc_msgSend(v4, "taskPort"), &kcd_addr_begin, &v9);
  if (!v6)
  {
    objc_msgSend(a1, "_getProcessLedgerDictFromCrashInfo:DataSize:", kcd_addr_begin, v9);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = 0;
  if (v6 == 4)
  {
    objc_msgSend(a1, "_getProcessLedgerDictFromKernelLedger:", objc_msgSend(v4, "pid"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

+ (id)_getProcessLedgerForCore:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "memoryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VMUTaskMemoryCache getCoreFileLedgerInternal:]((uint64_t)v5);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("internal"));

  }
  objc_msgSend(v3, "memoryCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VMUTaskMemoryCache getCoreFileLedgerInternalCompressed:]((uint64_t)v8);

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("internal_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VMUTaskMemoryCache getCoreFileLedgerIokitMapped:]((uint64_t)v11);

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("iokit_mapped"));

  }
  objc_msgSend(v3, "memoryCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VMUTaskMemoryCache getCoreFileLedgerAlternateAccounting:]((uint64_t)v14);

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("alternate_accounting"));

  }
  objc_msgSend(v3, "memoryCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VMUTaskMemoryCache getCoreFileLedgerAlternateAccountingCompressed:]((uint64_t)v17);

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("alternate_accounting_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[VMUTaskMemoryCache getCoreFileLedgerPurgeableNonvolatile:]((uint64_t)v20);

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("purgeable_nonvolatile"));

  }
  objc_msgSend(v3, "memoryCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VMUTaskMemoryCache getCoreFileLedgerPurgeableNonvolatileCompressed:]((uint64_t)v23);

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("purgeable_nonvolatile_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprint:]((uint64_t)v26);

  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("phys_footprint"));

  }
  objc_msgSend(v3, "memoryCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprintLifetimeMax:]((uint64_t)v29);

  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("phys_footprint_lifetime_max"));

  }
  objc_msgSend(v3, "memoryCache");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[VMUTaskMemoryCache getCoreFileLedgerPageTable:]((uint64_t)v32);

  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("page_table"));

  }
  objc_msgSend(v3, "memoryCache");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[VMUTaskMemoryCache getCoreFileLedgerNetworkNonvolatile:]((uint64_t)v35);

  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("network_nonvolatile"));

  }
  objc_msgSend(v3, "memoryCache");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[VMUTaskMemoryCache getCoreFileLedgerNetworkNonvolatileCompressed:]((uint64_t)v38);

  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("network_nonvolatile_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[VMUTaskMemoryCache getCoreFileLedgerWiredMem:]((uint64_t)v41);

  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("wired_mem"));

  }
  objc_msgSend(v3, "memoryCache");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[VMUTaskMemoryCache getCoreFileLedgerTaggedFootprint:]((uint64_t)v44);

  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("tagged_footprint"));

  }
  objc_msgSend(v3, "memoryCache");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[VMUTaskMemoryCache getCoreFileLedgerTaggedFootprintCompressed:]((uint64_t)v47);

  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("tagged_footprint_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[VMUTaskMemoryCache getCoreFileLedgerMediaFootprint:]((uint64_t)v50);

  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("media_footprint"));

  }
  objc_msgSend(v3, "memoryCache");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[VMUTaskMemoryCache getCoreFileLedgerMediaFootprintCompressed:]((uint64_t)v53);

  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v55, CFSTR("media_footprint_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[VMUTaskMemoryCache getCoreFileLedgerGraphicsFootprint:]((uint64_t)v56);

  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("graphics_footprint"));

  }
  objc_msgSend(v3, "memoryCache");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[VMUTaskMemoryCache getCoreFileLedgerGraphicsFootprintCompressed:]((uint64_t)v59);

  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v61, CFSTR("graphics_footprint_compressed"));

  }
  objc_msgSend(v3, "memoryCache");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[VMUTaskMemoryCache getCoreFileLedgerNeuralFootprint:]((uint64_t)v62);

  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, CFSTR("neural_footprint"));

  }
  objc_msgSend(v3, "memoryCache");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[VMUTaskMemoryCache getCoreFileLedgerNeuralFootprintCompressed:]((uint64_t)v65);

  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v67, CFSTR("neural_footprint_compressed"));

  }
  v68 = (void *)objc_msgSend(v4, "copy");

  return v68;
}

+ (id)_getProcessLedgerDictFromCrashInfo:(unint64_t)a3 DataSize:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3 && a4)
  {
    v7 = a4 + a3;
    v8 = a3 + 16;
    if (a3 + 16 <= a4 + a3 && v8 + *(unsigned int *)(a3 + 4) <= v7 && *(_DWORD *)a3 == -559025833)
    {
      v9 = a3;
      do
      {
        if (v8 + *(unsigned int *)(v9 + 4) > v7)
          break;
        v10 = *(_DWORD *)v9;
        if (*(_DWORD *)v9 == -242132755)
          break;
        if ((v10 & 0xFFFFFFF0) == 0x20)
          v10 = 17;
        switch(v10)
        {
          case 2078:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("internal");
            goto LABEL_33;
          case 2079:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("internal_compressed");
            goto LABEL_33;
          case 2080:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("iokit_mapped");
            goto LABEL_33;
          case 2081:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("alternate_accounting");
            goto LABEL_33;
          case 2082:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("alternate_accounting_compressed");
            goto LABEL_33;
          case 2083:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("purgeable_nonvolatile");
            goto LABEL_33;
          case 2084:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("purgeable_nonvolatile_compressed");
            goto LABEL_33;
          case 2085:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("page_table");
            goto LABEL_33;
          case 2086:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("phys_footprint");
            goto LABEL_33;
          case 2087:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("phys_footprint_lifetime_max");
            goto LABEL_33;
          case 2088:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("network_nonvolatile");
            goto LABEL_33;
          case 2089:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("network_nonvolatile_compressed");
            goto LABEL_33;
          case 2090:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("wired_mem");
            goto LABEL_33;
          case 2093:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("tagged_footprint");
            goto LABEL_33;
          case 2094:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("tagged_footprint_compressed");
            goto LABEL_33;
          case 2095:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("media_footprint");
            goto LABEL_33;
          case 2096:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("media_footprint_compressed");
            goto LABEL_33;
          case 2097:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("graphics_footprint");
            goto LABEL_33;
          case 2098:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("graphics_footprint_compressed");
            goto LABEL_33;
          case 2099:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("neural_footprint");
            goto LABEL_33;
          case 2100:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v9 + 16));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v6;
            v13 = v11;
            v14 = CFSTR("neural_footprint_compressed");
LABEL_33:
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v14);

            break;
          default:
            break;
        }
        v9 = v8 + *(unsigned int *)(v9 + 4);
        v8 = v9 + 16;
      }
      while (v9 + 16 <= v7);
    }
    else
    {
      NSLog(CFSTR("invalid task corpse info provided to VMUProcessLedger"));
    }
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], a3, a4);
  }
  v15 = (void *)objc_msgSend(v6, "copy");

  return v15;
}

+ (id)_getProcessLedgerDictFromKernelLedger:(int)a3
{
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v17;
  id v18;
  uint64_t v19;
  rusage_info_t buffer[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  *(_OWORD *)buffer = 0u;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!proc_pid_rusage(a3, 6, buffer))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v35);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v4, CFSTR("phys_footprint_lifetime_max"));

  }
  v5 = 0;
  v6 = 40;
  do
  {
    v7 = 2 * v6;
    v19 = 2 * v6;
    v5 = (char *)malloc_type_realloc(v5, 192 * v6, 0x1000040565EDBD2uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      free(v5);
      NSLog(CFSTR("Unable to retrieve ledger template info in VMUProcessLedger"));
LABEL_20:
      v15 = 0;
      goto LABEL_21;
    }
    v6 = v7;
  }
  while (v7 == v19);
  v8 = (char *)malloc_type_malloc(56 * v19, 0x100004021716A34uLL);
  if ((ledger() & 0x80000000) != 0)
  {
    free(v8);
    free(v5);
    NSLog(CFSTR("Unable to retrieve ledger entry info in VMUProcessLedger"));
    goto LABEL_20;
  }
  if (v19 >= 1)
  {
    v9 = 0;
    v17 = v8;
    do
    {
      v10 = 0;
      v11 = &v8[56 * v9];
      do
      {
        if (!strcmp(ledgerNameDict[v10], &v5[96 * v9]))
        {
          if (!strcmp(&v5[96 * v9], "purgeable_nonvolatile_compress"))
            v12 = "purgeable_nonvolatile_compressed";
          else
            v12 = &v5[96 * v9];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v11, v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, v14);

        }
        ++v10;
      }
      while (v10 != 22);
      ++v9;
      v8 = v17;
    }
    while (v9 < v19);
  }
  free(v5);
  free(v8);
  v15 = (void *)objc_msgSend(v18, "copy");
LABEL_21:

  return v15;
}

@end
