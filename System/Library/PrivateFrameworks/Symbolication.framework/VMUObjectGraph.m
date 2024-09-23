@implementation VMUObjectGraph

- (VMUObjectGraph)initWithNodeCount:(unsigned int)a3 nodeProvider:(id)a4
{
  uint64_t v4;
  id v6;
  VMUObjectGraph *v7;
  VMUObjectGraph *v8;
  uint64_t v9;
  id nodeProvider;
  uint64_t v11;
  void *knownClassInfos;
  objc_super v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VMUObjectGraph;
  v7 = -[VMUDirectedGraph initWithNodes:](&v14, sel_initWithNodes_, v4);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = MEMORY[0x1A85A995C](v6);
      nodeProvider = v8->_nodeProvider;
      v8->_nodeProvider = (id)v9;

      v8->_referenceGraphNodeNamespaceSize = v4;
      v11 = objc_opt_new();
      knownClassInfos = v8->_knownClassInfos;
      v8->_knownClassInfos = (VMUClassInfoMap *)v11;
    }
    else
    {
      knownClassInfos = v7;
      v8 = 0;
    }

  }
  return v8;
}

- (VMUObjectGraph)initWithNodesNoCopy:(_VMUBlockNode *)a3 nodeCount:
{
  unsigned int v3;
  unsigned int v4;
  VMUObjectGraph *v6;
  VMUObjectGraph *v7;
  uint64_t v8;
  VMUClassInfoMap *knownClassInfos;
  objc_super v11;

  v4 = v3;
  v11.receiver = self;
  v11.super_class = (Class)VMUObjectGraph;
  v6 = -[VMUDirectedGraph initWithNodes:](&v11, sel_initWithNodes_);
  v7 = v6;
  if (v6)
  {
    v6->_internalizedNodes = a3;
    v6->_internalizedCount = v4;
    v8 = objc_opt_new();
    knownClassInfos = v7->_knownClassInfos;
    v7->_knownClassInfos = (VMUClassInfoMap *)v8;

    v7->_referenceGraphNodeNamespaceSize = 0;
  }
  return v7;
}

- (void)dealloc
{
  VMUObjectGraph *referenceGraph;
  VMUObjectGraph *v4;
  _VMUObjectGraphEdge *referenceTable;
  _VMUObjectGraphEdgeLarge *referenceTableLarge;
  _VMUBlockNode *internalizedNodes;
  objc_super v8;

  referenceGraph = self->_referenceGraph;
  if (referenceGraph)
  {
    -[VMUObjectGraph _modifyDerivativeGraphCount:](referenceGraph, "_modifyDerivativeGraphCount:", 0xFFFFFFFFLL);
    v4 = self->_referenceGraph;
    self->_referenceGraph = 0;

  }
  referenceTable = self->_referenceTable;
  if (referenceTable)
  {
    free(referenceTable);
    self->_referenceTable = 0;
  }
  referenceTableLarge = self->_referenceTableLarge;
  if (referenceTableLarge)
  {
    free(referenceTableLarge);
    self->_referenceTableLarge = 0;
  }
  internalizedNodes = self->_internalizedNodes;
  if (internalizedNodes)
  {
    free(internalizedNodes);
    self->_internalizedNodes = 0;
  }
  +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:](VMUClassInfoMap, "_destroyRetainedLinearArray:withCount:", self->_classInfos, self->_classInfosCount);
  v8.receiver = self;
  v8.super_class = (Class)VMUObjectGraph;
  -[VMUDirectedGraph dealloc](&v8, sel_dealloc);
}

- (VMUObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  id v13;
  VMUObjectGraph *v14;
  char v15;
  unint64_t internalizedCount;
  char v17;
  void *v18;
  _DWORD *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t var0;
  unsigned int v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  _VMUBlockNode *v31;
  unint64_t v32;
  unint64_t v33;
  _VMUBlockNode *v34;
  _VMUBlockNode *v35;
  unsigned int v36;
  BOOL v37;
  int v38;
  FILE *v40;
  objc_class *v41;
  id v42;
  const char *v43;
  const char *Name;
  unsigned int v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  void *v72;
  _BOOL8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t referenceTableCapacity;
  _VMUObjectGraphEdge *referenceTable;
  $8D6A3E73ED2192107EDB56A8580BF2AB v83;
  $8D6A3E73ED2192107EDB56A8580BF2AB v84;
  void *v85;
  uint64_t v86;
  VMUClassInfoMap *knownClassInfos;
  VMUClassInfoMap *v88;
  int v89;
  void *v90;
  void *v91;
  _BOOL8 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  _BOOL8 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  VMUObjectGraph *v110;
  id *v112;
  id v113;
  void *v114;
  unint64_t v115;
  unint64_t v116;
  _QWORD v117[4];
  VMUObjectGraph *v118;
  _QWORD *v119;
  uint64_t *v120;
  _QWORD v121[4];
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  char v125;
  unint64_t v126;
  objc_super v127;
  uint64_t v128;
  const __CFString *v129;
  uint64_t v130;
  const __CFString *v131;
  uint64_t v132;
  const __CFString *v133;
  uint64_t v134;
  const __CFString *v135;
  uint64_t v136;
  _QWORD v137[3];

  v137[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v127.receiver = self;
  v127.super_class = (Class)VMUObjectGraph;
  v112 = a7;
  v113 = a6;
  v14 = -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:](&v127, sel_initWithArchived_version_options_diskLogs_error_, v13, a4, a5);
  if (!v14)
    goto LABEL_71;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("objectGraphInfo"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v14->_internalizedCount = -[VMUDirectedGraph nodeNamespaceSize](v14, "nodeNamespaceSize");
  v15 = -[VMUDirectedGraph graphIs64bit](v14, "graphIs64bit");
  internalizedCount = v14->_internalizedCount;
  if (internalizedCount < 0xFFFFFFF)
    v17 = 1;
  else
    v17 = v15;
  if ((v17 & 1) != 0)
  {
    v14->_internalizedNodes = (_VMUBlockNode *)malloc_type_malloc(16 * internalizedCount, 0x1000040451B5BE8uLL);
    v126 = 0;
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("objectDetails"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v18, &v126, a5);

    v20 = v126;
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("commonAddressBits"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v14->_internalizedCount)
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      var0 = 0;
      v27 = 0;
      v28 = v20 >> 2;
      while (v25 + 1 <= v28)
      {
        v29 = v19[v25];
        v30 = v25 + 4;
        if ((v29 & 0x80000000) != 0 && v30 > v28)
          break;
        if ((v29 & 0x80000000) != 0)
        {
          v32 = v19[v25 + 1] | ((unint64_t)(v29 & 0x7FFFFFFF) << 32);
          v33 = v19[v25 + 3] | ((unint64_t)v19[v25 + 2] << 32);
          v34 = &v14->_internalizedNodes[v23];
          v34->var0 = v32;
          *((_QWORD *)v34 + 1) = v33;
          v25 = v30;
        }
        else
        {
          v31 = &v14->_internalizedNodes[v23];
          v31->var0 = var0 + (((v29 >> 4) & 0x3FF) << (v29 & 0xF));
          *((_QWORD *)v31 + 1) = (32 * (((v29 >> 14) & 0x1F) << (v29 & 0xF))) | 1 | ((unint64_t)(v29 >> 19) << 41);
          ++v27;
          ++v25;
        }
        v35 = &v14->_internalizedNodes[v23];
        var0 = v35->var0;
        v36 = *((_DWORD *)v35 + 2) & 7;
        v37 = v36 > 4;
        v38 = (1 << v36) & 0x19;
        if (v37 || v38 == 0)
          v35->var0 = var0 | v22;
        ++v24;
        ++v23;
        if (v24 >= v14->_internalizedCount)
          goto LABEL_28;
      }
      v40 = (FILE *)*MEMORY[0x1E0C80C10];
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = (const char *)objc_msgSend(v42, "UTF8String");
      Name = sel_getName(a2);
      fprintf(v40, "-[%s %s] error: malformed serialized data\n", v43, Name);

      if (v19)
        free(v19);

      goto LABEL_26;
    }
    v27 = 0;
    v45 = 0;
    if (v19)
    {
LABEL_28:
      free(v19);
      v45 = v27;
    }
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Object Info] Compact: %d Large: %d (%2.2f%%)\n\n", v45, -[VMUDirectedGraph nodeNamespaceSize](v14, "nodeNamespaceSize") - v45, (double)v45 * 100.0 / (double)-[VMUDirectedGraph nodeNamespaceSize](v14, "nodeNamespaceSize"));
    v122 = 0;
    v123 = &v122;
    v124 = 0x2020000000;
    v125 = 1;
    v121[0] = 0;
    v121[1] = v121;
    v121[2] = 0x2020000000;
    v121[3] = 0;
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __66__VMUObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke;
    v117[3] = &unk_1E4E03D30;
    v14 = v14;
    v118 = v14;
    v119 = v121;
    v120 = &v122;
    -[VMUDirectedGraph enumerateNodesWithBlock:](v14, "enumerateNodesWithBlock:", v117);
    if (*((_BYTE *)v123 + 24))
    {
      v116 = 0;
      objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("referenceDetails"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v14->_referenceTable = (_VMUObjectGraphEdge *)+[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v46, &v116, a5);

      v47 = -[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize");
      v14->_referenceTableCapacity = v47;
      if (v116 >= 4 * (unint64_t)v47)
      {
        if (kVMUPrintArchivingTiming)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Reference Details] Total Compact and Large: %d\n\n", -[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize"));
        v115 = 0;
        objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("referenceDetailsLarge"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v14->_referenceTableLarge = (_VMUObjectGraphEdgeLarge *)+[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v68, &v115, a5);

        v69 = v115;
        v70 = v115 >> 4;
        v14->_referenceTableLargeCapacity = v115 >> 4;
        v14->_referenceTableLargeCount = v70;
        if (v69 >= 16 * (unint64_t)v14->_referenceTableLargeCapacity)
        {
          if (kVMUPrintArchivingTiming)
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Reference Details Large] Compact: %d Large: %d (%2.2f%%)\n\n", -[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize") - v14->_referenceTableLargeCount, v14->_referenceTableLargeCount, (double)(-[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize") - v14->_referenceTableLargeCount)* 100.0/ (double)-[VMUDirectedGraph edgeNamespaceSize](v14, "edgeNamespaceSize"));
          referenceTableCapacity = v14->_referenceTableCapacity;
          if ((_DWORD)referenceTableCapacity)
          {
            referenceTable = v14->_referenceTable;
            while (1)
            {
              v84 = referenceTable->var0.var0;
              ++referenceTable;
              v83 = v84;
              if ((*(_DWORD *)&v84 & 0x80000000) != 0
                && (*(unsigned int *)&v83 & 0x7FFFFFFF) >= v14->_referenceTableLargeCount)
              {
                break;
              }
              if (!--referenceTableCapacity)
                goto LABEL_55;
            }
            if (v112)
            {
              v100 = (void *)MEMORY[0x1E0CB35C8];
              v130 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.Symbolication.VMUObjectGraph"), 1, v101);
              *v112 = (id)objc_claimAutoreleasedReturnValue();

            }
            v102 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v102)
              -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.2(v102, v103, v104, v105, v106, v107, v108, v109);
          }
          else
          {
LABEL_55:
            objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("archivedClassInfos"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v85, objc_opt_class(), a5);
            v86 = objc_claimAutoreleasedReturnValue();
            knownClassInfos = v14->_knownClassInfos;
            v14->_knownClassInfos = (VMUClassInfoMap *)v86;

            v88 = v14->_knownClassInfos;
            if (v88)
            {
              v14->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:](v88, "_retainedLinearArrayWithReturnedCount:", &v14->_classInfosCount);
              if (kVMUPrintArchivingTiming)
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Class Layouts] Class info count: %d\n\n", -[VMUClassInfoMap count](v14->_knownClassInfos, "count"));
              v89 = 0;
LABEL_69:

              _Block_object_dispose(v121, 8);
              _Block_object_dispose(&v122, 8);

              if (v89)
                goto LABEL_70;
LABEL_71:
              v14 = v14;
              v110 = v14;
              goto LABEL_72;
            }
            if (v112)
            {
              v90 = (void *)MEMORY[0x1E0CB35C8];
              v128 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.Symbolication.VMUObjectGraph"), 1, v91);
              *v112 = (id)objc_claimAutoreleasedReturnValue();

            }
            v92 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v92)
              -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.4(v92, v93, v94, v95, v96, v97, v98, v99);

            v14 = 0;
          }
        }
        else
        {
          if (v112)
          {
            v71 = (void *)MEMORY[0x1E0CB35C8];
            v132 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.Symbolication.VMUObjectGraph"), 1, v72);
            *v112 = (id)objc_claimAutoreleasedReturnValue();

          }
          v73 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v73)
            -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.3(v73, v74, v75, v76, v77, v78, v79, v80);
        }
      }
      else
      {
        if (v112)
        {
          v48 = (void *)MEMORY[0x1E0CB35C8];
          v134 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.Symbolication.VMUObjectGraph"), 1, v49);
          *v112 = (id)objc_claimAutoreleasedReturnValue();

        }
        v50 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v50)
          -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.2(v50, v51, v52, v53, v54, v55, v56, v57);
      }
    }
    else
    {
      if (v112)
      {
        v58 = (void *)MEMORY[0x1E0CB35C8];
        v136 = *MEMORY[0x1E0CB2D50];
        v137[0] = CFSTR("Memgraph is corrupt due to malloc zone enumeration failure. The malloc heap of the target process was in an inconsistent state such as when being modified.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, &v136, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.Symbolication.VMUObjectGraph"), 1, v59);
        *v112 = (id)objc_claimAutoreleasedReturnValue();

      }
      v60 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v60)
        -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.1(v60, v61, v62, v63, v64, v65, v66, v67);
    }
    v89 = 1;
    goto LABEL_69;
  }
  NSLog(CFSTR("Memory graph has bizarrely high %s count %zu\n"), "internalized node", internalizedCount);

LABEL_26:
  v14 = 0;
LABEL_70:
  v110 = 0;
LABEL_72:

  return v110;
}

_QWORD *__66__VMUObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke(_QWORD *result, unsigned int a2, _BYTE *a3)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(result[4] + 128) + 16 * a2);
  v4 = *(_QWORD *)(result[5] + 8);
  if (*(_QWORD *)(v4 + 24) > v3)
  {
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 0;
    *a3 = 1;
    v4 = *(_QWORD *)(result[5] + 8);
  }
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int v10;
  _DWORD *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  _VMUBlockNode *internalizedNodes;
  BOOL v17;
  uint64_t v18;
  unint64_t var0;
  uint64_t v20;
  _VMUBlockNode *v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  unsigned int v28;
  unint64_t v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned int v39;
  void *v40;
  FILE **v41;
  void *v42;
  uint64_t referenceTableLargeCount;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)VMUObjectGraph;
  -[VMUDirectedGraph archiveDictionaryRepresentation:options:](&v47, sel_archiveDictionaryRepresentation_options_, v6, a4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  v8 = -[VMUObjectGraph _commonHighAddressBit](self, "_commonHighAddressBit");
  v9 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  v10 = v9;
  if (v9)
  {
    v11 = malloc_type_malloc(16 * v9, 0x100004052888210uLL);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    internalizedNodes = self->_internalizedNodes;
    v17 = 0;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v8)
      v18 = -1;
    do
    {
      var0 = internalizedNodes[v15].var0;
      v20 = var0 & v18;
      if (((var0 & v18 & 0x8000000000000000) != 0) != v17)
        -[VMUObjectGraph archiveDictionaryRepresentation:options:].cold.1();
      v21 = &internalizedNodes[v15];
      v24 = *((_QWORD *)v21 + 1);
      v22 = (uint64_t *)v21 + 1;
      v23 = v24;
      v25 = (v24 >> 5) & 0xFFFFFFFFFLL;
      v26 = v24 & 0x20;
      if (v25)
        v27 = v26 == 0;
      else
        v27 = 0;
      if (v27)
      {
        v28 = 0;
        v29 = v25;
        do
        {
          ++v28;
          if (v29 < 2)
            break;
          v30 = v29;
          v29 >>= 1;
        }
        while ((v30 & 2) == 0);
      }
      else
      {
        v28 = 0;
      }
      v31 = 0;
      v32 = v20 - v13;
      if (v32 && (v32 & 1) == 0)
      {
        v31 = 0;
        v33 = v32;
        do
        {
          ++v31;
          if (v33 < 2)
            break;
          v34 = v33;
          v33 >>= 1;
        }
        while ((v34 & 2) == 0);
      }
      if (v28 >= v31)
        v28 = v31;
      if (v28 >= 0xF)
        v28 = 15;
      if ((v23 & 7) == 1
        && (v35 = v23 >> 41, v35 <= 0xFFF)
        && (v36 = v32 >> v28, v36 <= 0x3FF)
        && (v37 = v25 >> v28, v37 <= 0x1F))
      {
        v11[v12++] = ((v37 & 0x1F) << 14) | (16 * (v36 & 0x3FF)) | ((_DWORD)v35 << 19) | v28;
        ++v14;
      }
      else
      {
        v11[v12] = HIDWORD(var0) | 0x80000000;
        v11[v12 + 1] = var0;
        v38 = *v22;
        v39 = v12 + 3;
        v11[v12 + 2] = HIDWORD(*v22);
        v12 += 4;
        v11[v39] = v38 & 0xFFFFFFE7;
      }
      ++v15;
      v13 = v20;
      v17 = __OFSUB__(v15, v10);
    }
    while (v15 != v10);
  }
  else
  {
    v11 = 0;
    v14 = 0;
    v12 = 0;
  }
  +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", v11, 4 * v12, a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("objectDetails"));

  if (v11)
    free(v11);
  v41 = (FILE **)MEMORY[0x1E0C80C10];
  if (kVMUPrintArchivingTiming)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Object Info] Compact: %d Large: %d (%2.2f%%)\n\n", v14, v10 - v14, (double)v14 * 100.0 / (double)v10);
  if (-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"))
  {
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_referenceTable, 4 * -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"), a4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, CFSTR("referenceDetails"));

  }
  if (kVMUPrintArchivingTiming)
    fprintf(*v41, "[Reference Details] Total Compact and Large: %d\n\n", -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"));
  referenceTableLargeCount = self->_referenceTableLargeCount;
  if ((_DWORD)referenceTableLargeCount)
  {
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_referenceTableLarge, 16 * referenceTableLargeCount, a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, CFSTR("referenceDetailsLarge"));

  }
  if (kVMUPrintArchivingTiming)
    fprintf(*v41, "[Reference Details Large] Compact: %d Large: %d (%2.2f%%)\n\n", -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize") - self->_referenceTableLargeCount, self->_referenceTableLargeCount, (double)(-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize") - self->_referenceTableLargeCount)* 100.0/ (double)-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"));
  +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", self->_knownClassInfos, a4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, CFSTR("archivedClassInfos"));

  if (kVMUPrintArchivingTiming)
    fprintf(*v41, "[Class Layouts] Class info count: %d\n\n", -[VMUClassInfoMap count](self->_knownClassInfos, "count"));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x8000000000000000);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, CFSTR("commonAddressBits"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("objectGraphInfo"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VMUObjectGraph;
  v4 = -[VMUDirectedGraph copyWithZone:](&v9, sel_copyWithZone_, a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__VMUObjectGraph_copyWithZone___block_invoke;
  v8[3] = &unk_1E4E03D58;
  v8[4] = self;
  v5 = MEMORY[0x1A85A995C](v8);
  v6 = (void *)*((_QWORD *)v4 + 21);
  *((_QWORD *)v4 + 21) = v5;

  objc_storeStrong((id *)v4 + 22, self);
  *((_DWORD *)v4 + 47) = -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
  *((_DWORD *)v4 + 46) = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  -[VMUObjectGraph _modifyDerivativeGraphCount:](self, "_modifyDerivativeGraphCount:", 1);
  return v4;
}

void *__31__VMUObjectGraph_copyWithZone___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "nodeDetails:", a2);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

- (void)setIndexedClassInfos:(id)a3
{
  VMUClassInfoMap **p_knownClassInfos;
  id v6;
  id *v7;

  p_knownClassInfos = &self->_knownClassInfos;
  objc_storeStrong((id *)&self->_knownClassInfos, a3);
  v6 = a3;
  +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:](VMUClassInfoMap, "_destroyRetainedLinearArray:withCount:", self->_classInfos, self->_classInfosCount);
  v7 = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:](*p_knownClassInfos, "_retainedLinearArrayWithReturnedCount:", &self->_classInfosCount);

  self->_classInfos = v7;
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  return -[VMUClassInfoMap hasClassInfosDerivedFromStackBacktraces](self->_knownClassInfos, "hasClassInfosDerivedFromStackBacktraces");
}

- (void)internalizeNodes
{
  VMUClassInfoMap *v3;
  VMUClassInfoMap *knownClassInfos;
  _VMUBlockNode *v5;
  uint64_t v6;
  _VMUBlockNode *internalizedNodes;
  _VMUObjectGraphEdge *v8;
  _VMUObjectGraphEdge *referenceTable;
  _VMUObjectGraphEdgeLarge *referenceTableLarge;
  VMUObjectGraph *referenceGraph;
  VMUObjectGraph *v12;
  id nodeProvider;
  _QWORD v14[8];
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[7];

  if (self->_referenceGraphNodeNamespaceSize && (self->_nodeProvider || self->_referenceGraph))
  {
    if (!self->_knownClassInfos)
    {
      v3 = (VMUClassInfoMap *)objc_opt_new();
      knownClassInfos = self->_knownClassInfos;
      self->_knownClassInfos = v3;

    }
    v5 = (_VMUBlockNode *)malloc_type_calloc(-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize"), 0x10uLL, 0x1000040451B5BE8uLL);
    v6 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __34__VMUObjectGraph_internalizeNodes__block_invoke;
    v28[3] = &unk_1E4E03290;
    v28[4] = self;
    v28[5] = v5;
    -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v28);
    +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:](VMUClassInfoMap, "_destroyRetainedLinearArray:withCount:", self->_classInfos, self->_classInfosCount);
    self->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:](self->_knownClassInfos, "_retainedLinearArrayWithReturnedCount:", &self->_classInfosCount);
    internalizedNodes = self->_internalizedNodes;
    if (internalizedNodes)
      free(internalizedNodes);
    self->_internalizedNodes = v5;
    self->_internalizedCount = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    if (self->_referenceGraphEdgeNamespaceSize)
    {
      v8 = (_VMUObjectGraphEdge *)malloc_type_calloc(-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize"), 4uLL, 0x100004052888210uLL);
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __34__VMUObjectGraph_internalizeNodes__block_invoke_2;
      v14[3] = &unk_1E4E03D80;
      v14[4] = &v24;
      v14[5] = &v20;
      v14[6] = &v16;
      v14[7] = v8;
      v15 = -[VMUDirectedGraph inverted](self, "inverted");
      -[VMUObjectGraph enumerateReferencesWithBlock:](self, "enumerateReferencesWithBlock:", v14);
      referenceTable = self->_referenceTable;
      if (referenceTable)
        free(referenceTable);
      referenceTableLarge = self->_referenceTableLarge;
      if (referenceTableLarge)
        free(referenceTableLarge);
      self->_referenceTable = v8;
      self->_referenceTableLarge = (_VMUObjectGraphEdgeLarge *)v25[3];
      self->_referenceTableLargeCount = *((_DWORD *)v21 + 6);
      self->_referenceTableLargeCapacity = *((_DWORD *)v17 + 6);
      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
    }
    referenceGraph = self->_referenceGraph;
    if (referenceGraph)
    {
      -[VMUObjectGraph _modifyDerivativeGraphCount:](referenceGraph, "_modifyDerivativeGraphCount:", 0xFFFFFFFFLL);
      v12 = self->_referenceGraph;
      self->_referenceGraph = 0;

    }
    nodeProvider = self->_nodeProvider;
    self->_nodeProvider = 0;

    self->_referenceGraphEdgeNamespaceSize = 0;
    self->_referenceGraphNodeNamespaceSize = 0;
  }
}

uint64_t __34__VMUObjectGraph_internalizeNodes__block_invoke(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v3 = (_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * a2);
  v5 = *a3;
  v4 = a3[1];
  v6 = (v4 >> 60) & 7;
  v7 = v4 & 0xFFFFFFFFFFFFFFFLL;
  if (v7 >= 0xFFFFFFFFFLL)
    v7 = 0xFFFFFFFFFLL;
  v8 = v6 | (32 * v7);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "indexForClassInfo:", a3[2]);
  *v3 = v5;
  v3[1] = v8 | (result << 41);
  return result;
}

_QWORD *__34__VMUObjectGraph_internalizeNodes__block_invoke_2(_QWORD *result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t *v19;

  v6 = *(_QWORD *)(result[4] + 8);
  v7 = *(_QWORD *)(result[5] + 8);
  v8 = result[7];
  v9 = *(_QWORD *)(result[6] + 8);
  v10 = *(_DWORD *)(a5 + 16);
  if (*((_BYTE *)result + 64))
    v11 = *(_QWORD *)(a5 + 8);
  else
    v11 = *(_QWORD *)(a5 + 24);
  if (*((_BYTE *)result + 64))
    v12 = *(_QWORD *)(a5 + 24);
  else
    v12 = *(_QWORD *)(a5 + 8);
  if ((v12 & 3) != 0)
  {
LABEL_12:
    v16 = *(_DWORD *)(v7 + 24);
    v17 = *(_DWORD *)(v9 + 24);
    result = *(_QWORD **)(v6 + 24);
    if (v16 >= v17)
    {
      v18 = 2 * v17;
      if (2 * v17 <= 0x100)
        v18 = 256;
      *(_DWORD *)(v9 + 24) = v18;
      result = malloc_type_realloc(result, 16 * v18, 0x1000040451B5BE8uLL);
      *(_QWORD *)(v6 + 24) = result;
      v16 = *(_DWORD *)(v7 + 24);
    }
    v19 = &result[2 * v16];
    *v19 = v12 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v10 << 56);
    v19[1] = v11 & 0xFFFFFFFFFFFFFFLL;
    *(_DWORD *)(v8 + 4 * a2) = (*(_DWORD *)(v7 + 24))++ | 0x80000000;
  }
  else
  {
    v13 = 0;
    v14 = -67108864 * (*(_DWORD *)(a5 + 16) & 0x1F);
    while (1)
    {
      v15 = offset_settings[v13];
      if (v12 < 1 << (26 - v15) && v11 < 1 << v15)
        break;
      ++v13;
      v14 -= 0x1000000;
      if (v13 == 4)
        goto LABEL_12;
    }
    *(_DWORD *)(v8 + 4 * a2) = ((((_DWORD)v12 << (v15 - 2)) | v11) & 0xFFFFFF) - v14;
  }
  return result;
}

- (BOOL)_commonHighAddressBit
{
  VMUObjectGraph *v2;
  uint64_t internalizedCount;
  _DWORD *v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  _VMUBlockNode *internalizedNodes;

  v2 = self;
  internalizedCount = self->_internalizedCount;
  LOBYTE(self) = 1;
  if ((_DWORD)internalizedCount)
  {
    v4 = (_DWORD *)v2->_internalizedNodes + 2;
    v5 = -1;
    v6 = internalizedCount;
    do
    {
      v7 = *v4 & 7;
      v8 = v7 > 4;
      v9 = (1 << v7) & 0x19;
      v10 = v8 || v9 == 0;
      if (v10 && v5 >= *((_QWORD *)v4 - 1))
        v5 = *((_QWORD *)v4 - 1);
      v4 += 4;
      --v6;
    }
    while (v6);
    if ((v5 & 0x8000000000000000) != 0)
    {
      internalizedNodes = v2->_internalizedNodes;
      do
      {
        internalizedNodes->var0 &= ~0x8000000000000000;
        ++internalizedNodes;
        --internalizedCount;
      }
      while (internalizedCount);
      LOBYTE(self) = 1;
    }
    else
    {
      return v5 >> 63;
    }
  }
  return (char)self;
}

- (void)setClassInfoIndex:(unsigned int)a3 forNode:(unsigned int)a4
{
  _VMUBlockNode *v4;

  v4 = &self->_internalizedNodes[a4];
  *((_QWORD *)v4 + 1) = *((_QWORD *)v4 + 1) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 sourceOffset:(unint64_t)a4 withScanType:(unsigned int)a5 toNode:(unsigned int)a6 destinationOffset:(unint64_t)a7
{
  unsigned __int8 v8;
  unsigned int v11;
  unsigned int v12;
  unsigned int referenceGraphEdgeNamespaceSize;
  uint64_t referenceTableCapacity;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _VMUObjectGraphEdge *v18;
  unsigned int v19;
  _VMUObjectGraphEdge *referenceTable;
  _BOOL4 v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unsigned int referenceTableLargeCount;
  unsigned int referenceTableLargeCapacity;
  _VMUObjectGraphEdgeLarge *referenceTableLarge;
  unsigned int v29;
  unint64_t *v30;
  unsigned __int8 v32;
  objc_super v33;

  v8 = a5;
  v33.receiver = self;
  v33.super_class = (Class)VMUObjectGraph;
  v11 = -[VMUDirectedGraph addEdgeFromNode:toNode:](&v33, sel_addEdgeFromNode_toNode_, *(_QWORD *)&a3, *(_QWORD *)&a6);
  v12 = v11;
  if (v11 != -1)
  {
    referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    referenceTableCapacity = self->_referenceTableCapacity;
    v32 = v8;
    if (v11 >= referenceTableCapacity)
    {
      LODWORD(v15) = 2 * referenceTableCapacity;
      if ((2 * referenceTableCapacity) <= 0x100)
        v15 = 256;
      else
        v15 = v15;
      v16 = referenceTableCapacity + 0x80000;
      if (v16 >= v15)
        v17 = v15;
      else
        v17 = v16;
      v18 = (_VMUObjectGraphEdge *)malloc_type_realloc(self->_referenceTable, 4 * v17, 0x100004052888210uLL);
      self->_referenceTable = v18;
      bzero(&v18[self->_referenceTableCapacity], 4 * (v17 - self->_referenceTableCapacity));
      self->_referenceTableCapacity = v17;
    }
    v19 = v12 - referenceGraphEdgeNamespaceSize;
    referenceTable = self->_referenceTable;
    v21 = -[VMUDirectedGraph inverted](self, "inverted");
    if (v21)
      v22 = a4;
    else
      v22 = a7;
    if (!v21)
      a7 = a4;
    if ((a7 & 3) != 0)
    {
LABEL_20:
      referenceTableLargeCount = self->_referenceTableLargeCount;
      referenceTableLargeCapacity = self->_referenceTableLargeCapacity;
      referenceTableLarge = self->_referenceTableLarge;
      if (referenceTableLargeCount >= referenceTableLargeCapacity)
      {
        v29 = 2 * referenceTableLargeCapacity;
        if (2 * referenceTableLargeCapacity <= 0x100)
          v29 = 256;
        self->_referenceTableLargeCapacity = v29;
        referenceTableLarge = (_VMUObjectGraphEdgeLarge *)malloc_type_realloc(referenceTableLarge, 16 * v29, 0x1000040451B5BE8uLL);
        self->_referenceTableLarge = referenceTableLarge;
        referenceTableLargeCount = self->_referenceTableLargeCount;
      }
      v30 = (unint64_t *)((char *)referenceTableLarge + 16 * referenceTableLargeCount);
      *v30 = a7 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v32 << 56);
      v30[1] = v22 & 0xFFFFFFFFFFFFFFLL;
      referenceTable[v19].var0.var0 = ($8D6A3E73ED2192107EDB56A8580BF2AB)(self->_referenceTableLargeCount++ | 0x80000000);
    }
    else
    {
      v23 = 0;
      v24 = -67108864 * (v32 & 0x1F);
      while (1)
      {
        v25 = offset_settings[v23];
        if (a7 < 1 << (26 - v25) && v22 < 1 << v25)
          break;
        ++v23;
        v24 -= 0x1000000;
        if (v23 == 4)
          goto LABEL_20;
      }
      referenceTable[v19].var0.var0 = ($8D6A3E73ED2192107EDB56A8580BF2AB)(((((_DWORD)a7 << (v25 - 2)) | v22) & 0xFFFFFF)
                                                                        - v24);
    }
  }
  return v12;
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4
{
  return -[VMUObjectGraph addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:](self, "addEdgeFromNode:sourceOffset:withScanType:toNode:destinationOffset:", *(_QWORD *)&a3, 0, 0, *(_QWORD *)&a4, 0);
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v8;
  _VMUBlockNode *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int v16;
  _VMUBlockNode *internalizedNodes;
  _VMUObjectGraphEdge *v18;
  unsigned int v19;
  uint64_t i;
  uint64_t v21;
  _VMUObjectGraphEdge *referenceTable;
  objc_super v23;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  if (a3)
  {
    v11 = (_VMUBlockNode *)malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
    v12 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    if (v12)
    {
      v13 = 0;
      v14 = a3;
      do
      {
        v16 = *v14++;
        v15 = v16;
        if (v16 != -1)
          v11[v15] = self->_internalizedNodes[v13];
        ++v13;
      }
      while (v12 != v13);
    }
    internalizedNodes = self->_internalizedNodes;
    if (internalizedNodes)
      free(internalizedNodes);
    self->_internalizedNodes = v11;
  }
  if (a5)
  {
    self->_referenceTableCapacity = v6;
    v18 = (_VMUObjectGraphEdge *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
    v19 = -[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
    if (v19)
    {
      for (i = 0; i != v19; ++i)
      {
        v21 = a5[i];
        if ((_DWORD)v21 != -1)
          v18[v21] = self->_referenceTable[i];
      }
    }
    referenceTable = self->_referenceTable;
    if (referenceTable)
      free(referenceTable);
    self->_referenceTable = v18;
  }
  v23.receiver = self;
  v23.super_class = (Class)VMUObjectGraph;
  -[VMUDirectedGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:](&v23, sel__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace_, a3, v8, a5, v6);
}

- (unsigned)scanTypeOfReferenceWithName:(unsigned int)a3
{
  $8D6A3E73ED2192107EDB56A8580BF2AB var0;

  var0 = self->_referenceTable[a3].var0.var0;
  if ((*(_DWORD *)&var0 & 0x80000000) != 0)
    return *((unsigned __int8 *)self->_referenceTableLarge + 16 * (*(unsigned int *)&var0 & 0x7FFFFFFF) + 7);
  else
    return *(unsigned int *)&var0 >> 26;
}

- (unsigned)nodeForAddress:(unint64_t)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v9;
  uint64_t v10;

  v5 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") + 1;
  do
  {
    -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v5 - 2);
    --v5;
  }
  while (!v10);
  if (!v5)
    return -1;
  v6 = 0;
  while (1)
  {
    v7 = v6 + (v5 >> 1);
    -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
    if (v9 == a3)
      break;
    if (v9 > a3)
    {
      v5 >>= 1;
    }
    else
    {
      v6 = v7 + 1;
      v5 += ~(v5 >> 1);
    }
    if (!v5)
      return -1;
  }
  return v7;
}

- (unsigned)enumerateObjectsWithBlock:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__VMUObjectGraph_enumerateObjectsWithBlock___block_invoke;
    v9[3] = &unk_1E4E03DA8;
    v9[4] = self;
    v10 = v4;
    v8.receiver = self;
    v8.super_class = (Class)VMUObjectGraph;
    v6 = -[VMUDirectedGraph enumerateNodesWithBlock:](&v8, sel_enumerateNodesWithBlock_, v9);

  }
  else
  {
    v6 = -[VMUDirectedGraph nodeCount](self, "nodeCount");
  }

  return v6;
}

uint64_t __44__VMUObjectGraph_enumerateObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  unsigned int v13;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_DWORD *)(v5 + 184);
  v8 = *(_QWORD *)(v5 + 128);
  v9 = *(_DWORD *)(v5 + 136);
  v10 = *(_QWORD *)(v5 + 144);
  v11 = *(id *)(v5 + 168);
  v12 = v11;
  v13 = a2 - v7;
  if (a2 >= v7 || v11 == 0)
  {
    if (v13 >= v9)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
    }
    else
    {
      v15 = (uint64_t *)(v8 + 16 * v13);
      v17 = *v15;
      v16 = v15[1];
      v20 = v17;
      v21 = ((v16 >> 5) | (v16 << 60)) & 0x7000000FFFFFFFFFLL;
      if ((v16 & 7) == 1)
        v18 = *(_QWORD *)(v10 + ((v16 >> 38) & 0x3FFFFF8));
      else
        v18 = 0;
      v22 = v18;
    }
  }
  else
  {
    (*((void (**)(uint64_t *__return_ptr, id, uint64_t))v11 + 2))(&v20, v11, a2);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t))(v6 + 16))(v6, a2, &v20, a3);
}

- (unsigned)enumerateObjectsOfGroupNode:(unsigned int)a3 withBlock:(id)a4
{
  id *v4;
  uint64_t v5;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  unsigned int v12;
  objc_super v14;
  _QWORD v15[5];
  id v16;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__VMUObjectGraph_enumerateObjectsOfGroupNode_withBlock___block_invoke;
    v15[3] = &unk_1E4E03DA8;
    v9 = v15;
    v4 = &v16;
    v10 = v7;
    v15[4] = self;
    v16 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = (void *)MEMORY[0x1A85A995C](v9);
  v14.receiver = self;
  v14.super_class = (Class)VMUObjectGraph;
  v12 = -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:](&v14, sel_enumerateMembersOfGroupNode_withBlock_, v5, v11);

  if (v8)
  return v12;
}

uint64_t __56__VMUObjectGraph_enumerateObjectsOfGroupNode_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];

  v7 = a1 + 32;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(v7 + 8);
  if (v5)
    objc_msgSend(v5, "nodeDetails:", a2);
  else
    memset(v9, 0, sizeof(v9));
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, uint64_t))(v6 + 16))(v6, a2, v9, a3);
}

- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4
{
  id v6;
  unsigned int v7;
  _DWORD *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  id v13;
  unsigned int referenceGraphNodeNamespaceSize;
  _VMUBlockNode *internalizedNodes;
  unsigned int internalizedCount;
  id v17;
  void *v18;
  unsigned int v19;
  _VMUBlockNode *v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  id *classInfos;
  _DWORD *v27;
  unint64_t var0;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  unsigned __int8 v32;

  v6 = a4;
  if (a3)
  {
    v7 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v32 = 0;
    v31.receiver = self;
    v31.super_class = (Class)VMUObjectGraph;
    v8 = -[VMUDirectedGraph deadNodeMap](&v31, sel_deadNodeMap);
    if (v7)
    {
      v9 = 0;
      v10 = 0;
      v27 = v8;
      while (1)
      {
        if (*(_DWORD *)a3 <= v9
          || (v11 = (v9 >> 3) + 4,
              v12 = 1 << (v9 & 7),
              (v12 & *((_BYTE *)a3 + v11)) == 0)
          || v8 && *v8 > v9 && (v12 & *((_BYTE *)v8 + v11)) != 0
          || (++v10, !v6))
        {
          v24 = 0;
          goto LABEL_19;
        }
        v13 = v6;
        referenceGraphNodeNamespaceSize = self->_referenceGraphNodeNamespaceSize;
        internalizedNodes = self->_internalizedNodes;
        internalizedCount = self->_internalizedCount;
        classInfos = self->_classInfos;
        v17 = self->_nodeProvider;
        v18 = v17;
        v19 = v9 - referenceGraphNodeNamespaceSize;
        if (v9 >= referenceGraphNodeNamespaceSize || v17 == 0)
        {
          if (v19 < internalizedCount)
          {
            v21 = &internalizedNodes[v19];
            var0 = v21->var0;
            v22 = *((_QWORD *)v21 + 1);
            v29 = ((v22 >> 5) | (v22 << 60)) & 0x7000000FFFFFFFFFLL;
            v6 = v13;
            if ((v22 & 7) == 1)
              v23 = *(uint64_t *)((char *)classInfos + ((v22 >> 38) & 0x3FFFFF8));
            else
              v23 = 0;
            v30 = v23;
            goto LABEL_26;
          }
          var0 = 0;
          v29 = 0;
          v30 = 0;
        }
        else
        {
          (*((void (**)(unint64_t *__return_ptr, id, uint64_t))v17 + 2))(&var0, v17, v9);
        }
        v6 = v13;
LABEL_26:

        (*((void (**)(id, uint64_t, unint64_t *, unsigned __int8 *))v6 + 2))(v6, v9, &var0, &v32);
        v24 = v32;
        v8 = v27;
LABEL_19:
        v9 = (v9 + 1);
        if (v9 >= v7 || v24)
          goto LABEL_28;
      }
    }
  }
  v10 = 0;
LABEL_28:

  return v10;
}

- (unsigned)enumerateReferencesWithBlock:(id)a3
{
  id v4;
  BOOL v5;
  unsigned int v6;
  void *v7;
  _DWORD *v8;
  unsigned int v9;
  objc_super v11;
  _QWORD v12[5];
  id v13;
  void *v14;
  _DWORD *v15;
  BOOL v16;

  v4 = a3;
  if (v4)
  {
    v5 = -[VMUDirectedGraph inverted](self, "inverted");
    v6 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v7 = malloc_type_malloc(24 * v6, 0x108004098BBCF0FuLL);
    v8 = malloc_type_calloc(1uLL, ((v6 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v8 = v6;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__VMUObjectGraph_enumerateReferencesWithBlock___block_invoke;
    v12[3] = &unk_1E4E03DD0;
    v14 = v7;
    v15 = v8;
    v12[4] = self;
    v13 = v4;
    v16 = v5;
    v11.receiver = self;
    v11.super_class = (Class)VMUObjectGraph;
    v9 = -[VMUDirectedGraph enumerateEdgesWithBlock:](&v11, sel_enumerateEdgesWithBlock_, v12);
    free(v7);
    free(v8);

  }
  else
  {
    v9 = -[VMUDirectedGraph edgeCount](self, "edgeCount");
  }

  return v9;
}

uint64_t __47__VMUObjectGraph_enumerateReferencesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  int *v13;
  int *v14;
  int *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  id v23;
  void *v24;
  unsigned int v25;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  id v38;
  void *v39;
  unsigned int v40;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  __int128 v46;
  _DWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  id v54;
  void *v55;
  unint64_t v56;
  char v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t);
  uint64_t v68;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;

  v10 = *(_QWORD *)(a1 + 48);
  v9 = *(unsigned int **)(a1 + 56);
  v11 = v10 + 24 * a3;
  if (!v9)
  {
    v17 = v10 + 24 * a4;
    goto LABEL_37;
  }
  v12 = &OBJC_IVAR___VMUDebugTimer__signpostID;
  v13 = &OBJC_IVAR___VMUDebugTimer__signpostID;
  v14 = &OBJC_IVAR___VMUDebugTimer__signpostID;
  v15 = &OBJC_IVAR___VMUDebugTimer__signpostID;
  v16 = &OBJC_IVAR___VMUDebugTimer__signpostID;
  if (*v9 > a3 && ((*((unsigned __int8 *)v9 + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0)
  {
    v17 = v10 + 24 * a4;
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_DWORD *)(v18 + 184);
    v20 = *(_QWORD *)(v18 + 128);
    v21 = *(_DWORD *)(v18 + 136);
    v22 = *(_QWORD *)(v18 + 144);
    v23 = *(id *)(v18 + 168);
    v24 = v23;
    v25 = a3 - v19;
    if (a3 >= v19 || v23 == 0)
    {
      if (v25 >= v21)
      {
        v70 = 0uLL;
        *(_QWORD *)&v71 = 0;
      }
      else
      {
        v27 = (_QWORD *)(v20 + 16 * v25);
        *(_QWORD *)&v70 = *v27;
        v28 = v27[1];
        *((_QWORD *)&v70 + 1) = ((v28 >> 5) | (v28 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v28 & 7) == 1)
          v29 = *(_QWORD *)(v22 + ((v28 >> 38) & 0x3FFFFF8));
        else
          v29 = 0;
        *(_QWORD *)&v71 = v29;
      }
    }
    else
    {
      (*((void (**)(__int128 *__return_ptr, id, uint64_t))v23 + 2))(&v70, v23, a3);
    }

    v30 = v70;
    *(_QWORD *)(v11 + 16) = v71;
    *(_OWORD *)v11 = v30;
    v9 = *(unsigned int **)(a1 + 56);
    v31 = *v9;
    if (*v9 <= a3)
    {
      v17 = *(_QWORD *)(a1 + 48) + 24 * a4;
      v16 = &OBJC_IVAR___VMUDebugTimer__signpostID;
      v15 = &OBJC_IVAR___VMUDebugTimer__signpostID;
      v14 = &OBJC_IVAR___VMUDebugTimer__signpostID;
      v13 = &OBJC_IVAR___VMUDebugTimer__signpostID;
      v12 = &OBJC_IVAR___VMUDebugTimer__signpostID;
      goto LABEL_21;
    }
    *((_BYTE *)v9 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
    v9 = *(unsigned int **)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 48) + 24 * a4;
    v16 = &OBJC_IVAR___VMUDebugTimer__signpostID;
    v15 = &OBJC_IVAR___VMUDebugTimer__signpostID;
    v14 = &OBJC_IVAR___VMUDebugTimer__signpostID;
    v13 = &OBJC_IVAR___VMUDebugTimer__signpostID;
    v12 = &OBJC_IVAR___VMUDebugTimer__signpostID;
    if (!v9)
      goto LABEL_37;
  }
  v31 = *v9;
LABEL_21:
  if (v31 > a4 && ((*((unsigned __int8 *)v9 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
    goto LABEL_37;
  v68 = v11;
  v32 = a2;
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(_DWORD *)(v33 + v12[302]);
  v35 = *(_QWORD *)(v33 + v14[304]);
  v36 = *(_DWORD *)(v33 + v15[305]);
  v37 = *(_QWORD *)(v33 + v16[309]);
  v38 = *(id *)(v33 + v13[301]);
  v39 = v38;
  v40 = a4 - v34;
  if (a4 < v34 && v38 != 0)
  {
    (*((void (**)(__int128 *__return_ptr, id, uint64_t))v38 + 2))(&v70, v38, a4);
LABEL_32:
    a2 = v32;
    v11 = v68;
    goto LABEL_35;
  }
  if (v40 >= v36)
  {
    v70 = 0uLL;
    *(_QWORD *)&v71 = 0;
    goto LABEL_32;
  }
  v42 = v37;
  v43 = (_QWORD *)(v35 + 16 * v40);
  *(_QWORD *)&v70 = *v43;
  v44 = v43[1];
  *((_QWORD *)&v70 + 1) = ((v44 >> 5) | (v44 << 60)) & 0x7000000FFFFFFFFFLL;
  a2 = v32;
  v11 = v68;
  if ((v44 & 7) == 1)
    v45 = *(_QWORD *)(v42 + ((v44 >> 38) & 0x3FFFFF8));
  else
    v45 = 0;
  *(_QWORD *)&v71 = v45;
LABEL_35:

  v46 = v70;
  *(_QWORD *)(v17 + 16) = v71;
  *(_OWORD *)v17 = v46;
  v47 = *(_DWORD **)(a1 + 56);
  if (*v47 > a4)
    *((_BYTE *)v47 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
LABEL_37:
  *(_QWORD *)&v73 = v11;
  v48 = *(_QWORD *)(a1 + 32);
  v49 = *(_QWORD *)(a1 + 40);
  v50 = *(_DWORD *)(v48 + 188);
  v51 = *(_QWORD *)(v48 + 96);
  v52 = *(_QWORD *)(v48 + 112);
  v53 = *(unsigned __int8 *)(a1 + 64);
  v54 = *(id *)(v48 + 176);
  v55 = v54;
  if (a2 >= v50)
  {
    v56 = *(unsigned int *)(v51 + 4 * (a2 - v50));
    if ((v56 & 0x80000000) != 0)
    {
      v64 = (unint64_t *)(v52 + 16 * (v56 & 0x7FFFFFFF));
      v62 = *v64;
      v63 = v64[1];
      if (v53)
        v65 = v63;
      else
        v65 = v62;
      if (v53)
        v63 = v62;
      *((_QWORD *)&v73 + 1) = v65 & 0xFFFFFFFFFFFFFFLL;
      LODWORD(v74) = HIBYTE(v62);
      v61 = v63 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      v57 = offset_settings[(v56 >> 24) & 3];
      v58 = 4 * ((v56 & 0xFFFFFF) >> v57);
      v59 = v56 & 0xFFFFFF & ~(-1 << v57);
      if (v53)
        v60 = v59;
      else
        v60 = v58;
      *((_QWORD *)&v73 + 1) = v60;
      LODWORD(v74) = v56 >> 26;
      if (v53)
        v61 = v58;
      else
        v61 = v59;
    }
    *((_QWORD *)&v74 + 1) = v61;
  }
  else if (v54)
  {
    objc_msgSend(v54, "referenceInfoWithName:", a2);
  }
  else
  {
    *((_QWORD *)&v73 + 1) = 0;
    v74 = 0uLL;
  }

  v75 = v17;
  v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t))(v49 + 16);
  v70 = v73;
  v71 = v74;
  v72 = v17;
  return v66(v49, a2, a3, a4, &v70, a5);
}

- (unsigned)enumerateReferencesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  unsigned int v8;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (v6 && -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") > v4)
  {
    v7 = -[VMUDirectedGraph inverted](self, "inverted");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__VMUObjectGraph_enumerateReferencesOfNode_withBlock___block_invoke;
    v11[3] = &unk_1E4E03DF8;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    v10.receiver = self;
    v10.super_class = (Class)VMUObjectGraph;
    v8 = -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:](&v10, sel__internalEnumerateEdgesOfNode_withBlock_, v4, v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __54__VMUObjectGraph_enumerateReferencesOfNode_withBlock___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7)
{
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  id v27;
  void *v28;
  unsigned int v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  id v39;
  void *v40;
  unint64_t v41;
  char v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, _QWORD, _QWORD, _OWORD *, uint64_t);
  _OWORD v58[2];
  uint64_t *v59;
  __int128 v60;
  __int128 v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v66 = 0;
  v67 = 0;
  v68 = 0;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_DWORD *)(v9 + 184);
  v11 = *(_QWORD *)(v9 + 128);
  v12 = *(_DWORD *)(v9 + 136);
  v13 = *(_QWORD *)(v9 + 144);
  v14 = *(id *)(v9 + 168);
  v15 = v14;
  v16 = a3 - v10;
  if (a3 >= v10 || v14 == 0)
  {
    if (v16 < v12)
    {
      v18 = (uint64_t *)(v11 + 16 * v16);
      v66 = *v18;
      v19 = v18[1];
      v67 = ((v19 >> 5) | (v19 << 60)) & 0x7000000FFFFFFFFFLL;
      v20 = a2;
      if ((v19 & 7) == 1)
        v21 = *(_QWORD *)(v13 + ((v19 >> 38) & 0x3FFFFF8));
      else
        v21 = 0;
      v68 = v21;
      goto LABEL_13;
    }
    v66 = 0;
    v67 = 0;
    v68 = 0;
  }
  else
  {
    (*((void (**)(uint64_t *__return_ptr, id, uint64_t))v14 + 2))(&v66, v14, a3);
  }
  v20 = a2;
LABEL_13:

  v63 = 0;
  v64 = 0;
  v65 = 0;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_DWORD *)(v22 + 184);
  v24 = *(_QWORD *)(v22 + 128);
  v25 = *(_DWORD *)(v22 + 136);
  v26 = *(_QWORD *)(v22 + 144);
  v27 = *(id *)(v22 + 168);
  v28 = v27;
  v29 = a4 - v23;
  if (a4 < v23 && v27)
  {
    (*((void (**)(uint64_t *__return_ptr, id))v27 + 2))(&v63, v27);
  }
  else if (v29 >= v25)
  {
    v63 = 0;
    v64 = 0;
    v65 = 0;
  }
  else
  {
    v30 = (uint64_t *)(v24 + 16 * v29);
    v63 = *v30;
    v31 = v30[1];
    v64 = ((v31 >> 5) | (v31 << 60)) & 0x7000000FFFFFFFFFLL;
    if ((v31 & 7) == 1)
      v32 = *(_QWORD *)(v26 + ((v31 >> 38) & 0x3FFFFF8));
    else
      v32 = 0;
    v65 = v32;
  }

  *(_QWORD *)&v60 = &v66;
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(_QWORD *)(a1 + 40);
  v35 = *(_DWORD *)(v33 + 188);
  v36 = *(_QWORD *)(v33 + 96);
  v37 = *(_QWORD *)(v33 + 112);
  v38 = *(unsigned __int8 *)(a1 + 48);
  v39 = *(id *)(v33 + 176);
  v40 = v39;
  if (v20 >= v35)
  {
    v41 = *(unsigned int *)(v36 + 4 * (v20 - v35));
    if ((v41 & 0x80000000) != 0)
    {
      v49 = (unint64_t *)(v37 + 16 * (v41 & 0x7FFFFFFF));
      v47 = *v49;
      v48 = v49[1];
      if (v38)
        v50 = v48;
      else
        v50 = v47;
      if (v38)
        v48 = v47;
      *((_QWORD *)&v60 + 1) = v50 & 0xFFFFFFFFFFFFFFLL;
      LODWORD(v61) = HIBYTE(v47);
      v46 = v48 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      v42 = offset_settings[(v41 >> 24) & 3];
      v43 = 4 * ((v41 & 0xFFFFFF) >> v42);
      v44 = v41 & 0xFFFFFF & ~(-1 << v42);
      if (v38)
        v45 = v44;
      else
        v45 = v43;
      *((_QWORD *)&v60 + 1) = v45;
      LODWORD(v61) = v41 >> 26;
      if (v38)
        v46 = v43;
      else
        v46 = v44;
    }
    *((_QWORD *)&v61 + 1) = v46;
  }
  else if (v39)
  {
    objc_msgSend(v39, "referenceInfoWithName:", v20);
  }
  else
  {
    *((_QWORD *)&v60 + 1) = 0;
    v61 = 0uLL;
  }

  v62 = &v63;
  v51 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, _OWORD *, uint64_t))(v34 + 16);
  v58[0] = v60;
  v58[1] = v61;
  v59 = &v63;
  return v51(v34, v20, a5, a6, v58, a7);
}

- (unsigned)nodeReferencedFromSourceNode:(unsigned int)a3 byIvarWithName:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -1;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v4);
  objc_msgSend(v15, "firstFieldWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__VMUObjectGraph_nodeReferencedFromSourceNode_byIvarWithName___block_invoke;
  v10[3] = &unk_1E4E03E20;
  v8 = v7;
  v11 = v8;
  v12 = &v16;
  -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](self, "enumerateReferencesOfNode:withBlock:", v4, v10);
  LODWORD(v4) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return v4;
}

uint64_t __62__VMUObjectGraph_nodeReferencedFromSourceNode_byIvarWithName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v10;
  uint64_t result;

  v10 = *(_QWORD *)(a5 + 8);
  result = objc_msgSend(*(id *)(a1 + 32), "offset");
  if (v10 == result && !*(_QWORD *)(a5 + 24))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
    *a6 = 1;
  }
  return result;
}

- (unsigned)enumerateObjectsContainedInCollection:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v22 = -1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke;
  v15[3] = &unk_1E4E03E48;
  v17 = &v19;
  v8 = v6;
  v16 = v8;
  v18 = &v23;
  -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](self, "enumerateReferencesOfNode:withBlock:", v4, v15);
  v9 = *((unsigned int *)v20 + 6);
  if ((_DWORD)v9 != -1)
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke_2;
    v12[3] = &unk_1E4E03E70;
    v13 = v8;
    v14 = &v23;
    -[VMUObjectGraph enumerateReferencesOfNode:withBlock:](self, "enumerateReferencesOfNode:withBlock:", v9, v12);

  }
  v10 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  int v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;

  if (*(_QWORD *)(a5 + 24)
    || (objc_msgSend(*(id *)(*(_QWORD *)(a5 + 32) + 16), "className"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("Storage)")),
        v10,
        !v11))
  {
    v12 = a1[4];
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v12 + 16);
    v14 = *(_OWORD *)(a5 + 16);
    v15[0] = *(_OWORD *)a5;
    v15[1] = v14;
    v16 = *(_QWORD *)(a5 + 32);
    v13(v12, a2, a3, a4, v15);
    ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
  }
}

uint64_t __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v8;
  uint64_t result;
  _OWORD v10[2];
  uint64_t v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v6 + 16);
  v8 = *(_OWORD *)(a5 + 16);
  v10[0] = *(_OWORD *)a5;
  v10[1] = v8;
  v11 = *(_QWORD *)(a5 + 32);
  result = v7(v6, a2, a3, a4, v10);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUObjectGraph *)self
{
  uint64_t v1;
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v5;
  unsigned int referenceGraphNodeNamespaceSize;
  $61A80719B04F7407D3E47539F1B23CAA v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int internalizedCount;
  BOOL v11;
  id nodeProvider;
  _VMUBlockNode *internalizedNodes;
  id *classInfos;
  void (**v15)(id, _QWORD);
  unsigned int v16;
  _VMUBlockNode *v18;
  unint64_t v19;
  unint64_t var0;
  unint64_t v21;
  void (**v22)(id, _QWORD);

  v3 = v1;
  v5 = v2;
  referenceGraphNodeNamespaceSize = self->_referenceGraphNodeNamespaceSize;
  v7.var0 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  if (LODWORD(v7.var0) < v3
    || ((v8 = v3 - referenceGraphNodeNamespaceSize,
         v9 = self->_referenceGraphNodeNamespaceSize,
         internalizedCount = self->_internalizedCount,
         v3 >= v9)
      ? (v11 = v8 >= internalizedCount)
      : (v11 = 0),
        v11))
  {
    *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
  }
  else
  {
    nodeProvider = self->_nodeProvider;
    internalizedNodes = self->_internalizedNodes;
    classInfos = self->_classInfos;
    v15 = (void (**)(id, _QWORD))nodeProvider;
    v16 = v3 - v9;
    if (v3 >= v9 || v15 == 0)
    {
      if (v16 >= internalizedCount)
      {
        *v5 = 0;
        v5[1] = 0;
        v5[2] = 0;
      }
      else
      {
        v18 = &internalizedNodes[v16];
        var0 = v18->var0;
        v19 = *((_QWORD *)v18 + 1);
        *v5 = var0;
        v5[1] = ((v19 >> 5) | (v19 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v19 & 7) == 1)
          v21 = *(unint64_t *)((char *)classInfos + ((v19 >> 38) & 0x3FFFFF8));
        else
          v21 = 0;
        v5[2] = v21;
      }
    }
    else
    {
      v22 = v15;
      v15[2](v15, v3);
      v15 = v22;
    }

  }
  return v7;
}

- ($3576753C8488139535C1C7A74D12E914)referenceInfoWithName:(SEL)a3
{
  uint64_t v4;
  $3576753C8488139535C1C7A74D12E914 *result;
  unsigned int referenceGraphEdgeNamespaceSize;
  VMUObjectGraph *referenceGraph;
  _VMUObjectGraphEdge *referenceTable;
  _VMUObjectGraphEdgeLarge *referenceTableLarge;
  _BOOL4 v12;
  VMUObjectGraph *v13;
  unint64_t var0;
  char v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  VMUObjectGraph *v24;

  v4 = *(_QWORD *)&a4;
  result = ($3576753C8488139535C1C7A74D12E914 *)-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
  if (result < v4)
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var2 = 0;
    return result;
  }
  referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
  referenceGraph = self->_referenceGraph;
  referenceTable = self->_referenceTable;
  referenceTableLarge = self->_referenceTableLarge;
  v12 = -[VMUDirectedGraph inverted](self, "inverted");
  v13 = referenceGraph;
  if (v4 >= referenceGraphEdgeNamespaceSize)
  {
    var0 = referenceTable[v4 - referenceGraphEdgeNamespaceSize].var0.var0;
    if ((var0 & 0x80000000) != 0)
    {
      v20 = (unint64_t *)((char *)referenceTableLarge + 16 * (var0 & 0x7FFFFFFF));
      v22 = *v20;
      v21 = v20[1];
      if (v12)
        v23 = v21;
      else
        v23 = v22;
      if (v12)
        v21 = v22;
      retstr->var0 = v23 & 0xFFFFFFFFFFFFFFLL;
      retstr->var1 = HIBYTE(v22);
      v19 = v21 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      v15 = offset_settings[(var0 >> 24) & 3];
      v16 = 4 * ((var0 & 0xFFFFFF) >> v15);
      v17 = var0 & 0xFFFFFF & ~(-1 << v15);
      if (v12)
        v18 = v17;
      else
        v18 = v16;
      retstr->var0 = v18;
      retstr->var1 = var0 >> 26;
      if (v12)
        v19 = v16;
      else
        v19 = v17;
    }
    retstr->var2 = v19;
  }
  else
  {
    if (v13)
    {
      v24 = v13;
      -[VMUObjectGraph referenceInfoWithName:](v13, "referenceInfoWithName:", v4);

      return result;
    }
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- ($3576753C8488139535C1C7A74D12E914)_rawReferenceInfoWithName:(SEL)a3
{
  uint64_t v4;
  $3576753C8488139535C1C7A74D12E914 *result;
  unsigned int referenceGraphEdgeNamespaceSize;
  VMUObjectGraph *referenceGraph;
  _VMUObjectGraphEdge *referenceTable;
  _VMUObjectGraphEdgeLarge *referenceTableLarge;
  VMUObjectGraph *v12;
  unint64_t var0;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  VMUObjectGraph *v18;

  v4 = *(_QWORD *)&a4;
  result = ($3576753C8488139535C1C7A74D12E914 *)-[VMUDirectedGraph edgeNamespaceSize](self, "edgeNamespaceSize");
  if (result >= v4)
  {
    referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    referenceGraph = self->_referenceGraph;
    referenceTable = self->_referenceTable;
    referenceTableLarge = self->_referenceTableLarge;
    v12 = referenceGraph;
    if (v4 >= referenceGraphEdgeNamespaceSize)
    {
      var0 = referenceTable[v4 - referenceGraphEdgeNamespaceSize].var0.var0;
      if ((var0 & 0x80000000) != 0)
      {
        v17 = (unint64_t *)((char *)referenceTableLarge + 16 * (var0 & 0x7FFFFFFF));
        v15 = *v17;
        v16 = v17[1];
        retstr->var0 = *v17 & 0xFFFFFFFFFFFFFFLL;
        retstr->var1 = HIBYTE(v15);
        retstr->var2 = v16 & 0xFFFFFFFFFFFFFFLL;
      }
      else
      {
        v14 = offset_settings[(var0 >> 24) & 3];
        retstr->var0 = 4 * ((var0 & 0xFFFFFF) >> v14);
        retstr->var1 = var0 >> 26;
        retstr->var2 = var0 & 0xFFFFFF & ~(-1 << v14);
      }
    }
    else if (v12)
    {
      v18 = v12;
      -[VMUObjectGraph referenceInfoWithName:](v12, "referenceInfoWithName:", v4);
      v12 = v18;
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var2 = 0;
    }

  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (void)_modifyDerivativeGraphCount:(int)a3
{
  int *p_referencingCount;
  unsigned int v4;

  p_referencingCount = &self->_referencingCount;
  do
    v4 = __ldaxr((unsigned int *)p_referencingCount);
  while (__stlxr(v4 + a3, (unsigned int *)p_referencingCount));
}

- (void)_refineTypesWithOverlay:(id)a3
{
  id v4;
  unsigned int *p_classInfosCount;
  uint64_t classInfosCount;
  _QWORD *v7;
  void **v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void **v17;
  void *v18;
  id v19;
  objc_super v20;
  _QWORD v21[6];
  objc_super v22;
  _QWORD v23[6];
  _QWORD v24[6];
  int v25;
  int v26;

  v4 = a3;
  if (v4)
  {
    -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
    -[VMUClassInfoMap _applyTypeOverlay:](self->_knownClassInfos, "_applyTypeOverlay:", v4);
    p_classInfosCount = &self->_classInfosCount;
    +[VMUClassInfoMap _destroyRetainedLinearArray:withCount:](VMUClassInfoMap, "_destroyRetainedLinearArray:withCount:", self->_classInfos, self->_classInfosCount);
    self->_classInfos = -[VMUClassInfoMap _retainedLinearArrayWithReturnedCount:](self->_knownClassInfos, "_retainedLinearArrayWithReturnedCount:", &self->_classInfosCount);
    classInfosCount = self->_classInfosCount;
    if ((_DWORD)classInfosCount)
    {
      v19 = v4;
      v7 = malloc_type_malloc(24 * classInfosCount, 0x10100408797764BuLL);
      v8 = (void **)v7;
      if (*p_classInfosCount)
      {
        v9 = 0;
        v10 = v7 + 1;
        do
        {
          v11 = objc_msgSend(self->_classInfos[v9], "instanceSize");
          v12 = objc_msgSend(self->_classInfos[v9], "defaultScanType");
          if ((_DWORD)v11)
            v13 = malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL);
          else
            v13 = 0;
          *((_DWORD *)v10 - 2) = v11;
          *((_DWORD *)v10 - 1) = v12;
          *v10 = v13;
          v10[1] = 0;
          v10 += 3;
          v14 = self->_classInfos[v9];
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke;
          v24[3] = &unk_1E4E03E98;
          v25 = v9;
          v26 = v11;
          v24[4] = self;
          v24[5] = v8;
          objc_msgSend(v14, "enumerateScanningLocationsForSize:withBlock:", v11, v24);
          ++v9;
        }
        while (v9 < *p_classInfosCount);
      }
      v15 = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_2;
      v23[3] = &unk_1E4E03EC0;
      v23[4] = self;
      v23[5] = v8;
      v22.receiver = self;
      v22.super_class = (Class)VMUObjectGraph;
      v23[0] = MEMORY[0x1E0C809B0];
      -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](&v22, sel__internalAccessRawEdgesWithBlock_, v23);
      v21[1] = 3221225472;
      v21[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_3;
      v21[3] = &unk_1E4E03EC0;
      v21[4] = self;
      v21[5] = v8;
      v20.receiver = self;
      v20.super_class = (Class)VMUObjectGraph;
      v21[0] = v15;
      -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](&v20, sel__internalAccessRawEdgesWithBlock_, v21);
      if (*p_classInfosCount)
      {
        v16 = 0;
        v17 = v8 + 2;
        do
        {
          v18 = *(v17 - 1);
          if (v18)
            free(v18);
          if (*v17)
            free(*v17);
          ++v16;
          v17 += 3;
        }
        while (v16 < *p_classInfosCount);
      }
      free(v8);
      v4 = v19;
    }
  }

}

void __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke(uint64_t a1, void *a2, unsigned int a3, char a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 8) + a3) = a4;
  objc_msgSend(a2, "destinationLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = a3;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16))
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16) = malloc_type_calloc(*(unsigned int *)(a1 + 52), 4uLL, 0x100004052888210uLL);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    objc_msgSend(a2, "destinationLayout");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16) + 4 * v8) = objc_msgSend(v9, "indexForClassInfo:", v10);

  }
}

uint64_t __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_2(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (a3)
  {
    v3 = a3;
    v4 = (unsigned int *)(a2 + 8);
    do
    {
      v5 = *(v4 - 2);
      if (v5 <= 0xFFFFFFFA)
      {
        v6 = *(_QWORD **)(result + 32);
        v7 = v6[16];
        v8 = *(_QWORD *)(v7 + 16 * *(v4 - 1) + 8) >> 41;
        if ((*(_QWORD *)(v7 + 16 * *(v4 - 1) + 8) & 7) == 1 && v8 != 0)
        {
          v10 = *(_QWORD *)(result + 40);
          v11 = *(_QWORD *)(v10 + 24 * v8 + 16);
          if (v11)
          {
            v12 = *(unsigned int *)(v6[12] + 4 * v5);
            if ((v12 & 0x80000000) != 0)
              v13 = *(_QWORD *)(v6[14] + 16 * (v12 & 0x7FFFFFFF)) & 0xFFFFFFFFFFFFFFLL;
            else
              v13 = 4 * ((v12 & 0xFFFFFF) >> offset_settings[(v12 >> 24) & 3]);
            if (v13 < *(unsigned int *)(v10 + 24 * v8))
            {
              v14 = *(unsigned int *)(v11 + 4 * v13);
              if ((_DWORD)v14)
              {
                v15 = v7 + 16 * *v4;
                v18 = *(_QWORD *)(v15 + 8);
                v16 = (uint64_t *)(v15 + 8);
                v17 = v18;
                if ((v18 & 0xFFFFFE0000000007) == 1)
                  *v16 = v17 | (v14 << 41);
              }
            }
          }
        }
      }
      v4 += 3;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_3(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  char v17;

  if (a3)
  {
    v3 = a3;
    v4 = (unsigned int *)(a2 + 4);
    do
    {
      v5 = *(v4 - 1);
      if (v5 > 0xFFFFFFFA)
        goto LABEL_9;
      v6 = *(_QWORD **)(result + 32);
      v7 = *(_QWORD *)(v6[16] + 16 * *v4 + 8) >> 41;
      if ((*(_QWORD *)(v6[16] + 16 * *v4 + 8) & 7) != 1 || v7 == 0)
        goto LABEL_9;
      v9 = v6[12];
      v10 = v6[14];
      v11 = *(unsigned int *)(v9 + 4 * v5);
      if ((v11 & 0x80000000) != 0)
      {
        v14 = *(_QWORD *)(v10 + 16 * (v11 & 0x7FFFFFFF));
        v12 = v14 & 0xFFFFFFFFFFFFFFLL;
        v13 = HIBYTE(v14);
      }
      else
      {
        v12 = 4 * ((v11 & 0xFFFFFF) >> offset_settings[(v11 >> 24) & 3]);
        LODWORD(v13) = v11 >> 26;
      }
      if ((_DWORD)v13 != 1)
        goto LABEL_9;
      v15 = *(_QWORD *)(result + 40);
      v16 = (unsigned int *)(v15 + 24 * v7);
      if (v12 >= *v16)
      {
        v17 = *((_BYTE *)v16 + 4);
        if ((v11 & 0x80000000) == 0)
        {
LABEL_19:
          *(_DWORD *)(v9 + 4 * v5) = v11 & 0x83FFFFFF | ((v17 & 0x1F) << 26);
          goto LABEL_9;
        }
      }
      else
      {
        v17 = *(_BYTE *)(*(_QWORD *)(v15 + 24 * v7 + 8) + v12);
        if ((v11 & 0x80000000) == 0)
          goto LABEL_19;
      }
      *(_BYTE *)(v10 + 16 * (v11 & 0x7FFFFFFF) + 7) = v17;
LABEL_9:
      v4 += 3;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)_compareWithGraph:(id)a3 andMarkOnMatch:(BOOL)a4
{
  int v4;
  id v6;
  size_t v7;
  unsigned int *v8;
  size_t v9;
  unsigned int *v10;
  uint64_t v11;
  unint64_t **v12;
  unsigned int v13;
  _DWORD *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  _VMUBlockNode *internalizedNodes;
  unint64_t v19;
  unint64_t var0;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  unint64_t v33;
  _QWORD v35[4];
  unint64_t **v36;
  uint64_t *v37;
  unsigned int *v38;
  _QWORD v39[7];
  uint64_t __pattern4;
  uint64_t *p_pattern4;
  uint64_t v42;
  int v43;

  v4 = a4;
  v6 = a3;
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  objc_msgSend(v6, "internalizeNodes");
  v7 = 4 * -[VMUDirectedGraph nodeCount](self, "nodeCount");
  v8 = (unsigned int *)malloc_type_malloc(v7, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v8, &__pattern4, v7);
  v9 = 4 * objc_msgSend(v6, "nodeCount");
  v10 = (unsigned int *)malloc_type_malloc(v9, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v10, &__pattern4, v9);
  __pattern4 = 0;
  p_pattern4 = &__pattern4;
  v42 = 0x2020000000;
  v43 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke;
  v39[3] = &unk_1E4E03EE8;
  v39[4] = self;
  v39[5] = &__pattern4;
  v39[6] = v8;
  -[VMUDirectedGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v39);
  *((_DWORD *)p_pattern4 + 6) = 0;
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke_2;
  v35[3] = &unk_1E4E03EE8;
  v37 = &__pattern4;
  v12 = (unint64_t **)v6;
  v36 = v12;
  v38 = v10;
  objc_msgSend(v12, "enumerateNodesWithBlock:", v35);
  sortNodesInMap(&self->_internalizedNodes->var0, v8, -[VMUDirectedGraph nodeCount](self, "nodeCount"));
  sortNodesInMap(v12[16], v10, objc_msgSend(v12, "nodeCount"));
  v13 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  v14 = malloc_type_calloc(1uLL, ((v13 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  v15 = 0;
  v16 = 0;
  *v14 = v13;
LABEL_2:
  v17 = v15;
  while (v17 < -[VMUDirectedGraph nodeCount](self, "nodeCount"))
  {
    internalizedNodes = self->_internalizedNodes;
    v19 = v8[v17];
    var0 = internalizedNodes[v19].var0;
    v21 = v12[16][2 * v10[v16]];
    if (var0 <= v21)
    {
      if (var0 < v21)
      {
        if ((v4 & 1) == 0 && *v14 > v19)
          *((_BYTE *)v14 + (v19 >> 3) + 4) |= 1 << (v19 & 7);
        goto LABEL_35;
      }
      if (v19 >= self->_internalizedCount)
      {
        v25 = 0;
        v24 = 0;
        var0 = 0;
      }
      else
      {
        v23 = *((_QWORD *)&internalizedNodes[v19] + 1);
        v24 = ((v23 >> 5) | (v23 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v23 & 7) == 1)
          v25 = *(id *)((char *)self->_classInfos + ((v23 >> 38) & 0x3FFFFF8));
        else
          v25 = 0;
      }
      v26 = v10[v16];
      if (v26 >= *((_DWORD *)v12 + 34))
      {
        v31 = 0;
        v30 = 0;
        v28 = 0;
        if (v25)
          goto LABEL_24;
      }
      else
      {
        v27 = &v12[16][2 * v26];
        v28 = *v27;
        v29 = v27[1];
        v30 = ((v29 >> 5) | (v29 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v29 & 7) == 1)
        {
          v31 = *(unint64_t *)((char *)v12[18] + ((v29 >> 38) & 0x3FFFFF8));
          if (!v25)
            goto LABEL_28;
LABEL_24:
          v32 = objc_msgSend(v25, "isEqual:", v31);
LABEL_25:
          if (v32 != v4)
            goto LABEL_33;
          goto LABEL_31;
        }
        v31 = 0;
        if (v25)
          goto LABEL_24;
      }
LABEL_28:
      if (var0 == v28 && ((v30 ^ v24) & 0xFFFFFFFFFFFFFFFLL) == 0)
      {
        v32 = v24 >> 60 == v30 >> 60;
        goto LABEL_25;
      }
      if ((v4 & 1) != 0)
      {
LABEL_33:
        if (v16 < objc_msgSend(v12, "nodeCount") - 1)
          ++v16;
        goto LABEL_35;
      }
LABEL_31:
      v33 = v8[v17];
      if (*v14 > v33)
        *((_BYTE *)v14 + (v33 >> 3) + 4) |= 1 << (v33 & 7);
      goto LABEL_33;
    }
    if (v16 == objc_msgSend(v12, "nodeCount") - 1)
    {
      if ((v4 & 1) == 0)
      {
        v22 = v8[v17];
        if (*v14 > v22)
          *((_BYTE *)v14 + (v22 >> 3) + 4) |= 1 << (v22 & 7);
      }
LABEL_35:
      v15 = v17 + 1;
      goto LABEL_2;
    }
    ++v16;
  }
  free(v8);
  free(v10);

  _Block_object_dispose(&__pattern4, 8);
  return v14;
}

uint64_t __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke(uint64_t a1, int a2)
{
  unsigned int v4;
  uint64_t result;

  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "nodeCount");
  if (v4 < result)
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = a2;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke_2(uint64_t a1, int a2)
{
  unsigned int v4;
  uint64_t result;

  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "nodeCount");
  if (v4 < result)
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = a2;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)createMapForMinusGraph:(id)a3
{
  return -[VMUObjectGraph _compareWithGraph:andMarkOnMatch:](self, "_compareWithGraph:andMarkOnMatch:", a3, 0);
}

- (void)createMapForIntersectGraph:(id)a3
{
  return -[VMUObjectGraph _compareWithGraph:andMarkOnMatch:](self, "_compareWithGraph:andMarkOnMatch:", a3, 1);
}

- (VMUClassInfoMap)indexedClassInfos
{
  return self->_knownClassInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceGraph, 0);
  objc_storeStrong(&self->_nodeProvider, 0);
  objc_storeStrong((id *)&self->_knownClassInfos, 0);
}

- (void)stronglyConnectedComponentSearch:(unsigned int)a3 withRecorder:(id)a4
{
  uint64_t v4;
  id v7;
  size_t v8;
  void *v9;
  size_t v10;
  void *v11;
  size_t v12;
  void *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  const char *Name;
  _QWORD v20[7];
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  int v30;
  _QWORD __pattern4[3];
  int v32;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (v7)
  {
    v8 = 4 * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v9 = malloc_type_malloc(v8, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v9, __pattern4, v8);
    v10 = 4 * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v11 = malloc_type_malloc(v10, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v11, __pattern4, v10);
    v12 = 4 * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v13 = malloc_type_malloc(v12, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v13, __pattern4, v12);
    v14 = 4 * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v15 = malloc_type_malloc(v14, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v15, __pattern4, v14);
    __pattern4[0] = 0;
    __pattern4[1] = __pattern4;
    __pattern4[2] = 0x2020000000;
    v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke;
    v21[3] = &unk_1E4E03F10;
    v25 = v13;
    v26 = v9;
    v27 = v11;
    v23 = __pattern4;
    v24 = v29;
    v22 = v7;
    v28 = v15;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke_2;
    v20[3] = &unk_1E4E03F38;
    v20[4] = self;
    v20[5] = v15;
    v20[6] = v11;
    -[VMUDirectedGraph depthFirstSearch:nodeVisitBlock:edgeVisitBlock:](self, "depthFirstSearch:nodeVisitBlock:edgeVisitBlock:", v4, v21, v20);
    free(v9);
    free(v11);
    free(v13);
    free(v15);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(__pattern4, 8);
  }
  else
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    NSLog(CFSTR("-[%@ %s]: %s"), v18, Name, "^block parameter must be non-nil.");

  }
}

uint64_t __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke(_QWORD *a1, unsigned int a2, int a3)
{
  char v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v5 = a2;
  if (a3)
  {
    v6 = a1[9];
    if (*(_DWORD *)(v6 + 4 * a2) == *(_DWORD *)(a1[8] + 4 * a2))
    {
      v7 = a1[7];
      v8 = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) - 1;
      for (i = *(unsigned int *)(v7 + 4 * v8); i != a2; i = *(unsigned int *)(v7 + 4 * v8))
      {
        *(_DWORD *)(v6 + 4 * i) = -1;
        --v8;
      }
      *(_DWORD *)(v6 + 4 * a2) = -1;
      if (a3 == 4)
        (*(void (**)(void))(a1[4] + 16))();
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
    }
    v10 = *(unsigned int *)(a1[10] + 4 * v5);
    if ((_DWORD)v10 != -1)
    {
      v11 = a1[9];
      v12 = *(_DWORD *)(v11 + 4 * v10);
      if (v12 >= *(_DWORD *)(v11 + 4 * v5))
        v12 = *(_DWORD *)(v11 + 4 * v5);
      *(_DWORD *)(v11 + 4 * v10) = v12;
    }
  }
  else
  {
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(unsigned int *)(v13 + 24);
    *(_DWORD *)(v13 + 24) = v14 + 1;
    v15 = a1[8];
    *(_DWORD *)(a1[7] + 4 * v14) = a2;
    v16 = *(_QWORD *)(a1[6] + 8);
    LODWORD(v14) = *(_DWORD *)(v16 + 24);
    *(_DWORD *)(v16 + 24) = v14 + 1;
    *(_DWORD *)(a1[9] + 4 * a2) = v14;
    *(_DWORD *)(v15 + 4 * a2) = v14;
  }
  if (((v3 + 1) & 0xFE) != 0)
    return 2;
  else
    return (v3 + 1);
}

BOOL __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke_2(_QWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, _BYTE *a5)
{
  void *v9;
  _BOOL8 result;
  uint64_t v11;
  unsigned int v12;
  char v13;

  v9 = (void *)a1[4];
  if (v9)
  {
    objc_msgSend(v9, "referenceInfoWithName:", a2);
    LOBYTE(v9) = v13;
  }
  result = VMUIsOwningReference((char)v9);
  if (result)
  {
    if (*a5)
    {
      result = 0;
      *a5 = 4;
      v11 = a1[6];
      v12 = *(_DWORD *)(v11 + 4 * a3);
      if (v12 >= *(_DWORD *)(v11 + 4 * a4))
        v12 = *(_DWORD *)(v11 + 4 * a4);
      *(_DWORD *)(v11 + 4 * a3) = v12;
    }
    else
    {
      *(_DWORD *)(a1[5] + 4 * a4) = a3;
      return 1;
    }
  }
  return result;
}

- (id)subgraphWithShortestPathsFromNode:(unsigned int)a3 toNodes:(void *)a4
{
  return _subgraphWithPaths(self, *(uint64_t *)&a3, (uint64_t)a4, 0);
}

- (id)subgraphWithUniquePathsFromNode:(unsigned int)a3 toNodes:(void *)a4
{
  return _subgraphWithPaths(self, *(uint64_t *)&a3, (uint64_t)a4, 1);
}

- (BOOL)isGroupNode:(unsigned int)a3
{
  return -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:](self, "enumerateMembersOfGroupNode:withBlock:", *(_QWORD *)&a3, &__block_literal_global_21) != 0;
}

void __48__VMUObjectGraph_UsefulAlgorithms__isGroupNode___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 1;
}

- (BOOL)isRootNode:(unsigned int)a3
{
  uint64_t v3;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = *(_QWORD *)&a3;
  if (!-[VMUDirectedGraph inverted](self, "inverted"))
    -[VMUObjectGraph(UsefulAlgorithms) isRootNode:].cold.1();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__VMUObjectGraph_UsefulAlgorithms__isRootNode___block_invoke;
  v7[3] = &unk_1E4E03F80;
  v7[4] = self;
  v7[5] = &v8;
  -[VMUDirectedGraph enumerateEdgesOfNode:withBlock:](self, "enumerateEdgesOfNode:withBlock:", v3, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __47__VMUObjectGraph_UsefulAlgorithms__isRootNode___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = 0;
  v11 = 0;
  v12 = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = objc_msgSend((id)result, "referenceInfoWithName:", a2);
  if (a3 != a4)
  {
    result = VMUIsOwningReference(v11);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a5 = 1;
    }
  }
  return result;
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4D79000, MEMORY[0x1E0C81028], a3, "Memgraph is corrupt due to malloc zone enumeration failure. The malloc heap of the target process was in an inconsistent state such as when being modified.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4();
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4();
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4();
}

- (void)archiveDictionaryRepresentation:options:.cold.1()
{
  __assert_rtn("-[VMUObjectGraph archiveDictionaryRepresentation:options:]", "VMUObjectGraph.m", 313, "(address & (1ull << 63)) == 0");
}

@end
