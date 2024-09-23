@implementation SAFrameIterator

- (void)setSharedCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setBacktracer:(unint64_t)a3
{
  self->_backtracer = a3;
}

- (void)setUserBinaryLoadInfos:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (SAFrameIterator)init
{
  SAFrameIterator *v2;
  SAFrame *v3;
  SAFrame *frame;
  SAExclaveFrame *v5;
  SAExclaveFrame *exclaveFrame;
  SAExclaveFrame *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SAFrameIterator;
  v2 = -[SAFrameIterator init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SAFrame);
    frame = v2->_frame;
    v2->_frame = v3;

    v5 = (SAExclaveFrame *)-[SAExclaveFrame initWithExclave:]([SAExclaveFrame alloc], 0);
    exclaveFrame = v2->_exclaveFrame;
    v2->_exclaveFrame = v5;

    v7 = v2->_exclaveFrame;
    if (v7)
      v7->super._BOOLs.bits |= 8u;
    v2->_exclaveInsertionIndex = -1;
  }
  return v2;
}

- (_QWORD)binaryLoadInfoForUserAddress:(_QWORD *)a1
{
  if (a1)
  {
    +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:", a2, a1[8], a1[10]);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)translatedAddressForNativeAddress:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = *(void **)(a1 + 120);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "unsignedLongLongValue");
      if (v7)
      {
LABEL_7:

        return v7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 120);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    }
    v7 = v2;
    goto LABEL_7;
  }
  return v2;
}

- (uint64_t)addressForStackDepth:(uint64_t *)a3 frames:(uint64_t)a4 numFrames:(int)a5 isUserspace:(int)a6 isSwiftAsync:(BOOL *)a7 isLeaf:(_DWORD *)a8 frameIndexUsed:
{
  unsigned int v8;
  uint64_t v9;
  int v12;
  int v15;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  unsigned int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a3 || (v9 = a4, !(_DWORD)a4))
  {
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "No frames", buf, 2u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(643, "No frames", v26, v27, v28, v29, v30, v31, v40);
    _os_crash();
    __break(1u);
LABEL_61:
    v32 = *__error();
    _sa_logt();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v42 = v8;
      v43 = 1024;
      v44 = v9;
      _os_log_error_impl(&dword_1B9BE0000, v33, OS_LOG_TYPE_ERROR, "stack depth %d, but only %d frames", buf, 0xEu);
    }

    *__error() = v32;
    _SASetCrashLogMessage(644, "stack depth %d, but only %d frames", v34, v35, v36, v37, v38, v39, v8);
    _os_crash();
    __break(1u);
  }
  v8 = a2;
  if (a2 >= a4)
    goto LABEL_61;
  if (a6)
  {
    v12 = ~a2 + a4;
    if (!a8)
      return a3[v12];
    goto LABEL_27;
  }
  switch(*(_QWORD *)(a1 + 56))
  {
    case 0:
      goto LABEL_26;
    case 1:
      v15 = a4 - 1;
      if ((_DWORD)a4 - 1 == a2)
      {
        if ((_DWORD)a4 != 1)
          goto LABEL_42;
        *a7 = 1;
        if (a8)
          *a8 = 0;
        if (!a5 || !*(_QWORD *)(a1 + 120))
          return *a3;
        return -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
      }
      v12 = a4 - 2 - a2;
      *a7 = (_DWORD)a4 - 2 == a2;
      if (a8)
        *a8 = v12;
      if (a5 && (_DWORD)a4 - 2 == a2 && *(_QWORD *)(a1 + 120))
      {
        v19 = *a3;
        v9 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
        if (v9 == v19)
        {
          if (*(_BYTE *)(a1 + 28))
          {
            v20 = a3[v15];
            v21 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, v20);
            if (v21 == v20)
              return v19;
            else
              return v21;
          }
          else
          {
            return v19;
          }
        }
        return v9;
      }
      return a3[v12];
    case 2:
      v12 = ~a2 + a4;
      *a7 = v12 == 0;
      if (a8)
        *a8 = v12;
      if (!a5 || v12 || !*(_QWORD *)(a1 + 120))
        return a3[v12];
      return -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
    case 3:
      if (!a5 || !*(_QWORD *)(a1 + 120) || (v17 = a4 - 2, v18 = a4 - 1, (_DWORD)a4 - 2 != a2) && v18 != a2)
      {
LABEL_26:
        v12 = ~a2 + a4;
        *a7 = v12 == 0;
        if (!a8)
          return a3[v12];
LABEL_27:
        *a8 = v12;
        return a3[v12];
      }
      v9 = *a3;
      v22 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
      if (v22 != v9)
      {
        if (v17 == v8)
        {
          *a7 = 0;
          if (a8)
            *a8 = 1;
          return a3[1];
        }
        *a7 = 1;
        if (a8)
          *a8 = 0;
        return v22;
      }
      if (v18 != v8)
      {
        *a7 = 1;
        v23 = a3[1];
        v22 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, v23);
        if (v22 == v23)
        {
          if (a8)
            *a8 = 0;
          return v9;
        }
        if (a8)
          *a8 = 1;
        return v22;
      }
LABEL_42:
      if (!a8)
        return 0;
      v9 = 0;
      *a8 = -1;
      return v9;
    default:
      return v9;
  }
}

- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4
{
  void *v4;
  unsigned int isSwiftAsyncStackTruncated;
  void (**v8)(id, SAFrame *);
  unsigned int numUserFrames;
  unint64_t backtracer;
  BOOL v11;
  unsigned int v12;
  int v13;
  SAFrame *frame;
  SAFrame *v15;
  SAFrame *v16;
  SAFrame *v17;
  uint64_t numSwiftAsyncFrames;
  unsigned int v19;
  uint64_t v20;
  SAFrame *v21;
  void *v22;
  SAFrame *v23;
  unsigned int v24;
  char v25;
  SAFrame *v26;
  SAFrame *v27;
  SAFrame *v28;
  unint64_t *userFrames;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unint64_t v37;
  int v38;
  SAFrame *v39;
  SAFrame *v40;
  SAFrame *v41;
  SAFrame *v42;
  SAFrame *v43;
  SAFrame *v44;
  SAFrame *v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
  unsigned int v49;
  int v50;
  char v51;
  unint64_t v52;
  _BOOL4 v53;
  SAFrame *v54;
  SAFrame *v55;
  void *v56;
  SAFrame *v57;
  unint64_t continuation;
  SAFrame *v59;
  void *v60;
  SAFrame *v61;
  SAExclaveFrame *exclaveFrame;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  NSObject *v71;
  unsigned int swiftAsyncStitchIndex;
  id v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  unsigned int numKernelFrames;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  NSObject *v100;
  unsigned int v101;
  uint64_t v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  NSObject *v111;
  unsigned int v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  BOOL v120;
  uint8_t buf[4];
  _BYTE v122[10];
  __int16 v123;
  unint64_t v124;
  __int16 v125;
  unsigned int v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, SAFrame *))a4;
  if ((a3 & 2) != 0)
    goto LABEL_70;
  if ((a3 & 8) != 0 && (a3 & 0x14) != 0)
  {
    v63 = *__error();
    _sa_logt();
    self = (SAFrameIterator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v122 = a3;
      _os_log_error_impl(&dword_1B9BE0000, &self->super, OS_LOG_TYPE_ERROR, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", buf, 0xCu);
    }

    *__error() = v63;
    _SASetCrashLogMessage(850, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", v64, v65, v66, v67, v68, v69, a3);
    _os_crash();
    __break(1u);
    goto LABEL_115;
  }
  numUserFrames = self->_numUserFrames;
  backtracer = self->_backtracer;
  if (backtracer - 2 < 2)
    goto LABEL_7;
  if (backtracer == 1)
  {
    v11 = numUserFrames >= 2;
    v12 = numUserFrames - 2;
LABEL_9:
    if (v11)
      LODWORD(v4) = v12;
    else
      LODWORD(v4) = 0;
    goto LABEL_12;
  }
  if (!backtracer)
  {
LABEL_7:
    v11 = numUserFrames != 0;
    v12 = numUserFrames - 1;
    goto LABEL_9;
  }
LABEL_12:
  if (self->_numSwiftAsyncFrames)
    isSwiftAsyncStackTruncated = 1;
  else
    isSwiftAsyncStackTruncated = self->_isSwiftAsyncStackTruncated;
  v13 = 1;
  if ((a3 & 0x10) == 0
    && isSwiftAsyncStackTruncated
    && ((a3 & 4) == 0 || v4 < self->_swiftAsyncStitchIndex))
  {
    -[SAFrame reset](self->_frame, "reset");
    frame = self->_frame;
    if (frame)
      frame->_BOOLs.bits |= 2u;
    if (self->_isSwiftAsyncStackTruncated)
    {
      v15 = self->_frame;
      if (v15)
      {
        v15->_BOOLs.bits |= 8u;
        v16 = self->_frame;
      }
      else
      {
        v16 = 0;
      }
      v8[2](v8, v16);
      v17 = self->_frame;
      if (v17)
        v17->_BOOLs.bits &= ~8u;
    }
    numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
    if ((_DWORD)numSwiftAsyncFrames)
    {
      v19 = 0;
      do
      {
        v20 = -[SAFrameIterator addressForStackDepth:frames:numFrames:isUserspace:isSwiftAsync:isLeaf:frameIndexUsed:]((uint64_t)self, v19, (uint64_t *)self->_swiftAsyncFrames, numSwiftAsyncFrames, 1, 1, (BOOL *)buf, 0);
        v21 = self->_frame;
        if (v21)
          v21->_address = v20;
        -[SAFrameIterator binaryLoadInfoForUserAddress:](self, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = self->_frame;
        if (v23)
          objc_storeWeak((id *)&v23->_binaryLoadInfo, v22);

        v8[2](v8, self->_frame);
        ++v19;
        numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
      }
      while (v19 < numSwiftAsyncFrames);
    }
    v13 = 0;
  }
  if ((a3 & 0x18) != 0)
    v24 = isSwiftAsyncStackTruncated;
  else
    v24 = 0;
  if (self->_swiftAsyncStitchIndex > self->_numUserFrames)
  {
LABEL_115:
    v70 = *__error();
    _sa_logt();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      swiftAsyncStitchIndex = self->_swiftAsyncStitchIndex;
      LODWORD(v4) = self->_numUserFrames;
      -[SAFrameIterator debugDescription](self, "debugDescription");
      v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v74 = objc_msgSend(v73, "UTF8String");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v122 = swiftAsyncStitchIndex;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = (_DWORD)v4;
      v123 = 2080;
      v124 = v74;
      _os_log_error_impl(&dword_1B9BE0000, v71, OS_LOG_TYPE_ERROR, "_swiftAsyncStitchIndex %u, _numUserFrames %u: %s", buf, 0x18u);

    }
    *__error() = v70;
    v75 = self->_swiftAsyncStitchIndex;
    -[SAFrameIterator debugDescription](self, "debugDescription");
    self = (SAFrameIterator *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[SAFrameIterator UTF8String](self, "UTF8String");
    _SASetCrashLogMessage(884, "_swiftAsyncStitchIndex %u, _numUserFrames %u: %s", v76, v77, v78, v79, v80, v81, v75);

    _os_crash();
    __break(1u);
LABEL_118:
    v82 = *__error();
    _sa_logt();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      numKernelFrames = self->_numKernelFrames;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v122 = numKernelFrames;
      _os_log_error_impl(&dword_1B9BE0000, v83, OS_LOG_TYPE_ERROR, "%d _numKernelFrames", buf, 8u);
    }

    *__error() = v82;
    _SASetCrashLogMessage(948, "%d _numKernelFrames", v85, v86, v87, v88, v89, v90, self->_numKernelFrames);
    _os_crash();
    __break(1u);
    goto LABEL_121;
  }
  if ((v13 | v24 ^ 1) != 1)
    goto LABEL_70;
  -[SAFrame reset](self->_frame, "reset");
  v25 = v13 ^ 1;
  if (!self->_isUserStackTruncated)
    v25 = 1;
  if ((v25 & 1) == 0)
  {
    v26 = self->_frame;
    if (v26)
    {
      v26->_BOOLs.bits |= 8u;
      v27 = self->_frame;
    }
    else
    {
      v27 = 0;
    }
    v8[2](v8, v27);
    v28 = self->_frame;
    if (v28)
      v28->_BOOLs.bits &= ~8u;
  }
  userFrames = self->_userFrames;
  if (!userFrames)
    goto LABEL_70;
  if (!self->_numUserFrames)
  {
LABEL_121:
    a3 = *__error();
    _sa_logt();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v92 = self->_numUserFrames;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v122 = v92;
      _os_log_error_impl(&dword_1B9BE0000, v91, OS_LOG_TYPE_ERROR, "%d _numUserFrames", buf, 8u);
    }

    *__error() = a3;
    _SASetCrashLogMessage(900, "%d _numUserFrames", v93, v94, v95, v96, v97, v98, self->_numUserFrames);
    _os_crash();
    __break(1u);
    goto LABEL_124;
  }
  isSwiftAsyncStackTruncated = (_DWORD)v4 + 1;
  if (!self->_assumeUserBinaryLoadInfosContainMainBinary)
    goto LABEL_52;
  -[NSArray firstObject](self->_userBinaryLoadInfos, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "loadAddress");

  if (!v31)
  {
    userFrames = self->_userFrames;
LABEL_52:
    if (*((_DWORD *)userFrames + 1))
      v33 = 0x100000000;
    else
      v33 = *MEMORY[0x1E0C85AD8];
    goto LABEL_55;
  }
  -[NSArray firstObject](self->_userBinaryLoadInfos, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "loadAddress");

LABEL_55:
  v34 = self->_swiftAsyncStitchIndex;
  if (v34 > isSwiftAsyncStackTruncated)
  {
LABEL_124:
    v99 = *__error();
    _sa_logt();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v101 = self->_swiftAsyncStitchIndex;
      -[SAFrameIterator debugDescription](self, "debugDescription");
      a3 = (unint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v102 = objc_msgSend((id)a3, "UTF8String");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v122 = v101;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = (_DWORD)v4;
      v123 = 2080;
      v124 = v102;
      _os_log_error_impl(&dword_1B9BE0000, v100, OS_LOG_TYPE_ERROR, "_swiftAsyncStitchIndex %u, maxDepth %u: %s", buf, 0x18u);

    }
    *__error() = v99;
    v103 = self->_swiftAsyncStitchIndex;
    -[SAFrameIterator debugDescription](self, "debugDescription");
    self = (SAFrameIterator *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[SAFrameIterator UTF8String](self, "UTF8String");
    _SASetCrashLogMessage(915, "_swiftAsyncStitchIndex %u, maxDepth %u: %s", v104, v105, v106, v107, v108, v109, v103);

    _os_crash();
    __break(1u);
LABEL_127:
    v110 = *__error();
    _sa_logt();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      v112 = self->_numUserFrames;
      v113 = self->_swiftAsyncStitchIndex;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v122 = isSwiftAsyncStackTruncated;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = v112;
      v123 = 2048;
      v124 = a3;
      v125 = 1024;
      v126 = v113;
      _os_log_error_impl(&dword_1B9BE0000, v111, OS_LOG_TYPE_ERROR, "endingDepth %u, numUserFrames %u, backtraceStyle 0x%llx, stitchIndex %u", buf, 0x1Eu);
    }

    *__error() = v110;
    _SASetCrashLogMessage(920, "endingDepth %u, numUserFrames %u, backtraceStyle 0x%llx, stitchIndex %u", v114, v115, v116, v117, v118, v119, isSwiftAsyncStackTruncated);
    _os_crash();
    __break(1u);
  }
  v35 = (_DWORD)v4 - v34;
  if (v13)
    v36 = 0;
  else
    v36 = v35 + 1;
  isSwiftAsyncStackTruncated = self->_numUserFrames;
  if (v24)
  {
    isSwiftAsyncStackTruncated = v35 + 1;
    if (v35 + 1 > self->_numUserFrames)
      goto LABEL_127;
  }
  if (v36 < isSwiftAsyncStackTruncated)
  {
    do
    {
      buf[0] = 0;
      v37 = -[SAFrameIterator addressForStackDepth:frames:numFrames:isUserspace:isSwiftAsync:isLeaf:frameIndexUsed:]((uint64_t)self, v36, (uint64_t *)self->_userFrames, self->_numUserFrames, 1, 0, (BOOL *)buf, 0);
      LOBYTE(v13) = v13 & (v37 < v33);
      if ((v13 & 1) == 0)
      {
        v38 = buf[0];
        v39 = self->_frame;
        if (v39)
        {
          v39->_BOOLs.bits = (v39->_BOOLs.bits & 0xFE | buf[0]) ^ 1;
          v40 = self->_frame;
          if (v40)
            v40->_address = v37;
        }
        -[SAFrameIterator binaryLoadInfoForUserAddress:](self, v37);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = self->_frame;
        if (v41)
          objc_storeWeak((id *)&v41->_binaryLoadInfo, v4);

        v8[2](v8, self->_frame);
        if (v38)
          break;
      }
      ++v36;
    }
    while (isSwiftAsyncStackTruncated != v36);
  }
LABEL_70:
  if ((a3 & 0x19) != 0)
    goto LABEL_111;
  -[SAFrame reset](self->_frame, "reset");
  v42 = self->_frame;
  if (v42)
    v42->_BOOLs.bits |= 4u;
  if (self->_kernelFrames)
  {
    if (self->_numKernelFrames)
    {
      if (self->_isKernelStackTruncated)
      {
        v43 = self->_frame;
        if (v43)
        {
          v43->_BOOLs.bits |= 8u;
          v44 = self->_frame;
        }
        else
        {
          v44 = 0;
        }
        v8[2](v8, v44);
        v45 = self->_frame;
        if (v45)
          v45->_BOOLs.bits &= ~8u;
      }
      v46 = self->_numKernelFrames;
      if (self->_exclaveInsertionIndex == -1)
        v47 = 1;
      else
        v47 = (a3 >> 5) & 1;
      if (*((_DWORD *)self->_kernelFrames + 1))
        v48 = 0xFFFFFFFFLL;
      else
        v48 = *MEMORY[0x1E0C85AD8] - 1;
      if ((_DWORD)v46)
      {
        v49 = 0;
        v50 = 0;
        v51 = 1;
        do
        {
          v120 = 0;
          *(_DWORD *)buf = -1;
          v52 = -[SAFrameIterator addressForStackDepth:frames:numFrames:isUserspace:isSwiftAsync:isLeaf:frameIndexUsed:]((uint64_t)self, v49, (uint64_t *)self->_kernelFrames, v46, 0, 0, &v120, buf);
          if (((v47 | v50) & 1) == 0)
          {
            if (*(_DWORD *)buf >= self->_exclaveInsertionIndex)
            {
              v50 = 0;
            }
            else
            {
              v8[2](v8, &self->_exclaveFrame->super);
              v50 = 1;
            }
          }
          v51 &= v52 < v48;
          if ((v51 & 1) == 0)
          {
            v53 = v120;
            v54 = self->_frame;
            if (v54)
            {
              v54->_BOOLs.bits = (v54->_BOOLs.bits & 0xFE | v120) ^ 1;
              v55 = self->_frame;
              if (v55)
                v55->_address = v52;
            }
            +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:", v52, self->_kernelBinaryLoadInfos, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = self->_frame;
            if (v57)
              objc_storeWeak((id *)&v57->_binaryLoadInfo, v56);

            v8[2](v8, self->_frame);
            if (v53)
              break;
          }
          ++v49;
          v46 = self->_numKernelFrames;
        }
        while (v49 < v46);
      }
      else
      {
        v50 = 0;
      }
      if (((v47 | v50) & 1) == 0)
      {
        exclaveFrame = self->_exclaveFrame;
LABEL_110:
        v8[2](v8, &exclaveFrame->super);
        goto LABEL_111;
      }
      goto LABEL_111;
    }
    goto LABEL_118;
  }
  continuation = self->_continuation;
  if (continuation)
  {
    v59 = self->_frame;
    if (v59)
      v59->_address = continuation;
    +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = self->_frame;
    if (v61)
      objc_storeWeak((id *)&v61->_binaryLoadInfo, v60);

    exclaveFrame = (SAExclaveFrame *)self->_frame;
    goto LABEL_110;
  }
LABEL_111:

}

- (void)clearThreadData
{
  unint64_t *userFrames;
  unint64_t *swiftAsyncFrames;
  unint64_t *kernelFrames;

  userFrames = self->_userFrames;
  if (userFrames)
    free(userFrames);
  self->_userFrames = 0;
  self->_numUserFrames = 0;
  self->_isUserStackTruncated = 0;
  swiftAsyncFrames = self->_swiftAsyncFrames;
  if (swiftAsyncFrames)
    free(swiftAsyncFrames);
  self->_swiftAsyncFrames = 0;
  self->_isSwiftAsyncStackTruncated = 0;
  self->_numSwiftAsyncFrames = 0;
  self->_swiftAsyncStitchIndex = 0;
  kernelFrames = self->_kernelFrames;
  if (kernelFrames)
    free(kernelFrames);
  self->_kernelFrames = 0;
  self->_continuation = 0;
  *(_QWORD *)&self->_numKernelFrames = 0xFFFFFFFF00000000;
  *(_WORD *)&self->_isKernelStackTruncated = 0;
}

- (void)clearTaskData
{
  NSArray *userBinaryLoadInfos;
  SASharedCache *sharedCache;
  NSMutableDictionary *addressTranslations;

  userBinaryLoadInfos = self->_userBinaryLoadInfos;
  self->_userBinaryLoadInfos = 0;

  self->_assumeUserBinaryLoadInfosContainMainBinary = 0;
  sharedCache = self->_sharedCache;
  self->_sharedCache = 0;

  addressTranslations = self->_addressTranslations;
  self->_addressTranslations = 0;

}

- (BOOL)hasStack
{
  return -[SAFrameIterator hasUserStack](self, "hasUserStack")
      || -[SAFrameIterator hasKernelStack](self, "hasKernelStack");
}

- (BOOL)hasUserStack
{
  return self->_numUserFrames != 0;
}

- (BOOL)hasSwiftAsyncStack
{
  return self->_numSwiftAsyncFrames || self->_isSwiftAsyncStackTruncated;
}

- (BOOL)hasKernelStack
{
  return self->_numKernelFrames || self->_continuation != 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SAFrameIterator clearThreadData](self, "clearThreadData");
  v3.receiver = self;
  v3.super_class = (Class)SAFrameIterator;
  -[SAFrameIterator dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  id v3;
  uint64_t numKernelFrames;
  unint64_t v5;
  uint64_t numUserFrames;
  unint64_t v7;
  uint64_t numSwiftAsyncFrames;
  unint64_t v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  numKernelFrames = self->_numKernelFrames;
  if ((_DWORD)numKernelFrames)
    v5 = *self->_kernelFrames;
  else
    v5 = 0;
  numUserFrames = self->_numUserFrames;
  if ((_DWORD)numUserFrames)
    v7 = *self->_userFrames;
  else
    v7 = 0;
  numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
  if ((_DWORD)numSwiftAsyncFrames)
    v9 = *self->_swiftAsyncFrames;
  else
    v9 = 0;
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("stack with %d kernel frames (leaf 0x%llx), %d user (leaf 0x%llx), %d swift async (leaf 0x%llx), backtracer %llu, exclave@%u"), numKernelFrames, v5, numUserFrames, v7, numSwiftAsyncFrames, v9, self->_backtracer, self->_exclaveInsertionIndex);
}

- (unint64_t)backtracer
{
  return self->_backtracer;
}

- (BOOL)assumeUserBinaryLoadInfosContainMainBinary
{
  return self->_assumeUserBinaryLoadInfosContainMainBinary;
}

- (void)setAssumeUserBinaryLoadInfosContainMainBinary:(BOOL)a3
{
  self->_assumeUserBinaryLoadInfosContainMainBinary = a3;
}

- (NSArray)userBinaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)kernelBinaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKernelBinaryLoadInfos:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (SASharedCache)sharedCache
{
  return (SASharedCache *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)userFrames
{
  return self->_userFrames;
}

- (void)setUserFrames:(unint64_t *)a3
{
  self->_userFrames = a3;
}

- (unsigned)numUserFrames
{
  return self->_numUserFrames;
}

- (void)setNumUserFrames:(unsigned int)a3
{
  self->_numUserFrames = a3;
}

- (BOOL)isUserStackTruncated
{
  return self->_isUserStackTruncated;
}

- (void)setIsUserStackTruncated:(BOOL)a3
{
  self->_isUserStackTruncated = a3;
}

- (unint64_t)swiftAsyncFrames
{
  return self->_swiftAsyncFrames;
}

- (void)setSwiftAsyncFrames:(unint64_t *)a3
{
  self->_swiftAsyncFrames = a3;
}

- (unsigned)numSwiftAsyncFrames
{
  return self->_numSwiftAsyncFrames;
}

- (void)setNumSwiftAsyncFrames:(unsigned int)a3
{
  self->_numSwiftAsyncFrames = a3;
}

- (unsigned)swiftAsyncStitchIndex
{
  return self->_swiftAsyncStitchIndex;
}

- (void)setSwiftAsyncStitchIndex:(unsigned int)a3
{
  self->_swiftAsyncStitchIndex = a3;
}

- (BOOL)isSwiftAsyncStackTruncated
{
  return self->_isSwiftAsyncStackTruncated;
}

- (void)setIsSwiftAsyncStackTruncated:(BOOL)a3
{
  self->_isSwiftAsyncStackTruncated = a3;
}

- (unint64_t)kernelFrames
{
  return self->_kernelFrames;
}

- (void)setKernelFrames:(unint64_t *)a3
{
  self->_kernelFrames = a3;
}

- (unsigned)numKernelFrames
{
  return self->_numKernelFrames;
}

- (void)setNumKernelFrames:(unsigned int)a3
{
  self->_numKernelFrames = a3;
}

- (unint64_t)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(unint64_t)a3
{
  self->_continuation = a3;
}

- (unsigned)exclaveInsertionIndex
{
  return self->_exclaveInsertionIndex;
}

- (void)setExclaveInsertionIndex:(unsigned int)a3
{
  self->_exclaveInsertionIndex = a3;
}

- (BOOL)isKernelStackTruncated
{
  return self->_isKernelStackTruncated;
}

- (void)setIsKernelStackTruncated:(BOOL)a3
{
  self->_isKernelStackTruncated = a3;
}

- (NSMutableDictionary)addressTranslations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAddressTranslations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)checkLR
{
  return self->_checkLR;
}

- (void)setCheckLR:(BOOL)a3
{
  self->_checkLR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressTranslations, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_kernelBinaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_userBinaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_exclaveFrame, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

@end
