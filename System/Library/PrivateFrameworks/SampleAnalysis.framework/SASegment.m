@implementation SASegment

+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:(uint64_t)a5 offsetIntoBinary:
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a2;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithBinary:name:length:offsetIntoBinary:", v9, v8, a4, a5);

  return v10;
}

- (id)nonInlineSymbolAtOffsetIntoSegment:(void *)a1
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];

  if (!a1)
    return 0;
  v3 = a1;
  objc_sync_enter(v3);
  v4 = v3[1];
  if (v4
    && (v10[0] = MEMORY[0x1E0C809B0],
        v10[1] = 3221225472,
        v10[2] = __48__SASegment_nonInlineSymbolAtOffsetIntoSegment___block_invoke,
        v10[3] = &__block_descriptor_40_e18_q16__0__SASymbol_8l,
        v10[4] = a2,
        (v5 = SABinarySearchArray(v4, 1536, (uint64_t)v10)) != 0))
  {
    objc_msgSend(v3[1], "objectAtIndexedSubscript:", v5 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length")
      && (v7 = objc_msgSend(v6, "offsetIntoSegment"), objc_msgSend(v6, "length") + v7 <= a2))
    {
      v8 = 0;
    }
    else
    {
      v8 = v6;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v3);

  return v8;
}

- (SASegment)initWithBinary:(id)a3 name:(id)a4 length:(unint64_t)a5 offsetIntoBinary:(int64_t)a6
{
  id v10;
  id v11;
  SASegment *v12;
  SASegment *v13;
  int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  int v19;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SASegment;
  v12 = -[SASegment init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_binary, v10);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_length = a5;
    v13->_offsetIntoBinary = a6;
    if (a5 >> 28)
    {
      if (objc_msgSend(v11, "containsString:", CFSTR("TEXT")))
      {
        v15 = *__error();
        _sa_logt();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          -[SASegment debugDescription](v13, "debugDescription");
          v19 = v15;
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v18 = objc_msgSend(v17, "UTF8String");
          *(_DWORD *)buf = 136315394;
          v22 = v18;
          v23 = 2048;
          v24 = a5;
          _os_log_fault_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);

          v15 = v19;
        }

        *__error() = v15;
      }
    }
  }

  return v13;
}

- (id)instructionAtOffsetIntoSegment:(unint64_t)a3
{
  id *v3;
  SASegment *v5;
  NSMutableDictionary *instructions;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  id *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  SASegment *WeakRetained;

  if (self->_length - 1 < a3)
  {
    v3 = 0;
    return v3;
  }
  v5 = self;
  objc_sync_enter(v5);
  instructions = v5->_instructions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](instructions, "objectForKeyedSubscript:", v7);
  v3 = (id *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_sync_exit(v5);
LABEL_5:

    return v3;
  }
  if (!v5->_instructions)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
    v9 = v5->_instructions;
    v5->_instructions = (NSMutableDictionary *)v8;

  }
  v10 = v5;
  v3 = (id *)objc_alloc_init((Class)objc_opt_self());
  objc_msgSend(v10, "binary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v3 + 3, v11);

  objc_storeWeak(v3 + 4, v10);
  v3[5] = (id)a3;
  v12 = v5->_instructions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v3, v13);

  objc_sync_exit(v10);
  -[SAInstruction checkForNewSymbol]((unint64_t *)v3);
  if (!v3[2])
  {
    WeakRetained = (SASegment *)objc_loadWeakRetained(v10 + 6);
    v5 = WeakRetained;
    if (WeakRetained)
      BYTE1(WeakRetained[1].super.isa) = 1;
    goto LABEL_5;
  }
  return v3;
}

- (int64_t)offsetIntoBinary
{
  return self->_offsetIntoBinary;
}

- (BOOL)isEmpty
{
  id *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  if (objc_msgSend(v1[7], "count"))
    v2 = 0;
  else
    v2 = objc_msgSend(v1[1], "count") == 0;
  objc_sync_exit(v1);

  return v2;
}

+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a2;
  v8 = (objc_class *)objc_opt_self();
  v9 = v6;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("__TEXT")))
    v10 = 0;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithBinary:name:length:offsetIntoBinary:", v7, v9, a4, v10);

  return v11;
}

- (BOOL)hasOffsetIntoBinary
{
  return self->_offsetIntoBinary != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(void *)a1
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  const char *ClassName;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  unint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = a1;
  objc_sync_enter(v3);
  if (!a2)
  {
LABEL_31:
    v43 = *__error();
    _sa_logt();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "debugDescription");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = objc_msgSend(v45, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v76 = v46;
      _os_log_error_impl(&dword_1B9BE0000, v44, OS_LOG_TYPE_ERROR, "%s: setting length 0", buf, 0xCu);

    }
    *__error() = v43;
    objc_msgSend(v3, "debugDescription");
    a2 = (unint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = objc_msgSend((id)a2, "UTF8String");
    _SASetCrashLogMessage(151, "%s: setting length 0", v48, v49, v50, v51, v52, v53, v47);

    _os_crash();
    __break(1u);
    goto LABEL_34;
  }
  if (v3[3])
  {
LABEL_34:
    v54 = *__error();
    _sa_logt();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "debugDescription");
      v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v57 = objc_msgSend(v56, "UTF8String");
      v58 = v3[3];
      *(_DWORD *)buf = 136315650;
      v76 = v57;
      v77 = 2048;
      v78 = a2;
      v79 = 2048;
      v80 = (uint64_t)v58;
      _os_log_error_impl(&dword_1B9BE0000, v55, OS_LOG_TYPE_ERROR, "%s: setting length to %llu when it was already %llu", buf, 0x20u);

    }
    *__error() = v54;
    objc_msgSend(v3, "debugDescription");
    v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v60 = objc_msgSend(v59, "UTF8String");
    _SASetCrashLogMessage(152, "%s: setting length to %llu when it was already %llu", v61, v62, v63, v64, v65, v66, v60);

    _os_crash();
    __break(1u);
    goto LABEL_37;
  }
  v3[3] = (id)a2;
  if (a2 >> 28)
  {
LABEL_37:
    v67 = *__error();
    _sa_logt();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "debugDescription");
      v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v70 = objc_msgSend(v69, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v76 = v70;
      v77 = 2048;
      v78 = a2;
      _os_log_fault_impl(&dword_1B9BE0000, v68, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);

    }
    *__error() = v67;
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v3[7], "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v72;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v72 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        if (objc_msgSend(v8, "unsignedLongLongValue") >= (unint64_t)v3[3])
        {
          objc_msgSend(v3[7], "objectForKeyedSubscript:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (id *)v9;
          if (v9)
          {
            v11 = *(id *)(v9 + 8);
            if (v11)
            {
              v12 = v11;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v12, "firstObject");
                v13 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_28;
                v13 = v12;
              }
              v14 = v13;
              v15 = objc_msgSend(v13, "length") == 0;

              if (!v15)
              {
                v16 = *__error();
                _sa_logt();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v3, "debugDescription");
                  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v19 = objc_msgSend(v18, "UTF8String");
                  v20 = v3[3];
                  v21 = objc_msgSend(v8, "unsignedLongLongValue");
                  objc_msgSend(v10, "debugDescription");
                  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v23 = objc_msgSend(v22, "UTF8String");
                  *(_DWORD *)buf = 136315906;
                  v76 = v19;
                  v77 = 2048;
                  v78 = (unint64_t)v20;
                  v79 = 2048;
                  v80 = v21;
                  v81 = 2080;
                  v82 = v23;
                  _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "%s: setting length to %llu when we have a symbol at offset %llu: %s", buf, 0x2Au);

                }
                *__error() = v16;
                objc_msgSend(v3, "debugDescription");
                v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v25 = objc_msgSend(v24, "UTF8String");
                v12 = v3[3];
                objc_msgSend(v8, "unsignedLongLongValue");
                objc_msgSend(v10, "debugDescription");
                v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v26, "UTF8String");
                _SASetCrashLogMessage(166, "%s: setting length to %llu when we have a symbol at offset %llu: %s", v27, v28, v29, v30, v31, v32, v25);

                _os_crash();
                __break(1u);
LABEL_28:
                v33 = *__error();
                _sa_logt();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  ClassName = object_getClassName(v12);
                  *(_DWORD *)buf = 136315138;
                  v76 = (uint64_t)ClassName;
                  _os_log_error_impl(&dword_1B9BE0000, v34, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
                }

                *__error() = v33;
                v36 = object_getClassName(v12);
                _SASetCrashLogMessage(4143, "symbol is %s", v37, v38, v39, v40, v41, v42, v36);
                _os_crash();
                __break(1u);
                goto LABEL_31;
              }
            }
            objc_storeWeak(v10 + 3, 0);
            objc_storeWeak(v10 + 4, 0);
          }
          objc_msgSend(v3[7], "setObject:forKeyedSubscript:", 0, v8);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_sync_exit(v3);
}

- (void)grabInstructionsFromOtherSegment:(id *)a1
{
  id *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  id Property;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void *v62;
  BOOL v63;
  const char *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  int v80;
  NSObject *v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  const char *v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  int v103;
  NSObject *v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  char v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  void *v121;
  id v122;
  id obj;
  id v124;
  id v125;
  id *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  id v133;
  char v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD v160[6];
  _QWORD v161[6];
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint8_t buf[4];
  uint64_t v167;
  __int16 v168;
  uint64_t v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  uint64_t v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v126 = v3;
    v5 = objc_loadWeakRetained(v3 + 6);

    if (WeakRetained != v5)
    {
      v103 = *__error();
      _sa_logt();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "debugDescription");
        v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v106 = objc_msgSend(v105, "UTF8String");
        objc_msgSend(v126, "debugDescription");
        v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315394;
        v167 = v106;
        v168 = 2080;
        v169 = objc_msgSend(v107, "UTF8String");
        _os_log_error_impl(&dword_1B9BE0000, v104, OS_LOG_TYPE_ERROR, "%s grabbing from %s", buf, 0x16u);

      }
      *__error() = v103;
      objc_msgSend(a1, "debugDescription");
      v108 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v109 = objc_msgSend(v108, "UTF8String");
      objc_msgSend(v126, "debugDescription");
      v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v110, "UTF8String");
      _SASetCrashLogMessage(186, "%s grabbing from %s", v111, v112, v113, v114, v115, v116, v109);

      _os_crash();
      __break(1u);
    }
    v3 = v126;
    if (objc_msgSend(a1, "hasOffsetIntoBinary"))
    {
      if (objc_msgSend(v126, "hasOffsetIntoBinary")
        && (objc_msgSend(v126[7], "count") || objc_msgSend(v126[1], "count")))
      {
        v6 = objc_msgSend(v126, "offsetIntoBinary");
        v7 = a1;
        objc_sync_enter(v7);
        objc_msgSend(v126[7], "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sortedArrayUsingSelector:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v164 = 0u;
        v165 = 0u;
        v162 = 0u;
        v163 = 0u;
        obj = v9;
        v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v179, 16);
        if (v137)
        {
          v133 = *(id *)v163;
          do
          {
            for (i = 0; i != v137; ++i)
            {
              if (*(id *)v163 != v133)
                objc_enumerationMutation(obj);
              v11 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
              v12 = objc_msgSend(v11, "unsignedLongLongValue") + v6;
              v13 = v7[5];
              v14 = v12 - (_QWORD)v13;
              if (v12 >= (uint64_t)v13)
              {
                if (v12 >= (uint64_t)v13 + (uint64_t)v7[3])
                  goto LABEL_27;
                objc_msgSend(v126[7], "objectForKeyedSubscript:", v11);
                v15 = objc_claimAutoreleasedReturnValue();
                v16 = v7[7];
                if (!v16)
                {
                  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v126[7], "count"));
                  v18 = v7[7];
                  v7[7] = (id)v17;

                  v16 = v7[7];
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  v21 = *__error();
                  _sa_logt();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v7, "debugDescription");
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "debugDescription");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v15, "debugDescription");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v167 = (uint64_t)v131;
                    v168 = 2112;
                    v169 = (uint64_t)v23;
                    v170 = 2112;
                    v171 = (uint64_t)v24;
                    _os_log_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: %@: have existing instruction %@ when grabbing %@, dropping grabbed instruction", buf, 0x20u);

                  }
                  *__error() = v21;
                  if (v15)
                  {
                    objc_storeWeak((id *)(v15 + 32), 0);
                    objc_storeWeak((id *)(v15 + 24), 0);
                  }
                }
                else
                {
                  if (v15)
                  {
                    objc_storeWeak((id *)(v15 + 32), v7);
                    *(_QWORD *)(v15 + 40) = v14;
                  }
                  v25 = v7[7];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:forKeyedSubscript:", v15, v26);

                }
                objc_msgSend(v126[7], "setObject:forKeyedSubscript:", 0, v11);

              }
            }
            v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v179, 16);
          }
          while (v137);
        }
LABEL_27:

        v27 = v126[1];
        if (v27)
        {
          v28 = MEMORY[0x1E0C809B0];
          v161[0] = MEMORY[0x1E0C809B0];
          v161[1] = 3221225472;
          v161[2] = __46__SASegment_grabInstructionsFromOtherSegment___block_invoke;
          v161[3] = &unk_1E7147ED8;
          v161[5] = v6;
          v161[4] = v7;
          v29 = SABinarySearchArray(v27, 1280, (uint64_t)v161);
          v30 = v126[1];
          v160[0] = v28;
          v160[1] = 3221225472;
          v160[2] = __46__SASegment_grabInstructionsFromOtherSegment___block_invoke_2;
          v160[3] = &unk_1E7147ED8;
          v160[5] = v6;
          v160[4] = v7;
          v31 = SABinarySearchArray(v30, 1280, (uint64_t)v160);
          if (v29 < objc_msgSend(v126[1], "count"))
          {
            if (v31)
            {
              v32 = v31 - v29;
              objc_msgSend(v126[1], "subarrayWithRange:", v29, v32);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126[1], "removeObjectsInRange:", v29, v32);
              if (v7[1])
              {
                v158 = 0u;
                v159 = 0u;
                v156 = 0u;
                v157 = 0u;
                v33 = v121;
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v156, v178, 16);
                if (!v34)
                  goto LABEL_84;
                v124 = v33;
                v35 = 0;
                v127 = *(_QWORD *)v157;
                while (1)
                {
                  v138 = 0;
                  v129 = v34;
                  do
                  {
                    if (*(_QWORD *)v157 != v127)
                      objc_enumerationMutation(v124);
                    v36 = *(_QWORD **)(*((_QWORD *)&v156 + 1) + 8 * v138);
                    v37 = objc_msgSend(v36, "offsetIntoSegment");
                    v38 = objc_msgSend(v36, "length");
                    v40 = v37 + v6;
                    v41 = v7[5];
                    v42 = (uint64_t)v41 + (_QWORD)v7[3];
                    if (v38 + v37 + v6 <= v42)
                    {
                      v43 = v40 - (_QWORD)v41;
                      if (v36)
                        goto LABEL_40;
                    }
                    else
                    {
                      if (v36)
                      {
                        v36[2] = v42 - v40;
                        v43 = v40 - (_QWORD)v7[5];
LABEL_40:
                        v36[1] = v43;
                        v154 = 0u;
                        v155 = 0u;
                        v152 = 0u;
                        v153 = 0u;
                        Property = objc_getProperty(v36, v39, 32, 1);
                        v134 = 0;
                        goto LABEL_41;
                      }
                      v43 = v40 - (_QWORD)v41;
                    }
                    Property = 0;
                    v154 = 0u;
                    v155 = 0u;
                    v134 = 1;
                    v152 = 0u;
                    v153 = 0u;
LABEL_41:
                    v45 = Property;
                    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v152, v177, 16);
                    if (v46)
                    {
                      v47 = *(_QWORD *)v153;
                      do
                      {
                        for (j = 0; j != v46; ++j)
                        {
                          if (*(_QWORD *)v153 != v47)
                            objc_enumerationMutation(v45);
                          v49 = *(_QWORD **)(*((_QWORD *)&v152 + 1) + 8 * j);
                          v50 = objc_msgSend(v49, "offsetIntoSegment");
                          if (v49)
                            v49[2] = v50 + v6 - (_QWORD)v7[5];
                        }
                        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v152, v177, 16);
                      }
                      while (v46);
                    }

                    while (v35 < objc_msgSend(v7[1], "count"))
                    {
                      objc_msgSend(v7[1], "objectAtIndexedSubscript:", v35);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      v52 = objc_msgSend(v51, "offsetIntoSegment") < v43;

                      if (!v52)
                        break;
                      ++v35;
                    }
                    objc_msgSend(v7[1], "objectAtIndexedSubscript:", v35);
                    v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                    v54 = objc_msgSend(v53, "offsetIntoSegment");
                    if (v54 == v43)
                    {
                      if (objc_msgSend(v36, "length"))
                      {
                        if (!objc_msgSend(v53, "length")
                          || (v55 = objc_msgSend(v36, "length"), v55 < objc_msgSend(v53, "length")))
                        {
                          v56 = objc_msgSend(v36, "length");
                          if (v53)
                            v53[2] = v56;
                        }
                      }
                      objc_msgSend(v53, "name");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v57)
                      {

                      }
                      else
                      {
                        objc_msgSend(v36, "name");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        v63 = v62 == 0;

                        if (!v63)
                        {
                          objc_msgSend(v36, "name");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v53)
                            objc_setProperty_atomic_copy(v53, v64, v65, 24);

                        }
                      }
                    }
                    else
                    {
                      if (v35)
                      {
                        objc_msgSend(v7[1], "objectAtIndexedSubscript:", v35 - 1);
                        v58 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                        v59 = objc_msgSend(v58, "offsetIntoSegment");
                        if (v43 < objc_msgSend(v58, "length") + v59)
                        {
                          v60 = objc_msgSend(v58, "offsetIntoSegment");
                          if (v58)
                            v58[2] = v43 - v60;
                        }

                      }
                      if (objc_msgSend(v36, "length") + v43 <= v54)
                        v61 = 1;
                      else
                        v61 = v134;
                      if ((v61 & 1) == 0)
                        v36[2] = v54 - v43;
                      objc_msgSend(v7[1], "insertObject:atIndex:", v36, v35++);
                    }

                    ++v138;
                  }
                  while (v138 != v129);
                  v66 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v156, v178, 16);
                  v34 = v66;
                  if (!v66)
                  {
                    v33 = v124;
                    goto LABEL_84;
                  }
                }
              }
              v67 = objc_msgSend(v121, "mutableCopy");
              v33 = v7[1];
              v7[1] = (id)v67;
LABEL_84:

              v150 = 0u;
              v151 = 0u;
              v148 = 0u;
              v149 = 0u;
              objc_msgSend(v126[2], "allKeys");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "sortedArrayUsingSelector:", sel_compare_);
              v122 = (id)objc_claimAutoreleasedReturnValue();

              v69 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v148, v176, 16);
              if (v69)
              {
                v125 = *(id *)v149;
                do
                {
                  v132 = 0;
                  v139 = v69;
                  do
                  {
                    if (*(id *)v149 != v125)
                      objc_enumerationMutation(v122);
                    v130 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v132);
                    v70 = objc_msgSend(v130, "unsignedLongLongValue") + v6;
                    v71 = v7[5];
                    if (v70 >= (uint64_t)v71)
                    {
                      if (v70 >= (uint64_t)v71 + (uint64_t)v7[3])
                        goto LABEL_121;
                      objc_msgSend(v126[2], "objectForKeyedSubscript:", v130);
                      v128 = (void *)objc_claimAutoreleasedReturnValue();
                      v72 = v7[5];
                      v73 = v7[2];
                      if (!v73)
                      {
                        v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
                        v75 = v7[2];
                        v7[2] = (id)v74;

                        v73 = v7[2];
                      }
                      v76 = v70 - (_QWORD)v72;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v70 - (_QWORD)v72);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "objectForKeyedSubscript:", v77);
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      v79 = v78 == 0;

                      if (v79)
                      {
                        v82 = v7[2];
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v76);
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v82, "setObject:forKeyedSubscript:", v128, v83);

                        v146 = 0u;
                        v147 = 0u;
                        v144 = 0u;
                        v145 = 0u;
                        v135 = v128;
                        v84 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v144, v175, 16);
                        if (v84)
                        {
                          v85 = *(_QWORD *)v145;
                          do
                          {
                            v86 = 0;
                            do
                            {
                              if (*(_QWORD *)v145 != v85)
                                objc_enumerationMutation(v135);
                              v87 = *(_QWORD **)(*((_QWORD *)&v144 + 1) + 8 * v86);
                              v88 = objc_msgSend(v87, "offsetIntoSegment");
                              if (v87)
                              {
                                v87[1] = v88 + v6 - (_QWORD)v7[5];
                                v142 = 0u;
                                v143 = 0u;
                                v140 = 0u;
                                v141 = 0u;
                                v90 = objc_getProperty(v87, v89, 32, 1);
                              }
                              else
                              {
                                v90 = 0;
                                v142 = 0u;
                                v143 = 0u;
                                v140 = 0u;
                                v141 = 0u;
                              }
                              v91 = v90;
                              v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v140, v174, 16);
                              if (v92)
                              {
                                v93 = *(_QWORD *)v141;
                                do
                                {
                                  for (k = 0; k != v92; ++k)
                                  {
                                    if (*(_QWORD *)v141 != v93)
                                      objc_enumerationMutation(v91);
                                    v95 = *(_QWORD **)(*((_QWORD *)&v140 + 1) + 8 * k);
                                    v96 = objc_msgSend(v95, "offsetIntoSegment");
                                    if (v95)
                                      v95[2] = v96 + v6 - (_QWORD)v7[5];
                                  }
                                  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v140, v174, 16);
                                }
                                while (v92);
                              }

                              v69 = v139;
                              ++v86;
                            }
                            while (v86 != v84);
                            v97 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v144, v175, 16);
                            v84 = v97;
                          }
                          while (v97);
                        }

                      }
                      else
                      {
                        v80 = *__error();
                        _sa_logt();
                        v81 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v7, "debugDescription");
                          v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                          v119 = objc_msgSend(v98, "UTF8String");
                          v118 = objc_msgSend(v128, "count");
                          -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v7, v76);
                          v136 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v136, "debugDescription");
                          v120 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                          v117 = objc_msgSend(v120, "UTF8String");
                          v99 = v7[2];
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v76);
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v99, "objectForKeyedSubscript:", v100);
                          v101 = (void *)objc_claimAutoreleasedReturnValue();
                          v102 = objc_msgSend(v101, "count");
                          *(_DWORD *)buf = 136315906;
                          v167 = v119;
                          v168 = 2048;
                          v169 = v118;
                          v170 = 2080;
                          v171 = v117;
                          v172 = 2048;
                          v173 = v102;
                          _os_log_debug_impl(&dword_1B9BE0000, v81, OS_LOG_TYPE_DEBUG, "%s: throwing out %lu duplicate inline symbols for %s (already have %lu)", buf, 0x2Au);

                        }
                        *__error() = v80;
                      }
                      objc_msgSend(v126[2], "setObject:forKeyedSubscript:", 0, v130);

                    }
                    ++v132;
                  }
                  while (v132 != v69);
                  v69 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v148, v176, 16);
                }
                while (v69);
              }
LABEL_121:

            }
          }
        }

        objc_sync_exit(v7);
        v3 = v126;
      }
    }
  }

}

uint64_t __46__SASegment_grabInstructionsFromOtherSegment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 40) + objc_msgSend(a2, "offsetIntoSegment");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v5 = v4 <= v3;
  if (v4 >= v3)
    v6 = 0;
  else
    v6 = -1;
  if (v5)
    return v6;
  else
    return 1;
}

uint64_t __46__SASegment_grabInstructionsFromOtherSegment___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 40) + objc_msgSend(a2, "offsetIntoSegment");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v5 = v4 <= v3;
  if (v4 >= v3)
    v6 = 0;
  else
    v6 = -1;
  if (v5)
    return v6;
  else
    return 1;
}

void __32__SASegment_addTailspinSymbols___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  uint8_t v22[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[7];
  uint64_t v28;
  uint8_t v29[128];
  __int128 buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v28 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v5);
    if ((objc_msgSend(v7, "scanUnsignedLongLong:", &v28) & 1) == 0)
    {
      v17 = *__error();
      _sa_logt();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "Unable to parse offset %@", (uint8_t *)&buf, 0xCu);
      }

      *__error() = v17;
      goto LABEL_30;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = *__error();
      _sa_logt();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "Bad offset in tailspin file", (uint8_t *)&buf, 2u);
      }

      v16 = __error();
      goto LABEL_25;
    }
    v28 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = *__error();
    _sa_logt();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "Bad symbol dict in tailspin file", (uint8_t *)&buf, 2u);
    }

    v16 = __error();
LABEL_25:
    *v16 = v14;
    goto LABEL_30;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x2020000000;
  v32 = -1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __32__SASegment_addTailspinSymbols___block_invoke_33;
  v27[3] = &unk_1E7147F00;
  v27[5] = &buf;
  v27[6] = v28;
  v27[4] = *(_QWORD *)(a1 + 32);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCCC450](v27);
  ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v6, 0);
  DictGetArray(v6, CFSTR("InlineSymbols"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = *__error();
          _sa_logt();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v22 = 0;
            _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "Bad inline symbol dict in tailspin file", v22, 2u);
          }

          *__error() = v20;
          goto LABEL_29;
        }
        v8[2](v8, v13, 1);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_29:

  _Block_object_dispose(&buf, 8);
LABEL_30:

}

void __32__SASegment_addTailspinSymbols___block_invoke_33(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  unint64_t v22;
  id v23;
  id v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  DictGetString(v5, CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DictGetNumber(v5, CFSTR("Offset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  DictGetNumber(v5, CFSTR("Length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  if (v8)
    v11 = 0;
  else
    v11 = v6 == 0;
  if (v11)
    goto LABEL_14;
  v12 = *(_QWORD *)(a1 + 48) - v8;
  if (!a3)
  {
    -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(_QWORD **)(a1 + 32), v12, v10, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;
    goto LABEL_9;
  }
  if (v6)
  {
    -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](*(void **)(a1 + 32), v12, v10, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    DictGetString(v5, CFSTR("FileName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      DictGetNumber(v5, CFSTR("SourceOffset"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v15, "unsignedLongLongValue");

      DictGetNumber(v5, CFSTR("SourceLength"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedLongLongValue");

      DictGetNumber(v5, CFSTR("LineNumber"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedIntValue");

      DictGetNumber(v5, CFSTR("ColNumber"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntValue");

      v22 = *(_QWORD *)(a1 + 48) - v30;
      if (a3)
        v23 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v22, v17, v19, v21, v14);
      else
        v24 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v22, v17, v19, v21, v14);
    }

    goto LABEL_14;
  }
  v25 = *__error();
  _sa_logt();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "debugDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v28;
    v33 = 2112;
    v34 = v29;
    _os_log_error_impl(&dword_1B9BE0000, v26, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", buf, 0x16u);

  }
  *__error() = v25;
LABEL_14:

}

- (id)addInlineSymbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:(unint64_t)a5 nonInlineSymbolOffsetIntoSegment:
{
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v25;
  BOOL v26;
  const char *v27;
  char v28;
  int v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  char v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id newValue;
  _QWORD v46[6];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  newValue = a4;
  if (!a1)
  {
LABEL_27:
    v20 = 0;
    goto LABEL_18;
  }
  if (!a3)
  {
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "debugDescription");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v31, "UTF8String");
      -[SASegment nonInlineSymbolAtOffsetIntoSegment:](a1, a5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "debugDescription");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136316162;
      v48 = v32;
      v49 = 2080;
      v50 = objc_msgSend(v34, "UTF8String");
      v51 = 2080;
      v52 = objc_msgSend(objc_retainAutorelease(newValue), "UTF8String");
      v53 = 2048;
      v54 = a2;
      v55 = 2048;
      v56 = a2;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "%s: inlining into %s: %s (0x%llx-0x%llx) with length 0", buf, 0x34u);

    }
    *__error() = v29;
    objc_msgSend(a1, "debugDescription");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = objc_msgSend(v35, "UTF8String");
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:](a1, a5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "debugDescription");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v38, "UTF8String");
    objc_msgSend(objc_retainAutorelease(newValue), "UTF8String");
    _SASetCrashLogMessage(481, "%s: inlining into %s: %s (0x%llx-0x%llx) with length 0", v39, v40, v41, v42, v43, v44, v36);

    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  v9 = a1;
  objc_sync_enter(v9);
  v10 = (void *)v9[2];
  if (!v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v12 = (void *)v9[2];
    v9[2] = v11;

    v10 = (void *)v9[2];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v9[2];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  }
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __95__SASegment_addInlineSymbolWithOffsetIntoSegment_length_name_nonInlineSymbolOffsetIntoSegment___block_invoke;
  v46[3] = &__block_descriptor_48_e18_q16__0__SASymbol_8l;
  v46[4] = a2;
  v46[5] = a3;
  v17 = SABinarySearchArray(v14, 1536, (uint64_t)v46);
  v18 = v17;
  if (v17)
  {
    v19 = v17 - 1;
    while (1)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "offsetIntoSegment") != a2 || objc_msgSend(v20, "length") != a3)
      {

        goto LABEL_16;
      }
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        break;
      objc_msgSend(v20, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", newValue);

      if (v23)
        break;

      if (--v19 == -1)
        goto LABEL_16;
    }
    objc_msgSend(v20, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 != 0;

    if (v20)
      v28 = v26;
    else
      v28 = 1;
    if ((v28 & 1) == 0)
      objc_setProperty_atomic_copy(v20, v27, newValue, 24);
  }
  else
  {
LABEL_16:
    +[SASymbol symbolWithOffsetIntoSegment:length:name:]((uint64_t)SASymbol, a2, a3, newValue);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertObject:atIndex:", v20, v18);
  }

  objc_sync_exit(v9);
LABEL_18:

  return v20;
}

- (_QWORD)addNonInlineSymbolWithOffsetIntoSegment:(unint64_t)a3 length:(void *)a4 name:
{
  id v7;
  _QWORD *v8;
  id *v9;
  id v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];

  v7 = a4;
  if (a1 && a1[3] - 1 >= a2)
  {
    v9 = a1;
    objc_sync_enter(v9);
    v10 = v9[1];
    if (!v10)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
      v12 = v9[1];
      v9[1] = (id)v11;

      v10 = v9[1];
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__SASegment_addNonInlineSymbolWithOffsetIntoSegment_length_name___block_invoke;
    v20[3] = &__block_descriptor_40_e18_q16__0__SASymbol_8l;
    v20[4] = a2;
    v13 = SABinarySearchArray(v10, 1280, (uint64_t)v20);
    if (v13 < objc_msgSend(v9[1], "count"))
    {
      objc_msgSend(v9[1], "objectAtIndexedSubscript:", v13);
      v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "offsetIntoSegment") == a2)
      {
        if (a3 && (!objc_msgSend(v8, "length") || objc_msgSend(v8, "length") > a3) && v8)
          v8[2] = a3;
        objc_msgSend(v8, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 && !v14 && v8)
          objc_setProperty_atomic_copy(v8, v15, v7, 24);
LABEL_26:
        objc_sync_exit(v9);

        goto LABEL_27;
      }
      if (objc_msgSend(v8, "offsetIntoSegment") < a3 + a2)
        a3 = objc_msgSend(v8, "offsetIntoSegment") - a2;

    }
    if (v13)
    {
      objc_msgSend(v9[1], "objectAtIndexedSubscript:", v13 - 1);
      v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "offsetIntoSegment");
      if (objc_msgSend(v16, "length") + v17 > a2)
      {
        v18 = objc_msgSend(v16, "offsetIntoSegment");
        if (v16)
          v16[2] = a2 - v18;
      }

    }
    +[SASymbol symbolWithOffsetIntoSegment:length:name:]((uint64_t)SASymbol, a2, a3, v7);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[1], "insertObject:atIndex:", v8, v13);
    goto LABEL_26;
  }
  v8 = 0;
LABEL_27:

  return v8;
}

uint64_t __95__SASegment_addInlineSymbolWithOffsetIntoSegment_length_name_nonInlineSymbolOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL8 v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "offsetIntoSegment");
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 <= v4)
  {
    if (v5 >= v4)
    {
      v7 = objc_msgSend(v3, "length");
      v8 = *(_QWORD *)(a1 + 40);
      v9 = v8 > v7;
      v10 = v8 < v7;
      if (v9)
        v6 = -1;
      else
        v6 = v10;
    }
    else
    {
      v6 = -1;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __65__SASegment_addNonInlineSymbolWithOffsetIntoSegment_length_name___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = objc_msgSend(a2, "offsetIntoSegment");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v4 > v3;
  if (v4 >= v3)
    v6 = 0;
  else
    v6 = -1;
  if (v5)
    return 1;
  else
    return v6;
}

unint64_t __34__SASegment_addInfoFromCSSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t Range;
  unint64_t v7;
  unint64_t v8;
  void *Name;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  Range = CSSymbolGetRange();
  v8 = v7;
  Name = (void *)CSSymbolGetName();
  v10 = Range - *(_QWORD *)(a1 + 40);
  if (!Name)
  {
    if (a4 != -1)
      goto LABEL_7;
    v12 = 0;
LABEL_11:
    -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(_QWORD **)(a1 + 32), v10, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_5;
    goto LABEL_12;
  }
  SANSStringForCString(Name);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4 == -1)
    goto LABEL_11;
  if (v11)
  {
    -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](*(void **)(a1 + 32), v10, v8, v11, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_5:
      v14 = 0;
      goto LABEL_13;
    }
LABEL_12:
    v14 = v13;
    CSSymbolForeachSourceInfo();

    goto LABEL_13;
  }
LABEL_7:
  v15 = *__error();
  _sa_logt();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 32), a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v19;
    v23 = 2112;
    v24 = v20;
    _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", buf, 0x16u);

  }
  v12 = 0;
  v14 = 0;
  v10 = 0;
  *__error() = v15;
LABEL_13:

  return v10;
}

void __34__SASegment_addInfoFromCSSegment___block_invoke_41(_QWORD *a1)
{
  void *Path;
  void *v3;
  int LineNumber;
  int Column;
  uint64_t Range;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;

  Path = (void *)CSSourceInfoGetPath();
  if (Path)
  {
    SANSStringForCString(Path);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v13 = v3;
      LineNumber = CSSourceInfoGetLineNumber();
      Column = CSSourceInfoGetColumn();
      Range = CSSourceInfoGetRange();
      v8 = v7;
      v9 = (void *)a1[4];
      v10 = Range - a1[5];
      if (a1[7] == -1)
        v12 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v10, v8, LineNumber, Column, v13);
      else
        v11 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v10, v8, LineNumber, Column, v13);
      v3 = v13;
    }

  }
}

void __34__SASegment_addInfoFromCSSegment___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  CSSymbolForeachInlineRange();

}

uint64_t __34__SASegment_addInfoFromCSSegment___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a6)
  {
    v8 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    v9 = a6 - 1;
    if (v9)
    {
      v10 = a4 + 24;
      do
      {
        result = CSSymbolIsUnnamed();
        if ((result & 1) == 0)
          result = (*(uint64_t (**)(void))(*(_QWORD *)(v8 + 32) + 16))();
        v10 += 16;
        --v9;
      }
      while (v9);
    }
  }
  return result;
}

- (void)symbolicateOffsetIntoSegment:(uint64_t)a3 symbolOwner:(uint64_t)a4 segmentBaseAddress:(uint64_t)a5 returningSymbols:(id *)a6 sourceInfos:(id *)a7
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  if (a1)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__2;
    v37 = __Block_byref_object_dispose__2;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2;
    v31 = __Block_byref_object_dispose__2;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = 0;
    v8 = a1;
    objc_sync_enter(v8);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    CSSymbolOwnerForEachStackFrameAtAddress();
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    objc_sync_exit(v8);

    v9 = (void *)v28[5];
    if (!v9)
      v9 = (void *)v34[5];
    objc_storeStrong(a6, v9);
    v10 = (void *)v16[5];
    if (!v10)
      v10 = (void *)v22[5];
    objc_storeStrong(a7, v10);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }
}

void __102__SASegment_symbolicateOffsetIntoSegment_symbolOwner_segmentBaseAddress_returningSymbols_sourceInfos___block_invoke(uint64_t a1)
{
  void *Name;
  uint64_t Range;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t Path;
  void *v13;
  int LineNumber;
  int Column;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((CSIsNull() & 1) == 0
    && (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) || (CSSymbolIsUnnamed() & 1) == 0))
  {
    Name = (void *)CSSymbolGetName();
    Range = CSSymbolGetRange();
    v5 = v4;
    v6 = Range - *(_QWORD *)(a1 + 88);
    if (Name)
    {
      SANSStringForCString(Name);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0)
      {
        if (v7)
        {
          -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](*(void **)(a1 + 32), v6, v5, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_20;
LABEL_15:
          if ((CSIsNull() & 1) != 0 || (Path = CSSourceInfoGetPath()) == 0)
          {
            v21 = 0;
          }
          else
          {
            v13 = (void *)Path;
            LineNumber = CSSourceInfoGetLineNumber();
            Column = CSSourceInfoGetColumn();
            SANSStringForCString(v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = CSSourceInfoGetRange();
            if (v16)
            {
              v19 = v18;
              v20 = v17 - *(_QWORD *)(a1 + 88);
              if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1)
                -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v20, v19, LineNumber, Column, v16);
              else
                -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v20, v19, LineNumber, Column, v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v21 = 0;
            }

          }
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v25 = *(void **)(v22 + 40);
          v23 = (id *)(v22 + 40);
          v24 = v25;
          if (!v25)
          {
            objc_storeStrong(v23, v9);
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v21);
            goto LABEL_52;
          }
          v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          if (v26)
          {
            if (!objc_msgSend(v26, "count"))
            {
LABEL_34:
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v9);
              v30 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
              v31 = *(void **)(v30 + 40);
              if (v21)
              {
                objc_msgSend(*(id *)(v30 + 40), "addObject:", v21);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v42);

                v21 = 0;
              }
              goto LABEL_52;
            }
            v27 = 0;
            while (1)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v9 == v28)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "objectAtIndexedSubscript:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21 == v29)
                {
                  v43 = *__error();
                  _sa_logt();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
LABEL_54:
                    objc_msgSend(v9, "debugDescription");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "debugDescription");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v51 = v48;
                    v52 = 2112;
                    v53 = v49;
                    _os_log_error_impl(&dword_1B9BE0000, v44, OS_LOG_TYPE_ERROR, "Same symbol/source info showed up twice in inlining: %@ %@", buf, 0x16u);

                  }
LABEL_51:

                  *__error() = v43;
                  goto LABEL_52;
                }
              }
              else
              {

              }
              if (++v27 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))goto LABEL_34;
            }
          }
          if (v9 == v24 && v21 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {
            v43 = *__error();
            _sa_logt();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              goto LABEL_54;
            goto LABEL_51;
          }
          v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9, 0);
          v33 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v34 = *(void **)(v33 + 40);
          *(_QWORD *)(v33 + 40) = v32;

          v35 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          v37 = v36;
          if (!v36)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v38 = v21;
          if (!v21)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v39 = objc_msgSend(v35, "initWithObjects:", v37, v38, 0);
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v41 = *(void **)(v40 + 40);
          *(_QWORD *)(v40 + 40) = v39;

          if (!v21)
          if (!v36)

LABEL_52:
          goto LABEL_53;
        }
LABEL_10:
        v10 = *__error();
        _sa_logt();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "debugDescription");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "debugDescription");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = v46;
          v52 = 2112;
          v53 = v47;
          _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", buf, 0x16u);

        }
        v8 = 0;
        *__error() = v10;
        goto LABEL_20;
      }
    }
    else
    {
      if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0)
        goto LABEL_10;
      v8 = 0;
    }
    -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(_QWORD **)(a1 + 32), v6, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
    if (!v9)
    {
LABEL_20:

      return;
    }
    goto LABEL_15;
  }
LABEL_53:
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (uint64_t)baseAddressInSymbolOwnerWrapper:(void *)a1
{
  _BYTE *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t Range;
  int v11;
  NSObject *v12;
  void *v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  int v20;
  int v21;
  int v22;
  char *v23;
  void *v24;
  const unsigned __int8 *CFUUIDBytes;
  unsigned int v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  char *v31;
  _QWORD v32[6];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  char *v38;
  _BYTE v39[24];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = -[SACSSymbolOwnerWrapper symbolOwner]((uint64_t)v3);
    v7 = v6;
    if ((v3[8] & 1) != 0 && objc_msgSend(v4, "hasOffsetIntoBinary"))
    {
      CSSymbolOwnerGetBaseAddress();
      objc_msgSend(v4, "offsetIntoBinary");
      CSSymbolOwnerGetSegmentWithAddress();
      if (CSIsNull())
      {
        v8 = *__error();
        _sa_logt();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "debugDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
          do
          {
            v26 = __ldxr(&uuid_string_index);
            v27 = v26 + 1;
          }
          while (__stxr(v27, &uuid_string_index));
          v19 = (-v27 & 0x80000000) != 0;
          v28 = -v27 & 3;
          v29 = v27 & 3;
          if (v19)
            v30 = v29;
          else
            v30 = -v28;
          v31 = &uuid_string_string[37 * v30];
          uuid_unparse(CFUUIDBytes, v31);
          *(_DWORD *)v39 = 138412546;
          *(_QWORD *)&v39[4] = v24;
          *(_WORD *)&v39[12] = 2080;
          *(_QWORD *)&v39[14] = v31;
          _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "%@: segment not found in %s", v39, 0x16u);

        }
        *__error() = v8;
        Range = -1;
      }
      else
      {
        Range = CSRegionGetRange();
      }
    }
    else
    {
      *(_QWORD *)v39 = 0;
      *(_QWORD *)&v39[8] = v39;
      *(_QWORD *)&v39[16] = 0x2020000000;
      v40 = -1;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __45__SASegment_baseAddressInSymbolOwnerWrapper___block_invoke;
      v32[3] = &unk_1E7148058;
      v32[4] = v4;
      v32[5] = v39;
      SASymbolOwnerForeachSegment(v5, v7, v32);
      Range = *(_QWORD *)(*(_QWORD *)&v39[8] + 24);
      if (Range == -1)
      {
        v11 = *__error();
        _sa_logt();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "debugDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v4[4];
          v16 = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
          do
          {
            v17 = __ldxr(&uuid_string_index);
            v18 = v17 + 1;
          }
          while (__stxr(v18, &uuid_string_index));
          v19 = (-v18 & 0x80000000) != 0;
          v20 = -v18 & 3;
          v21 = v18 & 3;
          if (v19)
            v22 = v21;
          else
            v22 = -v20;
          v23 = &uuid_string_string[37 * v22];
          uuid_unparse(v16, v23);
          *(_DWORD *)buf = 138412802;
          v34 = v14;
          v35 = 2112;
          v36 = v15;
          v37 = 2080;
          v38 = v23;
          _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%@: segment %@ not found in %s", buf, 0x20u);

        }
        *__error() = v11;
        Range = *(_QWORD *)(*(_QWORD *)&v39[8] + 24);
      }
      _Block_object_dispose(v39, 8);
    }
    objc_sync_exit(v4);

  }
  else
  {
    Range = 0;
  }

  return Range;
}

void __45__SASegment_baseAddressInSymbolOwnerWrapper___block_invoke(uint64_t a1)
{
  void *Name;
  void *v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == -1)
  {
    Name = (void *)CSRegionGetName();
    if (Name)
    {
      SANSStringForCString(Name);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CopyCleanSegmentName(v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CSRegionGetRange();

    }
  }
}

- (void)symbolicateWithSymbolOwnerWrapper:(void *)a1
{
  id v3;
  void *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1BCCCC288]();
    v5 = a1;
    objc_sync_enter(v5);
    if (!objc_msgSend(v5[7], "count") || (v6 = -[SASegment baseAddressInSymbolOwnerWrapper:](v5, v3), v6 == -1))
    {
      objc_sync_exit(v5);

    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5[7], "count"));
      v8 = -[SACSSymbolOwnerWrapper symbolOwner]((uint64_t)v3);
      v9 = v5[7];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __47__SASegment_symbolicateWithSymbolOwnerWrapper___block_invoke;
      v24[3] = &unk_1E7148080;
      v24[4] = v5;
      v26 = v8;
      v27 = v10;
      v28 = v6;
      v11 = v7;
      v25 = v11;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v24);

      objc_sync_exit(v5);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v16, "objectAtIndexedSubscript:", 0, (_QWORD)v20);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v16, "count") < 3)
            {
              v19 = 0;
            }
            else
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[SAInstruction setSymbol:sourceinfo:](v17, v18, v19);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v13);
      }

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __47__SASegment_symbolicateWithSymbolOwnerWrapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (!v5 || !*((_QWORD *)v5 + 2))
  {
    v13 = 0;
    v14 = 0;
    -[SASegment symbolicateOffsetIntoSegment:symbolOwner:segmentBaseAddress:returningSymbols:sourceInfos:](*(void **)(a1 + 32), objc_msgSend(v12, "unsignedLongLongValue"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v14, &v13);
    v7 = v14;
    if (v14)
    {
      v8 = *(void **)(a1 + 40);
      v9 = objc_alloc(MEMORY[0x1E0C99D20]);
      v10 = v13;
      v11 = (void *)objc_msgSend(v9, "initWithObjects:", v6, v7, v13, 0);
      objc_msgSend(v8, "addObject:", v11);

    }
    else
    {
      v10 = v13;
    }

  }
}

uint64_t __48__SASegment_nonInlineSymbolAtOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 >= objc_msgSend(v3, "offsetIntoSegment"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = v6 > objc_msgSend(v3, "offsetIntoSegment");
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (NSString)debugDescription
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  objc_msgSend(WeakRetained, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)&self->_binary);
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ <%@> %@ (offset 0x%llx length 0x%llx, %lu symbols)"), v5, v8, self->_name, self->_offsetIntoBinary, self->_length, -[NSMutableArray count](self->_symbols, "count"));

  return (NSString *)v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (SABinary)binary
{
  return (SABinary *)objc_loadWeakRetained((id *)&self->_binary);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_destroyWeak((id *)&self->_binary);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inlineSymbols, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  name = self->_name;
  v8 = v4;
  if (name)
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("name"), name);
  if (self->_length)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v8, CFSTR("length"), v6);

  }
  if (-[SASegment hasOffsetIntoBinary](self, "hasOffsetIntoBinary"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_offsetIntoBinary);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v8, CFSTR("offsetIntoBinary"), v7);

  }
}

+ (id)classDictionaryKey
{
  return CFSTR("SASegment");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 114;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  const char *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SASegment sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") > a4)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[SASegment debugDescription](self, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v39 = objc_msgSend(v18, "UTF8String");
      v40 = 2048;
      v41 = a4;
      v42 = 2048;
      v43 = -[SASegment sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu > buffer length %lu", buf, 0x20u);

    }
    *__error() = v16;
    -[SASegment debugDescription](self, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    -[SASegment sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4923, "%s: size %lu > buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  if (!WeakRetained)
    goto LABEL_11;
  v10 = WeakRetained;
  *(_WORD *)&a3->var0 = 513;
  *(_QWORD *)&a3->var3[64] = self->_offsetIntoBinary;
  *(int64_t *)((char *)&a3->var4 + 2) = self->_length;
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v8);
  v11 = objc_loadWeakRetained((id *)&self->_binary);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v11, v8);

  -[NSString dataUsingEncoding:allowLossyConversion:](self->_name, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "length") >= 0x40)
  {
LABEL_8:
    v27 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = -[NSString UTF8String](self->_name, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v39 = (uint64_t)v29;
      v40 = 2048;
      v41 = 63;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "Segment %s longer than %lu characters", buf, 0x16u);
    }

    *__error() = v27;
    v30 = (char)-[NSString UTF8String](self->_name, "UTF8String");
    _SASetCrashLogMessage(4942, "Segment %s longer than %lu characters", v31, v32, v33, v34, v35, v36, v30);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Segment with no binary"), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v13 = objc_retainAutorelease(v12);
  memmove(a3->var3, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  a3->var3[objc_msgSend(v13, "length")] = 0;
  objc_msgSend(v10, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getUUIDBytes:", a3->var2);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
    objc_msgSend(WeakRetained, "addSelfToSerializationDictionary:", v7);

    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v7);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  unint64_t v27;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  id v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  NSObject *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint8_t buf[4];
  _BYTE v78[18];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_36;
  if (a4 <= 0x61)
  {
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v78 = a4;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = 98;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASegment struct %lu", buf, 0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(4965, "bufferLength %lu < serialized SASegment struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 2u)
    goto LABEL_9;
  if (a4 <= 0x71)
  {
LABEL_27:
    v49 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v78 = a4;
      *(_WORD *)&v78[8] = 2048;
      *(_QWORD *)&v78[10] = 114;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASegment v2 struct %lu", buf, 0x16u);
    }

    *__error() = v49;
    _SASetCrashLogMessage(4972, "bufferLength %lu < serialized SASegment v2 struct %lu", v50, v51, v52, v53, v54, v55, a4);
    _os_crash();
    __break(1u);
    goto LABEL_30;
  }
  v12 = *(_QWORD *)((char *)a3 + 98);
  v13 = (void *)objc_opt_class();
  SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, (void *)v9, v11, v13);
  a4 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)((char *)a3 + 106);
  v15 = (void *)objc_opt_class();
  SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, (void *)v9, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v9 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v78 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "No binary for segment %s", buf, 0xCu);
    }

    *__error() = v9;
    v17 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _SASetCrashLogMessage(4984, "No binary for segment %s", v18, v19, v20, v21, v22, v23, v17);
    _os_crash();
    __break(1u);
LABEL_9:
    a4 = gSASerializationEncodedVersionBeingDecoded();
    if (*(uint64_t *)a4 >= 31)
    {
LABEL_30:
      v56 = *__error();
      _sa_logt();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = *((unsigned __int8 *)a3 + 1);
        v59 = *(_QWORD *)a4;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v78 = v58;
        *(_WORD *)&v78[4] = 2048;
        *(_QWORD *)&v78[6] = v59;
        _os_log_error_impl(&dword_1B9BE0000, v57, OS_LOG_TYPE_ERROR, "segment version %d, but encoded version %ld", buf, 0x12u);
      }

      *__error() = v56;
      _SASetCrashLogMessage(4977, "segment version %d, but encoded version %ld", v60, v61, v62, v63, v64, v65, *((_BYTE *)a3 + 1));
      _os_crash();
      __break(1u);
      goto LABEL_33;
    }
    v24 = *(void **)gBinaryBeingDecoded(&gBinaryBeingDecoded);
    if (!v24)
    {
LABEL_33:
      v66 = *__error();
      _sa_logt();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v68 = *((unsigned __int8 *)a3 + 1);
        v69 = *(_QWORD *)a4;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v78 = v68;
        *(_WORD *)&v78[4] = 2048;
        *(_QWORD *)&v78[6] = v69;
        _os_log_error_impl(&dword_1B9BE0000, v67, OS_LOG_TYPE_ERROR, "Segment version %d, encoded version %ld, no gBinaryBeingDecoded", buf, 0x12u);
      }

      *__error() = v66;
      _SASetCrashLogMessage(4978, "Segment version %d, encoded version %ld, no gBinaryBeingDecoded", v70, v71, v72, v73, v74, v75, *((_BYTE *)a3 + 1));
      _os_crash();
      __break(1u);
LABEL_36:
      +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SASegment version"), 0);
      v76 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v76);
    }
    a4 = v24;
    SANSStringForCString((char *)a3 + 18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v16)
  {
LABEL_24:
    v37 = *__error();
    _sa_logt();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)a4, "debugDescription");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = objc_msgSend(v39, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v78 = v40;
      _os_log_error_impl(&dword_1B9BE0000, v38, OS_LOG_TYPE_ERROR, "No name for segment in %s", buf, 0xCu);

    }
    *__error() = v37;
    objc_msgSend((id)a4, "debugDescription");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "UTF8String");
    _SASetCrashLogMessage(4985, "No name for segment in %s", v43, v44, v45, v46, v47, v48, v42);

    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  -[SABinary segmentWithCleanName:]((void *)a4, v16);
  v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = v25;
    if (!objc_msgSend(v25, "length"))
    {
      v27 = *(_QWORD *)((char *)a3 + 90);
      if (v27)
        -[SASegment setLength:](v26, v27);
    }
    if ((objc_msgSend(v26, "hasOffsetIntoBinary") & 1) == 0)
      v26[5] = *(_QWORD *)((char *)a3 + 82);
  }
  else
  {
    +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]((uint64_t)SASegment, (void *)a4, v16, *(_QWORD *)((char *)a3 + 90), *(_QWORD *)((char *)a3 + 82));
    v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[SABinary addSegment:]((void *)a4, v26);
  }

  return v26;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = a5;
  v9 = a6;
  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (a4 <= 0x71)
    {
      v16 = *__error();
      _sa_logt();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v26 = a4;
        v27 = 2048;
        v28 = 114;
        _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASegment v2 struct %lu", buf, 0x16u);
      }

      *__error() = v16;
      _SASetCrashLogMessage(5007, "bufferLength %lu < serialized SASegment v2 struct %lu", v18, v19, v20, v21, v22, v23, a4);
      _os_crash();
      __break(1u);
    }
    v10 = *(_QWORD *)((char *)a3 + 98);
    v11 = (void *)objc_opt_class();
    v12 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v10, v24, v9, v11);
    v13 = *(_QWORD *)((char *)a3 + 106);
    v14 = (void *)objc_opt_class();
    v15 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v24, v9, v14);
  }

}

@end
