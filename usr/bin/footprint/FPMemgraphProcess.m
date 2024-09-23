@implementation FPMemgraphProcess

+ (id)processWithMemgraph:(id)a3 error:(id *)p_isa
{
  id v5;
  FPMemgraphProcess *v6;
  FPMemgraphProcess *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  FPMemgraphProcess *v13;
  FPMemgraphProcess *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  FPSharedCache *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  FPSharedCache *sharedCache;
  id *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  FPSharedCache *v33;
  void *v34;
  FPSharedCache *v35;
  _OWORD v37[8];
  uint64_t v38;
  NSErrorUserInfoKey v39;

  v5 = a3;
  v6 = [FPMemgraphProcess alloc];
  if (!v6)
  {
    p_isa = 0;
    goto LABEL_33;
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v5, 1, p_isa));
  if (!v8)
    goto LABEL_13;
  v9 = objc_claimAutoreleasedReturnValue(+[VMUProcessObjectGraph directedGraphWithData:error:](VMUProcessObjectGraph, "directedGraphWithData:error:", v8, p_isa));
  v10 = *(void **)(&v7->super._bailedOut + 1);
  *(_QWORD *)(&v7->super._bailedOut + 1) = v9;

  v11 = *(void **)(&v7->super._bailedOut + 1);
  if (v11)
  {
    v38 = 0;
    memset(v37, 0, sizeof(v37));
    if (objc_msgSend(v11, "is64bit"))
      v12 = 16;
    else
      v12 = 0;
    LODWORD(v37[0]) = v12;
    HIDWORD(v37[0]) = objc_msgSend(*(id *)(&v7->super._bailedOut + 1), "pid");
    v13 = -[FPUserProcess initWithBsdInfo:](v7, "initWithBsdInfo:", v37);
    v14 = v13;
    if (!v13)
      goto LABEL_31;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&v13->super._bailedOut + 1), "processName"));
    -[FPProcess setName:](v14, "setName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess name](v14, "name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%d] (memgraph)"), v16, -[FPProcess pid](v14, "pid")));
    -[FPProcess setDisplayString:](v14, "setDisplayString:", v17);

    objc_msgSend(*(id *)(&v14->super._bailedOut + 1), "dyldSharedCacheRange");
    if (v18)
    {
      v19 = [FPSharedCache alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v21 = objc_msgSend(*(id *)(&v14->super._bailedOut + 1), "dyldSharedCacheRange");
      objc_msgSend(*(id *)(&v14->super._bailedOut + 1), "dyldSharedCacheRange");
      v23 = sub_1000067EC((id *)&v19->super.isa, v20, v21, v22, 0);
      sharedCache = v14->super.super._sharedCache;
      v14->super.super._sharedCache = (FPSharedCache *)v23;

      v25 = v23;
    }
    else
    {
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&v14->super._bailedOut + 1), "processDescriptionString"));
      if ((objc_msgSend(v27, "containsString:", CFSTR("X86-64")) & 1) != 0)
      {

        v28 = 0x7FE000000;
        v29 = 0x7FF800000000;
      }
      else if ((objc_msgSend(v27, "containsString:", CFSTR("X86")) & 1) != 0)
      {

        v28 = 0x20000000;
        v29 = 2415919104;
      }
      else if (objc_msgSend(v27, "containsString:", CFSTR("ARM64_32")))
      {

        v28 = 2281701376;
        v29 = 436207616;
      }
      else if ((objc_msgSend(v27, "containsString:", CFSTR("ARM64")) & 1) != 0)
      {

        v29 = 0x180000000;
        v28 = 0x180000000;
      }
      else
      {
        v30 = objc_msgSend(v27, "containsString:", CFSTR("ARM"));

        if (!v30)
        {
          fwrite("Unable to determine platform architecture of target\n", 0x34uLL, 1uLL, __stderrp);
          v25 = 0;
          goto LABEL_30;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&v14->super._bailedOut + 1), "binaryImagesDescription"));
        v32 = objc_msgSend(v31, "containsString:", CFSTR("arm64_32"));

        if (v32)
          v29 = 436207616;
        else
          v29 = 0x40000000;
        if (v32)
          v28 = 2281701376;
        else
          v28 = 0x40000000;
      }
      v33 = [FPSharedCache alloc];
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v25 = sub_1000067EC((id *)&v33->super.isa, v34, (void *)v29, (void *)v28, 0);

    }
LABEL_30:
    v35 = v14->super.super._sharedCache;
    v14->super.super._sharedCache = (FPSharedCache *)v25;

LABEL_31:
    v7 = v14;
    p_isa = (id *)&v7->super.super.super.isa;
    goto LABEL_32;
  }
  if (p_isa)
  {
    if (!*p_isa)
    {
      v39 = NSLocalizedDescriptionKey;
      *(_QWORD *)&v37[0] = CFSTR("memgraph initialization failed with unknown error");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, &v39, 1));
      *p_isa = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FootprintErrorDomain"), 1, v26));

    }
LABEL_13:
    p_isa = 0;
  }
LABEL_32:

LABEL_33:
  return p_isa;
}

- (unint64_t)_gatherPageSize
{
  unsigned int v3;
  void *v4;
  unint64_t result;

  v3 = objc_msgSend(*(id *)(&self->super._bailedOut + 1), "isTranslatedByRosetta");
  v4 = *(void **)(&self->super._bailedOut + 1);
  if (v3)
    LODWORD(result) = objc_msgSend(v4, "vmPageSize");
  else
    LODWORD(result) = objc_msgSend(v4, "kernelPageSize");
  return result;
}

- (BOOL)doOwnedAccountingAdjustments
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPMemgraphProcess;
  v3 = -[FPUserProcess doOwnedAccountingAdjustments](&v5, "doOwnedAccountingAdjustments");
  if (v3)
    LOBYTE(v3) = objc_msgSend(*(id *)(&self->super._bailedOut + 1), "didPhysFootprintDirtyAccounting") ^ 1;
  return v3;
}

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "dirtySize"))
    __assert_rtn("-[FPMemgraphProcess _populateMemoryRegionWithPageQueries:regionInfo:]", "FPMemgraphProcess.m", 149, "memoryRegion.dirtySize == 0");
  if (objc_msgSend(v5, "swappedSize"))
    __assert_rtn("-[FPMemgraphProcess _populateMemoryRegionWithPageQueries:regionInfo:]", "FPMemgraphProcess.m", 150, "memoryRegion.swappedSize == 0");
  objc_msgSend(v5, "setDirtySize:", a4->pages_dirtied);
  objc_msgSend(v5, "setSwappedSize:", a4->pages_swapped_out);

  return 1;
}

- (void)enumerateRegions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10000569C;
  v11[4] = sub_1000056AC;
  v12 = 0;
  if (self)
    v5 = *(void **)(&self->super._bailedOut + 1);
  else
    v5 = 0;
  v6 = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000056B4;
  v8[3] = &unk_100028828;
  v8[4] = self;
  v10 = v11;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "enumerateRegionsWithBlock:", v8);

  _Block_object_dispose(v11, 8);
}

- (void)_gatherPhysFootprint
{
  self->super._ledgers[1] = (unint64_t)objc_msgSend(*(id *)(&self->super._bailedOut + 1), "physicalFootprint");
  self->super._ledgers[2] = (unint64_t)objc_msgSend(*(id *)(&self->super._bailedOut + 1), "physicalFootprintPeak");
}

- (void)_gatherLedgers
{
  void *v3;
  void *v4;
  id v5;
  unint64_t *ledgers;
  void *v7;
  id v8;

  v3 = *(void **)(&self->super._bailedOut + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "page_table"));
  v5 = objc_msgSend(v3, "ledgerValueForKey:keyExists:", v4, 0);
  ledgers = self->super._ledgers;
  self->super._ledgers[0] = (unint64_t)v5;

  v7 = *(void **)(&self->super._bailedOut + 1);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "conclave_mem"));
  ledgers[3] = (unint64_t)objc_msgSend(v7, "ledgerValueForKey:keyExists:", v8, 0);

}

- (void)_gatherIdleExitStatus
{
  unsigned int v3;
  int v4;

  v3 = objc_msgSend(*(id *)(&self->super._bailedOut + 1), "idleExitStatus");
  if (v3 - 1 >= 3)
    v4 = 0;
  else
    v4 = v3;
  self->super.super._idleExitStatus = v4;
}

- (id)_gatherOwnedVmObjects
{
  return 0;
}

- (BOOL)_populateTask
{
  return 1;
}

- (BOOL)_isAlive
{
  return 0;
}

- (BOOL)breakDownPhysFootprint
{
  return objc_msgSend(*(id *)(&self->super._bailedOut + 1), "showsPhysFootprint");
}

- (void)_gatherIsTranslated
{
  self->super.super._isTranslated = objc_msgSend(*(id *)(&self->super._bailedOut + 1), "isTranslatedByRosetta");
}

- (BOOL)_configurePageSize
{
  return 1;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._bailedOut + 1), 0);
}

@end
