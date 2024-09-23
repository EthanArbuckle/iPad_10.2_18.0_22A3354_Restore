@implementation VMUCallTreeRoot

- (VMUCallTreeRoot)initWithSymbolicator:(_CSTypeRef)a3 sampler:(id)a4 options:(unint64_t)a5
{
  id v8;
  VMUCallTreeRoot *v9;
  VMUCallTreeRoot *v10;
  NSString *name;
  unint64_t v12;
  uint64_t v13;
  NSMutableSet *uniqueNodeNames;
  uint64_t v15;
  NSMapTable *addressToSymbolNameMap;
  uint64_t v17;
  NSMapTable *addressToLeafSymbolNameMap;
  objc_super v20;

  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VMUCallTreeRoot;
  v9 = -[VMUCallTreeRoot init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    name = v9->super._name;
    v9->super._name = (NSString *)&stru_1E4E04720;

    v10->_symbolicator._opaque_1 = CSRetain();
    v10->_symbolicator._opaque_2 = v12;
    objc_storeStrong((id *)&v10->_sampler, a4);
    v10->_options = a5;
    v13 = objc_opt_new();
    uniqueNodeNames = v10->_uniqueNodeNames;
    v10->_uniqueNodeNames = (NSMutableSet *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    addressToSymbolNameMap = v10->_addressToSymbolNameMap;
    v10->_addressToSymbolNameMap = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    addressToLeafSymbolNameMap = v10->_addressToLeafSymbolNameMap;
    v10->_addressToLeafSymbolNameMap = (NSMapTable *)v17;

  }
  return v10;
}

- (void)setStackLogReader:(id)a3
{
  objc_storeStrong((id *)&self->_stackLogReader, a3);
}

- (void)setVMRegions:(id)a3
{
  objc_storeStrong((id *)&self->_vmRegions, a3);
}

- (void)setCambriaRuntimeVMObjectID:(unint64_t)a3
{
  self->_cambriaRuntimeObjectID = a3;
}

- (void)allBacktracesHaveBeenAdded
{
  _CSTypeRef *p_symbolicator;

  p_symbolicator = &self->_symbolicator;
  CSRelease();
  p_symbolicator->_opaque_1 = 0;
  p_symbolicator->_opaque_2 = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[VMUCallTreeRoot allBacktracesHaveBeenAdded](self, "allBacktracesHaveBeenAdded");
  v3.receiver = self;
  v3.super_class = (Class)VMUCallTreeRoot;
  -[VMUCallTreeNode dealloc](&v3, sel_dealloc);
}

- (id)descriptionStringForAddress:(unint64_t)a3 atTime:(unint64_t)a4 leafFrame:(BOOL)a5 startOfRecursion:(BOOL)a6
{
  _BOOL4 v6;
  id *v10;
  const char *Path;
  BOOL v12;
  const char *v13;
  BOOL v14;
  id v15;
  uint64_t Name;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  VMUStackLogReader *stackLogReader;
  __CFString *v28;
  unint64_t options;
  __CFString *v30;
  id Range;
  const __CFString *v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  unint64_t v36;
  VMUStackLogReader *v37;
  uint64_t Filename;
  __CFString *v39;
  NSMutableSet *v40;
  id v41;
  void *v43;
  const char *v44;
  BOOL v45;
  int v46;
  _BOOL4 v47;
  __CFString *v48;
  void *v49;
  id *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v6 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  -[VMUStackLogReader vmuVMRegionForAddress:](self->_stackLogReader, "vmuVMRegionForAddress:");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  v45 = a5;
  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  Path = (const char *)CSSymbolOwnerGetPath();
  if (Path)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (!v12)
    Path = (const char *)objc_msgSend(v10[5], "UTF8String");
  if ((self->_options & 0x10) != 0)
  {
    v13 = Path;
    v14 = isSystemPath(Path);
    Path = v13;
    if (v14)
    {
      v15 = 0;
      goto LABEL_64;
    }
  }
  v44 = Path;
  v47 = v6;
  Name = CSSymbolOwnerGetName();
  v50 = v10;
  if (Name)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v17 = self->_vmRegions;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      v48 = CFSTR("Rosetta Runtime Routines");
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v23 = a3 - objc_msgSend((id)v22, "range");
          if (v23 < v24)
          {
            if (*(_DWORD *)(v22 + 104) == 234)
            {
              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(v22 + 232), 234, 0, 0, 0);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
            if (*(_QWORD *)(v22 + 112) == self->_cambriaRuntimeObjectID)
              goto LABEL_24;
          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v19)
          continue;
        break;
      }
      v48 = CFSTR("<unknown binary>");
    }
    else
    {
      v48 = CFSTR("<unknown binary>");
    }
LABEL_24:

  }
  CSSymbolicatorGetSymbolWithAddressAtTime();
  v25 = CSSymbolGetName();
  if (v25
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25),
        (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (stackLogReader = self->_stackLogReader) != 0
    && (-[VMUStackLogReader functionNameForPCaddress:](stackLogReader, "functionNameForPCaddress:", a3),
        (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    VMUSimplifyCPlusPlusSymbolName(v26);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    options = self->_options;
    if ((options & 0x20) != 0 || (options & 0x40) != 0 && isSystemPath(v44))
    {
      v49 = 0;
      v30 = 0;
      Range = 0;
      v46 = 1;
      goto LABEL_48;
    }
    Range = (id)CSSymbolGetRange();
    if (!Range)
      Range = (id)-[VMUStackLogReader functionRangeContainingPCaddress:](self->_stackLogReader, "functionRangeContainingPCaddress:", a3);
    v33 = 0;
    if (v45)
    {
      v30 = CFSTR("0");
      v46 = 1;
      goto LABEL_46;
    }
    v32 = CFSTR("%qu");
    goto LABEL_44;
  }
  v28 = kVMUUnknownSymbolName[0];
  Range = (id)CSSymbolOwnerGetBaseAddress();
  if (!Range && v50)
    Range = v50[1];
  if (Range)
  {
    v32 = CFSTR("0x%qx");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%qx"), Range);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v32, a3 - (_QWORD)Range);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    goto LABEL_45;
  }
  v46 = 0;
  v30 = 0;
  v33 = 0;
LABEL_45:
  Range = (id)a3;
LABEL_46:
  v49 = (void *)v33;
  if (Range)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%qx"), Range);
    Range = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_48:
  v34 = &stru_1E4E04720;
  if (v47)
    v34 = CFSTR("  RECURSION COLLAPSED");
  v35 = v34;
  v36 = self->_options;
  CSSymbolOwnerGetSourceInfoWithAddress();
  if ((CSIsNull() & 1) != 0)
  {
    v37 = self->_stackLogReader;
    if (v37)
    {
      if ((v36 & 2) != 0)
        -[VMUStackLogReader sourcePathForPCaddress:](v37, "sourcePathForPCaddress:", a3);
      else
        -[VMUStackLogReader sourceFileNameForPCaddress:](v37, "sourceFileNameForPCaddress:", a3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@:%u"), v35, v43, -[VMUStackLogReader sourceLineNumberForPCaddress:](self->_stackLogReader, "sourceLineNumberForPCaddress:", a3));
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }

      if (v39)
        goto LABEL_59;
    }
  }
  else
  {
    if ((v36 & 2) != 0)
      Filename = CSSourceInfoGetPath();
    else
      Filename = CSSourceInfoGetFilename();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %s:%u"), v35, Filename, CSSourceInfoGetLineNumber());
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v39)
      goto LABEL_59;
  }
  v39 = v35;
LABEL_59:
  -[VMUCallTreeNode nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:](self, "nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:", v28, v48, v49, v30, Range, v39);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v40 = self->_uniqueNodeNames;
    v41 = v15;
    -[NSMutableSet member:](v40, "member:", v41);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[NSMutableSet addObject:](v40, "addObject:", v41);
      v15 = v41;
    }

  }
  v10 = v50;
LABEL_64:

  return v15;
}

- (id)addBacktrace:(id)a3 count:(unsigned int)a4 numBytes:(unint64_t)a5
{
  id v8;
  int v9;
  int v10;
  VMUCallTreeRoot *v11;
  unint64_t options;
  uint64_t v13;
  VMUSampler *sampler;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSMapTable *threadPortToNameMap;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  int *v26;
  NSMapTable *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  void *context;
  id v34;
  unint64_t v35;
  unsigned int v36;
  char v37;
  void *key;

  v8 = a3;
  v9 = objc_msgSend(v8, "backtraceLength");
  if (v9)
  {
    v10 = v9;
    v11 = self;
    context = (void *)MEMORY[0x1A85A9758]();
    key = 0;
    options = v11->_options;
    v11->super._count += a4;
    v11->super._numBytes += a5;
    v13 = (uint64_t)v11;
    v37 = options;
    if ((options & 4) == 0)
    {
      sampler = v11->_sampler;
      if (sampler)
      {
        -[VMUSampler threadDescriptionStringForBacktrace:returnedAddress:](sampler, "threadDescriptionStringForBacktrace:returnedAddress:", v8, &key);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 2;
        v17 = (unint64_t)key;
      }
      else
      {
        if (!v11->_threadPortToNameMap)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
          v18 = objc_claimAutoreleasedReturnValue();
          threadPortToNameMap = v11->_threadPortToNameMap;
          v11->_threadPortToNameMap = (NSMapTable *)v18;

        }
        v17 = objc_msgSend(v8, "thread");
        NSMapGet(v11->_threadPortToNameMap, (const void *)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Thread_%x"), v17, context);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSMapInsert(v11->_threadPortToNameMap, (const void *)v17, v15);
        }
        key = (void *)v17;
        v16 = 1;
      }
      -[VMUCallTreeNode findOrAddChildWithName:address:nodeSearchType:isLeafNode:](v11, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", v15, v17, v16, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      *(_DWORD *)(v13 + 40) += a4;
      *(_QWORD *)(v13 + 32) += a5;

    }
    v36 = a4;
    v20 = objc_msgSend(v8, "backtrace");
    v34 = v8;
    objc_msgSend(v8, "timestamp");
    v21 = (v10 - 1);
    if (v10 - 1 >= 0)
    {
      v35 = a5;
      v22 = 0;
      v23 = v20 + 8 * v21 + 8;
      while (1)
      {
        v24 = *(void **)(v23 + v22 - 8);
        key = v24;
        if (v22)
          break;
        if ((unint64_t)v24 >= 0x1000)
          goto LABEL_19;
LABEL_41:
        v22 -= 8;
        if (v21-- <= 0)
          goto LABEL_43;
      }
      if ((v37 & 8) != 0 && v24 == *(void **)(v23 + v22))
        goto LABEL_41;
LABEL_19:
      if (v21)
      {
        v25 = 0;
        v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToSymbolNameMap;
      }
      else
      {
        v25 = (v11->_options & 0x20) == 0;
        v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToSymbolNameMap;
        if ((v11->_options & 0x20) == 0)
          v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToLeafSymbolNameMap;
      }
      v27 = (NSMapTable *)*(id *)((char *)&v11->super.super.isa + *v26);
      NSMapGet(v27, key);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        if (!key)
        {
          v28 = CFSTR("0x0");
          if (!v25)
            goto LABEL_38;
          goto LABEL_31;
        }
        -[VMUCallTreeRoot descriptionStringForAddress:atTime:leafFrame:startOfRecursion:](v11, "descriptionStringForAddress:atTime:leafFrame:startOfRecursion:");
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
          v28 = (__CFString *)v29;
        else
          v28 = CFSTR("IGNORE THIS FRAME");
        NSMapInsert(v27, key, v28);
      }
      if (v28 == CFSTR("IGNORE THIS FRAME"))
      {
        v28 = CFSTR("IGNORE THIS FRAME");
LABEL_40:

        goto LABEL_41;
      }
      if (!v25)
        goto LABEL_38;
LABEL_31:
      if ((-[__CFString hasPrefix:](v28, "hasPrefix:", kVMUUnknownSymbolName[0]) & 1) == 0)
      {
        objc_msgSend((id)v13, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", v28, 0, 1, 1);
        v30 = objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!*(_QWORD *)(v30 + 24))
            objc_msgSend((id)v30, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", 0, 0, 0, 0);
          objc_msgSend((id)v30, "addAddress:", key);
        }
        goto LABEL_39;
      }
LABEL_38:
      objc_msgSend((id)v13, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", v28, key, 1, 0);
      v30 = objc_claimAutoreleasedReturnValue();

LABEL_39:
      *(_DWORD *)(v30 + 40) += v36;
      *(_QWORD *)(v30 + 32) += v35;
      v13 = v30;
      goto LABEL_40;
    }
LABEL_43:
    objc_autoreleasePoolPop(context);
    v8 = v34;
  }
  else
  {
    v13 = 0;
  }

  return (id)v13;
}

- (id)addBacktrace:(id)a3
{
  return -[VMUCallTreeRoot addBacktrace:count:numBytes:](self, "addBacktrace:count:numBytes:", a3, 1, 0);
}

- (id)addChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v12 = a3;
  v13 = a7;
  -[NSMutableSet member:](self->_uniqueNodeNames, "member:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (id)v14;
    v16 = 1;
  }
  else
  {
    -[NSMutableSet addObject:](self->_uniqueNodeNames, "addObject:", v12);
    v15 = v12;
    v16 = 0;
  }
  objc_msgSend(v13, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", v15, a4, v16, a4 != 0);
  v17 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v17 + 40) += a5;
  *(_QWORD *)(v17 + 32) += a6;

  return (id)v17;
}

- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7
{
  return -[VMUCallTreeRoot addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:](self, "addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:", a3, a4, *(_QWORD *)&a5, a6, a7, a4 != 0);
}

- (id)addUniqueChildWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6 toNode:(id)a7 isLeafNode:(BOOL)a8
{
  id result;

  result = (id)objc_msgSend(a7, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", a3, a4, 0, a8);
  *((_DWORD *)result + 10) += a5;
  *((_QWORD *)result + 4) += a6;
  return result;
}

- (void)addChildCountsIntoNode
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _DWORD *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    v4 = -1;
    do
    {
LABEL_11:
      objc_msgSend(v15, "objectAtIndexedSubscript:", v4);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(v11 + 32);
      objc_msgSend((id)v11, "parent");
      v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v13[4] += v12;

      LODWORD(v12) = *(_DWORD *)(v11 + 40);
      objc_msgSend((id)v11, "parent");
      v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      v14[10] += v12;

      v3 = v15;
      --v4;
    }
    while (v4);
    goto LABEL_12;
  }
  v2 = 0;
  v3 = v15;
  do
  {
    v4 = v2;
    objc_msgSend(v3, "objectAtIndexedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numChildren");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      do
      {
        objc_msgSend(v5, "childAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v9);

        v8 = (v8 + 1);
      }
      while (v7 != (_DWORD)v8);
    }
    v2 = v4 + 1;

    v10 = v4 + 1 >= (unint64_t)objc_msgSend(v15, "count");
    v3 = v15;
  }
  while (!v10);
  if (v4)
    goto LABEL_11;
LABEL_12:

}

- (VMUCallTreeRoot)initWithCallGraphFile:(id)a3 fileHeader:(id *)a4 topFunctionsList:(id *)a5 binaryImagesList:(id *)a6
{
  id v10;
  VMUCallTreeRoot *v11;
  VMUCallTreeRoot *v12;
  const char *v13;
  uint64_t v14;
  VMUCallTreeRoot *v15;
  VMUCallTreeRoot *v16;
  NSString *name;
  void *v18;
  FILE *v19;
  int v20;
  VMUCallTreeRoot *v21;
  void *v22;
  void *v23;
  VMUCallTreeRoot *v24;
  void *v25;
  id *v26;
  void *v27;
  void *v29;
  int v30;
  void *v31;
  VMUCallTreeRoot *v32;
  char *v33;
  void *v34;
  id v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  id v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  VMUCallTreeRoot *v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  void *context;
  char v61;
  id v62;
  id *v63;
  id v64;
  char v65;
  id *v66;
  id *p_isa;
  id *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  FILE *v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  size_t v84[2];

  v10 = a3;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v11 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:](self, "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
  if (!v11)
  {
    v15 = 0;
    goto LABEL_30;
  }
  v12 = v11;
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
  v78 = fopen(v13, "re");
  if (!v78)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "couldn't open %s for reading call tree\n", v13);
    v15 = 0;
    goto LABEL_29;
  }
  if (!a4)
  {
    v14 = 0;
    if (a5)
      goto LABEL_11;
LABEL_15:
    v77 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!a5)
    goto LABEL_15;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v68 = a4;
  v69 = (void *)v14;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v76 = 0;
  }
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v12, 0);
  v16 = v12;
  name = v16->super._name;
  v16->super._name = (NSString *)&stru_1E4E04720;

  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("("));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(")"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = 0;
  v19 = v78;
  v20 = feof(v78);
  v21 = v16;
  v22 = 0;
  v23 = 0;
  v24 = v21;
  if (v20)
    goto LABEL_20;
  v66 = a5;
  p_isa = (id *)&v21->super.super.isa;
  v63 = a6;
  v64 = v10;
  v65 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v59 = 1;
  v61 = 1;
  v32 = v21;
  while (1)
  {
    v33 = fgetln(v19, v84);
    if (!v33)
      break;
    v34 = (void *)MEMORY[0x1A85A9758]();
    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    v36 = (void *)objc_msgSend(v35, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v33, v84[0], 4, 0);
    if (!strncmp(v33, "Call graph:", 0xBuLL))
    {
      v30 = 1;
      goto LABEL_46;
    }
    if (!strncmp(v33, "Total number in stack", 0x15uLL) || v30 == 1 && v84[0] <= 1)
    {
LABEL_37:
      objc_msgSend(v77, "appendString:", v36);
      v30 = 2;
LABEL_46:

      objc_autoreleasePoolPop(v34);
      v23 = v29;
      v22 = v31;
      v24 = v32;
      v19 = v78;
      goto LABEL_47;
    }
    if (!strncmp(v33, "Binary Images:", 0xEuLL))
    {
LABEL_45:
      objc_msgSend(v76, "appendString:", v36);
      v30 = 3;
      goto LABEL_46;
    }
    switch(v30)
    {
      case 0:
        if (objc_msgSend(v36, "integerValue") > 0)
          goto LABEL_42;
        objc_msgSend(v69, "appendString:", v36);
        v30 = 0;
        goto LABEL_46;
      case 1:
LABEL_42:
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v36);

        objc_msgSend(v23, "setCharactersToBeSkipped:", 0);
        v83 = 0;
        objc_msgSend(v23, "scanUpToCharactersFromSet:intoString:", v18, &v83);
        v62 = v83;
        v37 = objc_msgSend(v62, "length");
        context = v34;
        if (v37 < 4)
        {
          v24 = v32;
          v22 = v31;
          a6 = v63;
          v10 = v64;
          a5 = v66;
          goto LABEL_103;
        }
        v38 = v37;
        if (v37 <= objc_msgSend(v31, "length"))
        {
          do
          {
            objc_msgSend(v72, "removeLastObject");
            objc_msgSend(v72, "lastObject");
            v24 = (VMUCallTreeRoot *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v71, "removeLastObject");
            objc_msgSend(v71, "lastObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = v22;
            v32 = v24;
          }
          while (v38 <= objc_msgSend(v22, "length"));
        }
        else
        {
          v24 = v32;
          v22 = v31;
        }
        v82 = 0;
        a5 = v66;
        if (!objc_msgSend(v23, "scanInteger:", &v82)
          || v82 < 1
          || !objc_msgSend(v23, "scanCharactersFromSet:intoString:", v75, 0))
        {
          goto LABEL_89;
        }
        v39 = 0;
        if (!objc_msgSend(v23, "scanCharactersFromSet:intoString:", v74, 0))
          goto LABEL_66;
        LODWORD(v79) = 0;
        if ((objc_msgSend(v23, "scanFloat:", &v79) & 1) == 0)
        {
          objc_msgSend(v23, "setScanLocation:", objc_msgSend(v23, "scanLocation") - 1);
          v39 = 0;
          goto LABEL_66;
        }
        v81 = 0;
        v40 = objc_msgSend(v23, "scanUpToCharactersFromSet:intoString:", v70, &v81);
        v41 = v81;
        v42 = v41;
        if (!v40)
          goto LABEL_63;
        if (objc_msgSend(v41, "isEqualToString:", CFSTR("K")))
        {
          v43 = *(float *)&v79;
          v44 = 1024.0;
LABEL_62:
          *(float *)&v79 = v43 * v44;
          goto LABEL_63;
        }
        if (objc_msgSend(v42, "isEqualToString:", CFSTR("M")))
        {
          v43 = *(float *)&v79;
          v44 = 1048600.0;
          goto LABEL_62;
        }
        if ((objc_msgSend(v42, "hasSuffix:", CFSTR("bytes")) & 1) == 0 && objc_msgSend(v42, "length"))
        {
LABEL_88:

LABEL_89:
          a6 = v63;
          v10 = v64;
LABEL_103:

          objc_autoreleasePoolPop(context);
LABEL_104:
          if (v33[v84[0] - 1] == 10)
            v33[v84[0] - 1] = 0;
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "parse error with line: '%s'\n", v33);
          v21 = (VMUCallTreeRoot *)p_isa;
LABEL_20:
          if (v68)
            *v68 = 0;
          v25 = v69;
          if (a5)
            *a5 = 0;
          if (a6)
            *a6 = 0;

          v26 = 0;
LABEL_27:
          v27 = v71;
          goto LABEL_28;
        }
LABEL_63:
        v45 = *(float *)&v79;
        if (!objc_msgSend(v23, "scanCharactersFromSet:intoString:", v70, 0)
          || !objc_msgSend(v23, "scanCharactersFromSet:intoString:", v75, 0))
        {
          goto LABEL_88;
        }
        v39 = (unint64_t)v45;

LABEL_66:
        v46 = objc_msgSend(v23, "scanLocation");
        v80 = 0;
        objc_msgSend(v23, "scanUpToCharactersFromSet:intoString:", v73, &v80);
        v47 = v80;
        v48 = objc_msgSend(v47, "length");
        if (v48)
        {
          if (!v39)
          {
            v57 = v46;
            v49 = p_isa[14];
            v50 = v47;
            objc_msgSend(v49, "member:", v50);
            v47 = (id)objc_claimAutoreleasedReturnValue();
            if (!v47)
            {
              objc_msgSend(v49, "addObject:", v50);
              v47 = v50;
            }

            v46 = v57;
            v39 = 0;
LABEL_76:
            -[VMUCallTreeNode findOrAddChildWithName:address:nodeSearchType:isLeafNode:](v24, "findOrAddChildWithName:address:nodeSearchType:isLeafNode:", v47, 0, 0, 0);
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = (_QWORD *)v51;
            if (v51)
            {
              *(_DWORD *)(v51 + 40) = v82;
              *(_QWORD *)(v51 + 32) = v39;
              v79 = 0;
              if ((v61 & 1) != 0
                && (objc_msgSend((id)v51, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", 0, 0, 0, 0, &v79, 0), (v53 = v79) != 0))
              {
                v61 = 1;
              }
              else
              {
                objc_msgSend(v23, "setScanLocation:", v46);
                objc_msgSend(v23, "scanUpToString:intoString:", CFSTR("0x"), 0);
                objc_msgSend(v23, "scanHexLongLong:", &v79);
                v53 = v79;
                v61 = 0;
                if (!v79)
                {
                  v79 = v59;
                  v53 = v59++;
                }
              }
              v52[3] = v53;
              objc_msgSend(v72, "addObject:", v52);
              v58 = v52;
              v54 = v52;

              objc_msgSend(v71, "addObject:", v62);
              v55 = v62;

              if ((id *)v54->super._parent == p_isa)
              {
                *((_DWORD *)p_isa + 10) += v82;
                p_isa[4] = (char *)p_isa[4] + v39;
              }
              v24 = v54;
              v22 = v55;
              v52 = v58;
            }

            v30 = 1;
            v32 = v24;
            v31 = v22;
            v29 = v23;
            v34 = context;
            goto LABEL_46;
          }
          if ((objc_msgSend(v47, "isEqualToString:", kVMURootNodeNameForMallocCallTrees[0]) & 1) == 0)
            goto LABEL_76;
        }
        else
        {
          v65 = 1;
        }

        objc_autoreleasePoolPop(context);
        v30 = 1;
        v19 = v78;
        if (!v48)
          goto LABEL_91;
        break;
      case 2:
        goto LABEL_37;
      case 3:
        goto LABEL_45;
      default:
        goto LABEL_46;
    }
LABEL_47:
    v29 = v23;
    v31 = v22;
    v32 = v24;
    if (feof(v19))
      goto LABEL_91;
  }
  v24 = v32;
  v22 = v31;
  v23 = v29;
LABEL_91:
  v10 = v64;
  a5 = v66;
  if (!v30 || (v65 & 1) != 0)
  {
    a6 = v63;
    v21 = (VMUCallTreeRoot *)p_isa;
    if ((v65 & 1) != 0)
      goto LABEL_104;
    goto LABEL_20;
  }
  objc_msgSend(p_isa, "allBacktracesHaveBeenAdded");
  v25 = v69;
  if (v68)
    *v68 = objc_retainAutorelease(v69);
  if (v66)
    *v66 = objc_retainAutorelease(v77);
  if (v63)
  {
    v56 = objc_retainAutorelease(v76);
    *v63 = v56;
    objc_storeStrong(p_isa + 18, v56);
    v26 = p_isa;
    goto LABEL_27;
  }
  v27 = v71;
  v26 = p_isa;
LABEL_28:
  v12 = v26;

  v15 = v12;
LABEL_29:

LABEL_30:
  return v15;
}

- (id)chargeSystemLibrariesToCallersAndKeepBoundaries:(BOOL)a3
{
  _BOOL4 v3;
  VMUCallTreeRoot *v4;
  id v5;
  NSArray *binaryImages;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  _BOOL4 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v4 = self;
  if (v4->_binaryImagesDescription)
  {
    v20 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    binaryImages = v4->_binaryImages;
    if (!binaryImages)
    {
      +[VMUProcessDescription parseBinaryImagesDescription:](VMUProcessDescription, "parseBinaryImagesDescription:", v4->_binaryImagesDescription);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v4->_binaryImages;
      v4->_binaryImages = (NSArray *)v7;

      binaryImages = v4->_binaryImages;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = binaryImages;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKey:", CFSTR("ExecutablePath"));
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (isSystemPath((const char *)objc_msgSend(v15, "UTF8String")))
          {
            objc_msgSend(v14, "objectForKey:", CFSTR("DisplayName"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length"))
              objc_msgSend(v5, "addObject:", v16);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    if (v20)
      v17 = CFSTR("KEEP-BOUNDARIES PLACEHOLDER");
    else
      v17 = 0;
    -[VMUCallTreeNode chargeLibrariesInSet:toCaller:parentLibrary:](v4, "chargeLibrariesInSet:toCaller:parentLibrary:", v5, 0, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v4 = (VMUCallTreeRoot *)v18;
  }
  return v4;
}

- (NSString)binaryImagesDescription
{
  return self->_binaryImagesDescription;
}

- (void)setBinaryImagesDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryImages, 0);
  objc_storeStrong((id *)&self->_binaryImagesDescription, 0);
  objc_storeStrong((id *)&self->_threadPortToNameMap, 0);
  objc_storeStrong((id *)&self->_addressToLeafSymbolNameMap, 0);
  objc_storeStrong((id *)&self->_addressToSymbolNameMap, 0);
  objc_storeStrong((id *)&self->_uniqueNodeNames, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_vmRegions, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);
}

@end
