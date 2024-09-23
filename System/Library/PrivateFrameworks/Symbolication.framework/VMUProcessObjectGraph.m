@implementation VMUProcessObjectGraph

+ (id)createWithTask:(unsigned int)a3
{
  id v3;
  void *v4;

  v3 = -[VMUTaskMemoryScanner initFullyWithTask:]([VMUTaskMemoryScanner alloc], "initFullyWithTask:", *(_QWORD *)&a3);
  objc_msgSend(v3, "processSnapshotGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VMUProcessObjectGraph)initWithPid:(int)a3 nodes:(_VMUBlockNode *)a4 nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v15;
  id v16;
  VMUProcessObjectGraph *v17;
  VMUProcessObjectGraph *v18;
  uint64_t v19;
  NSString *binaryImagesDescription;
  uint64_t v21;
  VMURangeToStringMap *threadNameRanges;
  uint64_t v23;
  VMURangeToStringMap *binarySectionNameRanges;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *pthreadOffsets;
  uint64_t v30;
  VMUSymbolStore *symbolStore;
  size_t v32;
  NSDictionary *v33;
  id v35;
  id v36;
  objc_super v37;
  objc_super v38;
  _QWORD v39[3];
  _QWORD v40[4];
  void *v41;
  _DWORD *v42;
  unsigned int *v43;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v40[3] = *MEMORY[0x1E0C80C00];
  v15 = v5;
  v36 = v9;
  v16 = v8;
  v35 = v41;
  v38.receiver = self;
  v38.super_class = (Class)VMUProcessObjectGraph;
  v17 = -[VMUObjectGraph initWithNodesNoCopy:nodeCount:](&v38, sel_initWithNodesNoCopy_nodeCount_, a4, v11);
  v18 = v17;
  if (v17)
  {
    v37.receiver = v17;
    v37.super_class = (Class)VMUProcessObjectGraph;
    -[VMUObjectGraph setIndexedClassInfos:](&v37, sel_setIndexedClassInfos_, v36);
    *(&v18->super._referencingCount + 1) = a3;
    LODWORD(v18->_scanner) = *MEMORY[0x1E0C85AD8];
    HIDWORD(v18->_scanner) = *MEMORY[0x1E0C85AA8];
    objc_storeStrong((id *)&v18->_regionCount, v10);
    objc_storeStrong((id *)&v18->_machAbsolute, v8);
    LODWORD(v18->_regions) = objc_msgSend(v16, "count");
    v19 = objc_opt_new();
    binaryImagesDescription = v18->_binaryImagesDescription;
    v18->_binaryImagesDescription = (NSString *)v19;

    v21 = objc_opt_new();
    threadNameRanges = v18->_threadNameRanges;
    v18->_threadNameRanges = (VMURangeToStringMap *)v21;

    v23 = objc_opt_new();
    binarySectionNameRanges = v18->_binarySectionNameRanges;
    v18->_binarySectionNameRanges = (VMURangeToStringMap *)v23;

    objc_storeStrong((id *)&v18->_gotObjcClassStructureRanges, v41);
    v39[0] = CFSTR("parentPageOffset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v43[1]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v39[1] = CFSTR("firstEntryOffset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v43[2]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v26;
    v39[2] = CFSTR("childPageOffset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v43[6]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v28 = objc_claimAutoreleasedReturnValue();
    pthreadOffsets = v18->_pthreadOffsets;
    v18->_pthreadOffsets = (NSDictionary *)v28;

    v30 = objc_opt_new();
    symbolStore = v18->_symbolStore;
    v18->_symbolStore = (VMUSymbolStore *)v30;

    LODWORD(v18->_physicalFootprintPeak) = 0;
    if (v42)
    {
      v32 = ((*v42 + 7) >> 3) + 4;
      v33 = (NSDictionary *)malloc_type_malloc(v32, 0x37C10B9BuLL);
      memcpy(v33, v42, v32);
      v18->_autoreleasePoolOffsets = v33;
    }
  }

  return v18;
}

- (void)dealloc
{
  NSDictionary *autoreleasePoolOffsets;
  objc_super v4;

  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (autoreleasePoolOffsets)
  {
    free(autoreleasePoolOffsets);
    self->_autoreleasePoolOffsets = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUProcessObjectGraph;
  -[VMUObjectGraph dealloc](&v4, sel_dealloc);
}

- (VMUProcessObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  char *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned int *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  VMUSimpleDeserializer *v53;
  unsigned int v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  unint64_t v69;
  char *v70;
  VMUVMRegion *v71;
  VMUVMRegion *v72;
  void *v73;
  char *v74;
  unint64_t v75;
  char *v76;
  void *v77;
  void *v78;
  char *v79;
  unint64_t v80;
  char *v81;
  void *v82;
  int v83;
  _DWORD *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  VMUProcessObjectGraph *v88;
  uint64_t v89;
  void *v90;
  char *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  char v128;
  void *v129;
  void *v130;
  char *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v143;
  char *v144;
  void *v145;
  void *v146;
  id v147;
  VMUSimpleDeserializer *v148;
  id v149;
  unint64_t v150;
  objc_super v151;
  _QWORD v152[4];
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD v157[4];
  char *v158;
  id v159;
  _DWORD *v160;
  uint64_t v161;
  objc_super v162;
  _QWORD v163[3];
  _QWORD v164[5];

  v164[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v162.receiver = self;
  v162.super_class = (Class)VMUProcessObjectGraph;
  v14 = -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:](&v162, sel_initWithArchived_version_options_diskLogs_error_, v12, a4, a5, v13, a7);
  if (!v14)
    goto LABEL_91;
  v149 = v13;
  v161 = 0;
  if (a7)
    v15 = a7;
  else
    v15 = (id *)&v161;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("processGraphInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("pid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 49) = objc_msgSend(v17, "intValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("processName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)*((_QWORD *)v14 + 31);
  *((_QWORD *)v14 + 31) = v19;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("processDescriptionString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  v23 = (void *)*((_QWORD *)v14 + 32);
  *((_QWORD *)v14 + 32) = v22;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("isTranslatedByRosetta"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v14[264] = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("binaryImagesDescription"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v25, objc_opt_class(), a5);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)*((_QWORD *)v14 + 35);
  *((_QWORD *)v14 + 35) = v26;

  if (kVMUPrintArchivingTiming)
    fwrite("[Binary Images List] \n\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  v150 = a5;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("showsPhysFootprint"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v14[380] = objc_msgSend(v28, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("didPhysFootprintDirtyAccounting"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v14[381] = objc_msgSend(v29, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vmPageSize"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 52) = objc_msgSend(v30, "unsignedIntValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kernPageSize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 53) = objc_msgSend(v31, "unsignedIntValue");

  if (!*((_DWORD *)v14 + 52))
    *((_DWORD *)v14 + 52) = *((_DWORD *)v14 + 53);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dyldSharedCacheBase"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedLongLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dyldSharedCacheLength"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "unsignedLongLongValue");

  *((_QWORD *)v14 + 57) = v33;
  *((_QWORD *)v14 + 58) = v35;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("zoneNames"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "copy");
  v38 = (void *)*((_QWORD *)v14 + 30);
  *((_QWORD *)v14 + 30) = v37;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regionCount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (unsigned int *)(v14 + 232);
  *((_DWORD *)v14 + 58) = objc_msgSend(v39, "unsignedIntValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("machTime"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v14 + 27) = objc_msgSend(v41, "unsignedLongLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("snapshotDate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "copy");
  v44 = (void *)*((_QWORD *)v14 + 54);
  *((_QWORD *)v14 + 54) = v43;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("physFootprint"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v14 + 45) = objc_msgSend(v45, "unsignedLongLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("physFootprintPeak"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v14 + 46) = objc_msgSend(v46, "unsignedLongLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("pthreadOffsets"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "copy");
  v49 = (void *)*((_QWORD *)v14 + 40);
  *((_QWORD *)v14 + 40) = v48;

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("objectContentLevel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v14 + 96) = objc_msgSend(v50, "unsignedIntValue");

  *((_DWORD *)v14 + 97) = *((_DWORD *)v14 + 96);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("srcAddressToExtraAutoreleaseCountDict"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v51, objc_opt_class(), a5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
LABEL_18:
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VMUVMRegionCurrentVersion"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "integerValue");

    if (v64 <= objc_msgSend((id)objc_opt_class(), "version") && *v40)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regionData"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v65, 0, v150);

      if (kVMUPrintArchivingTiming)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "[VM Regions] Count: %u\n\n", *v40);
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regionDataSerializer"));
      v66 = objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regionDataSerializerCompressed"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v67, objc_opt_class(), v150);
        v66 = objc_claimAutoreleasedReturnValue();

        if (kVMUPrintArchivingTiming)
          fwrite("[VM Region list string content] \n\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      }
      v145 = v52;
      v143 = (void *)v66;
      v148 = -[VMUSimpleDeserializer initWithData:]([VMUSimpleDeserializer alloc], "initWithData:", v66);
      v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *v40);
      if (*v40)
      {
        v69 = 0;
        v70 = v144;
        while (1)
        {
          v71 = -[VMUVMRegion initWithVMRegionData:encodedVersion:simpleSerializer:error:]([VMUVMRegion alloc], "initWithVMRegionData:encodedVersion:simpleSerializer:error:", v70, v64, v148, v15);
          v72 = v71;
          if (*v15)
            break;
          objc_msgSend(v68, "addObject:", v71);

          ++v69;
          v70 += 128;
          if (v69 >= *v40)
            goto LABEL_29;
        }

        v88 = 0;
        goto LABEL_55;
      }
LABEL_29:
      free(v144);
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regionDataExtra"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v73, 0, v150);

      v52 = v145;
      if (v74)
      {
        if (kVMUPrintArchivingTiming)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Region Data Extra] Count: %u\n\n", *v40);
        if (*v40)
        {
          v75 = 0;
          v76 = v74;
          do
          {
            objc_msgSend(v68, "objectAtIndexedSubscript:", v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "setVMRegionDataExtra:", v76);

            ++v75;
            v76 += 16;
          }
          while (v75 < *v40);
        }
        free(v74);
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("exclaveFlagData"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v78, 0, v150);

      if (v79)
      {
        if (kVMUPrintArchivingTiming)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Exclave Flag Data] Count: %u\n\n", *v40);
        if (*v40)
        {
          v80 = 0;
          v81 = v79;
          do
          {
            objc_msgSend(v68, "objectAtIndexedSubscript:", v80);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setVMRegionExclaveFlagsData:", v81);

            ++v80;
            v81 += 4;
          }
          while (v80 < *v40);
        }
        free(v79);
      }
      objc_storeStrong((id *)v14 + 28, v68);
      v83 = objc_msgSend(v14, "nodeNamespaceSize");
      v84 = malloc_type_calloc(1uLL, ((v83 + 7) >> 3) + 4, 0xFF42C4F3uLL);
      *v84 = v83;
      if (v14[380] && !v14[381])
      {
        ownedPhysFootprintAdjustmentForMemgraph(v68, (_DWORD *)v14 + 58, *((_QWORD *)v14 + 57), *((_QWORD *)v14 + 58));
        v89 = objc_claimAutoreleasedReturnValue();
        v14[381] = 1;
        if (v89)
        {
          v90 = (void *)v89;
          v157[0] = MEMORY[0x1E0C809B0];
          v157[1] = 3221225472;
          v157[2] = __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke;
          v157[3] = &unk_1E4E03068;
          v91 = v14;
          v158 = v91;
          v92 = v90;
          v159 = v92;
          v160 = v84;
          objc_msgSend(v91, "reverseEnumerateNodesWithBlock:", v157);
          objc_msgSend(v91, "removeMarkedNodes:", v84);
          v146 = v92;
          objc_msgSend(v68, "removeObject:", v92);

        }
        else
        {
          v146 = 0;
        }
        v86 = v143;
      }
      else
      {
        v85 = objc_msgSend(v14, "nodeNamespaceSize") - 1;
        v154 = 0;
        v155 = 0;
        v156 = 0;
        objc_msgSend(v14, "nodeDetails:", v85);
        v86 = v143;
        if (VMUGraphNodeType_IsVMRegion(0))
        {
          objc_msgSend(v14, "vmuVMRegionForNode:", v85);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v87)
          {
            if (*v84 > v85)
              *((_BYTE *)v84 + (v85 >> 3) + 4) |= 1 << (v85 & 7);
            objc_msgSend(v14, "removeMarkedNodes:", v84);
          }

        }
        v146 = 0;
      }
      free(v84);

    }
    else
    {
      v146 = 0;
      v68 = 0;
      *v40 = 0;
    }
    objc_msgSend(v16, "objectForKey:", CFSTR("autoreleasePoolOffsets"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("autoreleasePoolOffsets"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "copy");
      v96 = (void *)*((_QWORD *)v14 + 41);
      *((_QWORD *)v14 + 41) = v95;
    }
    else
    {
      v163[0] = CFSTR("parentPageOffset");
      v97 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v14, "is64bit"))
        v98 = 32;
      else
        v98 = 24;
      objc_msgSend(v97, "numberWithUnsignedInt:", v98);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v164[0] = v94;
      v163[1] = CFSTR("firstEntryOffset");
      v99 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v14, "is64bit"))
        v100 = 56;
      else
        v100 = 40;
      objc_msgSend(v99, "numberWithUnsignedInt:", v100);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v164[1] = v96;
      v163[2] = CFSTR("childPageOffset");
      v101 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v14, "is64bit"))
        v102 = 40;
      else
        v102 = 28;
      objc_msgSend(v101, "numberWithUnsignedInt:", v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v164[2] = v103;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 3);
      v104 = objc_claimAutoreleasedReturnValue();
      v105 = (void *)*((_QWORD *)v14 + 41);
      *((_QWORD *)v14 + 41) = v104;

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("threadNameRanges"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v106, objc_opt_class(), v150);
    v107 = objc_claimAutoreleasedReturnValue();
    v108 = (void *)*((_QWORD *)v14 + 36);
    *((_QWORD *)v14 + 36) = v107;

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Thread Name Ranges] Count: %u  Uniqued string count: %u\n\n", objc_msgSend(*((id *)v14 + 36), "count"), objc_msgSend(*((id *)v14 + 36), "uniquedStringCount"));
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("binarySectionNameRanges"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v109, objc_opt_class(), v150);
    v110 = objc_claimAutoreleasedReturnValue();
    v111 = (void *)*((_QWORD *)v14 + 37);
    *((_QWORD *)v14 + 37) = v110;

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Binary Section Name Ranges] Count: %u  Uniqued string count: %u\n\n", objc_msgSend(*((id *)v14 + 37), "count"), objc_msgSend(*((id *)v14 + 37), "uniquedStringCount"));
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regionSymbolNameRanges"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v112, objc_opt_class(), v150);
    v113 = objc_claimAutoreleasedReturnValue();
    v114 = (void *)*((_QWORD *)v14 + 38);
    *((_QWORD *)v14 + 38) = v113;

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Region Symbol Name Ranges] Count: %u  Uniqued string count: %u\n\n", objc_msgSend(*((id *)v14 + 38), "count"), objc_msgSend(*((id *)v14 + 38), "uniquedStringCount"));
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("nodeLabels"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v115, objc_opt_class(), v150);
    v116 = objc_claimAutoreleasedReturnValue();
    v117 = (void *)*((_QWORD *)v14 + 53);
    *((_QWORD *)v14 + 53) = v116;

    v118 = (void *)*((_QWORD *)v14 + 53);
    if (v118)
    {
      if (kVMUPrintArchivingTiming)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Node Labels] Count: %u  Uniqued string count: %u\n\n", objc_msgSend(v118, "count"), objc_msgSend(*((id *)v14 + 53), "uniquedStringCount"));
    }
    else if (kVMUPrintArchivingTiming)
    {
      fwrite("[Node Labels] NO NODE LABELS\n\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("userMarked"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v14 + 42) = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v119, 0, v150);

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("symbolStore"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v120, objc_opt_class(), v150);
    v121 = objc_claimAutoreleasedReturnValue();
    v122 = (void *)*((_QWORD *)v14 + 52);
    *((_QWORD *)v14 + 52) = v121;

    if (kVMUPrintArchivingTiming)
      fwrite("[Symbol Store] \n\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    objc_msgSend(*((id *)v14 + 52), "setGraph:", v14);
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("stackLogReader"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClass:options:](VMUDirectedGraph, "_unarchivedObject:ofClass:options:", v123, objc_opt_class(), v150);
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = (void *)*((_QWORD *)v14 + 43);
    *((_QWORD *)v14 + 43) = v124;

    v126 = (void *)*((_QWORD *)v14 + 43);
    if (v126)
    {
      objc_msgSend(v126, "setGraph:", v14);
      objc_msgSend(*((id *)v14 + 43), "setDiskLogs:", v149);
      objc_msgSend(v14, "indexedClassInfos");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v127, "hasClassInfosDerivedFromStackBacktraces");

      if ((v128 & 1) == 0)
      {
        v129 = (void *)*((_QWORD *)v14 + 43);
        objc_msgSend(v14, "indexedClassInfos");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v152[0] = MEMORY[0x1E0C809B0];
        v152[1] = 3221225472;
        v152[2] = __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke_2;
        v152[3] = &unk_1E4E00D90;
        v131 = v14;
        v153 = v131;
        objc_msgSend(v129, "identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:", v131, v130, v152);

        objc_msgSend(v131, "indexedClassInfos");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v151.receiver = v131;
        v151.super_class = (Class)VMUProcessObjectGraph;
        -[VMUObjectGraph setIndexedClassInfos:](&v151, sel_setIndexedClassInfos_, v132);

      }
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("backtraces"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (void *)MEMORY[0x1E0C99E60];
    v135 = objc_opt_class();
    objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUDirectedGraph _unarchivedObject:ofClasses:options:](VMUDirectedGraph, "_unarchivedObject:ofClasses:options:", v133, v136, v150);
    v137 = objc_claimAutoreleasedReturnValue();
    v138 = (void *)*((_QWORD *)v14 + 51);
    *((_QWORD *)v14 + 51) = v137;

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("idleExitStatus"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v14 + 94) = objc_msgSend(v139, "unsignedIntValue");

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ledger"));
    v140 = objc_claimAutoreleasedReturnValue();
    v141 = (void *)*((_QWORD *)v14 + 56);
    *((_QWORD *)v14 + 56) = v140;

    v13 = v149;
LABEL_91:
    v88 = v14;
    goto LABEL_92;
  }
  v53 = -[VMUSimpleDeserializer initWithData:]([VMUSimpleDeserializer alloc], "initWithData:", v52);
  v54 = -[VMUSimpleDeserializer deserialize32WithError:](v53, "deserialize32WithError:", v15);
  if (!*v15)
  {
    v55 = v54;
    v147 = v12;
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[srcAddressToExtraAutoreleaseCountDict] Count: %u\n\n", v54);
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v55);
    if (v55)
    {
      while (1)
      {
        v57 = -[VMUSimpleDeserializer deserialize64WithError:](v53, "deserialize64WithError:", v15);
        if (*v15)
          break;
        v58 = v57;
        v59 = -[VMUSimpleDeserializer deserialize32WithError:](v53, "deserialize32WithError:", v15);
        if (*v15)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v60, v61);

        if (!--v55)
          goto LABEL_17;
      }

      v12 = v147;
      goto LABEL_54;
    }
LABEL_17:
    v62 = (void *)*((_QWORD *)v14 + 49);
    *((_QWORD *)v14 + 49) = v56;

    v12 = v147;
    goto LABEL_18;
  }
LABEL_54:

  v88 = 0;
LABEL_55:
  v13 = v149;
LABEL_92:

  return v88;
}

void __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unsigned int v4;
  void *v6;
  unsigned int *v7;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "vmuVMRegionForNode:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == *(void **)(a1 + 40))
  {
    v7 = *(unsigned int **)(a1 + 48);
    if (*v7 > v4)
      *((_BYTE *)v7 + (v4 >> 3) + 4) |= 1 << (v4 & 7);
    *a3 = 1;
  }

}

id __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VMUProcessObjectGraph;
  return objc_msgSendSuper2(&v4, sel_setClassInfoIndex_forNode_, a3, a2);
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v6;
  VMUGraphStackLogReader *stackLogReader;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  VMUGraphStackLogReader *v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  VMUGraphStackLogReader *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  os_signpost_id_t v20;
  void *v21;
  void *v22;
  NSArray *zoneNames;
  NSString *processName;
  void *v25;
  NSString *executablePath;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  VMUGraphStackLogReader *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  _UNKNOWN **v49;
  os_signpost_id_t v50;
  VMUGraphStackLogReader *v51;
  NSObject *v52;
  uint64_t v53;
  os_signpost_id_t v54;
  void *v55;
  char *v56;
  void *v57;
  unint64_t regions_low;
  unint64_t v59;
  char *v60;
  void *v61;
  void *v62;
  char *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  void *v68;
  void *v69;
  unsigned __int8 *v70;
  int v71;
  char *v72;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  char *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  VMUGraphStackLogReader *v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  os_signpost_id_t v86;
  VMUGraphStackLogReader *v87;
  NSObject *v88;
  uint64_t v89;
  os_signpost_id_t v90;
  void *v91;
  void *v92;
  void *v93;
  VMUGraphStackLogReader *v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  os_signpost_id_t v98;
  VMUGraphStackLogReader *v99;
  uint64_t v100;
  NSObject *v101;
  uint64_t v102;
  os_signpost_id_t v103;
  VMUGraphStackLogReader *v104;
  NSObject *v105;
  uint64_t v106;
  os_signpost_id_t v107;
  void *v108;
  VMUGraphStackLogReader *v109;
  uint64_t v110;
  NSObject *v111;
  uint64_t v112;
  os_signpost_id_t v113;
  VMUGraphStackLogReader *v114;
  uint64_t v115;
  NSObject *v116;
  uint64_t v117;
  os_signpost_id_t v118;
  VMUGraphStackLogReader *v119;
  NSObject *v120;
  uint64_t v121;
  os_signpost_id_t v122;
  void *v123;
  VMUGraphStackLogReader *v124;
  uint64_t v125;
  NSObject *v126;
  uint64_t v127;
  os_signpost_id_t v128;
  void *userMarked;
  void *v130;
  uint64_t v131;
  void *v132;
  NSArray *backtraces;
  void *v134;
  void *v135;
  VMUGraphStackLogReader *v136;
  uint64_t v137;
  NSObject *v138;
  uint64_t v139;
  os_signpost_id_t v140;
  id v141;
  id v142;
  void *v143;
  unint64_t v144;
  _QWORD v145[4];
  id v146;
  objc_super v147;
  uint8_t buf[16];

  v6 = a3;
  stackLogReader = self->_stackLogReader;
  if (stackLogReader)
  {
    v8 = -[VMUGraphStackLogReader signpostID](stackLogReader, "signpostID");
    stackLogReader = self->_stackLogReader;
    if (v8)
    {
      -[VMUGraphStackLogReader logHandle](stackLogReader, "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v9, OS_SIGNPOST_INTERVAL_END, v11, "VMUProcessObjectGraph", ", buf, 2u);
        }
      }

      stackLogReader = self->_stackLogReader;
    }
  }
  -[VMUGraphStackLogReader endEvent:](stackLogReader, "endEvent:", "VMUProcessObjectGraph");
  -[VMUGraphStackLogReader startWithCategory:message:](self->_stackLogReader, "startWithCategory:message:", "VMUProcessObjectGraph", "archiving VMUObjectGraph and VMUDirectedGraph");
  v12 = self->_stackLogReader;
  if (v12)
  {
    -[VMUGraphStackLogReader logHandle](v12, "logHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUProcessObjectGraph", "archiving VMUObjectGraph and VMUDirectedGraph", buf, 2u);
      }
    }

  }
  v147.receiver = self;
  v147.super_class = (Class)VMUProcessObjectGraph;
  -[VMUObjectGraph archiveDictionaryRepresentation:options:](&v147, sel_archiveDictionaryRepresentation_options_, v6, a4);
  v16 = self->_stackLogReader;
  if (v16)
  {
    v17 = -[VMUGraphStackLogReader signpostID](v16, "signpostID");
    v16 = self->_stackLogReader;
    if (v17)
    {
      -[VMUGraphStackLogReader logHandle](v16, "logHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v18, OS_SIGNPOST_INTERVAL_END, v20, "VMUProcessObjectGraph", ", buf, 2u);
        }
      }

      v16 = self->_stackLogReader;
    }
  }
  -[VMUGraphStackLogReader endEvent:](v16, "endEvent:", "VMUProcessObjectGraph");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)&self->super._referencingCount + 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("pid"));

  zoneNames = self->_zoneNames;
  if (zoneNames)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", zoneNames, CFSTR("processName"));
  processName = self->_processName;
  if (processName)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", processName, CFSTR("processDescriptionString"));
  if (LOBYTE(self->_processDescriptionString))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("isTranslatedByRosetta"));

  }
  executablePath = self->_executablePath;
  if (executablePath)
  {
    +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", executablePath, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("binaryImagesDescription"));

    if (kVMUPrintArchivingTiming)
      fwrite("[Binary Images List] \n\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE4(self->_physicalFootprintPeak));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, CFSTR("showsPhysFootprint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE5(self->_physicalFootprintPeak));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("didPhysFootprintDirtyAccounting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(self->_scanner));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, CFSTR("vmPageSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(self->_scanner));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, CFSTR("kernPageSize"));

  v32 = *(_QWORD *)&self->_regionCount;
  if (v32)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v32, CFSTR("zoneNames"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(self->_regions));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, CFSTR("regionCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&self->_vmPageSize);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("machTime"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_nodeLabels, CFSTR("snapshotDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_debugTimer);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v35, CFSTR("physFootprint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_physicalFootprint);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v36, CFSTR("physFootprintPeak"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", *(_QWORD *)&self->_gotObjcClassStructureRanges, CFSTR("pthreadOffsets"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_pthreadOffsets, CFSTR("autoreleasePoolOffsets"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_idleExitStatus);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v37, CFSTR("objectContentLevel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_ledger);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v38, CFSTR("dyldSharedCacheBase"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_dyldSharedCacheRange.location);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v39, CFSTR("dyldSharedCacheLength"));

  v144 = a4;
  if (objc_msgSend(*(id *)&self->_objectContentLevel, "count"))
  {
    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "serialize32:", objc_msgSend(*(id *)&self->_objectContentLevel, "count"));
    v41 = *(void **)&self->_objectContentLevel;
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = __65__VMUProcessObjectGraph_archiveDictionaryRepresentation_options___block_invoke;
    v145[3] = &unk_1E4E03090;
    v42 = v40;
    v146 = v42;
    objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v145);
    v43 = (void *)objc_msgSend(v42, "copyContiguousData");
    +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", v43, a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v44, CFSTR("srcAddressToExtraAutoreleaseCountDict"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[srcAddressToExtraAutoreleaseCountDict] Count: %lu\n\n", objc_msgSend(*(id *)&self->_objectContentLevel, "count"));

    a4 = v144;
  }
  v45 = self->_stackLogReader;
  if (v45 && (v46 = -[VMUGraphStackLogReader signpostID](v45, "signpostID"), v45 = self->_stackLogReader, v46))
  {
    -[VMUGraphStackLogReader logHandle](v45, "logHandle");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    v49 = &off_1E4DFF000;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v50 = v48;
      if (os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v47, OS_SIGNPOST_INTERVAL_END, v50, "VMUProcessObjectGraph", ", buf, 2u);
      }
    }

    v45 = self->_stackLogReader;
  }
  else
  {
    v49 = &off_1E4DFF000;
  }
  -[VMUGraphStackLogReader endEvent:](v45, "endEvent:", "VMUProcessObjectGraph");
  -[VMUGraphStackLogReader startWithCategory:message:](self->_stackLogReader, "startWithCategory:message:", "VMUProcessObjectGraph", "archiving region data");
  v51 = self->_stackLogReader;
  if (v51)
  {
    -[VMUGraphStackLogReader logHandle](v51, "logHandle");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v54 = v53;
      if (os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v54, "VMUProcessObjectGraph", "archiving region data", buf, 2u);
      }
    }

  }
  if (LODWORD(self->_regions))
  {
    v55 = (void *)objc_opt_new();
    v56 = (char *)malloc_type_malloc((unint64_t)LODWORD(self->_regions) << 7, 0x10000403777A4EEuLL);
    v57 = v56;
    LODWORD(regions_low) = self->_regions;
    if ((_DWORD)regions_low)
    {
      v59 = 0;
      v60 = v56;
      do
      {
        objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "getVMRegionData:withSimpleSerializer:", v60, v55);

        ++v59;
        regions_low = LODWORD(self->_regions);
        v60 += 128;
      }
      while (v59 < regions_low);
      a4 = v144;
      v49 = &off_1E4DFF000;
    }
    objc_msgSend(v49[159], "_archivedBytes:length:options:", v57, (unint64_t)regions_low << 7, a4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v62, CFSTR("regionData"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[VM Regions] Count: %u\n\n", LODWORD(self->_regions));
    v143 = v57;
    v63 = (char *)malloc_type_malloc(16 * LODWORD(self->_regions), 0x1000040451B5BE8uLL);
    v64 = v63;
    LODWORD(v65) = self->_regions;
    if ((_DWORD)v65)
    {
      v141 = v6;
      v66 = 0;
      v67 = v63;
      do
      {
        objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "getVMRegionDataExtra:", v67);

        ++v66;
        v65 = LODWORD(self->_regions);
        v67 += 16;
      }
      while (v66 < v65);
      v6 = v141;
      v49 = &off_1E4DFF000;
    }
    objc_msgSend(v49[159], "_archivedBytes:length:options:", v64, 16 * v65, v144);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v69, CFSTR("regionDataExtra"));

    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Region Data Extra] Count: %u\n\n", LODWORD(self->_regions));
    if (LODWORD(self->_regions))
    {
      objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", 0);
      v70 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v71 = v70[232];

      if (v71)
      {
        v72 = (char *)malloc_type_malloc(4 * LODWORD(self->_regions), 0x100004052888210uLL);
        v73 = v72;
        LODWORD(v74) = self->_regions;
        if ((_DWORD)v74)
        {
          v142 = v6;
          v75 = 0;
          v76 = v72;
          do
          {
            objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "getVMRegionExclaveFlagsData:", v76);

            ++v75;
            v74 = LODWORD(self->_regions);
            v76 += 4;
          }
          while (v75 < v74);
          v6 = v142;
        }
        +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", v73, 4 * v74, v144);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v78, CFSTR("exclaveFlagData"));

        free(v73);
        if (kVMUPrintArchivingTiming)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Exclave Flag Data] Count: %u\n\n", LODWORD(self->_regions));
      }
    }
    v79 = (void *)objc_msgSend(v55, "copyContiguousData");
    +[VMUDirectedGraph _archivedObject:options:](VMUDirectedGraph, "_archivedObject:options:", v79, v144);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v80, CFSTR("regionDataSerializerCompressed"));

    if (kVMUPrintArchivingTiming)
      fwrite("[VM Region list string content] \n\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "version"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v81, CFSTR("VMUVMRegionCurrentVersion"));

    free(v143);
    free(v64);

    a4 = v144;
    v49 = &off_1E4DFF000;
  }
  v82 = self->_stackLogReader;
  if (v82)
  {
    v83 = -[VMUGraphStackLogReader signpostID](v82, "signpostID");
    v82 = self->_stackLogReader;
    if (v83)
    {
      -[VMUGraphStackLogReader logHandle](v82, "logHandle");
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v85 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v86 = v85;
        if (os_signpost_enabled(v84))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v84, OS_SIGNPOST_INTERVAL_END, v86, "VMUProcessObjectGraph", ", buf, 2u);
        }
      }

      v82 = self->_stackLogReader;
    }
  }
  -[VMUGraphStackLogReader endEvent:](v82, "endEvent:", "VMUProcessObjectGraph");
  -[VMUGraphStackLogReader startWithCategory:message:](self->_stackLogReader, "startWithCategory:message:", "VMUProcessObjectGraph", "archiving thread / binary / regionSymbol to range mappings");
  v87 = self->_stackLogReader;
  if (v87)
  {
    -[VMUGraphStackLogReader logHandle](v87, "logHandle");
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
    if ((unint64_t)(v89 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v90 = v89;
      if (os_signpost_enabled(v88))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v88, OS_SIGNPOST_INTERVAL_BEGIN, v90, "VMUProcessObjectGraph", "archiving thread / binary / regionSymbol to range mappings", buf, 2u);
      }
    }

  }
  objc_msgSend(v49[159], "_archivedObject:options:", self->_binaryImagesDescription, a4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v91, CFSTR("threadNameRanges"));

  if (kVMUPrintArchivingTiming)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Thread Name Ranges] Count: %u  Uniqued string count: %u\n\n", -[NSString count](self->_binaryImagesDescription, "count"), -[NSString uniquedStringCount](self->_binaryImagesDescription, "uniquedStringCount"));
  objc_msgSend(v49[159], "_archivedObject:options:", self->_threadNameRanges, a4);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v92, CFSTR("binarySectionNameRanges"));

  if (kVMUPrintArchivingTiming)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Binary Section Name Ranges] Count: %u  Uniqued string count: %u\n\n", -[VMURangeToStringMap count](self->_threadNameRanges, "count"), -[VMURangeToStringMap uniquedStringCount](self->_threadNameRanges, "uniquedStringCount"));
  objc_msgSend(v49[159], "_archivedObject:options:", self->_binarySectionNameRanges, a4);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v93, CFSTR("regionSymbolNameRanges"));

  if (kVMUPrintArchivingTiming)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Region Symbol Name Ranges] Count: %u  Uniqued string count: %u\n\n", -[VMURangeToStringMap count](self->_binarySectionNameRanges, "count"), -[VMURangeToStringMap uniquedStringCount](self->_binarySectionNameRanges, "uniquedStringCount"));
  v94 = self->_stackLogReader;
  if (v94)
  {
    v95 = -[VMUGraphStackLogReader signpostID](v94, "signpostID");
    v94 = self->_stackLogReader;
    if (v95)
    {
      -[VMUGraphStackLogReader logHandle](v94, "logHandle");
      v96 = objc_claimAutoreleasedReturnValue();
      v97 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v97 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v98 = v97;
        if (os_signpost_enabled(v96))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v96, OS_SIGNPOST_INTERVAL_END, v98, "VMUProcessObjectGraph", ", buf, 2u);
        }
      }

      v94 = self->_stackLogReader;
    }
  }
  -[VMUGraphStackLogReader endEvent:](v94, "endEvent:", "VMUProcessObjectGraph");
  if (-[VMUSymbolStore count](self->_symbolStore, "count"))
  {
    v99 = self->_stackLogReader;
    if (v99)
    {
      v100 = -[VMUGraphStackLogReader signpostID](v99, "signpostID");
      v99 = self->_stackLogReader;
      if (v100)
      {
        -[VMUGraphStackLogReader logHandle](v99, "logHandle");
        v101 = objc_claimAutoreleasedReturnValue();
        v102 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v102 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v103 = v102;
          if (os_signpost_enabled(v101))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v101, OS_SIGNPOST_INTERVAL_END, v103, "VMUProcessObjectGraph", ", buf, 2u);
          }
        }

        v99 = self->_stackLogReader;
      }
    }
    -[VMUGraphStackLogReader endEvent:](v99, "endEvent:", "VMUProcessObjectGraph");
    -[VMUGraphStackLogReader startWithCategory:message:](self->_stackLogReader, "startWithCategory:message:", "VMUProcessObjectGraph", "archiving node labels");
    v104 = self->_stackLogReader;
    if (v104)
    {
      -[VMUGraphStackLogReader logHandle](v104, "logHandle");
      v105 = objc_claimAutoreleasedReturnValue();
      v106 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v106 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v107 = v106;
        if (os_signpost_enabled(v105))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v105, OS_SIGNPOST_INTERVAL_BEGIN, v107, "VMUProcessObjectGraph", "archiving node labels", buf, 2u);
        }
      }

    }
    objc_msgSend(v49[159], "_archivedObject:options:", self->_symbolStore, a4);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v108, CFSTR("nodeLabels"));

    v109 = self->_stackLogReader;
    if (v109)
    {
      v110 = -[VMUGraphStackLogReader signpostID](v109, "signpostID");
      v109 = self->_stackLogReader;
      if (v110)
      {
        -[VMUGraphStackLogReader logHandle](v109, "logHandle");
        v111 = objc_claimAutoreleasedReturnValue();
        v112 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v112 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v113 = v112;
          if (os_signpost_enabled(v111))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v111, OS_SIGNPOST_INTERVAL_END, v113, "VMUProcessObjectGraph", ", buf, 2u);
          }
        }

        v109 = self->_stackLogReader;
      }
    }
    -[VMUGraphStackLogReader endEvent:](v109, "endEvent:", "VMUProcessObjectGraph");
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Node Labels] Count: %u  Uniqued string count: %u\n\n", -[VMUSymbolStore count](self->_symbolStore, "count"), -[VMUSymbolStore uniquedStringCount](self->_symbolStore, "uniquedStringCount"));
  }
  else if (kVMUPrintArchivingTiming)
  {
    fwrite("[Node Labels] NO NODE LABELS\n\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
  if (self->_autoreleasePoolOffsets)
  {
    v114 = self->_stackLogReader;
    if (v114)
    {
      v115 = -[VMUGraphStackLogReader signpostID](v114, "signpostID");
      v114 = self->_stackLogReader;
      if (v115)
      {
        -[VMUGraphStackLogReader logHandle](v114, "logHandle");
        v116 = objc_claimAutoreleasedReturnValue();
        v117 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v117 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v118 = v117;
          if (os_signpost_enabled(v116))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v116, OS_SIGNPOST_INTERVAL_END, v118, "VMUProcessObjectGraph", ", buf, 2u);
          }
        }

        v114 = self->_stackLogReader;
      }
    }
    -[VMUGraphStackLogReader endEvent:](v114, "endEvent:", "VMUProcessObjectGraph");
    -[VMUGraphStackLogReader startWithCategory:message:](self->_stackLogReader, "startWithCategory:message:", "VMUProcessObjectGraph", "archiving userMarked");
    v119 = self->_stackLogReader;
    if (v119)
    {
      -[VMUGraphStackLogReader logHandle](v119, "logHandle");
      v120 = objc_claimAutoreleasedReturnValue();
      v121 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v121 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v122 = v121;
        if (os_signpost_enabled(v120))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v120, OS_SIGNPOST_INTERVAL_BEGIN, v122, "VMUProcessObjectGraph", "archiving userMarked", buf, 2u);
        }
      }

    }
    objc_msgSend(v49[159], "_archivedBytes:length:options:");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v123, CFSTR("userMarked"));

    v124 = self->_stackLogReader;
    if (v124)
    {
      v125 = -[VMUGraphStackLogReader signpostID](v124, "signpostID");
      v124 = self->_stackLogReader;
      if (v125)
      {
        -[VMUGraphStackLogReader logHandle](v124, "logHandle");
        v126 = objc_claimAutoreleasedReturnValue();
        v127 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
        if ((unint64_t)(v127 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v128 = v127;
          if (os_signpost_enabled(v126))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v126, OS_SIGNPOST_INTERVAL_END, v128, "VMUProcessObjectGraph", ", buf, 2u);
          }
        }

        v124 = self->_stackLogReader;
      }
    }
    -[VMUGraphStackLogReader endEvent:](v124, "endEvent:", "VMUProcessObjectGraph");
  }
  userMarked = self->_userMarked;
  if (userMarked)
  {
    objc_msgSend(v49[159], "_archivedObject:options:", userMarked, a4);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v130, CFSTR("stackLogReader"));

  }
  v131 = *(_QWORD *)&self->_hasClassInfosDerivedFromStackBacktraces;
  if (v131)
  {
    objc_msgSend(v49[159], "_archivedObject:options:", v131, a4);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v132, CFSTR("backtraces"));

  }
  backtraces = self->_backtraces;
  if (backtraces)
  {
    objc_msgSend(v49[159], "_archivedObject:options:", backtraces, a4);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v134, CFSTR("symbolStore"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VMUProcessObjectGraph idleExitStatus](self, "idleExitStatus"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v135, CFSTR("idleExitStatus"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_serializationOptions, CFSTR("ledger"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("processGraphInfo"));
  v136 = self->_stackLogReader;
  if (v136)
  {
    v137 = -[VMUGraphStackLogReader signpostID](v136, "signpostID");
    v136 = self->_stackLogReader;
    if (v137)
    {
      -[VMUGraphStackLogReader logHandle](v136, "logHandle");
      v138 = objc_claimAutoreleasedReturnValue();
      v139 = -[VMUGraphStackLogReader signpostID](self->_stackLogReader, "signpostID");
      if ((unint64_t)(v139 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v140 = v139;
        if (os_signpost_enabled(v138))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v138, OS_SIGNPOST_INTERVAL_END, v140, "VMUProcessObjectGraph", ", buf, 2u);
        }
      }

      v136 = self->_stackLogReader;
    }
  }
  -[VMUGraphStackLogReader endEvent:](v136, "endEvent:", "VMUProcessObjectGraph");

}

uint64_t __65__VMUProcessObjectGraph_archiveDictionaryRepresentation_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "serialize64:", objc_msgSend(a2, "unsignedLongLongValue"));
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v6, "unsignedIntValue");

  return objc_msgSend(v7, "serialize32:", v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSDictionary *autoreleasePoolOffsets;
  size_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VMUProcessObjectGraph;
  v4 = -[VMUObjectGraph copyWithZone:](&v9, sel_copyWithZone_, a3);
  *((_DWORD *)v4 + 49) = *(&self->super._referencingCount + 1);
  *((_QWORD *)v4 + 26) = self->_scanner;
  *((_QWORD *)v4 + 27) = *(_QWORD *)&self->_vmPageSize;
  objc_storeStrong((id *)v4 + 28, (id)self->_machAbsolute);
  *((_DWORD *)v4 + 58) = self->_regions;
  objc_storeStrong((id *)v4 + 30, *(id *)&self->_regionCount);
  objc_storeStrong((id *)v4 + 31, self->_zoneNames);
  objc_storeStrong((id *)v4 + 32, self->_processName);
  objc_storeStrong((id *)v4 + 35, self->_executablePath);
  *((_BYTE *)v4 + 380) = BYTE4(self->_physicalFootprintPeak);
  *((_BYTE *)v4 + 381) = BYTE5(self->_physicalFootprintPeak);
  objc_storeStrong((id *)v4 + 36, self->_binaryImagesDescription);
  objc_storeStrong((id *)v4 + 37, self->_threadNameRanges);
  objc_storeStrong((id *)v4 + 38, self->_binarySectionNameRanges);
  objc_storeStrong((id *)v4 + 40, *(id *)&self->_gotObjcClassStructureRanges);
  objc_storeStrong((id *)v4 + 41, self->_pthreadOffsets);
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (autoreleasePoolOffsets)
  {
    v6 = ((LODWORD(autoreleasePoolOffsets->super.isa) + 7) >> 3) + 4;
    v7 = malloc_type_malloc(v6, 0x37C10B9BuLL);
    memcpy(v7, autoreleasePoolOffsets, v6);
  }
  else
  {
    v7 = 0;
  }
  *((_QWORD *)v4 + 42) = v7;
  objc_storeStrong((id *)v4 + 43, self->_userMarked);
  objc_storeStrong((id *)v4 + 49, *(id *)&self->_objectContentLevel);
  *((_DWORD *)v4 + 96) = self->_idleExitStatus;
  *((_DWORD *)v4 + 97) = *(_DWORD *)&self->_showsPhysFootprint;
  objc_storeStrong((id *)v4 + 51, *(id *)&self->_hasClassInfosDerivedFromStackBacktraces);
  objc_storeStrong((id *)v4 + 52, self->_backtraces);
  objc_storeStrong((id *)v4 + 53, self->_symbolStore);
  *((_DWORD *)v4 + 94) = self->_physicalFootprintPeak;
  objc_storeStrong((id *)v4 + 56, (id)self->_serializationOptions);
  return v4;
}

- (void)setThreadName:(id)a3 forRange:(_VMURange)a4
{
  -[NSString setString:forRange:](self->_binaryImagesDescription, "setString:forRange:", a3, a4.location, a4.length);
}

- (id)threadNameForAddress:(unint64_t)a3
{
  return (id)-[NSString stringForAddress:](self->_binaryImagesDescription, "stringForAddress:", a3);
}

- (void)setBinarySectionName:(id)a3 forRange:(_VMURange)a4
{
  -[VMURangeToStringMap setString:forRange:](self->_threadNameRanges, "setString:forRange:", a3, a4.location, a4.length);
}

- (id)binarySectionNameForAddress:(unint64_t)a3
{
  NSArray *backtraces;
  uint64_t Name;
  void *v7;

  backtraces = self->_backtraces;
  if (backtraces
    && (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) == 0)
    && (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSectionWithAddressAtTime(),
        (Name = CSRegionGetName()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VMURangeToStringMap stringForAddress:](self->_threadNameRanges, "stringForAddress:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (_VMURange)binarySectionRangeContainingAddress:(unint64_t)a3
{
  NSArray *backtraces;
  unint64_t Range;
  unint64_t v7;
  _VMURange result;

  backtraces = self->_backtraces;
  if (!backtraces
    || (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) != 0)
    || (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSectionWithAddressAtTime(),
        (CSIsNull() & 1) != 0)
    || (Range = CSRegionGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    Range = -[VMURangeToStringMap rangeContainingAddress:](self->_threadNameRanges, "rangeContainingAddress:", a3);
  }
  result.length = v7;
  result.location = Range;
  return result;
}

- (void)_deriveObjcClassStructureRanges
{
  unint64_t v3;
  void *v4;
  _QWORD v5[6];

  if (!LOBYTE(self->_regionSymbolNameRanges))
  {
    v3 = +[VMUClassInfo sizeofClassStructure](VMUClassInfo, "sizeofClassStructure");
    -[VMUProcessObjectGraph realizedClasses](self, "realizedClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__VMUProcessObjectGraph__deriveObjcClassStructureRanges__block_invoke;
    v5[3] = &unk_1E4E030B8;
    v5[4] = self;
    v5[5] = v3;
    objc_msgSend(v4, "enumerateInfosWithBlock:", v5);

    LOBYTE(self->_regionSymbolNameRanges) = 1;
  }
}

void __56__VMUProcessObjectGraph__deriveObjcClassStructureRanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v11 = v5;
    v6 = (objc_msgSend(v5, "infoType") & 9) == 0;
    v5 = v11;
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1A85A9758](v11);
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "className");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("OBJC_CLASS_$_%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "setString:forRange:", v10, a2, *(_QWORD *)(a1 + 40));
      objc_autoreleasePoolPop(v7);
      v5 = v11;
    }
  }

}

- (void)setRegionSymbolName:(id)a3 forRange:(_VMURange)a4
{
  -[VMURangeToStringMap setString:forRange:](self->_binarySectionNameRanges, "setString:forRange:", a3, a4.location, a4.length);
}

- (id)regionSymbolNameForAddress:(unint64_t)a3
{
  NSArray *backtraces;
  uint64_t Name;
  void *v7;

  if (!LOBYTE(self->_regionSymbolNameRanges))
    -[VMUProcessObjectGraph _deriveObjcClassStructureRanges](self, "_deriveObjcClassStructureRanges");
  backtraces = self->_backtraces;
  if (backtraces
    && (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) == 0)
    && (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        (Name = CSSymbolGetName()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VMURangeToStringMap stringForAddress:](self->_binarySectionNameRanges, "stringForAddress:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (_VMURange)regionSymbolRangeContainingAddress:(unint64_t)a3
{
  NSArray *backtraces;
  unint64_t Range;
  unint64_t v7;
  _VMURange result;

  if (!LOBYTE(self->_regionSymbolNameRanges))
    -[VMUProcessObjectGraph _deriveObjcClassStructureRanges](self, "_deriveObjcClassStructureRanges");
  backtraces = self->_backtraces;
  if (!backtraces
    || (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) != 0)
    || (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        (CSIsNull() & 1) != 0)
    || (Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    Range = -[VMURangeToStringMap rangeContainingAddress:](self->_binarySectionNameRanges, "rangeContainingAddress:", a3);
  }
  result.length = v7;
  result.location = Range;
  return result;
}

- (_VMURange)rangeForSymbolName:(id)a3 inRegion:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  NSArray *backtraces;
  const char *v12;
  const char *Name;
  uint64_t Range;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _VMURange result;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 && v7)
  {
    backtraces = self->_backtraces;
    if (!backtraces
      || (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) != 0)
      || (-[NSArray symbolicator](self->_backtraces, "symbolicator"),
          CSSymbolicatorGetSymbolWithAddressAtTime(),
          (CSIsNull() & 1) != 0)
      || (v12 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"),
          Name = (const char *)CSSymbolGetName(),
          strcmp(v12, Name))
      || (Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
    {
      Range = -[VMURangeToStringMap rangeForString:startingAtAddress:](self->_binarySectionNameRanges, "rangeForString:startingAtAddress:", v6, v8[1]);
    }
    v10 = Range;
    v9 = v15;
  }

  v16 = v10;
  v17 = v9;
  result.length = v17;
  result.location = v16;
  return result;
}

- (unsigned)enumerateReferencesFromDataRegion:(id)a3 atGlobalSymbol:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke;
  v15[3] = &unk_1E4E03108;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v20;
  -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v15);
  LODWORD(self) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return self;
}

void __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke(uint64_t a1, uint64_t a2, __int128 *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (*((_QWORD *)a3 + 1) >> 60 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "vmuVMRegionForNode:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("__DATA")))
    {
      objc_msgSend(v18, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40));

      v12 = v18;
      if (!v11)
      {
LABEL_8:

        return;
      }
      v13 = objc_msgSend(*(id *)(a1 + 32), "rangeForSymbolName:inRegion:", *(_QWORD *)(a1 + 48), v18);
      v14 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke_2;
      v19[3] = &unk_1E4E030E0;
      v22 = *a3;
      v23 = *((_QWORD *)a3 + 2);
      v24 = v13;
      v25 = v15;
      v16 = *(id *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      v20 = v16;
      v21 = v17;
      objc_msgSend(v14, "enumerateReferencesOfNode:withBlock:", a2, v19);
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a4 = 1;
      v8 = v20;
    }

    v12 = v18;
    goto LABEL_8;
  }
}

_QWORD *__84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;

  v6 = result;
  if (*(_QWORD *)(a5 + 8) + result[6] - result[9] >= result[10])
  {
    if (*(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24))
      *a6 = 1;
  }
  else
  {
    v7 = result[4];
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v7 + 16);
    v9 = *(_OWORD *)(a5 + 16);
    v10[0] = *(_OWORD *)a5;
    v10[1] = v9;
    v11 = *(_QWORD *)(a5 + 32);
    result = (_QWORD *)v8(v7, a2, a3, a4, v10);
    ++*(_DWORD *)(*(_QWORD *)(v6[5] + 8) + 24);
  }
  return result;
}

- (unsigned)nodeReferencedFromDataRegion:(id)a3 byGlobalSymbol:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__VMUProcessObjectGraph_nodeReferencedFromDataRegion_byGlobalSymbol___block_invoke;
  v9[3] = &unk_1E4E03130;
  v9[4] = &v10;
  -[VMUProcessObjectGraph enumerateReferencesFromDataRegion:atGlobalSymbol:withBlock:](self, "enumerateReferencesFromDataRegion:atGlobalSymbol:withBlock:", v6, v7, v9);
  LODWORD(self) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return self;
}

uint64_t __69__VMUProcessObjectGraph_nodeReferencedFromDataRegion_byGlobalSymbol___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a4;
  return result;
}

- (void)setLabel:(id)a3 forNode:(unsigned int)a4
{
  -[VMUSymbolStore setString:forNode:](self->_symbolStore, "setString:forNode:", a3, *(_QWORD *)&a4);
}

- (id)labelForNode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if ((-[VMUProcessObjectGraph objectContentLevelForNodeLabels](self, "objectContentLevelForNodeLabels") & 0xFFFFFFFE) == 2)
  {
    -[VMUSymbolStore stringForNode:](self->_symbolStore, "stringForNode:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)hasLabelsForNodes
{
  return -[VMUSymbolStore count](self->_symbolStore, "count") != 0;
}

- (void)contentForNode:(unsigned int)a3
{
  return 0;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[VMUProcessObjectGraph labelForNode:](self, "labelForNode:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    shortenString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (VMUClassInfoMap)realizedClasses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUProcessObjectGraph;
  -[VMUObjectGraph indexedClassInfos](&v3, sel_indexedClassInfos);
  return (VMUClassInfoMap *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)zoneCount
{
  return objc_msgSend(*(id *)&self->_regionCount, "count");
}

- (id)zoneNameForIndex:(unsigned int)a3
{
  void *v5;

  if (objc_msgSend(*(id *)&self->_regionCount, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)&self->_regionCount, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unsigned)enumerateRegionsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  void *v6;
  char v9;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v9 = 0;
  if (LODWORD(self->_regions))
  {
    v5 = 0;
    do
    {
      objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, &v9);

    }
    while (++v5 < (unint64_t)LODWORD(self->_regions) && v9 == 0);
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (void)_reorderLabelsWithNodeNameMap:(unsigned int *)a3
{
  VMUSymbolStore *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VMUSymbolStore *symbolStore;

  v5 = (VMUSymbolStore *)objc_opt_new();
  v6 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  if (v6)
  {
    v7 = 0;
    v8 = v6;
    do
    {
      if (a3[v7] != -1)
      {
        -[VMUSymbolStore stringForNode:](self->_symbolStore, "stringForNode:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUSymbolStore setString:forNode:](v5, "setString:forNode:", v9, a3[v7]);

      }
      ++v7;
    }
    while (v8 != v7);
  }
  symbolStore = self->_symbolStore;
  self->_symbolStore = v5;

}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v8;
  NSDictionary *v11;
  NSDictionary *autoreleasePoolOffsets;
  _QWORD *v13;
  unsigned int isa;
  uint64_t v15;
  char *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  objc_super v22;
  _QWORD v23[2];
  uint64_t (*v24)(uint64_t, unsigned int);
  void *v25;
  NSDictionary *v26;
  unsigned int *v27;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  -[VMUProcessObjectGraph _reorderLabelsWithNodeNameMap:](self, "_reorderLabelsWithNodeNameMap:");
  if (self->_autoreleasePoolOffsets)
  {
    v20 = a5;
    v21 = v6;
    v11 = (NSDictionary *)malloc_type_calloc(1uLL, ((v8 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    v19 = v8;
    LODWORD(v11->super.isa) = v8;
    autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v24 = __80__VMUProcessObjectGraph__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace___block_invoke;
    v25 = &__block_descriptor_48_e8_v12__0I8l;
    v26 = v11;
    v27 = a3;
    v13 = v23;
    isa = autoreleasePoolOffsets->super.isa;
    if (LODWORD(autoreleasePoolOffsets->super.isa))
    {
      v15 = 0;
      do
      {
        v16 = (char *)autoreleasePoolOffsets + (v15 >> 3);
        v17 = v16[4];
        v18 = v15;
        if (v16[4])
        {
          do
          {
            if ((v17 & 1) != 0)
              v24((uint64_t)v13, v18);
            if (v17 < 2)
              break;
            v18 = (v18 + 1);
            v17 >>= 1;
          }
          while (v18 < isa);
        }
        v15 = (v15 + 8);
      }
      while (v15 < isa);
    }

    free(self->_autoreleasePoolOffsets);
    self->_autoreleasePoolOffsets = v11;
    v6 = v21;
    a5 = v20;
    v8 = v19;
  }
  v22.receiver = self;
  v22.super_class = (Class)VMUProcessObjectGraph;
  -[VMUObjectGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:](&v22, sel__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace_, a3, v8, a5, v6);
}

uint64_t __80__VMUProcessObjectGraph__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace___block_invoke(uint64_t result, unsigned int a2)
{
  _DWORD *v2;
  unint64_t v3;

  v2 = *(_DWORD **)(result + 32);
  v3 = *(unsigned int *)(*(_QWORD *)(result + 40) + 4 * a2);
  if (*v2 > v3)
    *((_BYTE *)v2 + (v3 >> 3) + 4) |= 1 << (v3 & 7);
  return result;
}

- (void)copyUserMarked
{
  NSDictionary *autoreleasePoolOffsets;
  size_t v3;
  void *v4;

  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (!autoreleasePoolOffsets)
    return 0;
  v3 = ((LODWORD(autoreleasePoolOffsets->super.isa) + 7) >> 3) + 4;
  v4 = malloc_type_malloc(v3, 0x37C10B9BuLL);
  memcpy(v4, autoreleasePoolOffsets, v3);
  return v4;
}

- (void)setUserMarked:(void *)a3
{
  NSDictionary *autoreleasePoolOffsets;
  size_t v6;
  NSDictionary *v7;

  if (a3)
  {
    autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
    if (autoreleasePoolOffsets)
      free(autoreleasePoolOffsets);
    v6 = ((*(_DWORD *)a3 + 7) >> 3) + 4;
    v7 = (NSDictionary *)malloc_type_malloc(v6, 0x37C10B9BuLL);
    memcpy(v7, a3, v6);
    self->_autoreleasePoolOffsets = v7;
  }
}

- (NSString)processDescriptionString
{
  if (self->_processName)
    return self->_processName;
  else
    return (NSString *)CFSTR("< process and analysis tool header unavailable >\n");
}

- (void)setProcessDescriptionString:(id)a3
{
  NSString *v4;
  NSString *processName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  processName = self->_processName;
  self->_processName = v4;

}

- (NSString)binaryImagesDescription
{
  if (self->_executablePath)
    return self->_executablePath;
  else
    return (NSString *)CFSTR("< binary images list unavailable >\n");
}

- (void)setBinaryImagesDescription:(id)a3
{
  NSString *v4;
  NSString *executablePath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  executablePath = self->_executablePath;
  self->_executablePath = v4;

}

- (NSString)processName
{
  if (self->_zoneNames)
    return (NSString *)self->_zoneNames;
  else
    return (NSString *)CFSTR("Unknown");
}

- (void)setProcessName:(id)a3
{
  NSArray *v4;
  NSArray *zoneNames;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  zoneNames = self->_zoneNames;
  self->_zoneNames = v4;

}

- (BOOL)is64bit
{
  _QWORD *v2;
  BOOL v3;

  if (!LODWORD(self->_regions))
    return 1;
  objc_msgSend((id)self->_machAbsolute, "lastObject");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[1] > 0x100000000uLL;

  return v3;
}

- (void)setStackLogReader:(id)a3
{
  objc_storeStrong(&self->_userMarked, a3);
}

- (id)sampleBacktracesString
{
  NSArray *backtraces;
  void *v4;
  VMUFakeSampler *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (*(_QWORD *)&self->_hasClassInfosDerivedFromStackBacktraces
    && (backtraces = self->_backtraces) != 0
    && (-[NSArray symbolicator](backtraces, "symbolicator"), (CSIsNull() & 1) == 0))
  {
    v5 = -[VMUFakeSampler initWithProcessObjectGraph:]([VMUFakeSampler alloc], "initWithProcessObjectGraph:", self);
    v6 = *(_QWORD *)&self->_hasClassInfosDerivedFromStackBacktraces;
    v7 = -[NSArray symbolicator](self->_backtraces, "symbolicator");
    +[VMUCallTreeNode rootForSamples:symbolicator:sampler:options:](VMUCallTreeNode, "rootForSamples:symbolicator:sampler:options:", v6, v7, v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fullOutputWithThreshold:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[NSString mutableCopy](self->_processName, "mutableCopy");
    objc_msgSend(v4, "appendString:", v10);
    objc_msgSend(v4, "appendFormat:", CFSTR("\n%@"), self->_executablePath);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  -[VMUProcessObjectGraph ledger](self, "ledger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4)
      *a4 = 1;
    v9 = objc_msgSend(v8, "unsignedLongLongValue");
  }
  else
  {
    v9 = 0;
    if (a4)
      *a4 = 0;
  }

  return v9;
}

- (id)_descriptionForRegionAddress:(unint64_t)a3 withOffset:(unint64_t)a4 showSegment:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  __CFString *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a5;
  v8 = a4 + a3;
  -[VMUProcessObjectGraph binarySectionNameForAddress:](self, "binarySectionNameForAddress:", a4 + a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VMUProcessObjectGraph binarySectionRangeContainingAddress:](self, "binarySectionRangeContainingAddress:", v8);
  -[VMUProcessObjectGraph regionSymbolNameForAddress:](self, "regionSymbolNameForAddress:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VMUProcessObjectGraph regionSymbolRangeContainingAddress:](self, "regionSymbolRangeContainingAddress:", v8);
  v13 = v12;
  v14 = &stru_1E4E04720;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v8 > v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" + %llu"), v8 - v12);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v9)
  {
    if (v11)
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("<PTHREAD_T>")))
      {
        v15 = v8 - v13;
        if (v8 <= v13)
        {
          v23 = 0;
          goto LABEL_30;
        }
        objc_msgSend(*(id *)&self->_gotObjcClassStructureRanges, "objectForKeyedSubscript:", CFSTR("FirstTLSslotKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedLongLongValue") + v13;

        objc_msgSend(*(id *)&self->_gotObjcClassStructureRanges, "objectForKeyedSubscript:", CFSTR("LastTLSslotKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedLongLongValue");

        if (v8 >= v17 && v8 <= v19 + v13)
        {
          v28 = -[VMUDirectedGraph pointerSize](self, "pointerSize");
          objc_msgSend((id)kVMUThreadSpecificDataKeyString, "stringByAppendingFormat:", CFSTR(" %llu"), (v8 - v17) / v28);
          v29 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v23 = (__CFString *)v29;
LABEL_30:
          v9 = 0;
          goto LABEL_31;
        }
        objc_msgSend(*(id *)&self->_gotObjcClassStructureRanges, "objectForKeyedSubscript:", CFSTR("StartRoutineArgumentOffsetKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedLongLongValue");

        if (v15 == v22)
        {
          v9 = 0;
          v23 = CFSTR("pthread start routine argument");
          goto LABEL_31;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pthread_t structure %+4lld"), v15, v30);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v11, v14);
      }
    }
    else
    {
      v26 = "";
      if (v5)
        v26 = "region ";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s+ %llu"), v26, a4);
    }
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (v11)
  {
    if (v5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: '%@'%@"), v9, v11, v14);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v11, v14, v31);
  }
  else
  {
    if (!v5)
    {
      v24 = objc_msgSend(v9, "rangeOfString:", CFSTR(" "));
      if (v24)
      {
        objc_msgSend(v9, "substringFromIndex:", v24 + 1);
        v25 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v25;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ + %llu"), v9, v8 - v10, v31);
  }
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v23;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  char v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;
  unint64_t v19;

  v5 = (void *)objc_msgSend((id)self->_machAbsolute, "count");
  if (v5)
  {
    v6 = (unint64_t)v5;
    v7 = 0;
    v8 = 0;
    v18 = a3;
    while (1)
    {
      v9 = v8 + (v6 >> 1);
      if (v9 >= objc_msgSend((id)self->_machAbsolute, "count"))
      {
        if (v7 == objc_msgSend((id)self->_machAbsolute, "count") - 1)
          goto LABEL_13;
        --v9;
      }
      v19 = v9;
      v10 = v9;
      do
      {
        objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v10);
        v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        v12 = v11[132];

        ++v10;
      }
      while ((v12 & 1) != 0);
      objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v10 - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "range");
      v16 = v15;

      if (v18 - v14 < v16)
        break;
      if (v18 < v14)
      {
        v6 >>= 1;
      }
      else
      {
        v8 = v10;
        v6 += ~(v6 >> 1);
      }
      v7 = v19;
      if (!v6)
      {
LABEL_13:
        v5 = 0;
        return v5;
      }
    }
    objc_msgSend((id)self->_machAbsolute, "objectAtIndexedSubscript:", v10 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)vmuVMRegionForNode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v3);
    -[VMUProcessObjectGraph vmuVMRegionForAddress:](self, "vmuVMRegionForAddress:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)shortNodeDescription:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
    return 0;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v3);
  if (!VMUGraphNodeType_IsVMRegion(0))
    return 0;
  -[VMUProcessObjectGraph vmuVMRegionForNode:](self, "vmuVMRegionForNode:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("/"));

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("%@ "), v11);

      objc_msgSend(v6, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v9, "appendString:", v12);
    }
    else
    {
      if (!objc_msgSend(v6, "isStack"))
      {
        objc_msgSend(v6, "type");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Stack %@"), v12);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = CFSTR("Unknown");
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VM: %@"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)nodeDescription:(unsigned int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[VMUProcessObjectGraph nodeDescription:withOffset:showLabel:](self, "nodeDescription:withOffset:showLabel:", v3, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4
{
  return -[VMUProcessObjectGraph nodeDescription:withOffset:showLabel:](self, "nodeDescription:withOffset:showLabel:", *(_QWORD *)&a3, a4, 1);
}

- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4 showLabel:(BOOL)a5
{
  uint64_t v6;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = *(_QWORD *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
    return 0;
  v8 = (void *)MEMORY[0x1A85A9758]();
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v6);
  if (VMUGraphNodeType_IsVMRegion(0))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a4, 1, self->_machAbsolute, 513);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("VM: %@"), v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_autoreleasePoolPop(v8);
  return v12;
}

- (id)nodeDescription:(unsigned int)a3 withDestinationNode:(unsigned int)a4 referenceInfo:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  unint64_t var2;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a3)
    return 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
  if (VMUGraphNodeType_IsVMRegion(v19 >> 60))
  {
    +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a5->var0 + v18, 1, self->_machAbsolute, 8193);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasPrefix:", CFSTR("__DATA ")))
    {
      objc_msgSend(v9, "substringFromIndex:", 7);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Region %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VMUProcessObjectGraph nodeDescription:](self, "nodeDescription:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  -[VMUProcessObjectGraph _detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:](self, "_detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:", &v16, v7, v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5->var2)
  {
    objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" --> offset %llu"), a5->var2);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }

  return v14;
}

- (id)nodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t var0;
  unsigned int v16;
  void *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a4)
    return 0;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v6);
  if (VMUGraphNodeType_IsVMRegion(0))
  {
    -[VMUProcessObjectGraph _descriptionForRegionAddress:withOffset:showSegment:](self, "_descriptionForRegionAddress:withOffset:showSegment:", 0, a3->var0, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(0, "ivarName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(0, "fullIvarNameAtOffset:", LODWORD(a3->var0) - objc_msgSend(0, "offset"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(0, "genericInfo");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      var0 = a3->var0;
      v16 = objc_msgSend(0, "instanceSize");

      if (var0 < v16)
      {
        -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v5);
        objc_msgSend(0, "className");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsString:", CFSTR("BlockVariable"));
        v19 = CFSTR("[capture]");
        if (v18)
          v19 = CFSTR("__block [capture]");
        v20 = v19;

        goto LABEL_15;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+%llu bytes"), a3->var0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (__CFString *)v12;
LABEL_15:

  return v20;
}

- (id)_detailedNodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v12;
  void *v13;
  __CFString *v14;
  const char *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t var0;
  unsigned int v27;
  void *v28;
  int v29;
  __CFString *v30;
  char __str[8];
  uint64_t v32;
  uint64_t v33;
  char __s[32];
  uint64_t v35;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x1E0C80C00];
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a4)
    return 0;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v8);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 200);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __s[0] = 0;
  if (VMUGraphNodeType_IsVMRegion(0))
  {
    -[VMUProcessObjectGraph _descriptionForRegionAddress:withOffset:showSegment:](self, "_descriptionForRegionAddress:withOffset:showSegment:", 0, a3->var0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v13);
  }
  else
  {
    v15 = VMUScanTypeKeywordDescription(a3->var1);
    v16 = "";
    if (v15 && *v15)
      v16 = " ";
    objc_msgSend(v12, "appendFormat:", CFSTR("%+6lld: %s%s"), a3->var0, v15, v16);
    v13 = 0;
    objc_msgSend(0, "ivarName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      objc_msgSend(0, "fullIvarNameAtOffset:", LODWORD(a3->var0) - objc_msgSend(0, "offset"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "instanceSize");
      goto LABEL_12;
    }
    objc_msgSend(0, "genericInfo");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      var0 = a3->var0;
      v27 = objc_msgSend(0, "instanceSize");

      if (var0 < v27)
      {
        *(_QWORD *)__str = 0;
        v32 = 0;
        v33 = 0;
        -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", v7);
        objc_msgSend(0, "className");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsString:", CFSTR("BlockVariable"));
        v30 = CFSTR("[capture]");
        if (v29)
          v30 = CFSTR("__block [capture]");
        v14 = v30;

        goto LABEL_12;
      }
    }
  }
  v14 = &stru_1E4E04720;
LABEL_12:

  snprintf(__str, 0x20uLL, "%#llx", a3->var0);
  v19 = objc_msgSend(v12, "length");
  v20 = strlen(__str);
  v21 = v20 + -[__CFString length](v14, "length") + strlen(__s) + v19;
  v22 = a6 - v21;
  if (a6 < v21)
    v22 = 0;
  if (v21 >= a6)
    v23 = 1;
  else
    v23 = v22;
  objc_msgSend(v12, "appendFormat:", CFSTR("%@%s%*s%s"), v14, __s, v23, ", __str);

  return v12;
}

- (id)referenceDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  unint64_t var2;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  if (-[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= a4
    || -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize") <= v7)
  {
    return 0;
  }
  v16 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  -[VMUProcessObjectGraph _detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:](self, "_detailedNodeOffsetDescription:withSourceNode:destinationNode:alignmentSpacing:", &v16, v8, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUProcessObjectGraph nodeDescription:](self, "nodeDescription:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3->var2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld bytes into %@"), a3->var2, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" --> %@"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)refineTypesWithOverlay:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUProcessObjectGraph;
  -[VMUObjectGraph _refineTypesWithOverlay:](&v3, sel__refineTypesWithOverlay_, a3);
}

- (void)refineEdges:(unsigned int)a3 withOptions:(unsigned int)a4 markingInvalid:(void *)a5
{
  char v6;
  uint64_t v9;
  _DWORD *v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  _QWORD v14[9];
  _QWORD v15[11];
  unsigned int v16;
  BOOL v17;
  _QWORD v18[3];
  int v19;
  _QWORD v20[3];
  int v21;
  _QWORD v22[3];
  int v23;
  _QWORD v24[3];
  int v25;

  v6 = a4;
  if (-[VMUProcessObjectGraph is64bit](self, "is64bit"))
    v9 = 7;
  else
    v9 = 3;
  if ((v6 & 1) != 0)
  {
    v11 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
    v10 = malloc_type_calloc(1uLL, ((v11 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v10 = v11;
  }
  else
  {
    v10 = 0;
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v12 = (v6 & 2) == 0;
  v13 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke;
  v15[3] = &unk_1E4E03178;
  v15[4] = self;
  v15[5] = v18;
  v17 = v12;
  v15[8] = v9;
  v15[9] = a5;
  v15[6] = v20;
  v15[7] = v24;
  v16 = a3;
  v15[10] = v10;
  -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](self, "_internalAccessRawEdgesWithBlock:", v15);
  if (v10)
  {
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke_2;
    v14[3] = &unk_1E4E031A0;
    v14[7] = v10;
    v14[8] = a5;
    v14[4] = self;
    v14[5] = v20;
    v14[6] = v22;
    -[VMUDirectedGraph _internalAccessRawEdgesWithBlock:](self, "_internalAccessRawEdgesWithBlock:", v14);
    free(v10);
  }
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

_QWORD *__64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke(_QWORD *result, unsigned int *a2, unsigned int a3)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v4 = result;
    v5 = a3;
    do
    {
      if (*a2 <= 0xFFFFFFFA)
      {
        ++*(_DWORD *)(*(_QWORD *)(v4[5] + 8) + 24);
        v12 = 0;
        v13 = 0;
        v14 = 0;
        result = (_QWORD *)v4[4];
        if (result)
          result = (_QWORD *)objc_msgSend(result, "_rawReferenceInfoWithName:", *a2);
        if (!*((_BYTE *)v4 + 92) && (v4[8] & v12) != 0)
        {
          v6 = (_DWORD *)v4[9];
          v7 = *a2;
          if (*v6 > v7)
            *((_BYTE *)v6 + (v7 >> 3) + 4) |= 1 << (v7 & 7);
          ++*(_DWORD *)(*(_QWORD *)(v4[6] + 8) + 24);
          ++*(_DWORD *)(*(_QWORD *)(v4[7] + 8) + 24);
        }
        if (((*((_DWORD *)v4 + 22) >> v13) & 1) == 0)
        {
          v8 = (_DWORD *)v4[9];
          v9 = *a2;
          if (*v8 > v9)
            *((_BYTE *)v8 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
          ++*(_DWORD *)(*(_QWORD *)(v4[6] + 8) + 24);
        }
        v10 = (_DWORD *)v4[10];
        if (v10)
        {
          if (!v14)
          {
            v11 = a2[2];
            if (a2[1] != (_DWORD)v11 && *v10 > v11)
              *((_BYTE *)v10 + (v11 >> 3) + 4) |= 1 << (v11 & 7);
          }
        }
      }
      a2 += 3;
      --v5;
    }
    while (v5);
  }
  return result;
}

_QWORD *__64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke_2(_QWORD *result, unsigned int *a2, unsigned int a3)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    v4 = result;
    v5 = a3;
    do
    {
      if (*a2 <= 0xFFFFFFFA)
      {
        v6 = (_DWORD *)v4[7];
        v7 = a2[2];
        if (*v6 > v7 && ((*((unsigned __int8 *)v6 + (v7 >> 3) + 4) >> (v7 & 7)) & 1) != 0)
        {
          v10 = 0;
          v11 = 0;
          v12 = 0;
          result = (_QWORD *)v4[4];
          if (result)
          {
            result = (_QWORD *)objc_msgSend(result, "_rawReferenceInfoWithName:");
            if (v12)
            {
              v8 = (_DWORD *)v4[8];
              v9 = *a2;
              if (*v8 > v9)
                *((_BYTE *)v8 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
              ++*(_DWORD *)(*(_QWORD *)(v4[5] + 8) + 24);
              ++*(_DWORD *)(*(_QWORD *)(v4[6] + 8) + 24);
            }
          }
        }
      }
      a2 += 3;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4
{
  -[VMUProcessObjectGraph markReachableNodesFromRoots:inMap:options:](self, "markReachableNodesFromRoots:inMap:options:", a3, a4, 0);
}

- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4 options:(unsigned int)a5
{
  size_t v8;
  unsigned int *v9;
  unsigned int v10;
  _DWORD *v11;
  void (**v12)(id, _QWORD);
  unsigned int v13;
  unsigned int v14;
  int v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  _DWORD *v20;
  int v21;
  uint64_t v22;
  VMUProcessObjectGraph *v23;
  char v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  BOOL v28;
  void (**v29)(id, _QWORD);
  size_t v30;
  int *v31;
  int v32;
  unint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int *v37;
  int v38;
  _QWORD *v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  char *v43;
  unsigned int v44;
  unsigned int v45;
  int v46;
  unint64_t v47;
  char *v48;
  _BYTE *v49;
  unint64_t v50;
  char v51;
  _DWORD *v52;
  _DWORD *v53;
  VMUProcessObjectGraph *v54;
  char v55;
  _QWORD v56[2];
  uint64_t (*v57)(uint64_t, uint64_t);
  void *v58;
  VMUProcessObjectGraph *v59;
  void (**v60)(id, _QWORD);
  char v61;
  _QWORD v62[5];
  id v63;
  _DWORD *v64;
  BOOL v65;
  _QWORD v66[7];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  int v70;
  int __pattern4[3];

  v55 = a5;
  -[VMUObjectGraph internalizeNodes](self, "internalizeNodes");
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v8 = 4 * -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  v9 = (unsigned int *)malloc_type_malloc(v8, 0x100004052888210uLL);
  v52 = a4;
  __pattern4[0] = -1;
  memset_pattern4(v9, __pattern4, v8);
  v54 = self;
  v10 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  v11 = malloc_type_calloc(1uLL, ((v10 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v11 = v10;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke;
  v66[3] = &unk_1E4E013B8;
  v66[4] = &v67;
  v66[5] = v9;
  v66[6] = v11;
  v12 = (void (**)(id, _QWORD))(id)MEMORY[0x1A85A995C](v66);
  v13 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    v14 = 0;
    v15 = 1;
    do
    {
      v16 = (char *)a3 + (v14 >> 3);
      v17 = v16[4];
      v18 = v15;
      if (v16[4])
      {
        do
        {
          if ((v17 & 1) != 0)
            v12[2](v12, v18 - 1);
          if (v17 < 2)
            break;
          v17 >>= 1;
          v19 = v18++ >= v13;
        }
        while (!v19);
      }
      v14 += 8;
      v15 += 8;
    }
    while (v14 < v13);
  }

  v20 = v68 + 3;
  v21 = *((_DWORD *)v68 + 6);
  v22 = MEMORY[0x1E0C809B0];
  v23 = v54;
  if (v21)
  {
    v24 = 1;
    v25 = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_2;
    v53 = v11;
    do
    {
      v26 = v21 - 1;
      *v20 = v26;
      v27 = v9[v26];
      v28 = (v55 & 2) != 0
         && -[VMUProcessObjectGraph nodeIsAutoreleasePoolContentPage:](v23, "nodeIsAutoreleasePoolContentPage:", v9[v26]);
      v62[0] = v22;
      v62[1] = 3221225472;
      v62[2] = v25;
      v62[3] = &unk_1E4E031C8;
      v62[4] = v23;
      v64 = v11;
      v65 = v28;
      v29 = v12;
      v63 = v29;
      -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:](v23, "_internalEnumerateEdgesOfNode:withBlock:", v27, v62);
      if (((*((_DWORD *)v68 + 6) == 0) & v24) == 1)
      {
        v30 = ((*v11 + 7) >> 3) + 4;
        v31 = (int *)malloc_type_malloc(v30, 0x37C10B9BuLL);
        memcpy(v31, v11, v30);
        v32 = *v31;
        v33 = (*v31 + 7);
        if (v33 >= 8)
        {
          v34 = v31 + 1;
          v35 = v33 >> 3;
          if (v33 >> 3 <= 1)
            v35 = 1;
          do
          {
            *v34 = ~*v34;
            ++v34;
            --v35;
          }
          while (v35);
        }
        v36 = v25;
        v37 = v9;
        v38 = v32 & 7;
        if (v38)
          *((_BYTE *)v31 + (v33 >> 3) + 3) ^= -1 << v38;
        v56[0] = v22;
        v56[1] = 3221225472;
        v57 = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_3;
        v58 = &unk_1E4E031F0;
        v59 = v23;
        v61 = v55 & 1;
        v60 = v29;
        v39 = v56;
        v40 = *v31;
        if (*v31)
        {
          v41 = 0;
          v42 = 1;
          do
          {
            v43 = (char *)v31 + (v41 >> 3);
            v44 = v43[4];
            v45 = v42;
            if (v43[4])
            {
              do
              {
                if ((v44 & 1) != 0)
                  v57((uint64_t)v39, v45 - 1);
                if (v44 < 2)
                  break;
                v44 >>= 1;
                v19 = v45++ >= v40;
              }
              while (!v19);
            }
            v41 += 8;
            v42 += 8;
          }
          while (v41 < v40);
        }

        free(v31);
        v24 = 0;
        v9 = v37;
        v11 = v53;
        v22 = MEMORY[0x1E0C809B0];
        v25 = v36;
        v23 = v54;
      }

      v20 = v68 + 3;
      v21 = *((_DWORD *)v68 + 6);
    }
    while (v21);
  }
  v46 = *v52;
  if (*v52 >= *v11)
    v46 = *v11;
  v47 = (v46 + 7);
  if (v47 >= 8)
  {
    v48 = (char *)(v11 + 1);
    v49 = v52 + 1;
    v50 = v47 >> 3;
    do
    {
      v51 = *v48++;
      *v49++ |= v51;
      --v50;
    }
    while (v50);
  }
  if (v9)
    free(v9);
  free(v11);

  _Block_object_dispose(&v67, 8);
}

_QWORD *__67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke(_QWORD *result, unsigned int a2)
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

uint64_t __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  _DWORD *v9;

  result = VMUIsOwningReference(objc_msgSend(*(id *)(a1 + 32), "scanTypeOfReferenceWithName:", a2));
  if ((_DWORD)result)
  {
    v9 = *(_DWORD **)(a1 + 48);
    if (*v9 <= a6 || ((*((unsigned __int8 *)v9 + (a6 >> 3) + 4) >> (a6 & 7)) & 1) == 0)
    {
      if (!*(_BYTE *)(a1 + 56))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      result = objc_msgSend(*(id *)(a1 + 32), "nodeIsAutoreleasePoolContentPage:", a6);
      if ((_DWORD)result)
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  return result;
}

uint64_t __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = objc_msgSend((id)result, "nodeDetails:", a2);
  if (!*(_BYTE *)(a1 + 48))
  {
    result = VMUGraphNodeType_IsVMRegion(0);
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

- (id)leakedNodesGraph
{
  unsigned int v3;
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int v10;
  void *v11;

  v3 = -[VMUDirectedGraph nodeNamespaceSize](self, "nodeNamespaceSize");
  v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v4 = v3;
  v5 = VMUCreateRootNodeMarkingMap(self);
  -[VMUProcessObjectGraph markReachableNodesFromRoots:inMap:options:](self, "markReachableNodesFromRoots:inMap:options:", v5, v4, 0);
  v6 = *v4;
  v7 = (*v4 + 7);
  if (v7 >= 8)
  {
    v8 = v4 + 1;
    v9 = v7 >> 3;
    if (v7 >> 3 <= 1)
      v9 = 1;
    do
    {
      *v8 = ~*v8;
      ++v8;
      --v9;
    }
    while (v9);
  }
  v10 = v6 & 7;
  if (v10)
    *((_BYTE *)v4 + (v7 >> 3) + 3) ^= -1 << v10;
  -[VMUDirectedGraph subgraphWithMarkedNodes:](self, "subgraphWithMarkedNodes:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);
  free(v5);
  return v11;
}

- (BOOL)nodeIsAutoreleasePoolContentPage:(unsigned int)a3
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = 0uLL;
  v8 = 0;
  -[VMUObjectGraph nodeDetails:](self, "nodeDetails:", *(_QWORD *)&a3);
  v5 = v7;
  v6 = v8;
  return -[VMUProcessObjectGraph nodeDetailIsAutoreleasePoolContentPage:](self, "nodeDetailIsAutoreleasePoolContentPage:", &v5);
}

- ($938B03310D06493B2963E5A84CB75A7E)autoreleasePoolOffsets
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  unsigned int v10;
  $938B03310D06493B2963E5A84CB75A7E result;

  -[NSDictionary objectForKeyedSubscript:](self->_pthreadOffsets, "objectForKeyedSubscript:", CFSTR("parentPageOffset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  -[NSDictionary objectForKeyedSubscript:](self->_pthreadOffsets, "objectForKeyedSubscript:", CFSTR("childPageOffset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  -[NSDictionary objectForKeyedSubscript:](self->_pthreadOffsets, "objectForKeyedSubscript:", CFSTR("firstEntryOffset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = v4 | (unint64_t)(v6 << 32);
  v10 = v8;
  result.var0 = v9;
  result.var1 = HIDWORD(v9);
  result.var2 = v10;
  return result;
}

- (BOOL)nodeDetailIsAutoreleasePoolContentPage:(id)a3
{
  void *v4;
  char v5;

  if (*(_QWORD *)(a3.var0 + 8) >> 60 != 1)
    return 0;
  objc_msgSend(*(id *)(a3.var0 + 16), "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("@autoreleasepool content"));

  return v5;
}

- (void)removeWeakEdges
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke;
  v2[3] = &unk_1E4E03240;
  v2[4] = self;
  -[VMUDirectedGraph withEdgeMarkingMap:](self, "withEdgeMarkingMap:", v2);
}

uint64_t __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v6[6];

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke_2;
  v6[3] = &unk_1E4E03218;
  v6[4] = v4;
  v6[5] = a2;
  objc_msgSend(v4, "enumerateEdgesWithBlock:", v6);
  return objc_msgSend(*(id *)(a1 + 32), "removeMarkedEdges:", a2);
}

void *__40__VMUProcessObjectGraph_removeWeakEdges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  void *result;
  BOOL v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  result = *(void **)(a1 + 32);
  if (!result
    || ((result = (void *)objc_msgSend(result, "referenceInfoWithName:", a2), (v8 - 1) <= 1)
      ? (v5 = v9 == 0)
      : (v5 = 0),
        !v5))
  {
    v6 = *(unsigned int **)(a1 + 40);
    if (*v6 > v2)
      *((_BYTE *)v6 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
  }
  return result;
}

- (void)markRootNodes:(void *)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VMUProcessObjectGraph_markRootNodes___block_invoke;
  v3[3] = &__block_descriptor_40_e25_v44__0I8___Qb60b4__12_B36l;
  v3[4] = a3;
  -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v3);
}

BOOL __39__VMUProcessObjectGraph_markRootNodes___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  _BOOL8 result;
  unsigned int *v6;

  result = VMUGraphNodeType_IsRoot(*(_QWORD *)(a3 + 8) >> 60);
  if (result)
  {
    v6 = *(unsigned int **)(a1 + 32);
    if (*v6 > a2)
      *((_BYTE *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
  return result;
}

- (void)markLeafNodes:(void *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VMUProcessObjectGraph_markLeafNodes___block_invoke;
  v3[3] = &unk_1E4E03290;
  v3[4] = self;
  v3[5] = a3;
  -[VMUObjectGraph enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v3);
}

void __39__VMUProcessObjectGraph_markLeafNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  void *v4;
  unsigned int *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v2 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__VMUProcessObjectGraph_markLeafNodes___block_invoke_2;
  v6[3] = &unk_1E4E03268;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateEdgesOfNode:withBlock:", a2, v6);
  if (!*((_DWORD *)v8 + 6))
  {
    v5 = *(unsigned int **)(a1 + 40);
    if (*v5 > v2)
      *((_BYTE *)v5 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __39__VMUProcessObjectGraph_markLeafNodes___block_invoke_2(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)resymbolicatePrivateMaps
{
  VMURangeToStringMap *binarySectionNameRanges;
  uint64_t v4;
  uint64_t v5;

  -[VMUSymbolStore resymbolicateObjectDescriptionStringsWithGraph:](self->_symbolStore, "resymbolicateObjectDescriptionStringsWithGraph:", self);
  binarySectionNameRanges = self->_binarySectionNameRanges;
  v4 = -[NSArray symbolicator](self->_backtraces, "symbolicator");
  -[VMURangeToStringMap resymbolicateStringsWithSymbolicator:](binarySectionNameRanges, "resymbolicateStringsWithSymbolicator:", v4, v5);
  -[VMUProcessObjectGraph resymbolicateNonObjectsUsingStackBacktrace](self, "resymbolicateNonObjectsUsingStackBacktrace");
}

- (void)resymbolicateNonObjectsUsingStackBacktrace
{
  void *userMarked;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  userMarked = self->_userMarked;
  if (userMarked)
  {
    -[VMUObjectGraph indexedClassInfos](self, "indexedClassInfos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__VMUProcessObjectGraph_resymbolicateNonObjectsUsingStackBacktrace__block_invoke;
    v7[3] = &unk_1E4E00D90;
    v7[4] = self;
    objc_msgSend(userMarked, "identifyNonObjectsUsingStackBacktraces:classInfoMap:classInfoSetterBlock:", self, v4, v7);

    -[VMUObjectGraph indexedClassInfos](self, "indexedClassInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)VMUProcessObjectGraph;
    -[VMUObjectGraph setIndexedClassInfos:](&v6, sel_setIndexedClassInfos_, v5);

  }
}

id __67__VMUProcessObjectGraph_resymbolicateNonObjectsUsingStackBacktrace__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VMUProcessObjectGraph;
  return objc_msgSendSuper2(&v4, sel_setClassInfoIndex_forNode_, a3, a2);
}

- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  NSArray *backtraces;
  char v18;

  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  backtraces = self->_backtraces;
  if (!backtraces)
  {
    -[VMUProcessObjectGraph _generateSymbolStoreFromExistingGraph](self, "_generateSymbolStoreFromExistingGraph");
    backtraces = self->_backtraces;
  }
  v18 = -[NSArray resymbolicateWithDsymPath:libraryNames:all:progress:showDebugInfo:error:](backtraces, "resymbolicateWithDsymPath:libraryNames:all:progress:showDebugInfo:error:", v14, v15, v11, v16, v9, a8);

  return v18;
}

- (_CSArchitecture)parseMacOSArchitectureFromProcessDescription
{
  NSString *processName;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _CSArchitecture v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  processName = self->_processName;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString componentsSeparatedByCharactersInSet:](processName, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("Code Type"), (_QWORD)v17))
        {
          if ((objc_msgSend(v11, "containsString:", CFSTR("X86-64")) & 1) != 0)
          {
            v12 = (_CSArchitecture)0x301000007;
            goto LABEL_19;
          }
          if ((objc_msgSend(v11, "containsString:", CFSTR("ARM64E")) & 1) != 0)
          {
            v12 = (_CSArchitecture)0x20100000CLL;
            goto LABEL_19;
          }
          if (objc_msgSend(v11, "containsString:", CFSTR("ARM64")))
          {
            +[VMUProcessDescription parseBinaryImagesDescription:](VMUProcessDescription, "parseBinaryImagesDescription:", self->_executablePath);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExecutablePath"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = (_CSArchitecture)0x20100000CLL;
            if ((objc_msgSend(v15, "hasPrefix:", CFSTR("/System")) & 1) == 0
              && !objc_msgSend(v15, "hasPrefix:", CFSTR("/usr")))
            {
              v12 = (_CSArchitecture)16777228;
            }

            goto LABEL_19;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (void)parseAddressesFromNodeLabelsIntoSymbolStore
{
  VMUSymbolStore *symbolStore;
  _QWORD v3[5];

  symbolStore = self->_symbolStore;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__VMUProcessObjectGraph_parseAddressesFromNodeLabelsIntoSymbolStore__block_invoke;
  v3[3] = &unk_1E4E032B8;
  v3[4] = self;
  -[VMUSymbolStore enumerateHexAddressesInStrings:](symbolStore, "enumerateHexAddressesInStrings:", v3);
}

uint64_t __68__VMUProcessObjectGraph_parseAddressesFromNodeLabelsIntoSymbolStore__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "addAddress:origin:", a2, 4);
}

- (void)_generateSymbolStoreFromExistingGraph
{
  uint64_t v3;
  uint64_t v4;
  VMUSymbolStore *v5;
  NSArray **p_backtraces;
  VMURangeToStringMap *binarySectionNameRanges;
  uint64_t v8;
  void *userMarked;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = +[VMUProcessDescription symbolicatorFromBinaryImagesDescription:withArchitecture:](VMUProcessDescription, "symbolicatorFromBinaryImagesDescription:withArchitecture:", self->_executablePath, -[VMUProcessObjectGraph parseMacOSArchitectureFromProcessDescription](self, "parseMacOSArchitectureFromProcessDescription"));
  v5 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]([VMUSymbolStore alloc], "initWithSymbolicator:debugTimer:", v3, v4, 0);
  p_backtraces = &self->_backtraces;
  objc_storeStrong((id *)&self->_backtraces, v5);
  -[NSArray setGraph:](self->_backtraces, "setGraph:", self);
  binarySectionNameRanges = self->_binarySectionNameRanges;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke;
  v21[3] = &unk_1E4E032B8;
  v21[4] = self;
  -[VMURangeToStringMap enumerateHexAddressesInStrings:](binarySectionNameRanges, "enumerateHexAddressesInStrings:", v21);
  -[VMUProcessObjectGraph parseAddressesFromNodeLabelsIntoSymbolStore](self, "parseAddressesFromNodeLabelsIntoSymbolStore");
  userMarked = self->_userMarked;
  if (userMarked)
  {
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke_2;
    v20[3] = &unk_1E4E032B8;
    v20[4] = self;
    objc_msgSend(userMarked, "enumerateUniquingTable:", v20);
  }
  v10 = *(void **)&self->_hasClassInfosDerivedFromStackBacktraces;
  if (v10)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[NSArray addBacktrace:origin:](*p_backtraces, "addBacktrace:origin:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), 0, (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v13);
    }

  }
  CSRelease();

}

uint64_t __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "addAddress:origin:", a2, 2);
}

uint64_t __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "addAddress:origin:", a2, 3);
}

- (int)pid
{
  return *(&self->super._referencingCount + 1);
}

- (VMUTaskMemoryScanner)scanner
{
  return (VMUTaskMemoryScanner *)objc_loadWeakRetained((id *)&self->_pid);
}

- (void)setScanner:(id)a3
{
  objc_storeWeak((id *)&self->_pid, a3);
}

- (unsigned)vmPageSize
{
  return self->_scanner;
}

- (unsigned)kernelPageSize
{
  return HIDWORD(self->_scanner);
}

- (unsigned)regionCount
{
  return self->_regions;
}

- (unint64_t)snapshotMachTime
{
  return *(_QWORD *)&self->_vmPageSize;
}

- (void)setSnapshotMachTime:(unint64_t)a3
{
  *(_QWORD *)&self->_vmPageSize = a3;
}

- (VMUDebugTimer)debugTimer
{
  return (VMUDebugTimer *)self->_stackLogReader;
}

- (void)setDebugTimer:(id)a3
{
  objc_storeStrong((id *)&self->_stackLogReader, a3);
}

- (VMUStackLogReader)stackLogReader
{
  return (VMUStackLogReader *)self->_userMarked;
}

- (BOOL)showRawClassNames
{
  return BYTE1(self->_regionSymbolNameRanges);
}

- (void)setShowRawClassNames:(BOOL)a3
{
  BYTE1(self->_regionSymbolNameRanges) = a3;
}

- (unint64_t)physicalFootprint
{
  return (unint64_t)self->_debugTimer;
}

- (void)setPhysicalFootprint:(unint64_t)a3
{
  self->_debugTimer = (VMUDebugTimer *)a3;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprint;
}

- (void)setPhysicalFootprintPeak:(unint64_t)a3
{
  self->_physicalFootprint = a3;
}

- (BOOL)isTranslatedByRosetta
{
  return (BOOL)self->_processDescriptionString;
}

- (void)setIsTranslatedByRosetta:(BOOL)a3
{
  LOBYTE(self->_processDescriptionString) = a3;
}

- (NSString)executablePath
{
  return *(NSString **)&self->_isTranslatedByRosetta;
}

- (BOOL)showsPhysFootprint
{
  return BYTE4(self->_physicalFootprintPeak);
}

- (void)setShowsPhysFootprint:(BOOL)a3
{
  BYTE4(self->_physicalFootprintPeak) = a3;
}

- (unsigned)objectContentLevel
{
  return self->_idleExitStatus;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_idleExitStatus = a3;
}

- (NSDictionary)srcAddressToExtraAutoreleaseCountDict
{
  return *(NSDictionary **)&self->_objectContentLevel;
}

- (void)setSrcAddressToExtraAutoreleaseCountDict:(id)a3
{
  objc_storeStrong((id *)&self->_objectContentLevel, a3);
}

- (NSArray)backtraces
{
  return *(NSArray **)&self->_hasClassInfosDerivedFromStackBacktraces;
}

- (void)setBacktraces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (VMUSymbolStore)symbolStore
{
  return (VMUSymbolStore *)self->_backtraces;
}

- (void)setSymbolStore:(id)a3
{
  objc_storeStrong((id *)&self->_backtraces, a3);
}

- (VMUNodeToStringMap)nodeLabels
{
  return (VMUNodeToStringMap *)self->_symbolStore;
}

- (_VMURange)dyldSharedCacheRange
{
  NSDictionary **p_ledger;
  NSDictionary *ledger;
  unint64_t v4;
  _VMURange result;

  p_ledger = &self->_ledger;
  ledger = self->_ledger;
  v4 = (unint64_t)p_ledger[1];
  result.length = v4;
  result.location = (unint64_t)ledger;
  return result;
}

- (void)setDyldSharedCacheRange:(_VMURange)a3
{
  *(_VMURange *)&self->_ledger = a3;
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  return (BOOL)self->_srcAddressToExtraAutoreleaseCountDict;
}

- (NSDate)snapshotDate
{
  return (NSDate *)self->_nodeLabels;
}

- (void)setSnapshotDate:(id)a3
{
  objc_storeStrong((id *)&self->_nodeLabels, a3);
}

- (BOOL)didPhysFootprintDirtyAccounting
{
  return BYTE5(self->_physicalFootprintPeak);
}

- (void)setDidPhysFootprintDirtyAccounting:(BOOL)a3
{
  BYTE5(self->_physicalFootprintPeak) = a3;
}

- (unsigned)objectContentLevelForNodeLabels
{
  return *(_DWORD *)&self->_showsPhysFootprint;
}

- (void)setObjectContentLevelForNodeLabels:(unsigned int)a3
{
  *(_DWORD *)&self->_showsPhysFootprint = a3;
}

- (unint64_t)serializationOptions
{
  return (unint64_t)self->_snapshotDate;
}

- (void)setSerializationOptions:(unint64_t)a3
{
  self->_snapshotDate = (NSDate *)a3;
}

- (NSDictionary)ledger
{
  return (NSDictionary *)self->_serializationOptions;
}

- (void)setLedger:(id)a3
{
  objc_storeStrong((id *)&self->_serializationOptions, a3);
}

- (unsigned)idleExitStatus
{
  return self->_physicalFootprintPeak;
}

- (void)setIdleExitStatus:(unsigned int)a3
{
  LODWORD(self->_physicalFootprintPeak) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationOptions, 0);
  objc_storeStrong((id *)&self->_nodeLabels, 0);
  objc_storeStrong((id *)&self->_symbolStore, 0);
  objc_storeStrong((id *)&self->_backtraces, 0);
  objc_storeStrong((id *)&self->_hasClassInfosDerivedFromStackBacktraces, 0);
  objc_storeStrong((id *)&self->_objectContentLevel, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);
  objc_storeStrong(&self->_userMarked, 0);
  objc_storeStrong((id *)&self->_pthreadOffsets, 0);
  objc_storeStrong((id *)&self->_gotObjcClassStructureRanges, 0);
  objc_storeStrong((id *)&self->_binarySectionNameRanges, 0);
  objc_storeStrong((id *)&self->_threadNameRanges, 0);
  objc_storeStrong((id *)&self->_binaryImagesDescription, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_isTranslatedByRosetta, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_regionCount, 0);
  objc_storeStrong((id *)&self->_machAbsolute, 0);
  objc_destroyWeak((id *)&self->_pid);
}

@end
