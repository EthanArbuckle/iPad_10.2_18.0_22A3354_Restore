@implementation OSABinaryImageCatalog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_used_segments, 0);
  objc_storeStrong((id *)&self->_shared_segments, 0);
  objc_storeStrong((id *)&self->_targeted_cache, 0);
  objc_storeStrong((id *)&self->_rootedCacheLibs, 0);
  objc_storeStrong((id *)&self->_kernel_text_exec_segments, 0);
  objc_storeStrong((id *)&self->_kernel_segments, 0);
  objc_storeStrong((id *)&self->_kernel_cache_segment, 0);
  objc_storeStrong((id *)&self->_absolute_segment, 0);
}

- (id)reportUsedImagesFullInfoUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_used_segments, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_used_segments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "full_details", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          v4[2](v4, v11);
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

BOOL __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v7, "symbolInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= objc_msgSend(v9, "start"))
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v7, "symbolInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "start");
    objc_msgSend(v7, "symbolInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "size") + v12;

    if (v10 < v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v7, 80));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v15;
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v7, "symbolInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedLongLong:", v17 - objc_msgSend(v18, "start"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {

  }
  v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

  return v24;
}

+ (BOOL)isApplePath:(id)a3 orBundle:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("/System")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("/usr/lib")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("/usr/bin")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("/usr/sbin")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("/bin")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("/sbin")) & 1) != 0
    || (objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
    || (objc_msgSend(v6, "hasPrefix:", CFSTR("commpage")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Ozone")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Motion"));
  }

  return v7;
}

- (id)searchFrame:(unint64_t)a3 in:(id)a4 regions:(id)a5 result:(id *)a6
{
  id v10;
  id v11;
  OSABinaryImageSegment *kernel_cache_segment;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSMutableArray *rootedCacheLibs;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id *v38;
  OSABinaryImageSegment *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[6];
  _QWORD v51[8];
  _QWORD v52[8];
  _QWORD v53[8];
  int v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];

  v69[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__6;
  v65 = __Block_byref_object_dispose__6;
  v66 = 0;
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__6;
  v59 = __Block_byref_object_dispose__6;
  v60 = 0;
  kernel_cache_segment = self->_kernel_cache_segment;
  if (kernel_cache_segment)
  {
    -[OSABinaryImageSegment symbolInfo](kernel_cache_segment, "symbolInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "start") > a3;

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_kernel_cache_segment, 85));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v15;
      v16 = (void *)MEMORY[0x1E0CB37E8];
      -[OSABinaryImageSegment symbolInfo](self->_kernel_cache_segment, "symbolInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedLongLong:", a3 - objc_msgSend(v17, "start"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      v21 = (void *)v62[5];
      v62[5] = v20;

      objc_storeStrong(v56 + 5, self->_kernel_cache_segment);
    }
  }
  v22 = (void *)v62[5];
  if (!v22)
  {
    v23 = self->_kernel_segments;
    if (-[NSMutableArray count](self->_kernel_text_exec_segments, "count"))
    {
      v24 = self->_kernel_text_exec_segments;

      v25 = 84;
      v23 = v24;
    }
    else
    {
      v25 = 75;
    }
    v26 = -[NSMutableArray count](v23, "count");
    v27 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke;
    v53[3] = &unk_1E4DEE540;
    v53[4] = self;
    v53[5] = &v61;
    v54 = v25;
    v53[6] = &v55;
    v53[7] = a3;
    -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v23, "indexOfObject:inSortedRange:options:usingComparator:", &unk_1E4DFDC48, 0, v26, 256, v53);
    if (v62[5])
      goto LABEL_21;
    v28 = a3 - self->_targeted_slide;
    if (-[NSMutableArray count](self->_rootedCacheLibs, "count"))
    {
      rootedCacheLibs = self->_rootedCacheLibs;
      v30 = -[NSMutableArray count](rootedCacheLibs, "count");
      v52[0] = v27;
      v52[1] = 3221225472;
      v52[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_2;
      v52[3] = &unk_1E4DEE568;
      v52[4] = self;
      v52[5] = &v61;
      v52[6] = &v55;
      v52[7] = v28;
      -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](rootedCacheLibs, "indexOfObject:inSortedRange:options:usingComparator:", &unk_1E4DFDC48, 0, v30, 256, v52);
    }
    if (v62[5])
      goto LABEL_21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (v28 < objc_msgSend(v31, "start"))
      {
LABEL_16:

        goto LABEL_17;
      }
      -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v48, "start");
      -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v46) = v28 < objc_msgSend(v32, "size") + v46;

      if ((_DWORD)v46)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_targeted_cache, 83));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = v47;
        v33 = (void *)MEMORY[0x1E0CB37E8];
        -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "numberWithUnsignedLongLong:", v28 - objc_msgSend(v49, "start"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "copy");
        v37 = (void *)v62[5];
        v62[5] = v36;

        v38 = v56;
        v39 = self->_targeted_cache;
        v31 = v38[5];
        v38[5] = v39;
        goto LABEL_16;
      }
    }
LABEL_17:
    if (!v62[5])
    {
      v51[0] = v27;
      v51[1] = 3221225472;
      v51[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_3;
      v51[3] = &unk_1E4DEE590;
      v51[4] = self;
      v51[5] = &v61;
      v51[6] = &v55;
      v51[7] = a3;
      objc_msgSend(v10, "indexOfObjectPassingTest:", v51);
      if (!v62[5])
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_absolute_segment, 65));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v40;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v62[5];
        v62[5] = v42;

        if (v11)
        {
          v50[0] = v27;
          v50[1] = 3221225472;
          v50[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_4;
          v50[3] = &unk_1E4DEE5B8;
          v50[4] = &v55;
          v50[5] = a3;
          objc_msgSend(v11, "indexOfObjectPassingTest:", v50);
        }
      }
    }
LABEL_21:
    if (a6)
      *a6 = objc_retainAutorelease(v56[5]);

    v22 = (void *)v62[5];
  }
  v44 = v22;
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v44;
}

- (unint64_t)markImageAsUsed:(id)a3 from:(int)a4
{
  uint64_t v4;
  id v6;
  unint64_t v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (objc_msgSend(v6, "source"))
  {
    v7 = objc_msgSend(v6, "used_index");
  }
  else
  {
    objc_msgSend(v6, "setSource:", v4);
    v7 = -[NSMutableArray count](self->_used_segments, "count");
    objc_msgSend(v6, "setUsed_index:", v7);
    -[NSMutableArray addObject:](self->_used_segments, "addObject:", v6);
  }

  return v7;
}

void __29__OSABinaryImageCatalog_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.ReportCrash.stackshot.sharedCacheLoader", 0);
  v1 = (void *)_sharedCacheLoaderQueue;
  _sharedCacheLoaderQueue = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_shared_caches;
  _shared_caches = v2;

}

- (id)searchFrame:(unint64_t)a3 in:(id)a4 result:(id *)a5
{
  return -[OSABinaryImageCatalog searchFrame:in:regions:result:](self, "searchFrame:in:regions:result:", a3, a4, 0, a5);
}

- (OSABinaryImageCatalog)init
{
  OSABinaryImageCatalog *v2;
  NSMutableArray *v3;
  NSMutableArray *used_segments;
  NSMutableArray *v5;
  NSMutableArray *kernel_segments;
  NSMutableArray *v7;
  NSMutableArray *kernel_text_exec_segments;
  uint64_t v9;
  NSMutableDictionary *shared_segments;
  uint64_t v11;
  NSMutableArray *notes;
  OSABinaryImageSegment *v13;
  OSABinaryImageSegment *absolute_segment;
  objc_super v16;
  uuid_t uu;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)OSABinaryImageCatalog;
  v2 = -[OSABinaryImageCatalog init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    used_segments = v2->_used_segments;
    v2->_used_segments = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    kernel_segments = v2->_kernel_segments;
    v2->_kernel_segments = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    kernel_text_exec_segments = v2->_kernel_text_exec_segments;
    v2->_kernel_text_exec_segments = v7;

    v9 = objc_opt_new();
    shared_segments = v2->_shared_segments;
    v2->_shared_segments = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v11;

    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    v13 = -[OSABinaryImageSegment initWithAddress:size:for:]([OSABinaryImageSegment alloc], "initWithAddress:size:for:", 0, 0, uu);
    absolute_segment = v2->_absolute_segment;
    v2->_absolute_segment = v13;

    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_106);
  }
  return v2;
}

- (void)appendNotesTo:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_notes);
}

- (void)setKernelImages:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_kernel_segments, "addObjectsFromArray:", a3);
}

- (void)setKernelTextExecImages:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_kernel_text_exec_segments, "addObjectsFromArray:", a3);
}

- (void)setKernelCache:(unsigned __int8)a3[16] address:(unint64_t)a4 size:(unint64_t)a5
{
  OSABinaryImageSegment *v6;
  OSABinaryImageSegment *kernel_cache_segment;

  v6 = -[OSABinaryImageSegment initWithAddress:size:for:]([OSABinaryImageSegment alloc], "initWithAddress:size:for:", a4, 0x40000000, a3);
  kernel_cache_segment = self->_kernel_cache_segment;
  self->_kernel_cache_segment = v6;

}

- (void)setRootedCacheLibs:(dyld_uuid_info_64 *)a3 count:(unsigned int)a4
{
  uint64_t v4;
  NSMutableArray *v7;
  NSMutableArray *rootedCacheLibs;
  unsigned __int8 *imageUUID;

  LODWORD(v4) = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  rootedCacheLibs = self->_rootedCacheLibs;
  self->_rootedCacheLibs = v7;

  if ((_DWORD)v4)
  {
    v4 = v4;
    imageUUID = a3->imageUUID;
    do
    {
      if (!uuid_is_null(imageUUID))
        -[NSMutableArray addImage:address:size:](self->_rootedCacheLibs, "addImage:address:size:", imageUUID, *((_QWORD *)imageUUID - 1), 0);
      imageUUID += 24;
      --v4;
    }
    while (v4);
  }
  -[NSMutableArray sortByAddressAndSetInferredSizes](self->_rootedCacheLibs, "sortByAddressAndSetInferredSizes");
}

- (void)targetSharedCache:(unsigned __int8)a3[16] withSlide:(unint64_t)a4 atBaseAddress:(unint64_t)a5
{
  OSABinaryImageSegment *v9;
  OSABinaryImageSegment *targeted_cache;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  OSABinaryImageCatalog *v15;
  unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16;
  unint64_t v17;
  unint64_t v18;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_shared_segments, "objectForKeyedSubscript:");
  v9 = (OSABinaryImageSegment *)objc_claimAutoreleasedReturnValue();
  targeted_cache = self->_targeted_cache;
  self->_targeted_cache = v9;

  self->_targeted_slide = a4;
  if (!self->_targeted_cache)
  {
    v11 = _sharedCacheLoaderQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__OSABinaryImageCatalog_targetSharedCache_withSlide_atBaseAddress___block_invoke;
    block[3] = &unk_1E4DEE518;
    v16 = a3;
    v17 = a5;
    v18 = a4;
    v14 = v12;
    v15 = self;
    dispatch_sync(v11, block);

  }
}

void __67__OSABinaryImageCatalog_targetSharedCache_withSlide_atBaseAddress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  OSABinaryImageSegment *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  OSASymbolInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  OSASymbolInfo *v15;

  objc_msgSend((id)_shared_caches, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (!uuid_is_null(*(const unsigned __int8 **)(a1 + 48)))
    {
      v9 = -[OSASymbolInfo initWithSharedCache:atBaseAddress:]([OSASymbolInfo alloc], "initWithSharedCache:atBaseAddress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 64));
      if (v9)
      {
        v15 = v9;
        objc_msgSend((id)_shared_caches, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 32));
        v2 = (uint64_t)v15;
        goto LABEL_2;
      }
      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("unable to instantiate shared cache %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

    }
    v14 = 0;
    goto LABEL_6;
  }
LABEL_2:
  v14 = (id)v2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v14, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));

    goto LABEL_7;
  }
  v5 = -[OSABinaryImageSegment initWithSymbol:]([OSABinaryImageSegment alloc], "initWithSymbol:", v14);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));
LABEL_7:

}

- (BOOL)isAddressInTargetedCache:(unint64_t)a3
{
  unint64_t targeted_slide;
  unint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;

  targeted_slide = self->_targeted_slide;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = a3 - targeted_slide;
  -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "start"))
  {
    -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "start");
    -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 < objc_msgSend(v11, "size") + v10;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 isKindOfClass;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v7 = v5;
  else
    v7 = v6;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v8, "symbolInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= objc_msgSend(v10, "start"))
  {
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v8, "symbolInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "start");
    objc_msgSend(v8, "symbolInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "size") + v13;

    if (v11 < v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v8, *(unsigned int *)(a1 + 64)));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v8, "symbolInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 - objc_msgSend(v19, "start"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
    }
  }
  else
  {

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v8, "symbolInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (((isKindOfClass ^ ((unint64_t)objc_msgSend(v26, "start") >= *(_QWORD *)(a1 + 56))) & 1) != 0)
      v25 = -1;
    else
      v25 = 1;

  }
  return v25;
}

uint64_t __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 isKindOfClass;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v7 = v5;
  else
    v7 = v6;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v8, "symbolInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= objc_msgSend(v10, "start"))
  {
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v8, "symbolInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "start");
    objc_msgSend(v8, "symbolInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "size") + v13;

    if (v11 < v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v8, 67));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v8, "symbolInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 - objc_msgSend(v19, "start"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
    }
  }
  else
  {

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v8, "symbolInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (((isKindOfClass ^ ((unint64_t)objc_msgSend(v26, "start") >= *(_QWORD *)(a1 + 56))) & 1) != 0)
      v25 = -1;
    else
      v25 = 1;

  }
  return v25;
}

BOOL __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  _BOOL8 v15;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "symbolInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= objc_msgSend(v9, "start"))
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "symbolInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "start");
    objc_msgSend(v7, "symbolInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "size") + v12;

    if (v10 < v14)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {

  }
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;

  return v15;
}

- (id)reportUsedImages
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_used_segments, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_used_segments;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "details", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

@end
