@implementation SABinaryLoadInfo

- (id)instructionAtOffsetIntoLoadInfo:(unint64_t)a3
{
  SASegment *segment;

  segment = self->_segment;
  if (segment)
    -[SASegment instructionAtOffsetIntoSegment:](segment, "instructionAtOffsetIntoSegment:", a3);
  else
    -[SABinary instructionAtOffsetIntoBinary:](self->_binary, "instructionAtOffsetIntoBinary:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SASegment)segment
{
  return (SASegment *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)loadAddress
{
  return self->_loadAddress;
}

+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4 libraryCache:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "binaryLoadInfos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(v9, "startAddress");
      v12 = 0;
      if (v11 == -1 || v11 > a3)
      {
LABEL_10:

        if (!v7)
          goto LABEL_18;
        goto LABEL_11;
      }
      if (objc_msgSend(v9, "endAddress") > a3)
      {
        +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:", a3, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
  if (!v7)
    goto LABEL_18;
LABEL_11:
  if (!v12)
  {
    +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:", a3, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v13;
    if (v9)
    {
      if (v13)
      {
        if (objc_msgSend(v9, "startAddress") != -1)
        {
          v14 = objc_msgSend(v12, "loadAddress");
          if (v14 < objc_msgSend(v9, "startAddress") && objc_msgSend(v9, "startAddress") <= a3)
          {

            v12 = 0;
          }
        }
      }
    }
  }
LABEL_18:

  return v12;
}

+ (id)binaryLoadInfoForAddress:(unint64_t)a3 inBinaryLoadInfos:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[5];

  v5 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__SABinaryLoadInfo_binaryLoadInfoForAddress_inBinaryLoadInfos___block_invoke;
  v14[3] = &__block_descriptor_40_e26_q16__0__SABinaryLoadInfo_8l;
  v14[4] = a3;
  v6 = SABinarySearchArray(v5, 1536, (uint64_t)v14);
  if (v6)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "segment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    if (!v9)
    {
      objc_msgSend(v7, "binary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      if (v11)
        v9 = v11;
      else
        v9 = 0x10000000;

    }
    if (objc_msgSend(v7, "loadAddress") + v9 <= a3)
      v12 = 0;
    else
      v12 = v7;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __63__SABinaryLoadInfo_binaryLoadInfoForAddress_inBinaryLoadInfos___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  _BOOL8 v6;

  v3 = objc_msgSend(a2, "loadAddress");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v4 >= v3;
  v6 = v4 > v3;
  if (v5)
    return v6;
  else
    return -1;
}

- (SABinary)binary
{
  return (SABinary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
  objc_storeStrong((id *)&self->_binary, 0);
}

- (SABinaryLoadInfo)initWithBinary:(id)a3 segment:(id)a4 loadAddress:(unint64_t)a5
{
  id v9;
  id v10;
  SABinaryLoadInfo *v11;
  SABinaryLoadInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SABinaryLoadInfo;
  v11 = -[SABinaryLoadInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_binary, a3);
    objc_storeStrong((id *)&v12->_segment, a4);
    v12->_loadAddress = a5;
  }

  return v12;
}

+ (id)binaryLoadInfoWithSegment:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  id *v12;
  __objc2_class *v13;
  id *v14;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  objc_opt_self();
  objc_msgSend(v9, "binary");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = *__error();
    _sa_logt();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "debugDescription");
      a1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v43 = objc_msgSend(a1, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_ERROR, "Getting a load info for segment %s when the binary has already been deallcoated", buf, 0xCu);

    }
    *__error() = v16;
    objc_msgSend(v9, "debugDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v9, "UTF8String");
    _SASetCrashLogMessage(2795, "Getting a load info for segment %s when the binary has already been deallcoated", v18, v19, v20, v21, v22, v23, v17);

    _os_crash();
    __break(1u);
LABEL_14:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "debugDescription");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = objc_msgSend(v26, "UTF8String");
      objc_msgSend(v9, "debugDescription");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "UTF8String");
      -[NSObject debugDescription](v10, "debugDescription");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = objc_msgSend(v30, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v43 = v27;
      v44 = 2080;
      v45 = v29;
      v46 = 2080;
      v47 = v31;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "%s segment %s has exclave %s in user space", buf, 0x20u);

    }
    *__error() = v24;
    objc_msgSend(a1, "debugDescription");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "UTF8String");
    objc_msgSend(v9, "debugDescription");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v34, "UTF8String");
    -[NSObject debugDescription](v10, "debugDescription");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v35, "UTF8String");
    _SASetCrashLogMessage(2796, "%s segment %s has exclave %s in user space", v36, v37, v38, v39, v40, v41, v33);

    _os_crash();
    __break(1u);
  }
  a1 = (id)v11;
  if (v10 && (a4 & 1) == 0)
    goto LABEL_14;
  if (!a4)
  {
    v13 = SAUserBinaryLoadInfo;
LABEL_9:
    v12 = (id *)objc_msgSend([v13 alloc], "initWithBinary:segment:loadAddress:", a1, v9, a3);
    goto LABEL_10;
  }
  if (!v10)
  {
    v13 = SAKernelBinaryLoadInfo;
    goto LABEL_9;
  }
  v12 = -[SAExclaveBinaryLoadInfo initWithBinary:segment:loadAddress:exclave:]([SAExclaveBinaryLoadInfo alloc], v11, (uint64_t)v9, a3, v10);
LABEL_10:
  v14 = v12;

  return v14;
}

+ (id)binaryLoadInfoWithBinary:(uint64_t)a3 loadAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  id v8;
  id v9;
  id *v10;
  __objc2_class *v11;
  id *v12;
  int v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  objc_opt_self();
  if (v9 && (a4 & 1) == 0)
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "debugDescription");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      objc_msgSend(v9, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v29 = v17;
      v30 = 2080;
      v31 = objc_msgSend(v18, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "%s has exclave %s in user space", buf, 0x16u);

    }
    *__error() = v14;
    objc_msgSend(v8, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    objc_msgSend(v9, "debugDescription");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "UTF8String");
    _SASetCrashLogMessage(2811, "%s has exclave %s in user space", v22, v23, v24, v25, v26, v27, v20);

    _os_crash();
    __break(1u);
  }
  if (!a4)
  {
    v11 = SAUserBinaryLoadInfo;
LABEL_8:
    v10 = (id *)objc_msgSend([v11 alloc], "initWithBinary:segment:loadAddress:", v8, 0, a3);
    goto LABEL_9;
  }
  if (!v9)
  {
    v11 = SAKernelBinaryLoadInfo;
    goto LABEL_8;
  }
  v10 = -[SAExclaveBinaryLoadInfo initWithBinary:segment:loadAddress:exclave:]([SAExclaveBinaryLoadInfo alloc], (uint64_t)v8, 0, a3, v9);
LABEL_9:
  v12 = v10;

  return v12;
}

- (unint64_t)length
{
  void *segment;

  segment = self->_segment;
  if (!segment)
    segment = self->_binary;
  return objc_msgSend(segment, "length");
}

- (BOOL)isInKernelAddressSpace
{
  return 0;
}

- (SAExclave)exclave
{
  return 0;
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3
{
  return (id)objc_msgSend(a1, "binaryLoadInfoForLiveProcessWithPid:dataGatheringOptions:additionalCSSymbolicatorFlags:", *(_QWORD *)&a3, 1026, 0);
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "binaryLoadInfoForLiveProcessWithPid:dataGatheringOptions:additionalCSSymbolicatorFlags:", *(_QWORD *)&a3, a4, 0);
}

+ (id)binaryLoadInfoForLiveProcessWithPid:(int)a3 dataGatheringOptions:(unint64_t)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  void *v5;
  void *v6;
  id v7;
  id v9[3];

  if ((a4 & 2) != 0 && (!a3 || (a4 & 0x400) != 0))
  {
    v9[1] = v5;
    v9[2] = v6;
    v9[0] = 0;
    CopyLoadInfosForLiveProcess(*(_BOOL8 *)&a3, a4, v9, 0, 0, 0, 0, a5);
    v7 = v9[0];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)binaryLoadInfoForSymbolicator:(uint64_t)a1 isKernel:(uint64_t)a2 dataGatheringOptions:(uint64_t)a3 excludeRange:(uint64_t)a4 ignoreSharedCache:(char)a5
{
  char v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v5 = ~a5;
  v6 = objc_opt_self();
  v7 = (void *)MEMORY[0x1BCCCC288](v6);
  if ((v5 & 5) != 0)
    v8 = 0;
  else
    v8 = +[SABinaryLocator sharedBinaryLocator](SABinaryLocator, "sharedBinaryLocator");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v10 = v8;
  v11 = v9;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  objc_msgSend(v10, "done");
  +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v11);
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_autoreleasePoolPop(v7);
  return v12;
}

void __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL4 IsContiguous;
  void *v7;
  void *v8;
  uint64_t BaseAddress;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _QWORD v18[2];

  if (!*(_BYTE *)(a1 + 64) || (CSSymbolOwnerIsDyldSharedCache() & 1) == 0)
  {
    v18[0] = 0;
    v18[1] = 0;
    IsContiguous = SASymbolOwnerIsContiguous(a2, a3, v18, 0);
    if ((CSRangeContainsRange() & 1) == 0)
    {
      +[SABinary binaryWithSymbolOwner:fromDisk:]((uint64_t)SABinary, a2, a3, IsContiguous);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if (IsContiguous)
        {
          BaseAddress = CSSymbolOwnerGetBaseAddress();
          +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v8, BaseAddress, *(unsigned __int8 *)(a1 + 65), 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
        }
        else
        {
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke_2;
          v11[3] = &unk_1E71483A0;
          v14 = *(_OWORD *)(a1 + 48);
          v12 = v7;
          v15 = a2;
          v16 = a3;
          v17 = *(_BYTE *)(a1 + 65);
          v13 = *(id *)(a1 + 32);
          SASymbolOwnerForeachSegment(a2, a3, v11);

          v10 = v12;
        }

        if (*(_QWORD *)(a1 + 40))
        {
          if ((CSSymbolOwnerIsDsym() & 1) == 0)
            -[SABinaryLocator addURLForSymbolOwner:](*(_BYTE **)(a1 + 40));
        }
      }

    }
  }
}

void __111__SABinaryLoadInfo_binaryLoadInfoForSymbolicator_isKernel_dataGatheringOptions_excludeRange_ignoreSharedCache___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t BaseAddress;
  uint64_t Range;
  void *v9;
  id v10;

  CSRegionGetRange();
  if ((CSRangeIntersectsRange() & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    BaseAddress = CSSymbolOwnerGetBaseAddress();
    -[SABinary segmentWithCSSegment:symbolOwnerLayoutMatchesDisk:symbolOwnerBaseAddress:](v6, a2, a3, 0, BaseAddress);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    Range = CSRegionGetRange();
    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v10, Range, *(unsigned __int8 *)(a1 + 80), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
}

+ (void)sortBinaryLoadInfos:(uint64_t)a1
{
  id v2;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_318);

}

+ (id)addBinaryLoadInfoForDyldImage:(void *)a3 toLoadInfos:(int)a4 isKernel:(int)a5 dataGatheringOptions:
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _QWORD v27[4];
  id v28;
  id v29;
  char v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_opt_self();
  v10 = (void *)MEMORY[0x1BCCCC288](v9);
  +[SABinary binaryForDyldImage:options:]((uint64_t)SABinary, a2, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v26 = a4;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = -1;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = -1;
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke;
    v31[3] = &unk_1E7148218;
    v14 = v11;
    v32 = v14;
    v33 = &v45;
    v34 = &v49;
    v35 = &v41;
    v36 = &v37;
    v15 = DyldImageEnumerateSegments(a2, v31);
    if (v15 < 0 || (v16 = v38[3], v16 == -1) || !v16 || (v17 = v50[3], (unint64_t)(v17 + 1) <= 1))
    {
      v18 = *__error();
      _sa_logt();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "debugDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v38[3];
        v25 = v50[3];
        *(_DWORD *)buf = 138413058;
        v54 = v23;
        v55 = 2048;
        v56 = v24;
        v57 = 2048;
        v58 = v25;
        v59 = 1024;
        v60 = v15;
        _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "Bad segments in dyld image for %@: imageTextStartAddress:%llu, imageStartAddress:%llu, ret %d", buf, 0x26u);

      }
      v20 = 0;
      *__error() = v18;
    }
    else
    {
      if (v16 == v17 && v46[3] - v16 == v42[3])
      {
        +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v14, v16, v26, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v22);
      }
      else
      {
        v27[0] = v13;
        v27[1] = 3221225472;
        v27[2] = __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke_316;
        v27[3] = &unk_1E71483F0;
        v28 = v14;
        v30 = v26;
        v29 = v8;
        DyldImageEnumerateSegments(a2, v27);

        v22 = v28;
      }

      v20 = v14;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    v20 = 0;
  }

  objc_autoreleasePoolPop(v10);
  return v20;
}

uint64_t __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke(uint64_t a1, char *__s1, unint64_t a3, uint64_t a4)
{
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  void *v13;
  int v14;
  char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = __s1;
      v16 = 2048;
      v17 = a4;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "Segment %s load address is 0 (length 0x%llx) for %@", (uint8_t *)&v14, 0x20u);

    }
    *__error() = v8;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v10 + 24) < a4 + a3)
    *(_QWORD *)(v10 + 24) = a4 + a3;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_QWORD *)(v11 + 24) > a3)
    *(_QWORD *)(v11 + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a4;
  result = strcmp(__s1, "__TEXT");
  if (!(_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
  return result;
}

void __92__SABinaryLoadInfo_addBinaryLoadInfoForDyldImage_toLoadInfos_isKernel_dataGatheringOptions___block_invoke_316(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  SANSStringForCString(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CopyCleanSegmentName(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SABinary segmentWithCleanName:](v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v9, a3, *(unsigned __int8 *)(a1 + 48), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  }
  else
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v13;
      v16 = 2082;
      v17 = a2;
      _os_log_fault_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_FAULT, "%@: No segment for %{public}s", (uint8_t *)&v14, 0x16u);

    }
    *__error() = v11;
  }

}

+ (id)loadInfosForSegmentsInBinary:(uint64_t)a3 binaryBaseAddress:(int)a4 isInKernelAddressSpace:(void *)a5 exclave:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  objc_opt_self();
  v20 = v8;
  objc_msgSend(v8, "segments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "hasOffsetIntoBinary"))
        {
          +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v17, objc_msgSend(v17, "offsetIntoBinary") + a3, a4, v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  return v11;
}

uint64_t __40__SABinaryLoadInfo_sortBinaryLoadInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "loadAddress");
  if (v6 >= objc_msgSend(v5, "loadAddress"))
  {
    v8 = objc_msgSend(v4, "loadAddress");
    v7 = v8 > objc_msgSend(v5, "loadAddress");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (NSString)debugDescription
{
  id v3;
  _BOOL4 v4;
  void *segment;
  unint64_t loadAddress;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[SABinaryLoadInfo isInKernelAddressSpace](self, "isInKernelAddressSpace");
  segment = self->_segment;
  loadAddress = self->_loadAddress;
  if (!segment)
    segment = self->_binary;
  objc_msgSend(segment, "debugDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR(" ");
  if (v4)
    v9 = CFSTR("*");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@0x%llx: %@"), v9, loadAddress, v7);

  return (NSString *)v10;
}

- (unint64_t)textSegmentLoadAddress
{
  void *v3;
  unint64_t loadAddress;
  unint64_t v5;

  if (self->_segment)
    return self->_loadAddress;
  -[SABinary segmentWithCleanName:](self->_binary, CFSTR("__TEXT_EXEC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    && (-[SABinary segmentWithCleanName:](self->_binary, CFSTR("__TEXT")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend(v3, "hasOffsetIntoBinary") & 1) == 0)
  {

    return self->_loadAddress;
  }
  loadAddress = self->_loadAddress;
  v5 = objc_msgSend(v3, "offsetIntoBinary") + loadAddress;

  return v5;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  void *v5;
  SASegment *segment;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v20 = a3;
  -[SABinary uuid](self->_binary, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v20, (uint64_t)CFSTR("binary"), v5);

  segment = self->_segment;
  if (segment)
  {
    -[SASegment name](segment, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v20, CFSTR("segment"), v7);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_loadAddress);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v20, CFSTR("loadAddress"), v8);

  if (-[SABinaryLoadInfo isInKernelAddressSpace](self, "isInKernelAddressSpace"))
  {
    SAJSONWriteDictionaryEntry(v20, CFSTR("isInKernelAddressSpace"), MEMORY[0x1E0C9AAB0]);
    -[SABinaryLoadInfo exclave](self, "exclave");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SABinaryLoadInfo exclave](self, "exclave");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        SAJSONWriteDictionaryEntry(v20, CFSTR("exclave"), v11);
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[SABinaryLoadInfo exclave](self, "exclave");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        SAJSONWriteDictionaryEntry(v20, CFSTR("exclave"), v14);

      }
    }
  }
  -[SABinary path](self->_binary, "path");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[SABinary uuid](self->_binary, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[SABinary haveMultipleBinariesWithUUID:]((uint64_t)SABinary, v17);

    if (v18)
    {
      -[SABinary path](self->_binary, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v20, CFSTR("binaryPath"), v19);

    }
  }

}

+ (id)classDictionaryKey
{
  return CFSTR("SABinaryLoadInfo");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 35;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  void *v9;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SABinaryLoadInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SABinaryLoadInfo debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = objc_msgSend(v13, "UTF8String");
      v24 = 2048;
      v25 = -[SABinaryLoadInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v26 = 2048;
      v27 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SABinaryLoadInfo debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SABinaryLoadInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5085, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 769;
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_loadAddress;
  BYTE2(a3->var3) = BYTE2(a3->var3) & 0xFE | -[SABinaryLoadInfo isInKernelAddressSpace](self, "isInKernelAddressSpace");
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_binary, v8);
  *(unint64_t *)((char *)&a3->var3 + 3) = SASerializableIndexForPointerFromSerializationDictionary(self->_segment, v8);
  -[SABinaryLoadInfo exclave](self, "exclave");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)((char *)&a3->var4.var1 + 3) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    -[SABinary addSelfToSerializationDictionary:](self->_binary, "addSelfToSerializationDictionary:", v7);
    -[SASegment addSelfToSerializationDictionary:](self->_segment, "addSelfToSerializationDictionary:", v7);
    -[SABinaryLoadInfo exclave](self, "exclave");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSelfToSerializationDictionary:", v7);

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  __objc2_class **v6;
  id result;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_13;
  if (a4 <= 0x12)
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v18 = a4;
      v19 = 2048;
      v20 = 19;
      _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5115, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SABinaryLoadInfo version"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  if ((*((_BYTE *)a3 + 18) & 1) != 0)
  {
    if (*((unsigned __int8 *)a3 + 1) < 3u || *(_QWORD *)((char *)a3 + 27) == -1)
      v6 = off_1E7145B18;
    else
      v6 = off_1E7145AC8;
  }
  else
  {
    v6 = off_1E7145BF8;
  }
  result = objc_alloc_init(*v6);
  *((_QWORD *)result + 3) = *(_QWORD *)((char *)a3 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SABinary *v14;
  SABinary *binary;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  SASegment *v21;
  SASegment *v22;
  void *v23;
  void *v24;
  SASegment *v25;
  SASegment *segment;
  unint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint8_t buf[4];
  unint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v55 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_27;
  if (a4 <= 0x12)
  {
    v30 = *__error();
    _sa_logt();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v57 = a4;
      v58 = 2048;
      v59 = 19;
      _os_log_error_impl(&dword_1B9BE0000, v31, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", buf, 0x16u);
    }

    *__error() = v30;
    _SASetCrashLogMessage(5136, "bufferLength %lu < serialized SABinaryLoadInfo struct %lu", v32, v33, v34, v35, v36, v37, a4);
    _os_crash();
    __break(1u);
    goto LABEL_21;
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v55, v11, v13);
  v14 = (SABinary *)objc_claimAutoreleasedReturnValue();
  binary = self->_binary;
  self->_binary = v14;

  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    -[SABinary segmentWithCleanName:](self->_binary, CFSTR("__TEXT_EXEC"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      -[SABinary segmentWithCleanName:](self->_binary, CFSTR("__TEXT"));
      v25 = (SASegment *)objc_claimAutoreleasedReturnValue();
    }
    segment = self->_segment;
    self->_segment = v25;

    goto LABEL_13;
  }
  if (a4 <= 0x1A)
  {
LABEL_21:
    v38 = *__error();
    _sa_logt();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v57 = a4;
      v58 = 2048;
      v59 = 27;
      _os_log_error_impl(&dword_1B9BE0000, v39, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo v2 struct %lu", buf, 0x16u);
    }

    *__error() = v38;
    _SASetCrashLogMessage(5142, "bufferLength %lu < serialized SABinaryLoadInfo v2 struct %lu", v40, v41, v42, v43, v44, v45, a4);
    _os_crash();
    __break(1u);
LABEL_24:
    v46 = *__error();
    _sa_logt();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v57 = a4;
      v58 = 2048;
      v59 = 35;
      _os_log_error_impl(&dword_1B9BE0000, v47, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SABinaryLoadInfo v3 struct %lu", buf, 0x16u);
    }

    *__error() = v46;
    _SASetCrashLogMessage(5154, "bufferLength %lu < serialized SABinaryLoadInfo v3 struct %lu", v48, v49, v50, v51, v52, v53, a4);
    _os_crash();
    __break(1u);
LABEL_27:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SABinaryLoadInfo version"), 0);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v54);
  }
  v16 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
  if (*v16 <= 30)
  {
    v17 = (_QWORD *)gBinaryBeingDecoded(&gBinaryBeingDecoded);
    *v17 = v18;
  }
  v19 = *(_QWORD *)((char *)a3 + 19);
  v20 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v55, v11, v20, 0);
  v21 = (SASegment *)objc_claimAutoreleasedReturnValue();
  v22 = self->_segment;
  self->_segment = v21;

  if (*v16 <= 30)
    *(_QWORD *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0;
LABEL_13:
  if (*((unsigned __int8 *)a3 + 1) >= 3u)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4 > 0x22)
      {
        v27 = *(_QWORD *)((char *)a3 + 27);
        v28 = (void *)objc_opt_class();
        SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v55, v11, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&self[1].super.isa, v29);

        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }
LABEL_17:

}

+ (_QWORD)binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:(uint64_t)a1
{
  __objc2_class **v3;
  _QWORD *v4;

  objc_opt_self();
  if (*(_QWORD *)(a2 + 16) <= 0x8000000000000000)
    v3 = off_1E7145BF8;
  else
    v3 = off_1E7145B18;
  v4 = objc_alloc_init(*v3);
  v4[3] = *(_QWORD *)(a2 + 16);
  return v4;
}

- (void)populateReferencesUsingPAStyleSerializedImageInfo:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  unint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  if (a1)
  {
    v6 = *(_QWORD *)(a2 + 8);
    v7 = a4;
    v8 = a3;
    v9 = (void *)objc_opt_class();
    SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v6, v8, v7, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v16, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v10;

    -[SABinary segmentWithCleanName:](*(void **)(a1 + 8), CFSTR("__TEXT_EXEC"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[SABinary segmentWithCleanName:](*(void **)(a1 + 8), CFSTR("__TEXT"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v14;

  }
}

@end
