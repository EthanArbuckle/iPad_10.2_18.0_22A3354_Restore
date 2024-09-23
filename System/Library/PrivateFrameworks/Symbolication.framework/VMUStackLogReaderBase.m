@implementation VMUStackLogReaderBase

- (id)symbolicatedBacktraceForNode:(unsigned int)a3 nodeDetails:(id)a4 isLiteZone:(id)a5 options:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[4096];
  uint64_t v21;

  v5 = MEMORY[0x1E0C80A78](self, a2, *(_QWORD *)&a3, a4.var0, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (id *)v5;
  v21 = *MEMORY[0x1E0C80C00];
  if (VMUGraphNodeType_IsVMRegion(v10[1] >> 60))
  {
    objc_msgSend(v14[3], "vmRegionRangeInfoForRange:", *v11, v11[1] & 0xFFFFFFFFFFFFFFFLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15 || (v17 = objc_msgSend(v15, "stackIdentifier"), v17 == -1))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = objc_msgSend(v14, "stackIDForNode:", v13);
      else
        v17 = -1;
    }
    v18 = objc_msgSend(v14, "getFramesForStackID:stackFramesBuffer:", v17, v20);

  }
  else
  {
    v18 = objc_msgSend(v14, "getFramesForNode:inLiteZone:stackFramesBuffer:", v13, v9, v20);
  }
  objc_msgSend(v14, "symbolicatedBacktraceForFrames:frameCount:options:", v20, v18, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)symbolicatedBacktraceForStackID:(unint64_t)a3 options:(unint64_t)a4
{
  _BYTE v5[4096];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VMUStackLogReaderBase symbolicatedBacktraceForFrames:frameCount:options:](self, "symbolicatedBacktraceForFrames:frameCount:options:", v5, -[VMUStackLogReaderBase getFramesForStackID:stackFramesBuffer:](self, "getFramesForStackID:stackFramesBuffer:", a3, v5), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)identifierForBinaryImagePath:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  CFURLRef v6;
  CFURLRef v7;
  __CFBundle *v8;
  __CFBundle *v9;

  v4 = (__CFString *)a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_binaryImagePathToIdentifierMap, "objectForKeyedSubscript:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, kCFURLPOSIXPathStyle, 1u);
      if (v6)
      {
        v7 = v6;
        v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
        if (v8)
        {
          v9 = v8;
          CFBundleGetIdentifier(v8);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CFRelease(v9);
          CFRelease(v7);
          if (v5)
          {
LABEL_10:
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_binaryImagePathToIdentifierMap, "setObject:forKeyedSubscript:", v5, v4);
            goto LABEL_11;
          }
        }
        else
        {
          CFRelease(v7);
        }
      }
      -[__CFString lastPathComponent](v4, "lastPathComponent");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    v5 = CFSTR("???");
  }
LABEL_11:

  return v5;
}

- (id)symbolicatedBacktraceForFrames:(unint64_t *)a3 frameCount:(int64_t)a4 options:(unint64_t)a5
{
  int64_t v5;
  char v6;
  int v7;
  NSMutableDictionary *v10;
  NSMutableDictionary *binaryImagePathToIdentifierMap;
  __CFString *v12;
  __CFString *v13;
  NSMapTable *v15;
  NSMapTable *addressToSymbolicationMap;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  char *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  id v35;
  const char *v36;
  const char *v37;
  int v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  __CFString *v45;
  __CFString *v46;
  uint64_t v47;
  void *context;
  char v49;
  unint64_t v50;
  unint64_t *v51;
  __CFString *v52;
  unint64_t v53;
  id v54;
  char v55;
  char v56;
  char __str[8];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a4 - 1;
  if (a4 < 1)
    return 0;
  v6 = a5;
  v7 = a4;
  if (!self->_binaryImagePathToIdentifierMap)
  {
    v10 = (NSMutableDictionary *)objc_opt_new();
    binaryImagePathToIdentifierMap = self->_binaryImagePathToIdentifierMap;
    self->_binaryImagePathToIdentifierMap = v10;

  }
  context = (void *)MEMORY[0x1A85A9758]();
  v56 = v6;
  if ((v6 & 0x20) != 0)
  {
    v55 = 0;
    v13 = 0;
  }
  else
  {
    v12 = (__CFString *)objc_opt_new();
    v13 = v12;
    if ((v6 & 4) != 0)
      -[__CFString appendString:](v12, "appendString:", CFSTR("\n"));
    if (-[VMUStackLogReaderBase coldestFrameIsNotThreadId](self, "coldestFrameIsNotThreadId"))
    {
      v55 = 0;
    }
    else
    {
      -[__CFString appendFormat:](v13, "appendFormat:", CFSTR("[thread %#llx]:"), a3[v5] - 1);
      if ((v6 & 8) != 0)
      {
        -[__CFString appendString:](v13, "appendString:", CFSTR("\t"));
        v55 = 0;
      }
      else
      {
        v55 = 1;
      }
      v7 = v5;
    }
    if (!self->_addressToSymbolicationMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
      v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      addressToSymbolicationMap = self->_addressToSymbolicationMap;
      self->_addressToSymbolicationMap = v15;

    }
  }
  if ((v6 & 4) != 0)
  {
    if (-[VMUStackLogReaderBase is64bit](self, "is64bit"))
      v17 = 18;
    else
      v17 = 10;
    v50 = 30;
  }
  else
  {
    v17 = 0;
    v50 = 0;
  }
  v18 = 0;
  v49 = 0;
  v19 = v56 & 0x44;
  v20 = -1;
  v51 = a3;
  v52 = v13;
  while (v7 != v18)
  {
    if (v19 == 4)
      v21 = v18;
    else
      v21 = v7 + v20;
    v22 = (char *)a3[v21];
    if ((unint64_t)v22 >= 0x1000)
    {
      NSMapGet(self->_addressToSymbolicationMap, (const void *)a3[v21]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        if ((v56 & 2) != 0)
        {
          v53 = v50;
          v54 = 0;
        }
        else
        {
          -[VMUStackLogReaderBase binaryImagePathForPCaddress:](self, "binaryImagePathForPCaddress:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUStackLogReaderBase identifierForBinaryImagePath:](self, "identifierForBinaryImagePath:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v26;
          if ((v56 & 4) != 0)
          {
            v28 = objc_msgSend(v26, "length");
            v27 = v50;
            if (v28 > v50)
              v27 = objc_msgSend(v54, "length");
          }
          else
          {
            v27 = 0;
          }
          v53 = v27;

        }
        -[VMUStackLogReaderBase functionNameForPCaddress:](self, "functionNameForPCaddress:", v22);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = v29;
          if (objc_msgSend(v29, "hasPrefix:", CFSTR("_malloc_type_"))
            && objc_msgSend(v30, "hasSuffix:", CFSTR("_outlined")))
          {
            objc_msgSend(v30, "substringFromIndex:", objc_msgSend(CFSTR("_malloc_type"), "length"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v31, "hasPrefix:", CFSTR("_zone")))
            {
              objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_zone"), CFSTR("_malloc_zone"));
              v32 = objc_claimAutoreleasedReturnValue();

              v31 = (void *)v32;
            }
            objc_msgSend(v31, "substringToIndex:", objc_msgSend(v31, "length") - objc_msgSend(CFSTR("_outlined"), "length"));
            v33 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v33;
            a3 = v51;
            if (!v33)
              goto LABEL_44;
          }
          else
          {

          }
          if (-[NSSet containsObject:](self->_excludedFrames, "containsObject:", v30))
          {

            v49 = 1;
            v23 = 3;
            v24 = v54;
            v13 = v52;
LABEL_70:

            v19 = v56 & 0x44;
            goto LABEL_71;
          }
          v35 = objc_retainAutorelease(v30);
          v36 = (const char *)objc_msgSend(v35, "UTF8String");
          v37 = v36;
          if ((v56 & 0x10) == 0 || (v38 = *(unsigned __int8 *)v36, v38 == 43) || v38 == 45)
            v39 = strlen(v36);
          else
            v39 = strcspn(v36, "(<");
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithBytes:length:encoding:", v37, v39, 4);
          v34 = v56;
          if ((v56 & 4) == 0)
          {
            if ((v56 & 2) == 0)
            {
LABEL_56:
              objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%#*llx (%-*s) %@"), v17, v22, v53, objc_msgSend(objc_retainAutorelease(v54), "UTF8String"), v24, context);
              goto LABEL_60;
            }
            goto LABEL_61;
          }
          objc_msgSend(v24, "appendFormat:", CFSTR(" + %llu"), &v22[--[VMUStackLogReaderBase functionRangeContainingPCaddress:](self, "functionRangeContainingPCaddress:", v22)]);
        }
        else
        {
LABEL_44:
          v34 = v56;
          if ((v56 & 4) == 0)
          {
            if ((v56 & 2) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("???"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 0;
              goto LABEL_56;
            }
            objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%#llx"), v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0;
            goto LABEL_61;
          }
          v40 = -[VMUStackLogReaderBase binaryImageRangeForPCaddress:](self, "binaryImageRangeForPCaddress:", v22);
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%#llx + %llu"), v40, &v22[-v40]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%-*s %#*llx %@"), v53, objc_msgSend(objc_retainAutorelease(v54), "UTF8String"), v17, v22, v24, context);
LABEL_60:
        v41 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v41;
        v34 = v56;
LABEL_61:
        -[VMUStackLogReaderBase sourceFileNameAndLineNumberForPCaddress:fullPath:](self, "sourceFileNameAndLineNumberForPCaddress:fullPath:", v22, v34 & 1);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if (v42)
          objc_msgSend(v24, "appendFormat:", CFSTR("  %@"), v42);
        NSMapInsertKnownAbsent(self->_addressToSymbolicationMap, v22, v24);

        a3 = v51;
        v13 = v52;
      }
      *(_QWORD *)__str = 0;
      v58 = 0;
      v44 = " | ";
      if ((v56 & 4) != 0)
      {
        snprintf(__str, 0x10uLL, "%-3d ", v21);
        v44 = "\n";
      }
      if ((v55 & 1) != 0)
        -[__CFString appendFormat:](v13, "appendFormat:", CFSTR("%s%s%@"), v44, __str, v24);
      else
        -[__CFString appendFormat:](v13, "appendFormat:", CFSTR("%s%@"), __str, v24, v47);
      v23 = 0;
      v55 = 1;
      goto LABEL_70;
    }
    v23 = 2;
LABEL_71:
    ++v18;
    --v20;
    if (v23 == 3)
      break;
  }
  -[__CFString appendString:](v13, "appendString:", CFSTR(" "));
  objc_autoreleasePoolPop(context);
  v45 = VMUBacktraceIsExcludedMarker;
  if ((v49 & 1) == 0)
    v45 = v13;
  v46 = v45;

  return v46;
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)inspectingLiveProcess
{
  return 0;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  return 5;
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  return 0;
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  return 0;
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  return 0;
}

- (id)binaryImagePathForPCaddress:(unint64_t)a3
{
  void *Path;

  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  Path = (void *)CSSymbolOwnerGetPath();
  if (Path)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
    Path = (void *)objc_claimAutoreleasedReturnValue();
  }
  return Path;
}

- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3
{
  unint64_t Range;
  unint64_t v4;
  _VMURange result;

  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  CSSymbolOwnerGetSegmentWithAddress();
  Range = CSRegionGetRange();
  if (!v4)
  {
    Range = 0x7FFFFFFFFFFFFFFFLL;
    v4 = 0;
  }
  result.length = v4;
  result.location = Range;
  return result;
}

- (id)functionNameForPCaddress:(unint64_t)a3
{
  void *Name;

  CSSymbolicatorGetSymbolWithAddressAtTime();
  Name = (void *)CSSymbolGetName();
  if (Name)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
    Name = (void *)objc_claimAutoreleasedReturnValue();
  }
  return Name;
}

- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3
{
  unint64_t Range;
  unint64_t v4;
  _VMURange result;

  CSSymbolicatorGetSymbolWithAddressAtTime();
  Range = CSSymbolGetRange();
  result.length = v4;
  result.location = Range;
  return result;
}

- (id)sourcePathForPCaddress:(unint64_t)a3
{
  void *Path;

  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  Path = (void *)CSSourceInfoGetPath();
  if (Path)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
    Path = (void *)objc_claimAutoreleasedReturnValue();
  }
  return Path;
}

- (id)sourceFileNameForPCaddress:(unint64_t)a3
{
  void *Filename;

  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  Filename = (void *)CSSourceInfoGetFilename();
  if (Filename)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Filename);
    Filename = (void *)objc_claimAutoreleasedReturnValue();
  }
  return Filename;
}

- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3
{
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  return CSSourceInfoGetLineNumber();
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  return 0;
}

- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t Path;
  uint64_t v6;
  uint64_t LineNumber;
  void *v8;

  v4 = a4;
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  if (v4)
    Path = CSSourceInfoGetPath();
  else
    Path = CSSourceInfoGetFilename();
  v6 = Path;
  LineNumber = CSSourceInfoGetLineNumber();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%u"), v6, LineNumber);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)shouldIgnoreSymbolWithName:(id)a3 binaryPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_19;
  }
  if (!v6)
  {
    v9 = 1;
    goto LABEL_19;
  }
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldIgnoreSymbolWithName_binaryPath__onceToken != -1)
    dispatch_once(&shouldIgnoreSymbolWithName_binaryPath__onceToken, &__block_literal_global_1);
  if ((objc_msgSend((id)shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore, "containsObject:", v8) & 1) == 0
    && (objc_msgSend((id)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore, "containsObject:", v5) & 1) == 0)
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("operator new")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("__typed_operator_new_impl")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("$_0::operator()")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("caulk::alloc::darwin_resource")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("objc::DenseMap")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("objc::detail::DenseMapPair")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("llvm::BumpPtrAllocatorImpl")) & 1) == 0
      && (!objc_msgSend(v5, "hasPrefix:", CFSTR("bmalloc_"))
       || (objc_msgSend(v5, "containsString:", CFSTR("_allocate")) & 1) == 0)
      && (!objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::"))
       || (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastZeroedMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastStrDup")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastMemDup")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::tryFastZeroedMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastAlignedMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::tryFastAlignedMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::tryFastMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::tryFastCalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastCalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::tryFastRealloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("WTF::fastRealloc")) & 1) == 0)
      && (!objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::"))
       || (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::tryMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::tryRealloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::tryAllocateZeroedVirtualPages")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::tryAlignedMalloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::malloc")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::tryMallocArray")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("Gigacage::mallocArray")) & 1) == 0)
      && (!objc_msgSend(v5, "hasPrefix:", CFSTR("JSC::"))
       || (objc_msgSend(v5, "hasPrefix:", CFSTR("JSC::IsoAlignedMemoryAllocator")) & 1) == 0
       && (objc_msgSend(v5, "hasPrefix:", CFSTR("JSC::tryAllocateAlignedMemory")) & 1) == 0
       && !objc_msgSend(v5, "hasPrefix:", CFSTR("JSC::tryAllocateMemory"))))
    {
      v9 = 0;
      goto LABEL_16;
    }
    objc_msgSend((id)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore, "addObject:", v5);
  }
  v9 = 1;
LABEL_16:

LABEL_19:
  return v9;
}

void __63__VMUStackLogReaderBase_shouldIgnoreSymbolWithName_binaryPath___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("libsystem_malloc.dylib"), CFSTR("libCoreLib.dylib"), 0);
  v1 = (void *)shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore;
  shouldIgnoreSymbolWithName_binaryPath__exactMatchLibrariesToIgnore = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("strndup"), CFSTR("reallocf"), CFSTR("_dispatch_calloc"), CFSTR("_dispatch_strdup_if_mutable"), CFSTR("_dispatch_continuation_alloc_from_heap"), CFSTR("_xpc_alloc"), CFSTR("swift_slowAlloc"), CFSTR("swift_allocObject"), CFSTR("swift_allocBox"), CFSTR("__CFSafelyReallocateWithAllocator"), CFSTR("CFStorageReplaceValues"), CFSTR("__NSMS1"), CFSTR("pdf_named_calloc"), CFSTR("pdf_named_malloc"), CFSTR("hash_table_modify"), CFSTR("CMMMemMgr::New(unsigned long)"), 0x1E4E05000,
         CFSTR("XAtomicAllocator::reserve(int)"),
         CFSTR("_table_addStorageBlock"),
         CFSTR("sqlite3MemMalloc"),
         CFSTR("sqlite3MemRealloc"),
         CFSTR("dbMallocRawFinish"),
         CFSTR("dbReallocFinish"),
         CFSTR("llvm::safe_malloc(unsigned long)"),
         CFSTR("llvm::safe_calloc(unsigned long, unsigned long)"),
         CFSTR("llvm::safe_realloc(void*, unsigned long)"),
         CFSTR("llvm::allocate_buffer(unsigned long, unsigned long)"),
         CFSTR("geo::MallocZoneAllocator::allocate(unsigned long, unsigned long)"),
         CFSTR("geo::MallocZoneAllocator::callocate(unsigned long, unsigned long)"),
         CFSTR("geo::MallocZoneAllocator::reallocate(void*, unsigned long)"),
         CFSTR("kalloc_ext"),
         CFSTR("IOMalloc_internal"),
         CFSTR("strdup"),
         CFSTR("IOLockAlloc"),
         0);
  v3 = (void *)shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore;
  shouldIgnoreSymbolWithName_binaryPath__exactMatchSymbolsToIgnore = v2;

}

- (id)_allocationTypeNameForStackID:(unint64_t)a3 returnedBinaryPath:(id *)a4
{
  id *v4;
  void *v7;
  int64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  __CFString *v37;
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[514];

  v4 = a4;
  v43[512] = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = CFSTR("<unknown>");
  if (a3 == -1)
    return CFSTR("non-object with no stack backtrace");
  v7 = (void *)MEMORY[0x1A85A9758](self, a2);
  v8 = -[VMUStackLogReaderBase getFramesForStackID:stackFramesBuffer:](self, "getFramesForStackID:stackFramesBuffer:", a3, v43);
  if (!v8)
  {
    objc_autoreleasePoolPop(v7);
    return CFSTR("non-object with no stack backtrace");
  }
  v9 = v8;
  -[VMUStackLogReaderBase functionNameForPCaddress:](self, "functionNameForPCaddress:", v43[0]);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    if (-[__CFString hasPrefix:](v10, "hasPrefix:", CFSTR("_malloc_zone_")))
    {
      -[__CFString substringFromIndex:](v11, "substringFromIndex:", 13);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 = -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR("_instrumented_or_legacy"));
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v12;
      }
      else
      {
        -[__CFString substringToIndex:](v12, "substringToIndex:", v13);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("malloc_zone_realloc")) & 1) != 0
           || (-[__CFString hasPrefix:](v11, "hasPrefix:", CFSTR("WTF::fastRealloc")) & 1) != 0
           || -[__CFString hasPrefix:](v11, "hasPrefix:", CFSTR("WTF::tryFastRealloc")))
    {

      v11 = CFSTR("realloc");
    }
    else if (-[__CFString hasPrefix:](v11, "hasPrefix:", CFSTR("caulk::alloc::darwin_resource")))
    {

      v11 = CFSTR("caulk::alloc::darwin_resource");
    }
    else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("realloc")) & 1) == 0
           && (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("sqlite3MemRealloc")) & 1) == 0)
    {
      -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("__CFSafelyReallocateWithAllocator"));
    }
  }
  else
  {
    v11 = CFSTR("malloc");
  }
  if (v9 >= 1)
  {
    v37 = v11;
    v38 = v7;
    v39 = v4;
    v40 = 0;
    v15 = 0;
    v41 = 0;
    v42 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = v43;
    while (1)
    {
      v20 = v18;
      v21 = v15;
      -[VMUStackLogReaderBase functionNameForPCaddress:](self, "functionNameForPCaddress:", *v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *v19++;
      -[VMUStackLogReaderBase binaryImagePathForPCaddress:](self, "binaryImagePathForPCaddress:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v22;
      _removeReturnValueFromCPlusPlusSymbolName(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v17, "hasPrefix:", CFSTR("std::"));
      if (v24)
      {
        v25 = v17;

        v26 = v15;
        v27 = v18;

        v41 = v27;
        v42 = v25;
        v40 = v26;
      }
      else
      {
        if ((v16 & 1) != 0
          && (objc_msgSend(v42, "hasPrefix:", CFSTR("std::__")) & 1) == 0
          && (objc_msgSend(v42, "hasPrefix:", CFSTR("std::enable_if")) & 1) == 0)
        {
          v32 = v42;

          v33 = v40;
          v34 = v41;

          v41 = v34;
          v42 = v32;
          v18 = v34;
          v17 = v32;
          v40 = v33;
          v15 = v33;
          if (!v32)
          {
LABEL_30:
            v7 = v38;
            v4 = v39;
            v11 = v37;
            v31 = v40;
            v30 = v41;
            goto LABEL_31;
          }
LABEL_27:
          _removeStdArgumentsFromCPlusPlusSymbolName(v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          _printCPlusPlusNameSimplification(v15, v28);
          v11 = v37;
          -[__CFString stringByAppendingFormat:](v37, "stringByAppendingFormat:", CFSTR(" in %@"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v38;
          v4 = v39;
          v31 = v40;
          v30 = v41;
          goto LABEL_35;
        }
        if (!-[VMUStackLogReaderBase shouldIgnoreSymbolWithName:binaryPath:](self, "shouldIgnoreSymbolWithName:binaryPath:", v17, v18))goto LABEL_26;
      }
      v16 = v24;
      if (!--v9)
      {
LABEL_26:
        if (!v17)
          goto LABEL_30;
        goto LABEL_27;
      }
    }
  }
  v15 = 0;
  v18 = 0;
  v31 = 0;
  v30 = 0;
  v42 = 0;
LABEL_31:
  objc_msgSend(v18, "lastPathComponent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(CFSTR("non-object from "), "stringByAppendingString:", v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  v28 = 0;
LABEL_35:

  objc_autoreleasePoolPop(v7);
  if (v4)
    *v4 = objc_retainAutorelease(v18);
  v36 = v29;

  return v36;
}

- (void)identifyNonObjectsUsingStackBacktraces:(id)a3 classInfoMap:(id)a4 classInfoSetterBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  VMUStackLogConsolidator *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[VMUStackLogConsolidator initWithScannerOrGraph:stackLogReader:]([VMUStackLogConsolidator alloc], "initWithScannerOrGraph:stackLogReader:", v10, self);

  if (-[VMUStackLogReaderBase usesLiteMode](self, "usesLiteMode")
    || -[VMUStackLogReaderBase usesCoreFile](self, "usesCoreFile"))
  {
    v12 = (void *)objc_opt_new();
  }
  else
  {
    v12 = 0;
  }
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke;
  v25[3] = &unk_1E4E01348;
  v25[4] = self;
  v26 = v12;
  v14 = v8;
  v27 = v14;
  v15 = v9;
  v28 = v15;
  v16 = v12;
  -[VMUStackLogConsolidator stackIDsToNodesFilteredBy:](v11, "stackIDsToNodesFilteredBy:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke_2;
  v21[3] = &unk_1E4E01370;
  v21[4] = self;
  v22 = (id)objc_opt_new();
  v23 = v14;
  v24 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v22;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v21);

}

uint64_t __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v7 = a4;
  v8 = (void *)MEMORY[0x1A85A9758]();
  if (*(_QWORD *)(a3 + 8) >> 60 != 1)
    goto LABEL_17;
  v9 = *(void **)(a3 + 16);
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasPrefix:", CFSTR("non-object")))
  {

    goto LABEL_6;
  }
  v11 = objc_msgSend(*(id *)(a3 + 16), "isDerivedFromStackBacktrace");

  if (!v11)
  {
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
LABEL_6:
  if (v7)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "usesLiteMode"))
    {
      v12 = v7;
      if ((objc_msgSend(v12, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone")) & 1) != 0)
      {
        v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper"));

        if ((v13 & 1) == 0)
          goto LABEL_10;
      }
      else
      {

      }
LABEL_14:
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "unsignedIntValue"))
      {
        objc_msgSend(CFSTR("non-object in zone "), "stringByAppendingString:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v16, CFSTR("<unknown>"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIsDerivedFromStackBacktrace:", 1);
        v18 = objc_msgSend(*(id *)(a1 + 48), "indexForClassInfo:", v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v7);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      goto LABEL_17;
    }
LABEL_10:
    if (!objc_msgSend(*(id *)(a1 + 32), "usesCoreFile")
      || objc_msgSend(*(id *)(a1 + 32), "stackIDForNode:", a2) != -1)
    {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
LABEL_12:
  v14 = 1;
LABEL_18:
  objc_autoreleasePoolPop(v8);

  return v14;
}

void __98__VMUStackLogReaderBase_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A85A9758]();
  v8 = objc_msgSend(v5, "unsignedLongValue");
  v9 = *(void **)(a1 + 32);
  v32 = 0;
  objc_msgSend(v9, "_allocationTypeNameForStackID:returnedBinaryPath:", v8, &v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CFString *)v32;
  v12 = v11;
  if (v10)
  {
    if (!v11)
      v12 = CFSTR("<unknown>");
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v25 = (void *)v13;
    v26 = v7;
    if (v14)
    {
      objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      if (objc_msgSend(v10, "containsString:", CFSTR("::")))
        v16 = 2;
      else
        v16 = 16;
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v10, v12, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setIsDerivedFromStackBacktrace:", 1);
      v18 = objc_msgSend(*(id *)(a1 + 48), "indexForClassInfo:", v17);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v13);

    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v6;
    v20 = v6;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntValue");
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v22);
    }

    v7 = v26;
    v6 = v27;
  }

  objc_autoreleasePoolPop(v7);
}

- (unsigned)task
{
  return self->_task;
}

- (BOOL)usesLiteMode
{
  return self->_usesLiteMode;
}

- (BOOL)usesCoreFile
{
  return self->_usesCoreFile;
}

- (BOOL)coldestFrameIsNotThreadId
{
  return self->_coldestFrameIsNotThreadId;
}

- (VMUVMRegionTracker)regionTracker
{
  return (VMUVMRegionTracker *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)excludedFrames
{
  return self->_excludedFrames;
}

- (void)setExcludedFrames:(id)a3
{
  objc_storeStrong((id *)&self->_excludedFrames, a3);
}

- (_CSTypeRef)symbolicator
{
  unint64_t v2;
  unint64_t v3;
  _QWORD v4[2];
  _CSTypeRef result;

  objc_copyStruct(v4, &self->_symbolicator, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result._opaque_2 = v3;
  result._opaque_1 = v2;
  return result;
}

- (VMUTask)vmuTask
{
  return (VMUTask *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryImagePathToIdentifierMap, 0);
  objc_storeStrong((id *)&self->_excludedFrames, 0);
  objc_storeStrong((id *)&self->_addressToSymbolicationMap, 0);
  objc_storeStrong((id *)&self->_regionTracker, 0);
  objc_storeStrong((id *)&self->_vmuTask, 0);
}

@end
