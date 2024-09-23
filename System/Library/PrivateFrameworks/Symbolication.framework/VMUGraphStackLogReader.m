@implementation VMUGraphStackLogReader

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUGraphStackLogReader)initWithCore:(id)a3 symbolicator:(_CSTypeRef)a4 graph:(id)a5 debugTimer:(id)a6 zones:(_VMUZoneNode *)a7 zonesCount:(unsigned int)a8
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  id v14;
  id v15;
  id v16;
  VMUGraphStackLogReader *v17;
  VMUGraphStackLogReader *v18;
  VMUVMRegionTracker *v19;
  VMUVMRegionTracker *regionTracker;
  uint64_t v21;
  VMURangeToStringMap *functionNameRanges;
  uint64_t v23;
  VMURangeToStringMap *sourceInfoRanges;
  VMUGraphStackLogReader *v25;
  objc_super v27;

  opaque_2 = a4._opaque_2;
  opaque_1 = a4._opaque_1;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)VMUGraphStackLogReader;
  v17 = -[VMUGraphStackLogReader init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->super._symbolicator._opaque_1 = opaque_1;
    v17->super._symbolicator._opaque_2 = opaque_2;
    -[VMUGraphStackLogReader setGraph:](v17, "setGraph:", v15);
    objc_storeStrong((id *)&v18->_debugTimer, a6);
    v18->super._usesCoreFile = 1;
    v18->super._coldestFrameIsNotThreadId = 1;
    v19 = objc_alloc_init(VMUVMRegionTracker);
    regionTracker = v18->super._regionTracker;
    v18->super._regionTracker = v19;

    v21 = objc_opt_new();
    functionNameRanges = v18->_functionNameRanges;
    v18->_functionNameRanges = (VMURangeToStringMap *)v21;

    v23 = objc_opt_new();
    sourceInfoRanges = v18->_sourceInfoRanges;
    v18->_sourceInfoRanges = (VMURangeToStringMap *)v23;

    if (!-[VMUGraphStackLogReader populateBacktraceUniquingTableWithCore:zones:zonesCount:](v18, "populateBacktraceUniquingTableWithCore:zones:zonesCount:", v14, a7, a8))
    {
      v25 = 0;
      goto LABEL_6;
    }
    -[VMUGraphStackLogReader symbolicateBacktraceUniquingTable](v18, "symbolicateBacktraceUniquingTable");
  }
  v25 = v18;
LABEL_6:

  return v25;
}

- (VMUGraphStackLogReader)initWithTask:(id)a3 symbolicator:(_CSTypeRef)a4 graph:(id)a5 debugTimer:(id)a6 collectDisklogs:(BOOL)a7
{
  _BOOL4 v7;
  unint64_t opaque_2;
  unint64_t opaque_1;
  id v14;
  id v15;
  id v16;
  VMUGraphStackLogReader *v17;
  VMUGraphStackLogReader *v18;
  VMUTaskStackLogReader *v19;
  VMUTaskStackLogReader *v20;
  VMUVMRegionTracker *v21;
  VMUVMRegionTracker *regionTracker;
  uint64_t v23;
  VMURangeToStringMap *functionNameRanges;
  uint64_t v25;
  VMURangeToStringMap *sourceInfoRanges;
  VMUGraphStackLogReader *v27;
  objc_super v29;

  v7 = a7;
  opaque_2 = a4._opaque_2;
  opaque_1 = a4._opaque_1;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)VMUGraphStackLogReader;
  v17 = -[VMUGraphStackLogReader init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._vmuTask, a3);
    v18->super._task = -[VMUTask taskPort](v18->super._vmuTask, "taskPort");
    v18->super._symbolicator._opaque_1 = opaque_1;
    v18->super._symbolicator._opaque_2 = opaque_2;
    -[VMUGraphStackLogReader setGraph:](v18, "setGraph:", v15);
    objc_storeStrong((id *)&v18->_debugTimer, a6);
    v19 = -[VMUTaskStackLogReader initWithTask:symbolicator:]([VMUTaskStackLogReader alloc], "initWithTask:symbolicator:", v18->super._task, opaque_1, opaque_2);
    if (!v19)
    {
      v27 = 0;
      goto LABEL_9;
    }
    v20 = v19;
    v18->super._coldestFrameIsNotThreadId = -[VMUStackLogReaderBase coldestFrameIsNotThreadId](v19, "coldestFrameIsNotThreadId");
    v21 = objc_alloc_init(VMUVMRegionTracker);
    regionTracker = v18->super._regionTracker;
    v18->super._regionTracker = v21;

    v23 = objc_opt_new();
    functionNameRanges = v18->_functionNameRanges;
    v18->_functionNameRanges = (VMURangeToStringMap *)v23;

    v25 = objc_opt_new();
    sourceInfoRanges = v18->_sourceInfoRanges;
    v18->_sourceInfoRanges = (VMURangeToStringMap *)v25;

    if (!v7 || !-[VMUGraphStackLogReader copyOriginalUniquingTable:](v18, "copyOriginalUniquingTable:", v20))
      -[VMUGraphStackLogReader populateBacktraceUniquingTableWithStackLogs:](v18, "populateBacktraceUniquingTableWithStackLogs:", v20);
    -[VMUGraphStackLogReader symbolicateBacktraceUniquingTable](v18, "symbolicateBacktraceUniquingTable");

  }
  v27 = v18;
LABEL_9:

  return v27;
}

- (void)setGraph:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unsigned int v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  objc_storeWeak((id *)&self->_graph, v9);
  objc_msgSend(v9, "symbolStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v9, "symbolStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->super._symbolicator._opaque_1 = objc_msgSend(v5, "symbolicator");
    self->super._symbolicator._opaque_2 = v6;

  }
  v7 = VMULiteZoneIndex(v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  self->super._usesLiteMode = v7 < objc_msgSend(WeakRetained, "zoneCount");

  if (self->super._usesLiteMode)
    self->super._coldestFrameIsNotThreadId = 1;

}

- (void)dealloc
{
  vmu_backtrace_uniquing_table_t *backtraceUniquingTable;
  unsigned int *nodeToStackIndexTable;
  unint64_t *nodeToTimestampTable;
  unint64_t *nodeToMSLPayloadTable;
  backtrace_uniquing_table *originalUniquingTable;
  objc_super v8;

  backtraceUniquingTable = self->_backtraceUniquingTable;
  if (backtraceUniquingTable)
    vmu_destroy_backtrace_uniquing_table((uint64_t)backtraceUniquingTable);
  nodeToStackIndexTable = self->_nodeToStackIndexTable;
  if (nodeToStackIndexTable)
    free(nodeToStackIndexTable);
  nodeToTimestampTable = self->_nodeToTimestampTable;
  if (nodeToTimestampTable)
    free(nodeToTimestampTable);
  nodeToMSLPayloadTable = self->_nodeToMSLPayloadTable;
  if (nodeToMSLPayloadTable)
    free(nodeToMSLPayloadTable);
  originalUniquingTable = self->_originalUniquingTable;
  if (originalUniquingTable)
    MEMORY[0x1A85A9710](originalUniquingTable, a2);
  v8.receiver = self;
  v8.super_class = (Class)VMUGraphStackLogReader;
  -[VMUGraphStackLogReader dealloc](&v8, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  VMUDebugTimer *debugTimer;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  VMUDebugTimer *v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  void *v17;
  uint64_t v18;
  mach_vm_address_t v20;
  void *v21;
  mach_vm_size_t v22;
  VMUDebugTimer *v23;
  uint64_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  VMUDebugTimer *v28;
  NSObject *v29;
  unint64_t v30;
  os_signpost_id_t v31;
  uint64_t v32;
  void *v33;
  VMUDebugTimer *v34;
  uint64_t v35;
  NSObject *v36;
  unint64_t v37;
  os_signpost_id_t v38;
  VMUDebugTimer *v39;
  NSObject *v40;
  unint64_t v41;
  os_signpost_id_t v42;
  uint64_t v43;
  void *v44;
  VMUDebugTimer *v45;
  uint64_t v46;
  NSObject *v47;
  unint64_t v48;
  os_signpost_id_t v49;
  VMUDebugTimer *v50;
  NSObject *v51;
  unint64_t v52;
  os_signpost_id_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  VMUDebugTimer *v58;
  uint64_t v59;
  NSObject *v60;
  unint64_t v61;
  os_signpost_id_t v62;
  VMUDebugTimer *v63;
  NSObject *v64;
  unint64_t v65;
  os_signpost_id_t v66;
  void *v67;
  VMUDebugTimer *v68;
  uint64_t v69;
  NSObject *v70;
  unint64_t v71;
  os_signpost_id_t v72;
  uint8_t buf[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  v6 = objc_msgSend(WeakRetained, "serializationOptions");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("classVersion"));

  if (self->_backtraceUniquingTable)
  {
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
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v10, OS_SIGNPOST_INTERVAL_END, v12, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        debugTimer = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "archiving backtrace uniquing table");
    v13 = self->_debugTimer;
    if (v13)
    {
      -[VMUDebugTimer logHandle](v13, "logHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VMUGraphStackLogReader", "archiving backtrace uniquing table", buf, 2u);
        }
      }

    }
    objc_msgSend(v4, "encodeInt64:forKey:", self->_backtraceUniquingTable->var3, CFSTR("backtraceUniquingTableSize"));
    objc_msgSend(v4, "encodeInt32:forKey:", self->_backtraceUniquingTable->var9, CFSTR("backtraceUniquingTableFlags"));
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_backtraceUniquingTable->var0, SLODWORD(self->_backtraceUniquingTable->var3), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("backtraceUniquingTableContents"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Backtrace Uniquing Table] %llu node capacity  %u nodes full  %llu bytes\n\n", self->_backtraceUniquingTable->var2, self->_backtraceUniquingTable->var7, self->_backtraceUniquingTable->var3);
  }
  if (self->_originalUniquingTable)
  {
    *(_QWORD *)buf = 0;
    v18 = msl_uniquing_table_serialize();
    if (v18 && *(_QWORD *)buf != 0)
    {
      v20 = v18;
      if (*(_QWORD *)buf == -1)
      {
        v22 = -1;
      }
      else
      {
        +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("originalUniquingTableContents"));

        v22 = *(_QWORD *)buf;
        if (kVMUPrintArchivingTiming)
        {
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Original Uniquing Table] %llu bytes\n\n", *(_QWORD *)buf);
          v22 = *(_QWORD *)buf;
        }
      }
      mach_vm_deallocate(*MEMORY[0x1E0C83DA0], v20, v22);
    }
  }
  if (self->_nodeToStackIndexTable)
  {
    v23 = self->_debugTimer;
    if (v23)
    {
      v24 = -[VMUDebugTimer signpostID](v23, "signpostID");
      v23 = self->_debugTimer;
      if (v24)
      {
        -[VMUDebugTimer logHandle](v23, "logHandle");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v27 = v26;
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v25, OS_SIGNPOST_INTERVAL_END, v27, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        v23 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v23, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "archiving nodeToStackIDTable");
    v28 = self->_debugTimer;
    if (v28)
    {
      -[VMUDebugTimer logHandle](v28, "logHandle");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v31 = v30;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VMUGraphStackLogReader", "archiving nodeToStackIDTable", buf, 2u);
        }
      }

    }
    v32 = 4 * self->_nodeNamespaceSize;
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_nodeToStackIndexTable, v32, v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("nodeToStackIdTable"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[nodeToStackIdTable] nodeNamespaceSize %u  %lu bytes\n\n", self->_nodeNamespaceSize, v32);
  }
  if (self->_nodeToTimestampTable)
  {
    v34 = self->_debugTimer;
    if (v34)
    {
      v35 = -[VMUDebugTimer signpostID](v34, "signpostID");
      v34 = self->_debugTimer;
      if (v35)
      {
        -[VMUDebugTimer logHandle](v34, "logHandle");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v38 = v37;
          if (os_signpost_enabled(v36))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v36, OS_SIGNPOST_INTERVAL_END, v38, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        v34 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v34, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "archiving nodeToTimestampTable");
    v39 = self->_debugTimer;
    if (v39)
    {
      -[VMUDebugTimer logHandle](v39, "logHandle");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "VMUGraphStackLogReader", "archiving nodeToTimestampTable", buf, 2u);
        }
      }

    }
    v43 = 8 * self->_nodeNamespaceSize;
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_nodeToTimestampTable, v43, v6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("nodeToTimestampTable"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[nodeToTimestampTable] nodeNamespaceSize %u  %lu bytes\n\n", self->_nodeNamespaceSize, v43);
  }
  if (self->_nodeToMSLPayloadTable)
  {
    v45 = self->_debugTimer;
    if (v45)
    {
      v46 = -[VMUDebugTimer signpostID](v45, "signpostID");
      v45 = self->_debugTimer;
      if (v46)
      {
        -[VMUDebugTimer logHandle](v45, "logHandle");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v49 = v48;
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v47, OS_SIGNPOST_INTERVAL_END, v49, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        v45 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v45, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "archiving nodeToMSLPayloadTable");
    v50 = self->_debugTimer;
    if (v50)
    {
      -[VMUDebugTimer logHandle](v50, "logHandle");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v53 = v52;
        if (os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v53, "VMUGraphStackLogReader", "archiving nodeToMSLPayloadTable", buf, 2u);
        }
      }

    }
    v54 = 8 * self->_nodeNamespaceSize;
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_nodeToMSLPayloadTable, v54, v6);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v55, CFSTR("nodeToMSLPayloadTable"));
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[nodeToMSLPayloadTable] nodeNamespaceSize %u  %lu bytes\n\n", self->_nodeNamespaceSize, v54);

  }
  if (-[VMURangeToStringMap count](self->_functionNameRanges, "count"))
  {
    +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", self->_functionNameRanges, v6);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v56, CFSTR("functionNameRanges"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Function Name Ranges] Count: %u  Uniqued string count: %u\n\n", -[VMURangeToStringMap count](self->_functionNameRanges, "count"), -[VMURangeToStringMap uniquedStringCount](self->_functionNameRanges, "uniquedStringCount"));
  }
  if (-[VMURangeToStringMap count](self->_sourceInfoRanges, "count"))
  {
    +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", self->_sourceInfoRanges, v6);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v57, CFSTR("sourceInfoRanges"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[SourceInfo Ranges] Count: %u  Uniqued string count: %u\n\n", -[VMURangeToStringMap count](self->_sourceInfoRanges, "count"), -[VMURangeToStringMap uniquedStringCount](self->_sourceInfoRanges, "uniquedStringCount"));
  }
  if (self->super._regionTracker)
  {
    v58 = self->_debugTimer;
    if (v58)
    {
      v59 = -[VMUDebugTimer signpostID](v58, "signpostID");
      v58 = self->_debugTimer;
      if (v59)
      {
        -[VMUDebugTimer logHandle](v58, "logHandle");
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v62 = v61;
          if (os_signpost_enabled(v60))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v60, OS_SIGNPOST_INTERVAL_END, v62, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        v58 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v58, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "archiving VM regionTracker");
    v63 = self->_debugTimer;
    if (v63)
    {
      -[VMUDebugTimer logHandle](v63, "logHandle");
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v66 = v65;
        if (os_signpost_enabled(v64))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v66, "VMUGraphStackLogReader", "archiving VM regionTracker", buf, 2u);
        }
      }

    }
    +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", self->super._regionTracker, v6);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v67, CFSTR("vmRegionTracker"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[VM Region Tracker] Region count: %u\n\n", -[VMUVMRegionTracker regionCount](self->super._regionTracker, "regionCount"));
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->super._coldestFrameIsNotThreadId, CFSTR("coldestFrameIsNotThreadId"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_maxTimestampDelta, CFSTR("maxTimestampDelta"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_mslRecordsCount, CFSTR("mslRecordsCount"));
  v68 = self->_debugTimer;
  if (v68)
  {
    v69 = -[VMUDebugTimer signpostID](v68, "signpostID");
    v68 = self->_debugTimer;
    if (v69)
    {
      -[VMUDebugTimer logHandle](v68, "logHandle");
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v72 = v71;
        if (os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v70, OS_SIGNPOST_INTERVAL_END, v72, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v68 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v68, "endEvent:", "VMUGraphStackLogReader");

}

- (VMUGraphStackLogReader)initWithCoder:(id)a3
{
  id v4;
  VMUGraphStackLogReader *v5;
  void *v6;
  int v7;
  void *v8;
  VMUDebugTimer *debugTimer;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  VMUDebugTimer *v14;
  NSObject *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  int v18;
  unint64_t v19;
  void *v20;
  char *backtrace_uniquing_table_from_archive;
  VMUDebugTimer *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  os_signpost_id_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  VMURangeToStringMap *functionNameRanges;
  VMURangeToStringMap *v42;
  void *v43;
  uint64_t v44;
  VMURangeToStringMap *sourceInfoRanges;
  VMURangeToStringMap *v46;
  uint64_t v47;
  VMUVMRegionTracker *regionTracker;
  VMUVMRegionTracker *v49;
  VMUGraphStackLogReader *v50;
  uint8_t v52[16];
  uint8_t buf[16];

  v4 = a3;
  if (kVMUPrintArchivingTiming)
    fwrite("[Stack Log Reader] \n\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  v5 = -[VMUGraphStackLogReader init](self, "init");
  if (!v5)
    goto LABEL_53;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (v7 != 1)
  {
LABEL_56:
    v50 = 0;
    goto LABEL_57;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backtraceUniquingTableContents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    debugTimer = v5->_debugTimer;
    if (debugTimer)
    {
      v10 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
      debugTimer = v5->_debugTimer;
      if (v10)
      {
        -[VMUDebugTimer logHandle](debugTimer, "logHandle");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = -[VMUDebugTimer signpostID](v5->_debugTimer, "signpostID");
        if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v13 = v12;
          if (os_signpost_enabled(v11))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v11, OS_SIGNPOST_INTERVAL_END, v13, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        debugTimer = v5->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](v5->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "archiving backtrace uniquing table");
    v14 = v5->_debugTimer;
    if (v14)
    {
      -[VMUDebugTimer logHandle](v14, "logHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[VMUDebugTimer signpostID](v5->_debugTimer, "signpostID");
      if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VMUGraphStackLogReader", "archiving backtrace uniquing table", buf, 2u);
        }
      }

    }
    v18 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("backtraceUniquingTableFlags"));
    v19 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("backtraceUniquingTableSize"));
    *(_QWORD *)buf = 0;
    v20 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v8, buf, 1);
    if (v19 != *(_QWORD *)buf)
      -[VMUGraphStackLogReader initWithCoder:].cold.1();
    backtrace_uniquing_table_from_archive = vmu_create_backtrace_uniquing_table_from_archive(v19, v18, (uint64_t)v20);
    v5->_backtraceUniquingTable = (vmu_backtrace_uniquing_table_t *)backtrace_uniquing_table_from_archive;
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - backtraceUniquingTableContents] %llu bytes\n\n", *((_QWORD *)backtrace_uniquing_table_from_archive + 3));
    v22 = v5->_debugTimer;
    if (v22)
    {
      v23 = -[VMUDebugTimer signpostID](v22, "signpostID");
      v22 = v5->_debugTimer;
      if (v23)
      {
        -[VMUDebugTimer logHandle](v22, "logHandle");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = -[VMUDebugTimer signpostID](v5->_debugTimer, "signpostID");
        if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v26 = v25;
          if (os_signpost_enabled(v24))
          {
            *(_WORD *)v52 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v24, OS_SIGNPOST_INTERVAL_END, v26, "VMUGraphStackLogReader", ", v52, 2u);
          }
        }

        v22 = v5->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v22, "endEvent:", "VMUGraphStackLogReader");
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalUniquingTableContents"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    *(_QWORD *)buf = 0;
    v28 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v27, buf, 1);
    if (v28)
    {
      v29 = v28;
      v5->_originalUniquingTable = (backtrace_uniquing_table *)msl_uniquing_table_copy_from_serialized();
      free(v29);
      if (kVMUPrintArchivingTiming)
        fwrite("[Stack Log Reader - originalUniquingTableContents] \n\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeToStackIdTable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    *(_QWORD *)buf = 0;
    v5->_nodeToStackIndexTable = (unsigned int *)+[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v30, buf, 1);
    v31 = *(_QWORD *)buf;
    v32 = *(_QWORD *)buf >> 2;
    v5->_nodeNamespaceSize = *(_QWORD *)buf >> 2;
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - nodeToStackIndexTable] nodeNamespaceSize %u  %lu bytes\n\n", v32, v31);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeToTimestampTable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    *(_QWORD *)buf = 0;
    v5->_nodeToTimestampTable = (unint64_t *)+[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v33, buf, 1);
    v34 = *(_QWORD *)buf;
    v35 = *(_QWORD *)buf >> 3;
    v5->_nodeNamespaceSize = *(_QWORD *)buf >> 3;
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - nodeToTimestampTable] nodeNamespaceSize %u  %lu bytes\n\n", v35, v34);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeToMSLPayloadTable"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    *(_QWORD *)buf = 0;
    v5->_nodeToMSLPayloadTable = (unint64_t *)+[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v36, buf, 1);
    v37 = *(_QWORD *)buf;
    v38 = *(_QWORD *)buf >> 3;
    v5->_nodeNamespaceSize = *(_QWORD *)buf >> 3;
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - nodeToMSLPayloadTable] nodeNamespaceSize %u  %lu bytes\n\n", v38, v37);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("functionNameRanges"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v39, objc_opt_class(), 1);
    v40 = objc_claimAutoreleasedReturnValue();
    functionNameRanges = v5->_functionNameRanges;
    v5->_functionNameRanges = (VMURangeToStringMap *)v40;

    v42 = v5->_functionNameRanges;
    if (!v42)
    {
LABEL_55:

      goto LABEL_56;
    }
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - Function Name Ranges] Count: %u  Uniqued string count: %u\n\n", -[VMURangeToStringMap count](v42, "count"), -[VMURangeToStringMap uniquedStringCount](v5->_functionNameRanges, "uniquedStringCount"));
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceInfoRanges"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    goto LABEL_48;
  +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v43, objc_opt_class(), 1);
  v44 = objc_claimAutoreleasedReturnValue();
  sourceInfoRanges = v5->_sourceInfoRanges;
  v5->_sourceInfoRanges = (VMURangeToStringMap *)v44;

  v46 = v5->_sourceInfoRanges;
  if (!v46)
  {
    v39 = v43;
    goto LABEL_55;
  }
  if (kVMUPrintArchivingTiming)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - SourceInfo Ranges] Count: %u  Uniqued string count: %u\n\n", -[VMURangeToStringMap count](v46, "count"), -[VMURangeToStringMap uniquedStringCount](v5->_sourceInfoRanges, "uniquedStringCount"));
LABEL_48:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vmRegionTracker"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v39, objc_opt_class(), 1);
    v47 = objc_claimAutoreleasedReturnValue();
    regionTracker = v5->super._regionTracker;
    v5->super._regionTracker = (VMUVMRegionTracker *)v47;

    v49 = v5->super._regionTracker;
    if (v49)
    {
      if (kVMUPrintArchivingTiming)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Stack Log Reader - VM Region Tracker] Region count: %u\n\n", -[VMUVMRegionTracker regionCount](v49, "regionCount"));
      goto LABEL_52;
    }
    goto LABEL_55;
  }
LABEL_52:
  v5->super._coldestFrameIsNotThreadId = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("coldestFrameIsNotThreadId"));
  v5->_maxTimestampDelta = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("maxTimestampDelta"));
  v5->_mslRecordsCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("mslRecordsCount"));

LABEL_53:
  v50 = v5;
LABEL_57:

  return v50;
}

- (int)streamFullStackLogsToBlock:(id)a3
{
  return msl_copy_disk_stack_logs();
}

- (BOOL)copyOriginalUniquingTable:(id)a3
{
  id v4;
  void *v5;
  backtrace_uniquing_table *v6;
  id WeakRetained;
  id v8;
  unint64_t *nodeToMSLPayloadTable;
  id v10;
  VMUDebugTimer *debugTimer;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  VMUDebugTimer *v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  uint64_t v20;
  id v21;
  int v22;
  id v23;
  VMUDebugTimer *v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t v27;
  os_signpost_id_t v28;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  int v33;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
    -[VMUGraphStackLogReader copyOriginalUniquingTable:].cold.1();
  v5 = v4;
  v6 = (backtrace_uniquing_table *)msl_uniquing_table_copy_from_task();
  self->_originalUniquingTable = v6;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
    self->_nodeNamespaceSize = objc_msgSend(WeakRetained, "nodeNamespaceSize");

    v8 = objc_loadWeakRetained((id *)&self->_graph);
    self->_nodeToMSLPayloadTable = (unint64_t *)malloc_type_malloc(8 * objc_msgSend(v8, "nodeNamespaceSize"), 0x100004000313F17uLL);

    nodeToMSLPayloadTable = self->_nodeToMSLPayloadTable;
    v10 = objc_loadWeakRetained((id *)&self->_graph);
    memset(nodeToMSLPayloadTable, 255, 8 * objc_msgSend(v10, "nodeNamespaceSize"));

    debugTimer = self->_debugTimer;
    if (debugTimer)
    {
      v12 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
      debugTimer = self->_debugTimer;
      if (v12)
      {
        -[VMUDebugTimer logHandle](debugTimer, "logHandle");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v15 = v14;
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_END, v15, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        debugTimer = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "copyOriginalUniquingTable build map of node --> payload");
    v16 = self->_debugTimer;
    if (v16)
    {
      -[VMUDebugTimer logHandle](v16, "logHandle");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v19 = v18;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VMUGraphStackLogReader", "copyOriginalUniquingTable build map of node --> payload", buf, 2u);
        }
      }

    }
    v20 = MEMORY[0x1E0C809B0];
    if (self->super._usesLiteMode)
    {
      v21 = objc_loadWeakRetained((id *)&self->_graph);
      v22 = VMULiteZoneIndex(v21);

      v23 = objc_loadWeakRetained((id *)&self->_graph);
      v31[0] = v20;
      v31[1] = 3221225472;
      v31[2] = __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke;
      v31[3] = &unk_1E4E02DE8;
      v31[4] = self;
      v33 = v22;
      v32 = v5;
      VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v23, v31);

    }
    self->_mslRecordsCount = 0;
    v30[0] = v20;
    v30[1] = 3221225472;
    v30[2] = __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2;
    v30[3] = &unk_1E4E01458;
    v30[4] = self;
    objc_msgSend(v5, "enumerateMSLRecordsAndPayloads:", v30);
    v24 = self->_debugTimer;
    if (v24)
    {
      v25 = -[VMUDebugTimer signpostID](v24, "signpostID");
      v24 = self->_debugTimer;
      if (v25)
      {
        -[VMUDebugTimer logHandle](v24, "logHandle");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v28 = v27;
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v26, OS_SIGNPOST_INTERVAL_END, v28, "VMUGraphStackLogReader", ", buf, 2u);
          }
        }

        v24 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v24, "endEvent:", "VMUGraphStackLogReader");
  }

  return v6 != 0;
}

void __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke(uint64_t a1, unsigned int a2, _QWORD *a3, uint64_t a4, BOOL *a5)
{
  id WeakRetained;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t invalid;
  unint64_t allocation_timestamp;
  uint64_t v16;
  unint64_t v17;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  *a5 = objc_msgSend(WeakRetained, "nodeNamespaceSize") <= a2;

  if (!*a5)
  {
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rangeIsInSharedCache:", *(_QWORD *)(a4 + 8), *(_QWORD *)(a4 + 16));
    v12 = a3[1];
    v13 = v12 >> 60;
    if (v12 >> 60 != 5)
      v11 = 1;
    if ((_DWORD)v13 == 1 || (v11 & 1) == 0)
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
      {
        if (*(_DWORD *)(a4 + 148) == *(_DWORD *)(a1 + 48))
        {
          invalid = objc_msgSend(*(id *)(a1 + 40), "liteMSLPayloadforMallocAddress:size:", *a3, v12 & 0xFFFFFFFFFFFFFFFLL);
LABEL_12:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 8 * a2) = invalid;
          allocation_timestamp = msl_payload_get_allocation_timestamp();
          v16 = *(_QWORD *)(a1 + 32);
          v17 = *(_QWORD *)(v16 + 168);
          if (allocation_timestamp > v17)
            v17 = allocation_timestamp;
          *(_QWORD *)(v16 + 168) = v17;
          return;
        }
        if (VMUGraphNodeType_IsVMRegion(v13))
        {
          invalid = objc_msgSend(*(id *)(a1 + 40), "liteMSLPayloadforVMregionAddress:", *a3);
          goto LABEL_12;
        }
      }
      invalid = msl_payload_get_invalid();
      goto LABEL_12;
    }
  }
}

unint64_t __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t v10;
  id WeakRetained;
  unsigned int v12;
  id v13;
  uint64_t v14;
  unint64_t v15;

  v9 = result;
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 176);
  if ((a2 & 0x12) != 0)
  {
    v10 = *(_QWORD *)(result + 32);
    if (!*(_BYTE *)(v10 + 56))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v10 + 80));
      v12 = objc_msgSend(WeakRetained, "nodeForAddress:", a3);

      if (v12 != -1)
      {
        v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(v9 + 32) + 80));
        if (v12 >= objc_msgSend(v13, "nodeNamespaceSize"))
          __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2_cold_1();

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 32) + 128) + 8 * v12) = a5;
      }
      result = msl_payload_get_allocation_timestamp();
      v14 = *(_QWORD *)(v9 + 32);
      v15 = *(_QWORD *)(v14 + 168);
      if (result > v15)
        v15 = result;
      *(_QWORD *)(v14 + 168) = v15;
    }
  }
  if ((a2 & 0x30) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 24), "handleStackLogType:address:size:stackID:", a2, a3, a4, msl_payload_get_uniquing_table_index());
  return result;
}

- (BOOL)populateBacktraceUniquingTableWithCore:(id)a3 zones:(_VMUZoneNode *)a4 zonesCount:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id WeakRetained;
  unsigned int v10;
  unsigned int *v11;
  uint64_t Range;
  uint64_t v13;
  uint64_t BaseAddress;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  unsigned __int8 *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  int v32;
  uint64_t v34;
  _VMUZoneNode *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  _QWORD *v40;
  uint64_t v41;
  int __pattern4;
  _QWORD v43[17];

  LODWORD(v5) = a5;
  v43[15] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  self->_backtraceUniquingTable = (vmu_backtrace_uniquing_table_t *)vmu_create_backtrace_uniquing_table(0, 4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  v10 = objc_msgSend(WeakRetained, "nodeNamespaceSize");

  self->_nodeNamespaceSize = v10;
  v11 = (unsigned int *)malloc_type_malloc(4 * v10, 0xFB9E4CC9uLL);
  self->_nodeToStackIndexTable = v11;
  __pattern4 = -1;
  memset_pattern4(v11, &__pattern4, 4 * v10);
  v41 = 0;
  CSSymbolicatorGetAOutSymbolOwner();
  CSSymbolOwnerGetSymbolWithName();
  Range = CSSymbolGetRange();
  objc_msgSend(v8, "peekAtAddress:size:returnsBuf:", Range, v13, &v41);
  CSSymbolicatorGetAOutSymbolOwner();
  BaseAddress = CSSymbolOwnerGetBaseAddress();
  if ((_DWORD)v5)
  {
    v15 = BaseAddress;
    v16 = 0;
    v36 = 0;
    v5 = v5;
    v34 = v5;
    v35 = a4;
    while (1)
    {
      v40 = 0;
      objc_msgSend(v8, "peekAtAddress:size:returnsBuf:", a4[v16].var0, 256, &v40);
      if (!*v40)
        goto LABEL_25;
      v17 = v40[24];
      if (!v17)
        goto LABEL_25;
      v39 = 0;
      objc_msgSend(v8, "peekAtAddress:size:returnsBuf:", v17, 32, &v39);
      v18 = *v39;
      if (v18 == 2)
        break;
      if (v18 == 1)
      {
        v38 = 0;
        objc_msgSend(v8, "peekAtAddress:size:returnsBuf:", v40[24] + 36, 12 * *((unsigned int *)v39 + 1), &v38);
        v19 = v39;
        if (*((_DWORD *)v39 + 1))
        {
          v20 = 0;
          v21 = 0;
          do
          {
            if (*(_QWORD *)(v38 + v20))
            {
              v22 = btref_decode_unslide(v8, *(_DWORD *)(v38 + v20 + 8) & 0xFFFFFFC0, v43, v41, v15);
              if ((_DWORD)v22)
              {
                v37 = 0;
                vmu_enter_stack_in_backtrace_uniquing_table((uint64_t)self->_backtraceUniquingTable, (uint64_t)&v37, (uint64_t)v43, v22, v23);
                v24 = objc_loadWeakRetained((id *)&self->_graph);
                v25 = objc_msgSend(v24, "nodeForAddress:", ~*(_QWORD *)(v38 + v20));

                if (v25 != -1)
                {
                  self->_nodeToStackIndexTable[v25] = v37;
                  v36 = 1;
                }
              }
              v19 = v39;
            }
            ++v21;
            v20 += 12;
          }
          while (v21 < *((unsigned int *)v19 + 1));
        }
LABEL_24:
        v5 = v34;
        a4 = v35;
      }
LABEL_25:
      if (++v16 == v5)
        goto LABEL_28;
    }
    v38 = 0;
    objc_msgSend(v8, "peekAtAddress:size:returnsBuf:", v40[24] + 48, 16 * *((unsigned int *)v39 + 1), &v38);
    v26 = v39;
    if (*((_DWORD *)v39 + 1))
    {
      v27 = 0;
      v28 = 0;
      do
      {
        if (*(_QWORD *)(v38 + v27))
        {
          v29 = btref_decode_unslide(v8, *(_DWORD *)(v38 + v27 + 12) & 0xFFFFFFC0, v43, v41, v15);
          if ((_DWORD)v29)
          {
            v37 = 0;
            vmu_enter_stack_in_backtrace_uniquing_table((uint64_t)self->_backtraceUniquingTable, (uint64_t)&v37, (uint64_t)v43, v29, v30);
            v31 = objc_loadWeakRetained((id *)&self->_graph);
            v32 = objc_msgSend(v31, "nodeForAddress:", ~*(_QWORD *)(v38 + v27));

            if (v32 != -1)
            {
              self->_nodeToStackIndexTable[v32] = v37;
              v36 = 1;
            }
          }
          v26 = v39;
        }
        ++v28;
        v27 += 16;
      }
      while (v28 < *((unsigned int *)v26 + 1));
    }
    goto LABEL_24;
  }
  v36 = 0;
LABEL_28:

  return v36 & 1;
}

- (void)populateBacktraceUniquingTableWithStackLogs:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  os_signpost_id_t v20;
  id v21;
  int v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  os_signpost_id_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  os_signpost_id_t v34;
  NSMapTable *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  os_signpost_id_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  os_signpost_id_t v44;
  NSMapTable *v45;
  const void *v46;
  unsigned int *v47;
  _QWORD *v48;
  uint64_t v49;
  int v50;
  int v51;
  _DWORD *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  os_signpost_id_t v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  os_signpost_id_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  os_signpost_id_t v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  os_signpost_id_t v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  os_signpost_id_t v88;
  uint64_t v89;
  unsigned int v90;
  _QWORD v91[4];
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *key;
  NSMapEnumerator v98;
  int __pattern4;
  void *value;
  NSMapEnumerator enumerator;
  _QWORD v102[5];
  NSMapTable *v103;
  _QWORD v104[5];
  id v105;
  id v106;
  int v107;
  unsigned int v108;
  uint8_t buf[4096];
  uint64_t v110;

  v3 = ((uint64_t (*)(VMUGraphStackLogReader *, SEL, id))MEMORY[0x1E0C80A78])(self, a2, a3);
  v110 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  if (!v5)
    -[VMUGraphStackLogReader populateBacktraceUniquingTableWithStackLogs:].cold.1();
  v6 = v5;
  *(_QWORD *)(v3 + 136) = vmu_create_backtrace_uniquing_table(0, 4);
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 80));
  v90 = objc_msgSend(WeakRetained, "nodeNamespaceSize");

  v8 = objc_loadWeakRetained((id *)(v3 + 80));
  *(_QWORD *)(v3 + 120) = malloc_type_malloc(8 * objc_msgSend(v8, "nodeNamespaceSize"), 0x100004000313F17uLL);

  v9 = *(void **)(v3 + 120);
  v10 = objc_loadWeakRetained((id *)(v3 + 80));
  memset(v9, 255, 8 * objc_msgSend(v10, "nodeNamespaceSize"));

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 259);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(v3 + 96);
  if (v12)
  {
    v13 = objc_msgSend(v12, "signpostID");
    v12 = *(void **)(v3 + 96);
    if (v13)
    {
      objc_msgSend(v12, "logHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v14, OS_SIGNPOST_INTERVAL_END, v16, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v12 = *(void **)(v3 + 96);
    }
  }
  objc_msgSend(v12, "endEvent:", "VMUGraphStackLogReader", 136);
  objc_msgSend(*(id *)(v3 + 96), "startWithCategory:message:", "VMUGraphStackLogReader", "populateUniquingTable build map of address --> {nodeIndex,stackID}");
  v17 = *(void **)(v3 + 96);
  if (v17)
  {
    objc_msgSend(v17, "logHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VMUGraphStackLogReader", "populateUniquingTable build map of address --> {nodeIndex,stackID}", buf, 2u);
      }
    }

  }
  v21 = objc_loadWeakRetained((id *)(v3 + 80));
  v22 = VMULiteZoneIndex(v21);

  v23 = objc_loadWeakRetained((id *)(v3 + 80));
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke;
  v104[3] = &unk_1E4E02E10;
  v104[4] = v3;
  v107 = v22;
  v24 = v6;
  v105 = v24;
  v25 = v11;
  v106 = v25;
  v108 = v90;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v23, v104);

  v26 = *(void **)(v3 + 96);
  if (v26)
  {
    v27 = objc_msgSend(v26, "signpostID");
    v26 = *(void **)(v3 + 96);
    if (v27)
    {
      objc_msgSend(v26, "logHandle");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v28, OS_SIGNPOST_INTERVAL_END, v30, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v26 = *(void **)(v3 + 96);
    }
  }
  objc_msgSend(v26, "endEvent:", "VMUGraphStackLogReader");
  objc_msgSend(*(id *)(v3 + 96), "startWithCategory:message:", "VMUGraphStackLogReader", "populateUniquingTable read stack log records");
  v31 = *(void **)(v3 + 96);
  if (v31)
  {
    objc_msgSend(v31, "logHandle");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v34 = v33;
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "VMUGraphStackLogReader", "populateUniquingTable read stack log records", buf, 2u);
      }
    }

  }
  *(_QWORD *)(v3 + 176) = 0;
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70;
  v102[3] = &unk_1E4E02E38;
  v102[4] = v3;
  v35 = (NSMapTable *)v25;
  v103 = v35;
  objc_msgSend(v24, "enumerateMSLRecordsAndPayloads:", v102);
  v36 = *(void **)(v3 + 96);
  if (v36)
  {
    v37 = objc_msgSend(v36, "signpostID");
    v36 = *(void **)(v3 + 96);
    if (v37)
    {
      objc_msgSend(v36, "logHandle");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
      if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v38, OS_SIGNPOST_INTERVAL_END, v40, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v36 = *(void **)(v3 + 96);
    }
  }
  objc_msgSend(v36, "endEvent:", "VMUGraphStackLogReader");
  objc_msgSend(*(id *)(v3 + 96), "startWithCategory:message:", "VMUGraphStackLogReader", "populateUniquingTable invert map table to create oldStackId --> nodeIndex map");
  v41 = *(void **)(v3 + 96);
  if (v41)
  {
    objc_msgSend(v41, "logHandle");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v44 = v43;
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v44, "VMUGraphStackLogReader", "populateUniquingTable invert map table to create oldStackId --> nodeIndex map", buf, 2u);
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 259);
  v45 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, v35);
  value = 0;
  while (NSNextMapEnumeratorPair(&enumerator, 0, &value))
  {
    v46 = (const void *)*((_QWORD *)value + 1);
    v47 = (unsigned int *)NSMapGet(v45, v46);
    if (v46 != (const void *)-1)
    {
      v48 = v47;
      if (v47)
      {
        v49 = *v47;
        if ((_DWORD)v49 == v47[1])
        {
          v50 = 4 * v49 + 6;
          v51 = v50 & 0x3FFFFFFE;
          v52 = malloc_type_malloc((4 * v50) + 8, 0x4450ED67uLL);
          memcpy(v52, v48, 4 * v49 + 8);
          v52[1] = v51;
          NSMapInsert(v45, v46, v52);
          v48 = v52;
        }
      }
      else
      {
        v48 = malloc_type_malloc(0x20uLL, 0x64F8F2D9uLL);
        *v48 = 0x600000000;
        NSMapInsertKnownAbsent(v45, v46, v48);
      }
      v53 = *(unsigned int *)v48;
      *((_DWORD *)v48 + v53 + 2) = *(_DWORD *)value;
      *(_DWORD *)v48 = v53 + 1;
    }
  }
  NSEndMapTableEnumeration(&enumerator);

  v54 = *(void **)(v3 + 96);
  if (v54)
  {
    v55 = objc_msgSend(v54, "signpostID");
    v54 = *(void **)(v3 + 96);
    if (v55)
    {
      objc_msgSend(v54, "logHandle");
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
      if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v58 = v57;
        if (os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v56, OS_SIGNPOST_INTERVAL_END, v58, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v54 = *(void **)(v3 + 96);
    }
  }
  objc_msgSend(v54, "endEvent:", "VMUGraphStackLogReader");
  objc_msgSend(*(id *)(v3 + 96), "startWithCategory:message:", "VMUGraphStackLogReader", "populateUniquingTable get backtraces from libmalloc into our backtrace uniquing table");
  v59 = *(void **)(v3 + 96);
  if (v59)
  {
    objc_msgSend(v59, "logHandle");
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
    if ((unint64_t)(v61 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v62 = v61;
      if (os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v62, "VMUGraphStackLogReader", "populateUniquingTable get backtraces from libmalloc into our backtrace uniquing table", buf, 2u);
      }
    }

  }
  *(_DWORD *)(v3 + 104) = v90;
  v63 = malloc_type_malloc(4 * v90, 0x89BB72AAuLL);
  *(_QWORD *)(v3 + 112) = v63;
  __pattern4 = -1;
  memset_pattern4(v63, &__pattern4, 4 * v90);
  memset(&v98, 0, sizeof(v98));
  NSEnumerateMapTable(&v98, v45);
  v96 = 0;
  key = 0;
  while (NSNextMapEnumeratorPair(&v98, &key, &v96))
  {
    v64 = objc_msgSend(v24, "getFramesForStackID:stackFramesBuffer:", key, buf);
    if ((_DWORD)v64)
    {
      v95 = 0;
      vmu_enter_stack_in_backtrace_uniquing_table(*(_QWORD *)(v3 + v89), (uint64_t)&v95, (uint64_t)buf, v64, v65);
      v66 = (unsigned int *)v96;
      if (*(_DWORD *)v96)
      {
        v67 = v95;
        v68 = *(_QWORD *)(v3 + 112);
        v69 = 2;
        do
        {
          *(_DWORD *)(v68 + 4 * v66[v69]) = v67;
          v70 = v69++ - 1;
        }
        while (v70 < *v66);
      }
    }
  }
  NSEndMapTableEnumeration(&v98);
  v71 = *(void **)(v3 + 96);
  if (v71)
  {
    v72 = objc_msgSend(v71, "signpostID");
    v71 = *(void **)(v3 + 96);
    if (v72)
    {
      objc_msgSend(v71, "logHandle");
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
      if ((unint64_t)(v74 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v75 = v74;
        if (os_signpost_enabled(v73))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v73, OS_SIGNPOST_INTERVAL_END, v75, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v71 = *(void **)(v3 + 96);
    }
  }
  objc_msgSend(v71, "endEvent:", "VMUGraphStackLogReader");
  objc_msgSend(*(id *)(v3 + 96), "startWithCategory:message:", "VMUGraphStackLogReader", "populateUniquingTable convert VM region tracker's from old to new stackIDs");
  v76 = *(void **)(v3 + 96);
  if (v76)
  {
    objc_msgSend(v76, "logHandle");
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
    if ((unint64_t)(v78 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v79 = v78;
      if (os_signpost_enabled(v77))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v77, OS_SIGNPOST_INTERVAL_BEGIN, v79, "VMUGraphStackLogReader", "populateUniquingTable convert VM region tracker's from old to new stackIDs", buf, 2u);
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 1282);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = *(void **)(v3 + 24);
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_74;
  v91[3] = &unk_1E4E02E60;
  v82 = v80;
  v92 = v82;
  v83 = v24;
  v93 = v83;
  v94 = v3;
  objc_msgSend(v81, "convertStackIDs:", v91);
  v84 = *(void **)(v3 + 96);
  if (v84)
  {
    v85 = objc_msgSend(v84, "signpostID");
    v84 = *(void **)(v3 + 96);
    if (v85)
    {
      objc_msgSend(v84, "logHandle");
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(*(id *)(v3 + 96), "signpostID");
      if ((unint64_t)(v87 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v88 = v87;
        if (os_signpost_enabled(v86))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v86, OS_SIGNPOST_INTERVAL_END, v88, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v84 = *(void **)(v3 + 96);
    }
  }
  objc_msgSend(v84, "endEvent:", "VMUGraphStackLogReader");

}

void __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke(uint64_t a1, unsigned int a2, const void **a3, uint64_t a4, BOOL *a5)
{
  char v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t uniquing_table_index;
  unint64_t allocation_timestamp;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rangeIsInSharedCache:", *(_QWORD *)(a4 + 8), *(_QWORD *)(a4 + 16));
  v11 = (unint64_t)a3[1];
  v12 = v11 >> 60;
  if (v11 >> 60 != 5)
    v10 = 1;
  if ((_DWORD)v12 == 1 || (v10 & 1) == 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
      goto LABEL_15;
    if (*(_DWORD *)(a4 + 148) == *(_DWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "liteMSLPayloadforMallocAddress:size:", *a3, v11 & 0xFFFFFFFFFFFFFFFLL);
      uniquing_table_index = msl_payload_get_uniquing_table_index();
      allocation_timestamp = msl_payload_get_allocation_timestamp();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 8 * a2) = allocation_timestamp;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(v15 + 168);
      if (allocation_timestamp > v16)
        v16 = allocation_timestamp;
      *(_QWORD *)(v15 + 168) = v16;
      if (uniquing_table_index == -1)
        goto LABEL_17;
      goto LABEL_16;
    }
    if (VMUGraphNodeType_IsVMRegion(v12))
    {
      objc_msgSend(*(id *)(a1 + 40), "liteMSLPayloadforVMregionAddress:", *a3);
      uniquing_table_index = msl_payload_get_uniquing_table_index();
      v17 = msl_payload_get_allocation_timestamp();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 8 * a2) = v17;
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(v18 + 168);
      if (v17 > v19)
        v19 = v17;
      *(_QWORD *)(v18 + 168) = v19;
    }
    else
    {
LABEL_15:
      uniquing_table_index = -1;
    }
LABEL_16:
    v20 = malloc_type_malloc(0x10uLL, 0x1000040F7F8B94BuLL);
    *(_DWORD *)v20 = a2;
    v20[1] = uniquing_table_index;
    NSMapInsert(*(NSMapTable **)(a1 + 48), *a3, v20);
LABEL_17:
    *a5 = *(_DWORD *)(a1 + 60) <= a2;
  }
}

void __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t uniquing_table_index;
  _QWORD *v9;
  id WeakRetained;
  unsigned int v11;
  id v12;
  unint64_t allocation_timestamp;
  uint64_t v14;
  unint64_t v15;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  uniquing_table_index = msl_payload_get_uniquing_table_index();
  if ((a2 & 0x12) != 0 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v9 = NSMapGet(*(NSMapTable **)(a1 + 40), a3);
    if (v9)
    {
      v9[1] = uniquing_table_index;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      v11 = objc_msgSend(WeakRetained, "nodeForAddress:", a3);

      if (v11 != -1)
      {
        v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
        if (v11 >= objc_msgSend(v12, "nodeNamespaceSize"))
          __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70_cold_1();

        allocation_timestamp = msl_payload_get_allocation_timestamp();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 8 * v11) = allocation_timestamp;
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(v14 + 168);
        if (allocation_timestamp > v15)
          v15 = allocation_timestamp;
        *(_QWORD *)(v14 + 168) = v15;
      }
    }
  }
  if ((a2 & 0x30) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "handleStackLogType:address:size:stackID:", a2, a3, a4, uniquing_table_index);
}

char *__70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_74(uint64_t a1, const void *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v9;
  _BYTE v10[4096];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (char *)NSMapGet(*(NSMapTable **)(a1 + 32), a2);
  v5 = v4;
  v9 = v4;
  if (v4)
    return v4 - 1;
  v6 = objc_msgSend(*(id *)(a1 + 40), "getFramesForStackID:stackFramesBuffer:", a2, v10);
  if ((_DWORD)v6)
  {
    vmu_enter_stack_in_backtrace_uniquing_table(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 136), (uint64_t)&v9, (uint64_t)v10, v6, v7);
    NSMapInsertKnownAbsent(*(NSMapTable **)(a1 + 32), a2, v9 + 1);
    return v9;
  }
  return v5;
}

- (void)enumerateUniquingTable:(id)a3
{
  id v4;
  void *v5;
  vmu_backtrace_uniquing_table_t *backtraceUniquingTable;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  backtraceUniquingTable = self->_backtraceUniquingTable;
  if (backtraceUniquingTable)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__VMUGraphStackLogReader_enumerateUniquingTable___block_invoke;
    v7[3] = &unk_1E4E02E88;
    v8 = v4;
    vmu_enumerate_backtrace_uniquing_table(backtraceUniquingTable, (uint64_t)v7);

  }
  else if (self->_originalUniquingTable)
  {
    msl_uniquing_table_enumerate();
  }

}

uint64_t __49__VMUGraphStackLogReader_enumerateUniquingTable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)symbolicateBacktraceUniquingTable
{
  VMUDebugTimer *debugTimer;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  VMUDebugTimer *v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  VMUDebugTimer *v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[16];

  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v4 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v4)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v5, OS_SIGNPOST_INTERVAL_END, v7, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUGraphStackLogReader");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUGraphStackLogReader", "symbolicateBacktraceUniquingTable");
  v8 = self->_debugTimer;
  if (v8)
  {
    -[VMUDebugTimer logHandle](v8, "logHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VMUGraphStackLogReader", "symbolicateBacktraceUniquingTable", buf, 2u);
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 1282);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 1282);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__VMUGraphStackLogReader_symbolicateBacktraceUniquingTable__block_invoke;
  v21[3] = &unk_1E4E02EB0;
  v21[4] = self;
  v14 = v12;
  v22 = v14;
  v15 = v13;
  v23 = v15;
  -[VMUGraphStackLogReader enumerateUniquingTable:](self, "enumerateUniquingTable:", v21);
  v16 = self->_debugTimer;
  if (v16)
  {
    v17 = -[VMUDebugTimer signpostID](v16, "signpostID");
    v16 = self->_debugTimer;
    if (v17)
    {
      -[VMUDebugTimer logHandle](v16, "logHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v18, OS_SIGNPOST_INTERVAL_END, v20, "VMUGraphStackLogReader", ", buf, 2u);
        }
      }

      v16 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v16, "endEvent:", "VMUGraphStackLogReader");

}

void __59__VMUGraphStackLogReader_symbolicateBacktraceUniquingTable__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  const void *Range;
  uint64_t v9;
  uint64_t v10;
  uint64_t Name;
  void *v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Path;
  uint64_t LineNumber;
  void *v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "symbolStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
    objc_msgSend(v6, "symbolStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAddress:origin:", a2, 3);

  }
  CSSymbolicatorGetSymbolWithAddressAtTime();
  if ((CSIsNull() & 1) == 0)
  {
    Range = (const void *)CSSymbolGetRange();
    v10 = v9;
    if (!NSHashGet(*(NSHashTable **)(a1 + 40), Range))
    {
      NSHashInsert(*(NSHashTable **)(a1 + 40), Range);
      Name = CSSymbolGetName();
      if (Name)
      {
        v12 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setFunctionName:forPCAddressRange:", v13, Range, v10);

      }
    }
  }
  CSSymbolicatorGetSourceInfoWithAddressAtTime();
  if ((CSIsNull() & 1) == 0)
  {
    v14 = (const void *)CSSourceInfoGetRange();
    v16 = v15;
    if (!NSHashGet(*(NSHashTable **)(a1 + 48), v14))
    {
      NSHashInsert(*(NSHashTable **)(a1 + 48), v14);
      Path = CSSourceInfoGetPath();
      LineNumber = CSSourceInfoGetLineNumber();
      v19 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setSourcePath:lineNumber:forPCAddressRange:", v20, LineNumber, v14, v16);

    }
  }
}

- (id)binaryImagePathForPCaddress:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[VMUGraphStackLogReader vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_VMURange)binaryImageRangeForPCaddress:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _VMURange result;

  -[VMUGraphStackLogReader vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "range");
    v7 = v6;
  }
  else
  {
    v7 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)_setFunctionName:(id)a3 forPCAddressRange:(_VMURange)a4
{
  -[VMURangeToStringMap setString:forRange:](self->_functionNameRanges, "setString:forRange:", a3, a4.location, a4.length);
}

- (id)functionNameForPCaddress:(unint64_t)a3
{
  void *v5;
  objc_super v7;

  if ((CSIsNull() & 1) != 0
    || (v7.receiver = self,
        v7.super_class = (Class)VMUGraphStackLogReader,
        -[VMUStackLogReaderBase functionNameForPCaddress:](&v7, sel_functionNameForPCaddress_, a3),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[VMURangeToStringMap stringForAddress:](self->_functionNameRanges, "stringForAddress:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (_VMURange)functionRangeContainingPCaddress:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  objc_super v7;
  _VMURange result;

  if ((CSIsNull() & 1) != 0
    || (v7.receiver = self,
        v7.super_class = (Class)VMUGraphStackLogReader,
        v5 = -[VMUStackLogReaderBase functionRangeContainingPCaddress:](&v7, sel_functionRangeContainingPCaddress_, a3),
        v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = (id)-[VMURangeToStringMap rangeContainingAddress:](self->_functionNameRanges, "rangeContainingAddress:", a3);
  }
  result.length = v6;
  result.location = (unint64_t)v5;
  return result;
}

- (void)_setSourcePath:(id)a3 lineNumber:(unsigned int)a4 forPCAddressRange:(_VMURange)a5
{
  unint64_t length;
  unint64_t location;
  uint64_t v7;
  VMURangeToStringMap *sourceInfoRanges;
  id v10;
  void *v11;
  uint64_t v12;
  VMURangeToStringMap *v13;
  void *v14;
  uint64_t v15;
  id v16;

  if (a3)
  {
    length = a5.length;
    location = a5.location;
    v7 = *(_QWORD *)&a4;
    sourceInfoRanges = self->_sourceInfoRanges;
    v10 = a3;
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[VMURangeToStringMap indexForString:insertIfMissing:](sourceInfoRanges, "indexForString:insertIfMissing:", v11, 1);

    v13 = self->_sourceInfoRanges;
    objc_msgSend(v10, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[VMURangeToStringMap indexForString:insertIfMissing:](v13, "indexForString:insertIfMissing:", v14, 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u:%u:%u"), v12, v15, v7);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[VMURangeToStringMap setString:forRange:](self->_sourceInfoRanges, "setString:forRange:", v16, location, length);

  }
}

- (void)_parseSourceInfoString:(id)a3 intoComponents:(unsigned int *)a4
{
  const char *v5;
  size_t v6;
  int v7;
  int v8;
  int v9;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v6 = strlen(v5);
  *a4 = 0;
  if (v6)
  {
    v7 = 0;
    do
    {
      v9 = *v5++;
      v8 = v9;
      if (v9 == 58)
        a4[++v7] = 0;
      else
        a4[v7] = v8 + 10 * a4[v7] - 48;
      --v6;
    }
    while (v6);
  }
}

- (id)sourcePathForPCaddress:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((CSIsNull() & 1) != 0
    || (v10.receiver = self,
        v10.super_class = (Class)VMUGraphStackLogReader,
        -[VMUStackLogReaderBase sourcePathForPCaddress:](&v10, sel_sourcePathForPCaddress_, a3),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12 = 0;
      v11 = 0;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:](self, "_parseSourceInfoString:intoComponents:", v6, &v11);
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", HIDWORD(v11));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)sourceFileNameForPCaddress:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((CSIsNull() & 1) != 0
    || (v8.receiver = self,
        v8.super_class = (Class)VMUGraphStackLogReader,
        -[VMUStackLogReaderBase sourceFileNameForPCaddress:](&v8, sel_sourceFileNameForPCaddress_, a3),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = 0;
      v9 = 0;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:](self, "_parseSourceInfoString:intoComponents:", v6, &v9);
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", HIDWORD(v9));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (unsigned)sourceLineNumberForPCaddress:(unint64_t)a3
{
  unsigned int v5;
  void *v6;
  objc_super v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((CSIsNull() & 1) != 0
    || (v8.receiver = self,
        v8.super_class = (Class)VMUGraphStackLogReader,
        (v5 = -[VMUStackLogReaderBase sourceLineNumberForPCaddress:](&v8, sel_sourceLineNumberForPCaddress_, a3)) == 0))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = 0;
      v9 = 0;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:](self, "_parseSourceInfoString:intoComponents:", v6, &v9);
      v5 = v10;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)sourceFileNameAndLineNumberForPCaddress:(unint64_t)a3 fullPath:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  if ((CSIsNull() & 1) != 0
    || (v15.receiver = self,
        v15.super_class = (Class)VMUGraphStackLogReader,
        -[VMUStackLogReaderBase sourceFileNameAndLineNumberForPCaddress:fullPath:](&v15, sel_sourceFileNameAndLineNumberForPCaddress_fullPath_, a3, v4), (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[VMURangeToStringMap stringForAddress:](self->_sourceInfoRanges, "stringForAddress:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v17 = 0;
      v16 = 0;
      -[VMUGraphStackLogReader _parseSourceInfoString:intoComponents:](self, "_parseSourceInfoString:intoComponents:", v8, &v16);
      -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", HIDWORD(v16));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v17;
      if (v4)
      {
        -[VMURangeToStringMap stringForIndex:](self->_sourceInfoRanges, "stringForIndex:", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathComponent:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u"), v12, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%u"), v9, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v13;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (_VMURange)sourceLineRangeContainingPCaddress:(unint64_t)a3
{
  unint64_t Range;
  unint64_t v6;
  _VMURange result;

  if ((CSIsNull() & 1) != 0
    || (CSSymbolicatorGetSymbolWithAddressAtTime(), Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    Range = -[VMURangeToStringMap rangeContainingAddress:](self->_sourceInfoRanges, "rangeContainingAddress:", a3);
  }
  result.length = v6;
  result.location = Range;
  return result;
}

- (BOOL)is64bit
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  v3 = objc_msgSend(WeakRetained, "is64bit");

  return v3;
}

- (BOOL)inspectingLiveProcess
{
  return 0;
}

- (BOOL)containsTimestampsByNode
{
  return self->_nodeToTimestampTable != 0;
}

- (int)enumerateMSLRecordsAndPayloads:(id)a3
{
  id v4;
  backtrace_uniquing_table *originalUniquingTable;
  unint64_t i;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  NSData *diskLogs;
  id v12;

  v4 = a3;
  originalUniquingTable = self->_originalUniquingTable;
  if (self->_backtraceUniquingTable)
  {
    if (originalUniquingTable)
      -[VMUGraphStackLogReader enumerateMSLRecordsAndPayloads:].cold.1();
  }
  else
  {
    if (!originalUniquingTable)
      goto LABEL_19;
    diskLogs = self->_diskLogs;
    if (diskLogs)
    {
      -[NSData bytes](diskLogs, "bytes");
      -[NSData length](self->_diskLogs, "length");
      -[VMUGraphStackLogReader is64bit](self, "is64bit");
      v12 = v4;
      msl_disk_stack_logs_enumerate_from_buffer();

      goto LABEL_19;
    }
  }
  if (self->_nodeNamespaceSize)
  {
    for (i = 0; i < self->_nodeNamespaceSize; ++i)
    {
      if (self->_originalUniquingTable)
      {
        v7 = self->_nodeToMSLPayloadTable[i];
        if (!msl_payload_is_invalid())
          goto LABEL_10;
      }
      else if (self->_nodeToStackIndexTable[i] != -1)
      {
        v7 = msl_payload_create_from_index();
LABEL_10:
        WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
        v9 = WeakRetained;
        if (WeakRetained)
          objc_msgSend(WeakRetained, "nodeDetails:", i);

        if (VMUGraphNodeType_IsVMRegion(0))
          (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t))v4 + 2))(v4, 16, 0, 0, v7);
      }
    }
  }
LABEL_19:

  return 0;
}

uint64_t __57__VMUGraphStackLogReader_enumerateMSLRecordsAndPayloads___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)getFramesForNode:(unsigned int)a3 inLiteZone:(BOOL)a4 stackFramesBuffer:(unint64_t *)a5
{
  unint64_t v7;
  int64_t result;
  unint64_t v9;

  v7 = -[VMUGraphStackLogReader stackIDForNode:](self, "stackIDForNode:", *(_QWORD *)&a3, a4);
  if (v7 > 0xFFFFFFFE)
    return 0;
  v9 = v7;
  if (self->_originalUniquingTable)
  {
    msl_uniquing_table_get_frames_from_table();
    return 0;
  }
  else
  {
    result = (int64_t)self->_backtraceUniquingTable;
    if (result)
      return (int)vmu_stack_frames_for_uniqued_stack(result, v9, (uint64_t)a5, 512);
  }
  return result;
}

- (unint64_t)stackIDForNode:(unsigned int)a3
{
  if (self->_originalUniquingTable)
    return msl_payload_get_uniquing_table_index();
  if (!self->_backtraceUniquingTable)
    return -1;
  if (self->_nodeToStackIndexTable[a3] == -1)
    return -1;
  return self->_nodeToStackIndexTable[a3];
}

- (unint64_t)timestampForNode:(unsigned int)a3
{
  unint64_t *nodeToTimestampTable;

  if (self->_nodeToMSLPayloadTable)
    return msl_payload_get_allocation_timestamp();
  nodeToTimestampTable = self->_nodeToTimestampTable;
  if (nodeToTimestampTable)
    return nodeToTimestampTable[a3];
  else
    return 0;
}

- (int64_t)getFramesForAddress:(unint64_t)a3 size:(unint64_t)a4 inLiteZone:(BOOL)a5 stackFramesBuffer:(unint64_t *)a6
{
  _BOOL8 v7;
  id WeakRetained;
  uint64_t v11;

  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  v11 = objc_msgSend(WeakRetained, "nodeForAddress:", a3);

  if ((_DWORD)v11 == -1)
    return 0;
  else
    return -[VMUGraphStackLogReader getFramesForNode:inLiteZone:stackFramesBuffer:](self, "getFramesForNode:inLiteZone:stackFramesBuffer:", v11, v7, a6);
}

- (int64_t)getFramesForStackID:(unint64_t)a3 stackFramesBuffer:(unint64_t *)a4
{
  int64_t result;
  int v5;

  if (a3 > 0xFFFFFFFE)
    return 0;
  if (self->_originalUniquingTable)
  {
    msl_uniquing_table_get_frames_from_table();
    return 0;
  }
  else
  {
    result = (int64_t)self->_backtraceUniquingTable;
    if (result)
    {
      v5 = vmu_stack_frames_for_uniqued_stack(result, a3, (uint64_t)a4, 512);
      if (v5 <= 512)
        return v5;
      else
        return 0;
    }
  }
  return result;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  objc_msgSend(WeakRetained, "vmuVMRegionForAddress:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)nodesInUniquingTable
{
  unint64_t v2;
  vmu_backtrace_uniquing_table_t *backtraceUniquingTable;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_originalUniquingTable)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    msl_uniquing_table_enumerate();
    v2 = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    backtraceUniquingTable = self->_backtraceUniquingTable;
    if (backtraceUniquingTable)
      return backtraceUniquingTable->var7;
    else
      return 0;
  }
  return v2;
}

uint64_t __46__VMUGraphStackLogReader_nodesInUniquingTable__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_loadWeakRetained((id *)&self->_graph);
}

- (NSData)diskLogs
{
  return self->_diskLogs;
}

- (void)setDiskLogs:(id)a3
{
  objc_storeStrong((id *)&self->_diskLogs, a3);
}

- (unint64_t)maxTimestampDelta
{
  return self->_maxTimestampDelta;
}

- (unint64_t)mslRecordsCount
{
  return self->_mslRecordsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfoRanges, 0);
  objc_storeStrong((id *)&self->_functionNameRanges, 0);
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_diskLogs, 0);
  objc_destroyWeak((id *)&self->_graph);
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[VMUGraphStackLogReader initWithCoder:]", "VMUGraphStackLogReader.m", 250, "tableSize == tableContentsSize");
}

- (void)copyOriginalUniquingTable:.cold.1()
{
  __assert_rtn("-[VMUGraphStackLogReader copyOriginalUniquingTable:]", "VMUGraphStackLogReader.m", 324, "taskStackLogReader");
}

void __52__VMUGraphStackLogReader_copyOriginalUniquingTable___block_invoke_2_cold_1()
{
  __assert_rtn("-[VMUGraphStackLogReader copyOriginalUniquingTable:]_block_invoke_2", "VMUGraphStackLogReader.m", 384, "nodeIndex < _graph.nodeNamespaceSize");
}

- (void)populateBacktraceUniquingTableWithStackLogs:.cold.1()
{
  __assert_rtn("-[VMUGraphStackLogReader populateBacktraceUniquingTableWithStackLogs:]", "VMUGraphStackLogReader.m", 547, "taskStackLogReader");
}

void __70__VMUGraphStackLogReader_populateBacktraceUniquingTableWithStackLogs___block_invoke_70_cold_1()
{
  __assert_rtn("-[VMUGraphStackLogReader populateBacktraceUniquingTableWithStackLogs:]_block_invoke", "VMUGraphStackLogReader.m", 624, "nodeIndex < _graph.nodeNamespaceSize");
}

- (void)enumerateMSLRecordsAndPayloads:.cold.1()
{
  __assert_rtn("-[VMUGraphStackLogReader enumerateMSLRecordsAndPayloads:]", "VMUGraphStackLogReader.m", 929, "!_backtraceUniquingTable || !_originalUniquingTable");
}

@end
