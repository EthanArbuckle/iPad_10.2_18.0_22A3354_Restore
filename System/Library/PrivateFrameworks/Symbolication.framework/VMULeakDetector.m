@implementation VMULeakDetector

- (VMULeakDetector)initWithTask:(unsigned int)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  VMUTask *v13;
  VMULeakDetector *v14;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", v8);
  v14 = -[VMULeakDetector initWithVMUTask:graph:scanner:stackLogReader:](self, "initWithVMUTask:graph:scanner:stackLogReader:", v13, v12, v11, v10);

  return v14;
}

- (VMULeakDetector)initWithVMUTask:(id)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VMULeakDetector *v15;
  VMULeakDetector *v16;
  VMUTaskMemoryScanner *scanner;
  int v18;
  NSMutableString *outputString;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VMULeakDetector;
  v15 = -[VMULeakDetector init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_scanner, a5);
    objc_storeStrong((id *)&v16->_stackLogReader, a6);
    objc_storeStrong((id *)&v16->_graph, a4);
    objc_storeStrong((id *)&v16->_task, a3);
    v16->_showBinaryContents = 0;
    *(_DWORD *)&v16->_showLeakedVMregions = 0;
    scanner = v16->_scanner;
    if (scanner)
      v18 = -[VMUTaskMemoryScanner objectContentLevel](scanner, "objectContentLevel");
    else
      v18 = 3;
    v16->_objectContentLevel = v18;
    *(_DWORD *)&v16->_checkAbandoned = 0;
    v16->_referenceTreeShowRegionVirtualSize = 0;
    v16->_max_contents_bytes = 128;
    v16->_numExcluded = 0;
    v16->_outputFile = (__sFILE *)*MEMORY[0x1E0C80C20];
    outputString = v16->_outputString;
    v16->_outputString = 0;

  }
  return v16;
}

- (void)printout:(const char *)a3
{
  NSMutableString *outputString;
  void *v5;
  FILE *outputFile;
  void *v7;
  va_list v8;
  uint64_t v9;

  if (self->_outputString || self->_outputFile)
  {
    v8 = (va_list)&v9;
    if (self->_outputString)
    {
      v7 = 0;
      if (vasprintf((char **)&v7, a3, v8) < 0 || !v7)
        -[VMULeakDetector printout:].cold.1();
      outputString = self->_outputString;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](outputString, "appendString:", v5);

      free(v7);
    }
    else
    {
      outputFile = self->_outputFile;
      if (outputFile)
        vfprintf(outputFile, a3, v8);
    }
  }
}

- (BOOL)checkTaskExistence
{
  return 1;
}

- (id)scannerOrGraph
{
  void *scanner;

  scanner = self->_scanner;
  if (!scanner)
    scanner = self->_graph;
  return scanner;
}

- (id)labelForNode:(unsigned int)a3 details:(id)a4 shortLabel:(id)a5
{
  int v5;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  int v11;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;

  v5 = (int)a5;
  v7 = *(_QWORD *)&a3;
  if (VMUGraphNodeType_IsVMRegion(*(_QWORD *)(a4.var0 + 8) >> 60)
    && (-[VMUTask isCore](self->_task, "isCore")
     || -[VMUTask taskPort](self->_task, "taskPort") && -[VMUTask taskPort](self->_task, "taskPort") != -1))
  {
    v9 = *(_QWORD *)a4.var0 & ~*MEMORY[0x1E0C85AA0];
    v18 = 0;
    -[VMUTask memoryCache](self->_task, "memoryCache", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "machVMPageRangeQueryWithAddress:size:dispositions:dispositionsCount:", v9, *MEMORY[0x1E0C85AD8], &v18, &v17);
    v11 = v18 & 0x11;

    if ((_DWORD)v9 || v11 == 0)
      return 0;
  }
  -[VMULeakDetector scannerOrGraph](self, "scannerOrGraph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5)
    objc_msgSend(v14, "shortLabelForNode:", v7);
  else
    objc_msgSend(v14, "labelForNode:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)printContents:(void *)a3 size:(unint64_t)a4
{
  unint64_t max_contents_bytes;
  unint64_t v6;
  unsigned int *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  char v15;
  int v16;
  const char *v17;
  unint64_t v18;

  if (!a3)
  {
    v17 = "< content unavailable >\n";
    goto LABEL_24;
  }
  max_contents_bytes = self->_max_contents_bytes;
  if (max_contents_bytes >= a4)
    v6 = a4;
  else
    v6 = self->_max_contents_bytes;
  if (v6 >= 4)
  {
    v7 = (unsigned int *)a3;
    v18 = a4;
    v8 = v6 >> 2;
    do
    {
      -[VMULeakDetector printout:](self, "printout:", "\t");
      if (v8 >= 4)
        v9 = 4;
      else
        v9 = v8;
      v10 = v9;
      v11 = v7;
      do
      {
        v12 = *v11++;
        -[VMULeakDetector printout:](self, "printout:", "0x%08x ", v12);
        --v10;
      }
      while (v10);
      -[VMULeakDetector printout:](self, "printout:", "\t");
      if ((4 * v9) <= 1)
        v13 = 1;
      else
        v13 = (4 * v9);
      v14 = v7;
      do
      {
        v16 = *(unsigned __int8 *)v14;
        v14 = (unsigned int *)((char *)v14 + 1);
        v15 = v16;
        if ((v16 - 32) >= 0x5F)
          v15 = 46;
        -[VMULeakDetector printout:](self, "printout:", "%c", v15);
        --v13;
      }
      while (v13);
      -[VMULeakDetector printout:](self, "printout:", "\n");
      v7 += v9;
      v8 -= v9;
    }
    while (v8);
    max_contents_bytes = self->_max_contents_bytes;
    a4 = v18;
  }
  if (max_contents_bytes < a4)
  {
    v17 = "\t...\n";
LABEL_24:
    -[VMULeakDetector printout:](self, "printout:", v17);
  }
}

- (void)printLeak:(const char *)a3 node:(unsigned int)a4 details:(id)a5 region:(id)a6 stop:
{
  uint64_t v7;
  unsigned int *v10;
  _BOOL4 IsVMRegion;
  VMUStackLogReader *stackLogReader;
  void *v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  VMUStackLogReader *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  _BOOL4 showBinaryContents;
  void *v35;
  __int128 v36;
  uint64_t v37;

  v7 = *(_QWORD *)&a4;
  v10 = (unsigned int *)a6;
  IsVMRegion = VMUGraphNodeType_IsVMRegion(*(_QWORD *)(a5.var0 + 8) >> 60);
  if ((self->_showLeakedVMregions || !IsVMRegion) && (!self->_showOnlyVMregions || IsVMRegion))
  {
    stackLogReader = self->_stackLogReader;
    if (stackLogReader)
    {
      if (-[VMUStackLogReader usesLiteMode](stackLogReader, "usesLiteMode"))
      {
        -[VMUProcessObjectGraph zoneNameForIndex:](self->_graph, "zoneNameForIndex:", v10[37]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      v16 = v14;
      if (objc_msgSend(v16, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone")))
        v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper")) ^ 1;
      else
        v17 = 0;

      v18 = 4 * self->_fullStacks;
      v19 = self->_stackLogReader;
      v36 = *(_OWORD *)a5.var0;
      v37 = *(_QWORD *)(a5.var0 + 16);
      -[VMUStackLogReader symbolicatedBacktraceForNode:nodeDetails:isLiteZone:options:](v19, "symbolicatedBacktraceForNode:nodeDetails:isLiteZone:options:", v7, &v36, v17, v18);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (v15 == VMUBacktraceIsExcludedMarker)
    {
      ++self->_numExcluded;
      goto LABEL_38;
    }
    -[VMULeakDetector printout:](self, "printout:", "%s: %#llx  size=%llu  ", a3, *(_QWORD *)a5.var0, *(_QWORD *)(a5.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
    if (VMUGraphNodeType_IsVMRegion(*(_QWORD *)(a5.var0 + 8) >> 60))
    {
      objc_msgSend(v10, "type");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "descriptionWithOptions:maximumLength:", 513, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("VM: %@"), v23);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = CFSTR("VM: unknown region type");
      }
      v27 = objc_retainAutorelease(v24);
      -[VMULeakDetector printout:](self, "printout:", "%s", -[__CFString UTF8String](v27, "UTF8String"));
    }
    else
    {
      -[VMUProcessObjectGraph zoneNameForIndex:](self->_graph, "zoneNameForIndex:", v10[37]);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[VMULeakDetector printout:](self, "printout:", "zone: %s", objc_msgSend(v25, "UTF8String"));

      v26 = *(void **)(a5.var0 + 16);
      if (!v26)
      {
LABEL_29:
        if ((self->_objectContentLevel & 0xFFFFFFFE) == 2)
        {
          v36 = *(_OWORD *)a5.var0;
          v37 = *(_QWORD *)(a5.var0 + 16);
          -[VMULeakDetector labelForNode:details:shortLabel:](self, "labelForNode:details:shortLabel:", v7, &v36, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32)
          {
            -[VMULeakDetector printout:](self, "printout:", "   %s\n", objc_msgSend(objc_retainAutorelease(v32), "UTF8String"));
          }
          else
          {
            showBinaryContents = self->_showBinaryContents;
            -[VMULeakDetector printout:](self, "printout:", "\n");
            if (showBinaryContents)
            {
              -[VMULeakDetector scannerOrGraph](self, "scannerOrGraph");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[VMULeakDetector printContents:size:](self, "printContents:size:", objc_msgSend(v35, "contentForNode:", v7), *(_QWORD *)(a5.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);

            }
          }

          if (!v15)
            goto LABEL_38;
        }
        else
        {
          -[VMULeakDetector printout:](self, "printout:", "\n");
          if (!v15)
            goto LABEL_38;
        }
        -[VMULeakDetector printout:](self, "printout:", "\tCall stack: %s\n", -[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String"));
        -[VMULeakDetector printout:](self, "printout:", "\n");
LABEL_38:

        goto LABEL_39;
      }
      if (self->_showRawClassNames)
        objc_msgSend(v26, "className");
      else
        objc_msgSend(v26, "displayName");
      v27 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = -[__CFString UTF8String](v27, "UTF8String");
      objc_msgSend(*(id *)(a5.var0 + 16), "typeName");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "UTF8String");
      objc_msgSend(*(id *)(a5.var0 + 16), "binaryName");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[VMULeakDetector printout:](self, "printout:", "   %s  %s  %s", v28, v30, objc_msgSend(v31, "UTF8String"));

    }
    goto LABEL_29;
  }
LABEL_39:

}

- (id)nodeTypeDescription:(unsigned int)a3 details:(id *)a4 mallocBySize:(id)a5
{
  unint64_t v7;
  int v8;
  void *var0;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;

  if (a4)
  {
    v7 = a4[1].var0 >> 60;
    if ((_DWORD)v7 == 1)
    {
      v8 = (int)a5;
      var0 = (void *)a4[2].var0;
      if (self->_showRawClassNames)
        objc_msgSend(var0, "className", *(_QWORD *)&a3);
      else
        objc_msgSend(var0, "displayName", *(_QWORD *)&a3);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = (__CFString *)v10;
      else
        v11 = CFSTR("malloc-block");
      if (!v10 && v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("malloc<%s>"), VMUMemorySizeString(a4[1].var0 & 0xFFFFFFFFFFFFFFFLL));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = *(_QWORD *)&a3;
      if (VMUGraphNodeType_IsVMRegion(v7))
      {
        -[VMUProcessObjectGraph vmuVMRegionForNode:](self->_graph, "vmuVMRegionForNode:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("VM: %@"), v15);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = a4[1].var0 >> 60;
        v17 = CFSTR("thread");
        if ((_DWORD)v16 != 4)
          v17 = 0;
        if ((_DWORD)v16 == 3)
          v11 = CFSTR("kernel");
        else
          v11 = (__CFString *)v17;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)nodeDescription:(unsigned int)a3 usingDetails:(id *)a4
{
  if (self->_groupByType)
    -[VMULeakDetector nodeTypeDescription:details:mallocBySize:](self, "nodeTypeDescription:details:mallocBySize:", *(_QWORD *)&a3, a4, 1);
  else
    -[VMUProcessObjectGraph nodeDescription:withOffset:showLabel:](self->_graph, "nodeDescription:withOffset:showLabel:", *(_QWORD *)&a3, 0, (self->_objectContentLevel & 0xFFFFFFFE) == 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nodeDescription:(unsigned int)a3
{
  uint64_t v3;
  VMUProcessObjectGraph *graph;
  _QWORD v7[3];

  v3 = *(_QWORD *)&a3;
  memset(v7, 0, sizeof(v7));
  graph = self->_graph;
  if (graph)
    -[VMUObjectGraph nodeDetails:](graph, "nodeDetails:", *(_QWORD *)&a3);
  -[VMULeakDetector nodeDescription:usingDetails:](self, "nodeDescription:usingDetails:", v3, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  __int128 v9;
  void *v10;
  _OWORD v12[2];
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  v9 = *(_OWORD *)&a3->var1.var1;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v9;
  var2 = a3->var2;
  objc_msgSend(v8, "referenceDescription:dstDescription:is64bit:", v12, v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t var0;
  unsigned int v16;
  const char *v17;
  __CFString *v18;
  void *v19;
  uint64_t v21;
  char __str[32];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)*((_QWORD *)a3->var0 + 2);
  v9 = 3;
  if (v5)
    v9 = 7;
  if ((a3->var1.var0 & v9) != 0 && *((_QWORD *)a3->var0 + 1) >> 60 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unaligned +%lld:  --> %@"), a3->var1.var0, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  else
  {
    objc_msgSend(*((id *)a3->var2 + 2), "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("Storage)"));

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "fieldAtOrBeforeOffset:", LODWORD(a3->var1.var0));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "ivarName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        var0 = a3->var1.var0;
        v16 = objc_msgSend(v13, "offset");
        __str[0] = 0;
        if (var0 != v16)
          snprintf(__str, 0x20uLL, " + %llu", var0 - v16);
        v17 = VMUScanTypeKeywordDescription(objc_msgSend(v13, "scanType"));
        if (v17 && *v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s "), v17);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = &stru_1E4E04720;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%s --> %@"), v18, v14, __str, v7);
        v21 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v21;
      }

    }
    return v7;
  }
}

- (void)buildLeakTree
{
  void *v2;
  size_t v3;
  _DWORD *v4;
  void *v5;
  VMULeakDetector *v6;
  void *v7;
  VMUDebugTimer *debugTimer;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  VMUDebugTimer *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  VMUProcessObjectGraph *leakedGraph;
  VMUDebugTimer *v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  VMUDebugTimer *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  void *v23;
  uint64_t i;
  id v25;
  char v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  VMUDebugTimer *v31;
  uint64_t v32;
  NSObject *v33;
  os_signpost_id_t v34;
  VMUDebugTimer *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  void *v38;
  VMULeakDetector *v39;
  VMUDebugTimer *v40;
  uint64_t v41;
  NSObject *v42;
  os_signpost_id_t v43;
  VMUDebugTimer *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  VMUCallTreeRootWithBacktrace *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  VMULeakDetector *v51;
  VMUDebugTimer *v52;
  uint64_t v53;
  NSObject *v54;
  os_signpost_id_t v55;
  VMUDebugTimer *v56;
  NSObject *v57;
  os_signpost_id_t v58;
  int v59;
  void *v60;
  unint64_t v61;
  VMUCallTreeRootWithBacktrace *v62;
  id v63;
  void *v64;
  VMUCallTreeRootWithBacktrace *v65;
  VMULeakDetector *v66;
  __CFString *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  VMUCallTreeRootWithBacktrace *v83;
  id v84;
  VMUDebugTimer *v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  os_signpost_id_t v89;
  VMULeakDetector *v90;
  VMUDebugTimer *v91;
  uint64_t v92;
  NSObject *v93;
  os_signpost_id_t v94;
  VMUDebugTimer *v95;
  NSObject *v96;
  os_signpost_id_t v97;
  NSMutableArray *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  VMUDebugTimer *v102;
  uint64_t v103;
  NSObject *v104;
  os_signpost_id_t v105;
  id v106;
  void *v107;
  NSMapTable *table;
  uint64_t v109;
  id v110;
  void *v111;
  unsigned int *v112;
  VMUCallTreeRootWithBacktrace *v113;
  VMUStackLogReader *v114;
  __CFString *v115;
  id v116;
  VMUStackLogReader *v117;
  NSMapTable *v118;
  id *v119;
  _DWORD *v120;
  id *v121;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[4];
  id v128;
  id v129;
  VMUCallTreeRootWithBacktrace *v130;
  id v131;
  VMULeakDetector *v132;
  __CFString *v133;
  VMUStackLogReader *v134;
  id v135;
  NSMapEnumerator *p_pattern4;
  id *v137;
  uint64_t v138;
  void *v139;
  _DWORD *v140;
  id *v141;
  NSMapEnumerator __pattern4;
  char v143;
  void *value;
  void *key;
  _QWORD v146[4];
  NSMapTable *v147;
  _QWORD v148[4];
  id v149;
  VMULeakDetector *v150;
  id v151;
  VMUStackLogReader *v152;
  id v153;
  NSMapTable *v154;
  id v155;
  _DWORD *v156;
  int v157;
  _QWORD v158[5];
  _QWORD v159[7];
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  int v163;
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  -[VMUDirectedGraph subgraphWithMarkedNodes:](self->_graph, "subgraphWithMarkedNodes:", self->_leakedNodes);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMULeakDetector setLeakedGraph:](self, "setLeakedGraph:", v2);

  v121 = (id *)malloc_type_calloc(-[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize"), 8uLL, 0x80040B8603338uLL);
  v113 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRootWithBacktrace alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
  v160 = 0;
  v161 = &v160;
  v162 = 0x2020000000;
  v163 = 0;
  v3 = 4 * -[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize");
  LODWORD(__pattern4._pi) = -1;
  v112 = (unsigned int *)malloc_type_malloc(v3, 0x100004052888210uLL);
  memset_pattern4(v112, &__pattern4, v3);
  LODWORD(v3) = -[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize");
  v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v4 = v3;
  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v159[2] = __32__VMULeakDetector_buildLeakTree__block_invoke;
  v159[3] = &unk_1E4E013B8;
  v159[5] = v112;
  v159[4] = &v160;
  v111 = v4;
  v159[6] = v4;
  v5 = (void *)MEMORY[0x1A85A995C](v159);
  v6 = self;
  v7 = (void *)-[VMUProcessObjectGraph copy](self->_leakedGraph, "copy");
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v9 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v9)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v10, OS_SIGNPOST_INTERVAL_END, v11, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
      }

      v6 = self;
      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "buildLeakTree");
  -[VMUDebugTimer startWithCategory:message:](v6->_debugTimer, "startWithCategory:message:", "buildLeakTree", "identifying strongly-connected-components (cycles) in the graph");
  v12 = v6->_debugTimer;
  if (v12)
  {
    -[VMUDebugTimer logHandle](v12, "logHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[VMUDebugTimer signpostID](v6->_debugTimer, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "buildLeakTree", "identifying strongly-connected-components (cycles) in the graph", (uint8_t *)&__pattern4, 2u);
    }

    v6 = self;
  }
  leakedGraph = v6->_leakedGraph;
  v158[0] = MEMORY[0x1E0C809B0];
  v158[1] = 3221225472;
  v158[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_52;
  v158[3] = &unk_1E4E013E0;
  v158[4] = v6;
  -[VMUObjectGraph stronglyConnectedComponentSearch:withRecorder:](leakedGraph, "stronglyConnectedComponentSearch:withRecorder:", 0xFFFFFFFFLL, v158);
  v16 = v6->_debugTimer;
  if (v16)
  {
    v17 = -[VMUDebugTimer signpostID](v16, "signpostID");
    v16 = v6->_debugTimer;
    if (v17)
    {
      -[VMUDebugTimer logHandle](v16, "logHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = -[VMUDebugTimer signpostID](v6->_debugTimer, "signpostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v18, OS_SIGNPOST_INTERVAL_END, v19, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
      }

      v6 = self;
      v16 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v16, "endEvent:", "buildLeakTree");
  -[VMUDebugTimer startWithCategory:message:](v6->_debugTimer, "startWithCategory:message:", "buildLeakTree", "identifying root leaks and cycles");
  v20 = v6->_debugTimer;
  if (v20)
  {
    -[VMUDebugTimer logHandle](v20, "logHandle");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = -[VMUDebugTimer signpostID](v6->_debugTimer, "signpostID");
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "buildLeakTree", "identifying root leaks and cycles", (uint8_t *)&__pattern4, 2u);
    }

    v6 = self;
  }
  v114 = v6->_stackLogReader;
  if (v114)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 256);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VMUStackLogReader inspectingLiveProcess](v114, "inspectingLiveProcess")
      && -[VMUStackLogReader usesLiteMode](v114, "usesLiteMode"))
    {
      for (i = 0; i < objc_msgSend(v7, "zoneCount"); i = (i + 1))
      {
        objc_msgSend(v7, "zoneNameForIndex:", i);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone")) & 1) != 0)
        {
          v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper"));

          if ((v26 & 1) == 0)
          {

            goto LABEL_35;
          }
        }
        else
        {

        }
      }
    }
  }
  else
  {
    v23 = 0;
  }
  LODWORD(i) = -1;
LABEL_35:
  v27 = -[VMUDirectedGraph nodeNamespaceSize](self->_leakedGraph, "nodeNamespaceSize");
  v120 = malloc_type_calloc(1uLL, ((v27 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v120 = v27;
  -[VMUDirectedGraph invertedGraph](self->_leakedGraph, "invertedGraph");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  v148[0] = MEMORY[0x1E0C809B0];
  v148[1] = 3221225472;
  v148[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_57;
  v148[3] = &unk_1E4E01430;
  v30 = v28;
  v149 = v30;
  v150 = self;
  v106 = v29;
  v151 = v106;
  v156 = v120;
  v110 = v5;
  v155 = v110;
  v117 = v114;
  v152 = v117;
  v116 = v7;
  v153 = v116;
  v157 = i;
  table = v23;
  v154 = table;
  objc_msgSend(v30, "enumerateObjectsWithBlock:", v148);

  if (v114
    && (!-[VMUStackLogReader usesLiteMode](v117, "usesLiteMode", v106)
     || (-[VMUStackLogReader inspectingLiveProcess](v117, "inspectingLiveProcess") & 1) == 0))
  {
    v31 = self->_debugTimer;
    if (v31)
    {
      v32 = -[VMUDebugTimer signpostID](v31, "signpostID");
      v31 = self->_debugTimer;
      if (v32)
      {
        -[VMUDebugTimer logHandle](v31, "logHandle");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(__pattern4._pi) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v33, OS_SIGNPOST_INTERVAL_END, v34, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
        }

        v31 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v31, "endEvent:", "buildLeakTree");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "buildLeakTree", "enumerate stack logs to populate rootLeakAddressToStackIDMap");
    v35 = self->_debugTimer;
    if (v35)
    {
      -[VMUDebugTimer logHandle](v35, "logHandle");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "buildLeakTree", "enumerate stack logs to populate rootLeakAddressToStackIDMap", (uint8_t *)&__pattern4, 2u);
      }

    }
    v146[0] = MEMORY[0x1E0C809B0];
    v146[1] = 3221225472;
    v146[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_66;
    v146[3] = &unk_1E4E01458;
    v147 = table;
    -[VMUStackLogReader enumerateMSLRecordsAndPayloads:](v117, "enumerateMSLRecordsAndPayloads:", v146);

  }
  v38 = (void *)objc_opt_new();
  -[VMULeakDetector setLeakTreeRootsArray:](self, "setLeakTreeRootsArray:", v38);

  if (v114)
  {
    v39 = self;
    v40 = self->_debugTimer;
    if (v40)
    {
      v41 = -[VMUDebugTimer signpostID](v40, "signpostID");
      v40 = self->_debugTimer;
      if (v41)
      {
        -[VMUDebugTimer logHandle](v40, "logHandle");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          LOWORD(__pattern4._pi) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v42, OS_SIGNPOST_INTERVAL_END, v43, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
        }

        v39 = self;
        v40 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v40, "endEvent:", "buildLeakTree", v106);
    -[VMUDebugTimer startWithCategory:message:](v39->_debugTimer, "startWithCategory:message:", "buildLeakTree", "invert rootLeakAddressToStackIDMap to produce stackID --> {size,count,root-leak-call-tree-root} map");
    v44 = v39->_debugTimer;
    if (v44)
    {
      -[VMUDebugTimer logHandle](v44, "logHandle");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = -[VMUDebugTimer signpostID](v39->_debugTimer, "signpostID");
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v46, "buildLeakTree", "invert rootLeakAddressToStackIDMap to produce stackID --> {size,count,root-leak-call-tree-root} map", (uint8_t *)&__pattern4, 2u);
      }

    }
    v119 = (id *)malloc_type_calloc(objc_msgSend(v116, "nodeNamespaceSize"), 8uLL, 0x80040B8603338uLL);
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 0);
    v118 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    memset(&__pattern4, 0, sizeof(__pattern4));
    NSEnumerateMapTable(&__pattern4, table);
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&__pattern4, &key, &value))
    {
      NSMapGet(v118, value);
      v47 = (VMUCallTreeRootWithBacktrace *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        v48 = (void *)MEMORY[0x1A85A9758]();
        v47 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRootWithBacktrace alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
        if (self->_fullStacks)
          v49 = 68;
        else
          v49 = 64;
        -[VMUStackLogReader symbolicatedBacktraceForStackID:options:](v117, "symbolicatedBacktraceForStackID:options:", value, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUCallTreeRootWithBacktrace setBacktraceString:](v47, "setBacktraceString:", v50);

        -[NSMutableArray addObject:](self->_leakTreeRootsArray, "addObject:", v47);
        NSMapInsert(v118, value, v47);
        objc_autoreleasePoolPop(v48);
      }

    }
    NSEndMapTableEnumeration(&__pattern4);
  }
  else
  {
    v118 = 0;
    v119 = 0;
  }
  v51 = self;
  v115 = kVMURootRetainCycle[0];
  v109 = -[__CFString length](v115, "length");
  v52 = self->_debugTimer;
  if (v52)
  {
    v53 = -[VMUDebugTimer signpostID](v52, "signpostID");
    v52 = self->_debugTimer;
    if (v53)
    {
      -[VMUDebugTimer logHandle](v52, "logHandle");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v54, OS_SIGNPOST_INTERVAL_END, v55, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
      }

      v51 = self;
      v52 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v52, "endEvent:", "buildLeakTree", v106);
  -[VMUDebugTimer startWithCategory:message:](v51->_debugTimer, "startWithCategory:message:", "buildLeakTree", "building call tree from references");
  v56 = v51->_debugTimer;
  if (v56)
  {
    -[VMUDebugTimer logHandle](v56, "logHandle");
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v58, "buildLeakTree", "building call tree from references", (uint8_t *)&__pattern4, 2u);
    }

  }
  if (*((_DWORD *)v161 + 6))
  {
    v59 = 0;
    do
    {
      v60 = (void *)MEMORY[0x1A85A9758]();
      v61 = v112[v59];
      v62 = v113;
      v63 = v121[v61];
      if (v63)
      {
        v64 = v63;
        if (v114)
        {
          v65 = (VMUCallTreeRootWithBacktrace *)v119[v61];

          v62 = v65;
        }
      }
      else
      {
        memset(&__pattern4, 0, sizeof(__pattern4));
        v66 = self;
        if (v116)
          objc_msgSend(v116, "nodeDetails:", v61);
        if (-[VMUDirectedGraph parentGroupForNode:](self->_leakedGraph, "parentGroupForNode:", v61) == -1)
          v67 = CFSTR("ROOT LEAK: ");
        else
          v67 = v115;
        if (v114)
        {
          v68 = NSMapGet(table, (const void *)__pattern4._pi);
          if (v68)
          {
            NSMapGet(v118, v68);
            v69 = objc_claimAutoreleasedReturnValue();

            v119[v61] = (id)v69;
            v62 = (VMUCallTreeRootWithBacktrace *)v69;
            v66 = self;
          }
        }
        -[VMULeakDetector nodeDescription:usingDetails:](v66, "nodeDescription:usingDetails:", v61, &__pattern4);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v67, "stringByAppendingString:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (self->_groupByType)
          -[VMUCallTreeRoot addChildWithName:address:count:numBytes:toNode:](v62, "addChildWithName:address:count:numBytes:toNode:", v71, 0, 1, __pattern4._si & 0xFFFFFFFFFFFFFFFLL, v62);
        else
          -[VMUCallTreeRoot addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:](v62, "addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:", v71, __pattern4._pi, 1, __pattern4._si & 0xFFFFFFFFFFFFFFFLL, v62, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v121[v61] = v64;

      }
      if (*v120 > v61
        && ((*((unsigned __int8 *)v120 + (v61 >> 3) + 4) >> (v61 & 7)) & 1) != 0
        && (v72 = v64) != 0)
      {
        v73 = v72;
        v74 = 0;
        do
        {
          objc_msgSend(v73, "parent");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (v75)
          {
            objc_msgSend(v73, "parent");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "parent");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v77 == 0;

            if (v78)
            {
              objc_msgSend(v73, "name");
              v79 = objc_claimAutoreleasedReturnValue();

              v74 = (void *)v79;
            }
          }
          objc_msgSend(v73, "parent");
          v80 = objc_claimAutoreleasedReturnValue();

          v73 = (void *)v80;
        }
        while (v80);
      }
      else
      {
        v74 = 0;
      }
      __pattern4._pi = 0;
      __pattern4._si = (NSUInteger)&__pattern4;
      __pattern4._bs = (void *)0x2020000000;
      v143 = 0;
      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_73;
      v127[3] = &unk_1E4E01480;
      v137 = v121;
      v81 = v74;
      v128 = v81;
      p_pattern4 = &__pattern4;
      v138 = v109;
      v82 = v116;
      v129 = v82;
      v83 = v62;
      v130 = v83;
      v84 = v64;
      v131 = v84;
      v139 = v111;
      v135 = v110;
      v132 = self;
      v140 = v120;
      v133 = v115;
      v134 = v117;
      v141 = v119;
      objc_msgSend(v82, "enumerateReferencesOfNode:withBlock:", v61, v127);

      _Block_object_dispose(&__pattern4, 8);
      objc_autoreleasePoolPop(v60);
      ++v59;
    }
    while (v59 != *((_DWORD *)v161 + 6));
  }
  v85 = self->_debugTimer;
  if (v85)
  {
    v86 = v120;
    v87 = -[VMUDebugTimer signpostID](v85, "signpostID");
    v85 = self->_debugTimer;
    if (!v87)
      goto LABEL_118;
    -[VMUDebugTimer logHandle](v85, "logHandle");
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v88, OS_SIGNPOST_INTERVAL_END, v89, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
    }

    v85 = self->_debugTimer;
  }
  v86 = v120;
LABEL_118:
  -[VMUDebugTimer endEvent:](v85, "endEvent:", "buildLeakTree");
  free(v112);
  free(v111);
  free(v86);
  free(v121);
  free(v119);

  v90 = self;
  if (-[VMUCallTreeNode numChildren](v113, "numChildren"))
    -[NSMutableArray addObject:](self->_leakTreeRootsArray, "addObject:", v113);
  v91 = self->_debugTimer;
  if (v91)
  {
    v92 = -[VMUDebugTimer signpostID](v91, "signpostID");
    v91 = self->_debugTimer;
    if (v92)
    {
      -[VMUDebugTimer logHandle](v91, "logHandle");
      v93 = objc_claimAutoreleasedReturnValue();
      v94 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v93, OS_SIGNPOST_INTERVAL_END, v94, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
      }

      v90 = self;
      v91 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v91, "endEvent:", "buildLeakTree");
  -[VMUDebugTimer startWithCategory:message:](v90->_debugTimer, "startWithCategory:message:", "buildLeakTree", "addChildCountsIntoNode");
  v95 = v90->_debugTimer;
  if (v95)
  {
    -[VMUDebugTimer logHandle](v95, "logHandle");
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = -[VMUDebugTimer signpostID](v90->_debugTimer, "signpostID");
    if (v97 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v96, OS_SIGNPOST_INTERVAL_BEGIN, v97, "buildLeakTree", "addChildCountsIntoNode", (uint8_t *)&__pattern4, 2u);
    }

    v90 = self;
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v98 = v90->_leakTreeRootsArray;
  v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v123, v164, 16);
  if (v99)
  {
    v100 = *(_QWORD *)v124;
    do
    {
      for (j = 0; j != v99; ++j)
      {
        if (*(_QWORD *)v124 != v100)
          objc_enumerationMutation(v98);
        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "addChildCountsIntoNode");
      }
      v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v123, v164, 16);
    }
    while (v99);
  }

  -[NSMutableArray sortUsingSelector:](self->_leakTreeRootsArray, "sortUsingSelector:", sel_comparePuttingRetainCycleNodesAtTop_);
  v102 = self->_debugTimer;
  if (v102)
  {
    v103 = -[VMUDebugTimer signpostID](v102, "signpostID");
    v102 = self->_debugTimer;
    if (v103)
    {
      -[VMUDebugTimer logHandle](v102, "logHandle");
      v104 = objc_claimAutoreleasedReturnValue();
      v105 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v104, OS_SIGNPOST_INTERVAL_END, v105, "buildLeakTree", ", (uint8_t *)&__pattern4, 2u);
      }

      v102 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v102, "endEvent:", "buildLeakTree");

  _Block_object_dispose(&v160, 8);
}

_QWORD *__32__VMULeakDetector_buildLeakTree__block_invoke(_QWORD *result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;

  v2 = result[5];
  v3 = *(_QWORD *)(result[4] + 8);
  v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  v5 = (unsigned int *)result[6];
  if (*v5 > a2)
    *((_BYTE *)v5 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  return result;
}

uint64_t __32__VMULeakDetector_buildLeakTree__block_invoke_52(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 >= 2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 128), "addGroupNodeForNodes:count:", a2, a3);
  return result;
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t uniquing_table_index;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *, uint64_t);
  void *v15;
  uint64_t v16;
  id v17;
  void **v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *key;
  void **p_key;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  _QWORD v34[3];
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  _QWORD v40[3];
  int v41;

  v2 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isRootNode:", a2))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "isGroupNode:", v2))
    {
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v41 = 0;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v35 = 0;
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v33 = -1;
      key = 0;
      p_key = &key;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__2;
      v28 = __Block_byref_object_dispose__2;
      v29 = 0;
      v12 = MEMORY[0x1E0C809B0];
      v14 = __32__VMULeakDetector_buildLeakTree__block_invoke_58;
      v15 = &unk_1E4E01408;
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(a1 + 48);
      v6 = *(void **)(v4 + 128);
      v13 = 3221225472;
      v16 = v4;
      v17 = v5;
      v18 = &key;
      v19 = &v36;
      v20 = &v30;
      v7 = *(_QWORD *)(a1 + 88);
      v22 = v40;
      v23 = v7;
      v21 = v34;
      objc_msgSend(v6, "enumerateMembersOfGroupNode:withBlock:", v2, &v12);
      v2 = *((unsigned int *)v31 + 6);
      if (*((_DWORD *)v37 + 6) == 6)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", p_key[5], v12, v13, v14, v15, v16);

      _Block_object_dispose(&key, 8);
      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(v34, 8);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(v40, 8);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v8 = *(void **)(a1 + 56);
    if (v8)
    {
      key = 0;
      p_key = 0;
      v26 = 0;
      if (*(_QWORD *)(a1 + 64))
      {
        objc_msgSend(*(id *)(a1 + 64), "nodeDetails:", v2);
        v8 = *(void **)(a1 + 56);
      }
      if (objc_msgSend(v8, "inspectingLiveProcess", v12, v13, v14, v15, v16)
        && objc_msgSend(*(id *)(a1 + 56), "usesLiteMode"))
      {
        objc_msgSend(*(id *)(a1 + 64), "vmuVMRegionForNode:", v2);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9 && *(_DWORD *)(v9 + 148) == *(_DWORD *)(a1 + 96))
        {
          objc_msgSend(*(id *)(a1 + 56), "liteMSLPayloadforMallocAddress:size:", key, (unint64_t)p_key & 0xFFFFFFFFFFFFFFFLL);
          uniquing_table_index = msl_payload_get_uniquing_table_index();
        }
        else
        {
          uniquing_table_index = -1;
        }

      }
      else
      {
        uniquing_table_index = -1;
      }
      NSMapInsert(*(NSMapTable **)(a1 + 72), key, (const void *)uniquing_table_index);
    }
  }
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_58(_QWORD *a1, uint64_t a2)
{
  unsigned int v2;
  void *v4;
  uint64_t v5;
  unsigned int *v6;

  v2 = a2;
  v4 = *(void **)(a1[4] + 128);
  if (v4)
    objc_msgSend(v4, "nodeDetails:", a2);
  v5 = *(_QWORD *)(a1[7] + 8);
  if (!*(_DWORD *)(v5 + 24))
  {
    *(_DWORD *)(v5 + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v2;
  }
  if (*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) != 5)
    *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
  v6 = (unsigned int *)a1[11];
  if (*v6 > v2)
    *((_BYTE *)v6 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
  ++*(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_66(uint64_t a1, char a2, void *key)
{
  uint64_t uniquing_table_index;
  NSMapTable *v6;
  const void *v7;

  if ((a2 & 0x12) != 0)
  {
    if (!NSMapGet(*(NSMapTable **)(a1 + 32), key))
      return;
    uniquing_table_index = msl_payload_get_uniquing_table_index();
    v6 = *(NSMapTable **)(a1 + 32);
    v7 = key;
    goto LABEL_7;
  }
  if ((a2 & 0x24) != 0 && NSMapGet(*(NSMapTable **)(a1 + 32), key))
  {
    v6 = *(NSMapTable **)(a1 + 32);
    v7 = key;
    uniquing_table_index = -1;
LABEL_7:
    NSMapInsert(v6, v7, (const void *)uniquing_table_index);
  }
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_73(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  id v19;
  _DWORD *v20;
  _QWORD *v21;
  void *v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v8 = (void *)MEMORY[0x1A85A9758]();
  if (VMUIsOwningReference(*((_DWORD *)a5 + 4)))
  {
    v9 = *(id *)(*(_QWORD *)(a1 + 104) + 8 * a4);
    v10 = v9;
    if (v9
      && (v11 = *(void **)(a1 + 32),
          objc_msgSend(v9, "name"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v12),
          v12,
          (_DWORD)v11))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      {
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v10, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "substringFromIndex:", *(_QWORD *)(a1 + 112));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("CYCLE BACK TO "), "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(*(id *)(a1 + 40), "is64bit");
      v17 = a5[1];
      v36 = *a5;
      v37 = v17;
      v38 = *((_QWORD *)a5 + 4);
      +[VMULeakDetector referenceDescription:dstDescription:is64bit:](VMULeakDetector, "referenceDescription:dstDescription:is64bit:", &v36, v15, v16);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v19 = (id)objc_msgSend(*(id *)(a1 + 48), "addChildWithName:address:count:numBytes:toNode:", v18, 0, 0, 0, *(_QWORD *)(a1 + 56));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    }
    else
    {
      v20 = *(_DWORD **)(a1 + 120);
      if (*v20 > a4 && ((*((unsigned __int8 *)v20 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
        goto LABEL_25;
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      v21 = (_QWORD *)*((_QWORD *)a5 + 4);
      objc_msgSend(*(id *)(a1 + 64), "nodeDescription:usingDetails:", a4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_DWORD **)(a1 + 128);
      if (*v23 > a4 && ((*((unsigned __int8 *)v23 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", v22);
        v24 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v24;
      }
      v25 = a4;
      v26 = objc_msgSend(*(id *)(a1 + 40), "is64bit");
      v27 = a5[1];
      v36 = *a5;
      v37 = v27;
      v38 = *((_QWORD *)a5 + 4);
      +[VMULeakDetector referenceDescription:dstDescription:is64bit:](VMULeakDetector, "referenceDescription:dstDescription:is64bit:", &v36, v22, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(_BYTE *)(*(_QWORD *)(a1 + 64) + 17) && VMUGraphNodeType_IsVMRegion(v21[1] >> 60))
      {
        objc_msgSend(*(id *)(a1 + 40), "vmuVMRegionForNode:", a4);
        v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        v21[1] = v21[1] & 0xF000000000000000 | (v28[22] + v28[23] - v28[24]) & 0xFFFFFFFFFFFFFFFLL;
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 64) + 16))
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          v30 = VMUMemorySizeString(v28[23]);
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@  dirty: %s  swapped: %s"), v14, v30, VMUMemorySizeString(v29[22]));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = v29[24];
          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  purgableVolatile: %s"), v31, VMUMemorySizeString(v32));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v14 = v31;
          }
        }

      }
      v18 = *(id *)(a1 + 56);
      v33 = *(void **)(a1 + 48);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 64) + 16))
        objc_msgSend(v33, "addChildWithName:address:count:numBytes:toNode:", v14, 0, 1, v21[1] & 0xFFFFFFFFFFFFFFFLL, v18);
      else
        objc_msgSend(v33, "addUniqueChildWithName:address:count:numBytes:toNode:isLeafNode:", v14, *v21, 1, v21[1] & 0xFFFFFFFFFFFFFFFLL, v18, 0);
      v34 = objc_claimAutoreleasedReturnValue();

      *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v25) = v34;
      if (*(_QWORD *)(a1 + 80))
        *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8 * v25) = *(_QWORD *)(a1 + 48);
      v10 = (void *)v34;
    }

    goto LABEL_25;
  }
LABEL_26:
  objc_autoreleasePoolPop(v8);
}

+ (id)consolidatedRootLeakDescriptionsForTree:(id)a3
{
  return +[VMULeakDetector _consolidatedRootLeakDescriptionsForTree:](VMULeakDetector, "_consolidatedRootLeakDescriptionsForTree:", a3);
}

+ (id)_consolidatedRootLeakDescriptionsForTree:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_consolidatedRootLeakDescriptionsForTree__onceToken != -1)
    dispatch_once(&_consolidatedRootLeakDescriptionsForTree__onceToken, &__block_literal_global_2);
  v4 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v31 = v3;
  objc_msgSend(v3, "sortedChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsString:", CFSTR(": 0x"));

        if (v12)
        {
          v13 = _consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex;
          objc_msgSend(v10, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");
          v17 = (void *)v13;
          v18 = v14;
          v19 = CFSTR("$1: malloc[$2]");
        }
        else
        {
          objc_msgSend(v10, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsString:", CFSTR(": VM: "));

          if (v21)
          {
            v22 = _consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex;
            objc_msgSend(v10, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");
            v17 = (void *)v22;
            v18 = v14;
            v19 = CFSTR("$1: $2");
          }
          else
          {
            v23 = _consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex;
            objc_msgSend(v10, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");
            v17 = (void *)v23;
            v18 = v14;
            v19 = CFSTR("$1: <$2>");
          }
        }
        objc_msgSend(v17, "stringByReplacingMatchesInString:options:range:withTemplate:", v18, 0, 0, v16, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend(v10, "count");
        v26 = v25 - objc_msgSend(v10, "sumOfChildCounts");
        objc_msgSend(v4, "objectForKeyedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          v26 = objc_msgSend(v27, "unsignedIntValue") + v26;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, v24);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  return v4;
}

void __60__VMULeakDetector__consolidatedRootLeakDescriptionsForTree___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(ROOT LEAK|CYCLE): 0x[0-9a-f]+ \\[(.*)\\].*"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex = v0;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(ROOT LEAK|CYCLE): (VM: .*)  0x.*"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex = v2;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(ROOT LEAK|CYCLE): <(.*) 0x[0-9a-f]+>* \\[\\d+\\].*"), 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex = v4;

}

- (void)printLeakTree
{
  VMULeakDetector *v2;
  VMUDebugTimer *debugTimer;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  VMUDebugTimer *v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  VMULeakDetector *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  id v35;
  const char *v36;
  id v37;
  VMUDebugTimer *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  os_signpost_id_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSMutableArray *obj;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[16];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v2 = self;
  v61 = *MEMORY[0x1E0C80C00];
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v4 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = v2->_debugTimer;
    if (v4)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[VMUDebugTimer signpostID](v2->_debugTimer, "signpostID");
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v5, OS_SIGNPOST_INTERVAL_END, v7, "printLeakTree", ", buf, 2u);
        }
      }

      debugTimer = v2->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "printLeakTree");
  -[VMUDebugTimer startWithCategory:message:](v2->_debugTimer, "startWithCategory:message:", "printLeakTree", ");
  v8 = v2->_debugTimer;
  if (v8)
  {
    -[VMUDebugTimer logHandle](v8, "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[VMUDebugTimer signpostID](v2->_debugTimer, "signpostID");
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "printLeakTree", ", buf, 2u);
      }
    }

  }
  if (-[NSMutableArray count](v2->_leakTreeRootsArray, "count") == 1)
    v12 = 74;
  else
    v12 = 76;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v2->_leakTreeRootsArray;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    v43 = *(_QWORD *)v55;
    v44 = v12;
    do
    {
      v16 = 0;
      v45 = v14;
      do
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v16);
        if (v2->_stackLogReader)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v16), "backtraceString");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          v20 = VMUBacktraceIsExcludedMarker;

          if (v18 == v20)
          {
            v2->_numExcluded += objc_msgSend(v19, "count");
            goto LABEL_41;
          }
          v48 = v16;
          objc_msgSend(v19, "backtraceString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          v17 = v19;
          if (v22)
          {
            v46 = v19;
            +[VMULeakDetector _consolidatedRootLeakDescriptionsForTree:](VMULeakDetector, "_consolidatedRootLeakDescriptionsForTree:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "keysSortedByValueUsingComparator:", &__block_literal_global_108);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastObject");
            v25 = (id)objc_claimAutoreleasedReturnValue();
            v26 = v2;
            -[VMULeakDetector printout:](v2, "printout:", "STACK OF ");
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v49 = v24;
            v27 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v51 != v29)
                    objc_enumerationMutation(v49);
                  v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                  objc_msgSend(v23, "objectForKeyedSubscript:", v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v32, "unsignedIntValue");

                  if (v33 <= 1)
                    v34 = "INSTANCE";
                  else
                    v34 = "INSTANCES";
                  v35 = objc_retainAutorelease(v31);
                  -[VMULeakDetector printout:](v26, "printout:", "%u %s OF '%s'", v33, v34, objc_msgSend(v35, "UTF8String"));
                  if (v35 == v25)
                    v36 = ":";
                  else
                    v36 = ", ";
                  -[VMULeakDetector printout:](v26, "printout:", v36);
                }
                v28 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
              }
              while (v28);
            }

            objc_msgSend(v46, "backtraceString");
            v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            -[VMULeakDetector printout:](v26, "printout:", "%s\n", objc_msgSend(v37, "UTF8String"));

            v17 = v46;
            v2 = v26;

            v12 = v44;
            v14 = v45;
            v15 = v43;
          }
          else
          {
            -[VMULeakDetector printout:](v2, "printout:", "NO STACK\n");
          }
          -[VMULeakDetector printout:](v2, "printout:", "====\n");
          v16 = v48;
        }
        objc_msgSend(v17, "printCallTreeToFile:cumulativeOutput:options:", v2->_outputFile, v2->_outputString, v12);
        -[VMULeakDetector printout:](v2, "printout:", "\n");
LABEL_41:
        ++v16;
      }
      while (v16 != v14);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v14);
  }

  v38 = v2->_debugTimer;
  if (v38)
  {
    v39 = -[VMUDebugTimer signpostID](v38, "signpostID");
    v38 = v2->_debugTimer;
    if (v39)
    {
      -[VMUDebugTimer logHandle](v38, "logHandle");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = -[VMUDebugTimer signpostID](v2->_debugTimer, "signpostID");
      if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v40, OS_SIGNPOST_INTERVAL_END, v42, "printLeakTree", ", buf, 2u);
        }
      }

      v38 = v2->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v38, "endEvent:", "printLeakTree");
}

uint64_t __32__VMULeakDetector_printLeakTree__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (unsigned)detectLeaksWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  VMUDebugTimer *debugTimer;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  VMUDebugTimer *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  unsigned int v14;
  _DWORD *v15;
  VMUProcessObjectGraph *graph;
  VMUDebugTimer *v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  unsigned int leakedAllocationsCount;
  unsigned int numExcluded;
  unsigned int v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD *, uint64_t);
  void *v30;
  VMULeakDetector *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint8_t buf[16];
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __40__VMULeakDetector_detectLeaksWithError___block_invoke;
  v36[3] = &unk_1E4E014E8;
  v36[4] = self;
  v36[5] = &v41;
  v36[6] = &v37;
  v6 = (void *)MEMORY[0x1A85A995C](v36, a2);
  -[VMUObjectGraph enumerateObjectsWithBlock:](self->_graph, "enumerateObjectsWithBlock:", v6);
  self->_allocationsCount = *((_DWORD *)v38 + 6);
  self->_allocationsSize = v42[3];
  if (!-[VMULeakDetector checkTaskExistence](self, "checkTaskExistence"))
  {
LABEL_25:
    v23 = 0;
    goto LABEL_26;
  }
  if (!self->_allocationsCount)
  {
    if (a3)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v45 = CFSTR("message");
      v46[0] = CFSTR("unable to inspect heap ranges of target process; it may be using a malloc replacement library without the required support");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("VMULeakDetectorDomain"), 1, v25);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_25;
  }
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v8 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v8)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v9, OS_SIGNPOST_INTERVAL_END, v10, "VMULeakDetector", ", buf, 2u);
      }

      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMULeakDetector");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMULeakDetector", "scan for leaks");
  v11 = self->_debugTimer;
  if (v11)
  {
    -[VMUDebugTimer logHandle](v11, "logHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VMULeakDetector", "scan for leaks", buf, 2u);
    }

  }
  v14 = -[VMUDirectedGraph nodeNamespaceSize](self->_graph, "nodeNamespaceSize");
  v15 = malloc_type_calloc(1uLL, ((v14 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v15 = v14;
  -[VMULeakDetector setLeakedNodes:](self, "setLeakedNodes:", v15);
  if (self->_checkAbandoned)
    -[VMULeakDetector setAbandoned:](self, "setAbandoned:", -[VMUProcessObjectGraph copyUserMarked](self->_graph, "copyUserMarked"));
  graph = self->_graph;
  v27 = v5;
  v28 = 3221225472;
  v29 = __40__VMULeakDetector_detectLeaksWithError___block_invoke_128;
  v30 = &unk_1E4E01510;
  v31 = self;
  v33 = &v41;
  v34 = &v37;
  v32 = v6;
  VMUWithRootNodeMarkingMap(graph, &v27);
  v17 = self->_debugTimer;
  if (v17)
  {
    v18 = -[VMUDebugTimer signpostID](v17, "signpostID", v27, v28, v29, v30, v31);
    v17 = self->_debugTimer;
    if (v18)
    {
      -[VMUDebugTimer logHandle](v17, "logHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v19, OS_SIGNPOST_INTERVAL_END, v20, "VMULeakDetector", ", buf, 2u);
      }

      v17 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v17, "endEvent:", "VMULeakDetector", v27, v28, v29, v30, v31);
  leakedAllocationsCount = self->_leakedAllocationsCount;
  numExcluded = self->_numExcluded;

  v23 = leakedAllocationsCount - numExcluded;
LABEL_26:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  return v23;
}

BOOL __40__VMULeakDetector_detectLeaksWithError___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 result;

  if (*(_BYTE *)(a1[4] + 8) || !(result = VMUGraphNodeType_IsVMRegion(*(_QWORD *)(a3 + 8) >> 60)))
  {
    result = VMUGraphNodeType_IsRoot(*(_QWORD *)(a3 + 8) >> 60);
    if (!result)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += *(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL;
      ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
  }
  return result;
}

uint64_t __40__VMULeakDetector_detectLeaksWithError___block_invoke_128(_QWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  int v8;
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 48), "markReachableNodesFromRoots:inMap:options:", a2, *(_QWORD *)(a1[4] + 112), *(unsigned __int8 *)(a1[4] + 8));
  v3 = *(_DWORD **)(a1[4] + 112);
  v4 = *v3;
  v5 = (*v3 + 7);
  if (v5 >= 8)
  {
    v6 = v3 + 1;
    v7 = v5 >> 3;
    if (v5 >> 3 <= 1)
      v7 = 1;
    do
    {
      *v6 = ~*v6;
      ++v6;
      --v7;
    }
    while (v7);
  }
  v8 = v4 & 7;
  if (v8)
    *((_BYTE *)v3 + (v5 >> 3) + 3) ^= -1 << v8;
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1[4] + 48), "enumerateMarkedObjects:withBlock:", *(_QWORD *)(a1[4] + 112), a1[5]);
  *(_DWORD *)(a1[4] + 144) = *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  *(_QWORD *)(a1[4] + 160) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  result = objc_msgSend(*(id *)(a1[4] + 48), "enumerateMarkedObjects:withBlock:", *(_QWORD *)(a1[4] + 104), a1[5]);
  *(_DWORD *)(a1[4] + 148) = *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  *(_QWORD *)(a1[4] + 168) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  return result;
}

- (unsigned)doNormalLeakDetectionWithError:(id *)a3
{
  unsigned int result;
  uint64_t v6;
  uint64_t leakedAllocationsCount;
  const char *v8;
  uint64_t v9;
  uint64_t abandonedCount;
  const char *v11;
  VMUProcessObjectGraph *graph;
  unsigned int numExcluded;
  const char *v14;
  void *v15;
  _QWORD v16[5];

  -[VMULeakDetector detectLeaksWithError:](self, "detectLeaksWithError:");
  if (*a3)
    return 0;
  result = -[VMULeakDetector checkTaskExistence](self, "checkTaskExistence");
  if (result)
  {
    -[VMULeakDetector printout:](self, "printout:", "Process %d: %u nodes malloced for %llu KB\n", -[VMUProcessObjectGraph pid](self->_graph, "pid"), self->_allocationsCount, (self->_allocationsSize + 1023) >> 10);
    v6 = -[VMUProcessObjectGraph pid](self->_graph, "pid");
    leakedAllocationsCount = self->_leakedAllocationsCount;
    if ((_DWORD)leakedAllocationsCount == 1)
      v8 = "";
    else
      v8 = "s";
    -[VMULeakDetector printout:](self, "printout:", "Process %d: %u leak%s for %llu total leaked bytes.\n", v6, leakedAllocationsCount, v8, self->_leakedAllocationsSize);
    if (self->_abandonedSize)
    {
      v9 = -[VMUProcessObjectGraph pid](self->_graph, "pid");
      abandonedCount = self->_abandonedCount;
      if ((_DWORD)abandonedCount == 1)
        v11 = "";
      else
        v11 = "s";
      -[VMULeakDetector printout:](self, "printout:", "Process %d: %u object%s abandoned for %llu total abandoned bytes.\n", v9, abandonedCount, v11, self->_abandonedSize);
    }
    if (!self->_suppressOutput)
    {
      -[VMULeakDetector printout:](self, "printout:", "\n");
      if (self->_abandoned || self->_showListOfLeaks)
      {
        graph = self->_graph;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __50__VMULeakDetector_doNormalLeakDetectionWithError___block_invoke;
        v16[3] = &unk_1E4E01538;
        v16[4] = self;
        VMUEnumerateVMAnnotatedMallocObjectsWithBlock(graph, v16);
      }
      else
      {
        -[VMULeakDetector buildLeakTree](self, "buildLeakTree");
        if (-[VMULeakDetector outputFile](self, "outputFile")
          || (-[VMULeakDetector outputString](self, "outputString"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          -[VMULeakDetector printLeakTree](self, "printLeakTree");
        }
      }
    }
    numExcluded = self->_numExcluded;
    if (numExcluded)
    {
      if (numExcluded == 1)
        v14 = "";
      else
        v14 = "s";
      -[VMULeakDetector printout:](self, "printout:", "\n%u leak%s excluded (not printed)\n", self->_numExcluded, v14);
    }
    if (-[VMULeakDetector outputFile](self, "outputFile"))
      fflush(-[VMULeakDetector outputFile](self, "outputFile"));
    return self->_leakedAllocationsCount - self->_numExcluded;
  }
  return result;
}

_QWORD *__50__VMULeakDetector_doNormalLeakDetectionWithError___block_invoke(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  _DWORD *v6;
  const char *v7;
  _DWORD *v8;
  __int128 v9;
  uint64_t v10;

  result = *(_QWORD **)(a1 + 32);
  v6 = (_DWORD *)result[14];
  if (*v6 > a2 && ((*((unsigned __int8 *)v6 + (a2 >> 3) + 4) >> (a2 & 7)) & 1) != 0)
  {
    v9 = *a3;
    v10 = *((_QWORD *)a3 + 2);
    v7 = "Leak";
    return (_QWORD *)objc_msgSend(result, "printLeak:node:details:region:stop:", v7, a2, &v9, a4, a5);
  }
  v8 = (_DWORD *)result[13];
  if (v8 && *v8 > a2 && ((*((unsigned __int8 *)v8 + (a2 >> 3) + 4) >> (a2 & 7)) & 1) != 0)
  {
    v9 = *a3;
    v10 = *((_QWORD *)a3 + 2);
    v7 = "Abandoned";
    return (_QWORD *)objc_msgSend(result, "printLeak:node:details:region:stop:", v7, a2, &v9, a4, a5);
  }
  return result;
}

- (void)dealloc
{
  void *abandoned;
  void *leakedNodes;
  FILE *outputFile;
  objc_super v6;

  abandoned = self->_abandoned;
  if (abandoned)
  {
    free(abandoned);
    self->_abandoned = 0;
  }
  leakedNodes = self->_leakedNodes;
  if (leakedNodes)
  {
    free(leakedNodes);
    self->_leakedNodes = 0;
  }
  if (self->_fcloseOutput)
  {
    outputFile = self->_outputFile;
    if (outputFile)
    {
      fclose(outputFile);
      self->_outputFile = 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)VMULeakDetector;
  -[VMULeakDetector dealloc](&v6, sel_dealloc);
}

- (BOOL)showLeakedVMregions
{
  return self->_showLeakedVMregions;
}

- (void)setShowLeakedVMregions:(BOOL)a3
{
  self->_showLeakedVMregions = a3;
}

- (BOOL)showContext
{
  return self->_showContext;
}

- (void)setShowContext:(BOOL)a3
{
  self->_showContext = a3;
}

- (BOOL)showOnlyVMregions
{
  return self->_showOnlyVMregions;
}

- (void)setShowOnlyVMregions:(BOOL)a3
{
  self->_showOnlyVMregions = a3;
}

- (BOOL)fullStacks
{
  return self->_fullStacks;
}

- (void)setFullStacks:(BOOL)a3
{
  self->_fullStacks = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (BOOL)showBinaryContents
{
  return self->_showBinaryContents;
}

- (void)setShowBinaryContents:(BOOL)a3
{
  self->_showBinaryContents = a3;
}

- (BOOL)checkAbandoned
{
  return self->_checkAbandoned;
}

- (void)setCheckAbandoned:(BOOL)a3
{
  self->_checkAbandoned = a3;
}

- (BOOL)suppressOutput
{
  return self->_suppressOutput;
}

- (void)setSuppressOutput:(BOOL)a3
{
  self->_suppressOutput = a3;
}

- (BOOL)showListOfLeaks
{
  return self->_showListOfLeaks;
}

- (void)setShowListOfLeaks:(BOOL)a3
{
  self->_showListOfLeaks = a3;
}

- (BOOL)groupByType
{
  return self->_groupByType;
}

- (void)setGroupByType:(BOOL)a3
{
  self->_groupByType = a3;
}

- (BOOL)referenceTreeShowRegionVirtualSize
{
  return self->_referenceTreeShowRegionVirtualSize;
}

- (void)setReferenceTreeShowRegionVirtualSize:(BOOL)a3
{
  self->_referenceTreeShowRegionVirtualSize = a3;
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debugTimer, a3);
}

- (__sFILE)outputFile
{
  return self->_outputFile;
}

- (void)setOutputFile:(__sFILE *)a3
{
  self->_outputFile = a3;
}

- (NSMutableString)outputString
{
  return self->_outputString;
}

- (void)setOutputString:(id)a3
{
  objc_storeStrong((id *)&self->_outputString, a3);
}

- (BOOL)fcloseOutput
{
  return self->_fcloseOutput;
}

- (void)setFcloseOutput:(BOOL)a3
{
  self->_fcloseOutput = a3;
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

- (VMUTask)task
{
  return self->_task;
}

- (VMUProcessObjectGraph)graph
{
  return self->_graph;
}

- (VMUTaskMemoryScanner)scanner
{
  return self->_scanner;
}

- (VMUStackLogReader)stackLogReader
{
  return self->_stackLogReader;
}

- (void)abandoned
{
  return self->_abandoned;
}

- (void)setAbandoned:(void *)a3
{
  self->_abandoned = a3;
}

- (void)leakedNodes
{
  return self->_leakedNodes;
}

- (void)setLeakedNodes:(void *)a3
{
  self->_leakedNodes = a3;
}

- (NSMutableArray)leakTreeRootsArray
{
  return self->_leakTreeRootsArray;
}

- (void)setLeakTreeRootsArray:(id)a3
{
  objc_storeStrong((id *)&self->_leakTreeRootsArray, a3);
}

- (VMUProcessObjectGraph)leakedGraph
{
  return self->_leakedGraph;
}

- (void)setLeakedGraph:(id)a3
{
  objc_storeStrong((id *)&self->_leakedGraph, a3);
}

- (unsigned)allocationsCount
{
  return self->_allocationsCount;
}

- (void)setAllocationsCount:(unsigned int)a3
{
  self->_allocationsCount = a3;
}

- (unint64_t)allocationsSize
{
  return self->_allocationsSize;
}

- (void)setAllocationsSize:(unint64_t)a3
{
  self->_allocationsSize = a3;
}

- (unsigned)leakedAllocationsCount
{
  return self->_leakedAllocationsCount;
}

- (void)setLeakedAllocationsCount:(unsigned int)a3
{
  self->_leakedAllocationsCount = a3;
}

- (unint64_t)leakedAllocationsSize
{
  return self->_leakedAllocationsSize;
}

- (void)setLeakedAllocationsSize:(unint64_t)a3
{
  self->_leakedAllocationsSize = a3;
}

- (unsigned)abandonedCount
{
  return self->_abandonedCount;
}

- (void)setAbandonedCount:(unsigned int)a3
{
  self->_abandonedCount = a3;
}

- (unint64_t)abandonedSize
{
  return self->_abandonedSize;
}

- (void)setAbandonedSize:(unint64_t)a3
{
  self->_abandonedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leakedGraph, 0);
  objc_storeStrong((id *)&self->_leakTreeRootsArray, 0);
  objc_storeStrong((id *)&self->_outputString, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);
  objc_storeStrong((id *)&self->_debugTimer, 0);
}

- (void)printout:.cold.1()
{
  NSLog(CFSTR("vasprintf unexpectedly failed"));
  abort();
}

@end
