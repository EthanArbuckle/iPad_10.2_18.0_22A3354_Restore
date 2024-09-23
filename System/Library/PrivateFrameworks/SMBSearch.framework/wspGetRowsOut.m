@implementation wspGetRowsOut

- (wspGetRowsOut)initWithCtx:(id)a3
{
  id v5;
  wspGetRowsOut *v6;
  wspGetRowsOut *v7;
  wspHeader *v8;
  wspHeader *whdr;
  searchResults *v10;
  searchResults *results;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)wspGetRowsOut;
  v6 = -[wspGetRowsOut init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wctx, a3);
    v8 = objc_alloc_init(wspHeader);
    whdr = v7->_whdr;
    v7->_whdr = v8;

    if (v7->_whdr
      && (v10 = objc_alloc_init(searchResults),
          results = v7->_results,
          v7->_results = v10,
          results,
          v7->_results))
    {
      v7->_rowsReturned = 0;
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v6;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  unsigned int v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  unsigned int v40;
  unsigned int v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int *v63;
  unint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _BOOL8 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BOOL8 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  unint64_t v96;
  uint64_t v97;
  void *v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  __int128 v102;
  searchColumn *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  unint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  unsigned int v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  rowVariant *v125;
  void *v126;
  int v127;
  searchColumn *v128;
  void *v129;
  searchColumn *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  unint64_t v147;
  unsigned int v148;
  unsigned int v149;
  __int128 v150;
  unsigned int v151;
  void *context;
  uint64_t v153;
  void *v154;
  unsigned int v155;
  searchColumn *v156;
  uint64_t v157;
  int v158;
  void *v159;
  unsigned int *v160;
  unsigned int *v161;
  unsigned int v162;
  uint8_t buf[4];
  unsigned int v164;
  __int16 v165;
  int v166;
  uint64_t v167;

  v6 = *(_QWORD *)&a4;
  v167 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v162 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.34();
    v13 = 12;
    goto LABEL_9;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");
  -[wspGetRowsOut whdr](self, "whdr");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "decodeBuffer:BufferOffset:BytesDecoded:", v10, v6, &v162);

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.33();
    *a5 = v162;
    goto LABEL_9;
  }
  v15 = v162;
  -[wspGetRowsOut whdr](self, "whdr");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "msgid");

  if (v17 != 204)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.32(self);
LABEL_16:
    v13 = 5;
    goto LABEL_9;
  }
  -[wspGetRowsOut whdr](self, "whdr");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "status");

  if (v19)
  {
    -[wspGetRowsOut whdr](self, "whdr");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "status") == 265926)
    {

    }
    else
    {
      -[wspGetRowsOut whdr](self, "whdr");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = a5;
      v22 = objc_msgSend(v21, "status");

      v23 = v22 == 265933;
      a5 = v160;
      if (!v23)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.31(self);
        goto LABEL_30;
      }
    }
  }
  v24 = v15 + v6;
  v25 = v9 - v6 - v15;
  if (v25 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.1();
    goto LABEL_34;
  }
  v161 = a5;
  v26 = v15 + v6;
  v27 = *(unsigned int *)(v11 + v24);
  -[wspGetRowsOut setRowsReturned:](self, "setRowsReturned:", v27);
  -[wspGetRowsOut wctx](self, "wctx");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setRowsSoFar:", objc_msgSend(v28, "rowsSoFar") + v27);

  v162 += 4;
  if (!-[wspGetRowsOut rowsReturned](self, "rowsReturned"))
  {
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v30)
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_30;
  }
  v158 = v26;
  v29 = v25 & 0xFFFFFFFFFFFFFFFCLL;
  if ((v25 & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_34;
  }
  v39 = *(_DWORD *)(v11 + (v26 + 4));
  v40 = v162;
  v162 += 4;
  if (v29 == 8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_34;
  }
  v162 = v40 + 8;
  v41 = v26 + 12;
  switch(v39)
  {
    case 0:
      v153 = v11;
      v42 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v42)
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.14(v42, v43, v44, v45, v46, v47, v48, v49);
      -[wspGetRowsOut wctx](self, "wctx");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setSeekBookmarkOffset:", 4294967292);

      -[wspGetRowsOut wctx](self, "wctx");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "rowsSoFar");
      -[wspGetRowsOut wctx](self, "wctx");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setSeekSkip:", v52);

      goto LABEL_88;
    case 1:
      v54 = v25 - 12;
      v153 = v11;
      v55 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v55)
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.16(v55, v56, v57, v58, v59, v60, v61, v62);
      v63 = v161;
      if (v54 > 3)
      {
        v162 += 4;
        goto LABEL_89;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.15();
      goto LABEL_34;
    case 2:
      v64 = v25 - 12;
      v65 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v65)
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.20(v65, v66, v67, v68, v69, v70, v71, v72);
      if (v64 > 3)
      {
        v90 = *(unsigned int *)(v11 + v41);
        -[wspGetRowsOut wctx](self, "wctx");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setSeekBookmarkOffset:", v90);

        v162 += 4;
        if (v29 == 16)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.18();
        }
        else
        {
          v97 = *(unsigned int *)(v11 + (v158 + 16));
          -[wspGetRowsOut wctx](self, "wctx");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setSeekSkip:", v97);

          v99 = v162;
          v162 += 4;
          if (v29 != 20)
          {
            v153 = v11;
            v101 = v99 + 8;
            goto LABEL_87;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.19();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.17();
      }
      goto LABEL_34;
    case 3:
      v73 = v25 - 12;
      v74 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v74)
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.24(v74, v75, v76, v77, v78, v79, v80, v81);
      if (v73 <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.21();
        goto LABEL_34;
      }
      v92 = v162;
      v162 += 4;
      if (v29 == 16)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.22();
        goto LABEL_34;
      }
      v162 = v92 + 8;
      if (v29 == 20)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.23();
        goto LABEL_34;
      }
      v153 = v11;
      v101 = v92 + 12;
LABEL_87:
      v162 = v101;
LABEL_88:
      v63 = v161;
      goto LABEL_89;
    case 4:
      v82 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v82)
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.30(v82, v83, v84, v85, v86, v87, v88, v89);
      if (v25 - 12 <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.25();
        goto LABEL_34;
      }
      v93 = *(_DWORD *)(v11 + v41);
      v94 = v162 + 4;
      v162 += 4;
      v95 = v158 + 16;
      v96 = v25 - 16;
      if (v93)
      {
        while (v96 > 3)
        {
          v94 += 4;
          v162 = v94;
          v95 += 4;
          v96 -= 4;
          if (!--v93)
            goto LABEL_71;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.29();
LABEL_34:
        v13 = 55;
        goto LABEL_9;
      }
LABEL_71:
      if (v96 <= 3)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        goto LABEL_73;
      }
      v153 = v11;
      v100 = *(_DWORD *)(v11 + v95);
      v162 = v94 + 4;
      if ((v96 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_34;
LABEL_73:
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.26();
        goto LABEL_34;
      }
      v162 = v94 + 8;
      v63 = v161;
      if (v100)
      {
        v147 = v96 - 8;
        v148 = v95 + 8;
        v149 = v94 + 12;
        while (v147 > 3)
        {
          v162 = v149;
          v148 += 4;
          v147 -= 4;
          v149 += 4;
          if (!--v100)
            goto LABEL_89;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.28();
        goto LABEL_34;
      }
LABEL_89:
      if (!-[wspGetRowsOut rowsReturned](self, "rowsReturned"))
      {
        v103 = 0;
        v139 = 0;
LABEL_109:
        *v63 = v162;

LABEL_30:
        v13 = 0;
        goto LABEL_9;
      }
      v159 = 0;
      v103 = 0;
      v104 = 0;
      v151 = 0;
      v155 = v6 + 40;
      v105 = 0x24F061000uLL;
      *(_QWORD *)&v102 = 67109376;
      v150 = v102;
LABEL_91:
      v106 = v104;
      context = (void *)MEMORY[0x22E2A6F9C]();
      v107 = objc_alloc_init(*(Class *)(v105 + 2352));

      v154 = v107;
      if (!v107)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.6();
        v13 = 12;
        goto LABEL_140;
      }
      v108 = 0;
      v157 = v153 + v155;
      v156 = v103;
      while (1)
      {
        -[wspGetRowsOut wctx](self, "wctx", v150);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "pidMap");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "colTableArr");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v111, "count");

        if (v112 <= v108)
        {
          v103 = v156;
          v104 = v154;
          objc_msgSend(v154, "columns");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = objc_msgSend(v133, "count");

          if (v134)
          {
            -[wspGetRowsOut results](self, "results");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "rows");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "addObject:", v154);

            -[wspGetRowsOut wctx](self, "wctx");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "pidMap");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v155 += objc_msgSend(v138, "rowLength");

            objc_autoreleasePoolPop(context);
            ++v151;
            v63 = v161;
            v105 = 0x24F061000;
            if (v151 < -[wspGetRowsOut rowsReturned](self, "rowsReturned"))
              goto LABEL_91;

            v139 = v159;
            goto LABEL_109;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.13();
          v13 = 5;
LABEL_140:
          v145 = context;
          v146 = v154;
          goto LABEL_131;
        }
        v113 = v108;
        -[wspGetRowsOut wctx](self, "wctx");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "pidMap");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "colTableArr");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "objectAtIndex:", v108);
        v117 = (void *)objc_claimAutoreleasedReturnValue();

        v118 = objc_msgSend(v117, "statusOffset");
        v119 = objc_msgSend(v117, "lengthOffset");
        v159 = v117;
        v120 = objc_msgSend(v117, "valueOffset");
        if (v9 < v155 + 1 + v118)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.7();
          v13 = 55;
LABEL_116:
          v145 = context;
          v146 = v154;
LABEL_120:
          v103 = v156;
          goto LABEL_131;
        }
        v121 = *(unsigned __int8 *)(v157 + v118);
        if (!(_DWORD)v121)
          break;
        v122 = v113;
        if ((_DWORD)v121 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.8(v121, v151, v113, v140, v141, v142, v143, v144);
          v13 = 5;
          goto LABEL_116;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v150;
          v164 = v151;
          v165 = 1024;
          v166 = v113;
          _os_log_debug_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, colStatus: StoreStatusNull\n", buf, 0xEu);
        }
LABEL_104:
        v108 = (v122 + 1);
      }
      v122 = v113;
      if (v9 < v155 + 4 + v119)
      {
        v146 = v154;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.9();
        v13 = 55;
        v145 = context;
        goto LABEL_120;
      }
      v123 = v120;
      v124 = *(unsigned int *)(v157 + v119);
      v125 = objc_alloc_init(rowVariant);
      if (!v125)
      {
        v145 = context;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.10();
        goto LABEL_126;
      }
      -[wspGetRowsOut wctx](self, "wctx");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:](v125, "decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:", v10, v6, v155, v123, v124, objc_msgSend(v126, "supports64BitOffsets"));

      if (v127)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.12();
        v145 = context;
LABEL_126:
        v146 = v154;
        v103 = v156;
        goto LABEL_130;
      }
      v128 = [searchColumn alloc];
      objc_msgSend(v159, "propSpec");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = -[searchColumn initWithPropertyNumber:RVariant:](v128, "initWithPropertyNumber:RVariant:", objc_msgSend(v129, "propNumber"), v125);

      if (v130)
      {
        objc_msgSend(v154, "columns");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[searchColumn propNumber](v130, "propNumber"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "setObject:forKey:", v130, v132);

        v156 = v130;
        goto LABEL_104;
      }
      v146 = v154;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.11();
      v103 = 0;
      v145 = context;
LABEL_130:

      v13 = 12;
LABEL_131:
      objc_autoreleasePoolPop(v145);

LABEL_9:
      return v13;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.5();
      goto LABEL_16;
  }
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWhdr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)rowsReturned
{
  return self->_rowsReturned;
}

- (void)setRowsReturned:(unsigned int)a3
{
  self->_rowsReturned = a3;
}

- (searchResults)results
{
  return (searchResults *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_wctx, 0);
  objc_storeStrong((id *)&self->_whdr, 0);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode cRowsReturned, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: cRowsReturned is zero, no more rows to decode\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eType, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode chapter, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: unknown seek description: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: row: %u, no memory for new searchRow\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: field Status: Out of buffer row: %u, col: %u, field: Status\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, colStatus: 0x%x\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: field Status: Out of buffer row: %u, col: %u, field: Length\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, no memory for rowVariant\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, no memory for new searchColumn\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, rowVariant decodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: row: %u is empty, no columns were decoded\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: Saw eRowsSeekNone\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowsSeekNext:cskip, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: Saw eRowsSeekNext\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAt:bmkOffset, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAt:cskip, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAt:hregion, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: Saw eRowSeekAt\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAtRatio:ulNumerator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAtRatio:ulDenominator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAtRatio:hregion, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: Saw eRowSeekAtRatio\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:cBookMarks, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:maxRet, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:HRESULT, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:aBookMark, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspGetRowsOut:decodeBuffer: Saw eRowSeekByBookmark\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.31(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "whdr");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "msgid");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspGetRowsOut:decodeBuffer: hdr status: 0x%x\n", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.32(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "whdr");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "msgid");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspGetRowsOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.33()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRowsOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
