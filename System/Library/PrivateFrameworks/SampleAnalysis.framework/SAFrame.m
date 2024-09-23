@implementation SAFrame

- (SAInstruction)instruction
{
  SABinaryLoadInfo **p_binaryLoadInfo;
  id WeakRetained;
  id v5;
  unint64_t address;
  unint64_t v7;
  id v8;
  void *v9;

  p_binaryLoadInfo = &self->_binaryLoadInfo;
  WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    address = self->_address;
    v7 = address - -[SAFrame isSymbolicationOffByOne](self, "isSymbolicationOffByOne");
    v8 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    objc_msgSend(v5, "instructionAtOffsetIntoLoadInfo:", v7 - objc_msgSend(v8, "loadAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_storeWeak((id *)p_binaryLoadInfo, 0);
  }
  else
  {
    v9 = 0;
  }
  return (SAInstruction *)v9;
}

- (BOOL)isTruncatedBacktraceFrame
{
  return (self->_BOOLs.bits >> 3) & 1;
}

- (unint64_t)address
{
  return self->_address;
}

+ (void)enumerateFrameTree:(void *)a3 block:
{
  id v4;
  void (**v5)(id, id, id, uint8_t *);
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  const char *ClassName;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  const char *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (!objc_msgSend(v4, "count"))
    goto LABEL_27;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(v6, "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_26;
  v9 = v8;
  while (1)
  {
    v10 = (id)objc_msgSend(v6, "count");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((void *)v9 != v11)
      break;
    objc_msgSend(v6, "removeLastObject");
LABEL_23:
    objc_msgSend(v6, "lastObject");
    v20 = objc_claimAutoreleasedReturnValue();

    v9 = v20;
    if (!v20)
      goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (id)v9;
    objc_msgSend(v12, "anyObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v9 = *__error();
      _sa_logt();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "No frame in child frames", buf, 2u);
      }

      *__error() = v9;
      _SASetCrashLogMessage(288, "No frame in child frames", v22, v23, v24, v25, v26, v27, v48);
      _os_crash();
      __break(1u);
LABEL_31:
      v28 = *__error();
      _sa_logt();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        ClassName = object_getClassName((id)v9);
        *(_DWORD *)buf = 136315138;
        v50 = ClassName;
        _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v28;
      v31 = object_getClassName((id)v9);
      _SASetCrashLogMessage(295, "child is %s", v32, v33, v34, v35, v36, v37, v31);
      _os_crash();
      __break(1u);
LABEL_34:
      v38 = *__error();
      _sa_logt();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = object_getClassName(v10);
        *(_DWORD *)buf = 136315138;
        v50 = v40;
        _os_log_error_impl(&dword_1B9BE0000, v39, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v38;
      v41 = object_getClassName(v10);
      _SASetCrashLogMessage(320, "child is %s", v42, v43, v44, v45, v46, v47, v41);
      _os_crash();
      __break(1u);
    }
    v14 = (id)v13;
    objc_msgSend(v12, "removeObject:", v13);
    v15 = objc_msgSend(v12, "count");
    v16 = v15 == 0;
    if (!v15)
      objc_msgSend(v6, "removeLastObject");

    if (!v5)
      goto LABEL_15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_31;
    v14 = (id)v9;
    objc_msgSend(v6, "removeLastObject");
    v16 = 1;
    if (!v5)
      goto LABEL_15;
  }
  buf[0] = 0;
  v5[2](v5, v14, v10, buf);
  if (!buf[0])
  {
LABEL_15:
    v10 = objc_getProperty(v14, v17, 40, 1);
    if (v10)
    {
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v18);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v6, "addObject:", v19);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_34;
        objc_msgSend(v6, "addObject:", v10);
      }
    }

    goto LABEL_23;
  }

LABEL_26:
LABEL_27:

}

- (BOOL)isKernel
{
  return (self->_BOOLs.bits >> 2) & 1;
}

- (unint64_t)hash
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_childFrameOrFrames, 0);
  objc_destroyWeak((id *)&self->_binaryLoadInfo);
}

- (BOOL)isSwiftAsync
{
  return (self->_BOOLs.bits >> 1) & 1;
}

- (BOOL)isExclave
{
  return 0;
}

- (SAExclave)exclave
{
  return 0;
}

- (BOOL)isSymbolicationOffByOne
{
  BOOL v2;
  SABinaryLoadInfo **p_binaryLoadInfo;
  id WeakRetained;
  id v6;

  if ((self->_BOOLs.bits & 1) == 0)
    return 0;
  p_binaryLoadInfo = &self->_binaryLoadInfo;
  WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    v2 = objc_msgSend(v6, "loadAddress") != self->_address;

  }
  else
  {
    v2 = 1;
  }

  return v2;
}

- (BOOL)isLeafyCallstackIsInAnotherCallTreeFrame
{
  return (self->_BOOLs.bits >> 4) & 1;
}

- (void)reset
{
  id childFrameOrFrames;

  self->_BOOLs.bits = 0;
  self->_address = 0;
  self->_parentFrame = 0;
  objc_storeWeak((id *)&self->_binaryLoadInfo, 0);
  childFrameOrFrames = self->_childFrameOrFrames;
  self->_childFrameOrFrames = 0;

}

- (id)initCopyingFrame:(id)a3 withParent:(id)a4
{
  id v6;
  SAFrame *v7;
  SAFrame *v8;
  id WeakRetained;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SAFrame;
  v7 = -[SAFrame init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_address = *((_QWORD *)v6 + 2);
    v7->_parentFrame = (SAFrame *)a4;
    WeakRetained = objc_loadWeakRetained((id *)v6 + 3);
    objc_storeWeak((id *)&v8->_binaryLoadInfo, WeakRetained);

    v8->_BOOLs.bits = *((_BYTE *)v6 + 8);
  }

  return v8;
}

- (id)copyWithNewParent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initCopyingFrame:withParent:", self, v4);

  return v5;
}

- (BOOL)isRootFrame
{
  return self->_parentFrame == 0;
}

- (BOOL)isFakeFrame
{
  return -[SAFrame isTruncatedBacktraceFrame](self, "isTruncatedBacktraceFrame")
      || -[SAFrame isLeafyCallstackIsInAnotherCallTreeFrame](self, "isLeafyCallstackIsInAnotherCallTreeFrame");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (self)
    LOBYTE(self) = self->_BOOLs.bits == *((unsigned __int8 *)v4 + 8) && self->_address == v4[2];

  return (char)self;
}

- (void)_addChildFrame:(uint64_t)a1
{
  id v4;
  id *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  id v10;
  int v11;
  NSObject *v12;
  const char *ClassName;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1 && v4)
  {
    v21 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    v5 = (id *)(a1 + 40);
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*v5, "addObject:", v21);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = *__error();
          _sa_logt();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            ClassName = object_getClassName(*v5);
            *(_DWORD *)buf = 136315138;
            v23 = ClassName;
            _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
          }

          *__error() = v11;
          v14 = object_getClassName(*v5);
          _SASetCrashLogMessage(155, "child is %s", v15, v16, v17, v18, v19, v20, v14);
          _os_crash();
          __break(1u);
        }
        v7 = (objc_class *)MEMORY[0x1E0C99E20];
        v8 = *v5;
        v9 = objc_msgSend([v7 alloc], "initWithObjects:", v8, v21, 0);
        v10 = *v5;
        *v5 = (id)v9;

      }
    }
    else
    {
      objc_storeStrong(v5, a2);
    }
    v4 = v21;
  }

}

+ (id)addStack:(uint64_t)a3 backtraceStyle:(void *)a4 toSetOfRootFrames:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id result;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a2;
  v7 = a4;
  objc_opt_self();
  if (v6)
  {
    if (v7)
    {
      *(_QWORD *)buf = 0;
      v31 = buf;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy_;
      v34 = __Block_byref_object_dispose_;
      v35 = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __53__SAFrame_addStack_backtraceStyle_toSetOfRootFrames___block_invoke;
      v27[3] = &unk_1E7146978;
      v29 = buf;
      v8 = v7;
      v28 = v8;
      objc_msgSend(v6, "iterateFramesWithBacktraceStyle:block:", a3, v27);
      v9 = *((id *)v31 + 5);

      _Block_object_dispose(buf, 8);
      return v9;
    }
  }
  else
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "nil frameIterator", buf, 2u);
    }

    *__error() = v11;
    _SASetCrashLogMessage(165, "nil frameIterator", v13, v14, v15, v16, v17, v18, v27[0]);
    _os_crash();
    __break(1u);
  }
  v19 = *__error();
  _sa_logt();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_ERROR, "nil rootFrames", buf, 2u);
  }

  *__error() = v19;
  _SASetCrashLogMessage(166, "nil rootFrames", v21, v22, v23, v24, v25, v26, v27[0]);
  result = (id)_os_crash();
  __break(1u);
  return result;
}

void __53__SAFrame_addStack_backtraceStyle_toSetOfRootFrames___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint8_t buf[4];
  const char *ClassName;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v20 = (char *)v3;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "member:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_17;
    goto LABEL_14;
  }
  v5 = objc_getProperty(v4, v3, 40, 1);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "member:", v20);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = *__error();
        _sa_logt();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          ClassName = object_getClassName(v5);
          _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
        }

        *__error() = v11;
        v13 = object_getClassName(v5);
        _SASetCrashLogMessage(180, "child is %s", v14, v15, v16, v17, v18, v19, v13);
        _os_crash();
        __break(1u);
      }
      v7 = v5;
      if (objc_msgSend(v20, "isEqual:", v7))
        v6 = v7;
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = 0;
  }

  if (!v6)
  {
LABEL_14:
    v6 = (id)objc_msgSend(v20, "copyWithNewParent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v8)
      -[SAFrame _addChildFrame:](v8, v6);
    else
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
LABEL_17:
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (void)printFrameTree:(id)a3
{
  +[SAFrame enumerateFrameTree:block:]((uint64_t)a1, a3, &__block_literal_global);
}

int *__26__SAFrame_printFrameTree___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4;
  int v5;
  FILE *v6;
  int v7;
  id v8;
  int *result;

  v4 = a2;
  v5 = *__error();
  v6 = (FILE *)*MEMORY[0x1E0C80C20];
  v7 = 2 * a3 - 2;
  objc_msgSend(v4, "debugDescription");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v6, "%*s%p %s\n", v7, ", v4, (const char *)objc_msgSend(v8, "UTF8String"));

  result = __error();
  *result = v5;
  return result;
}

+ (void)releaseFrameTree:(uint64_t)a1
{
  id v2;
  id v3;
  const char *v4;
  void *v5;
  id *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  SEL v17;
  id *v18;
  SEL v19;
  id *v20;
  id *v21;
  int v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  const char *ClassName;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = v2;
  v5 = v3;
  if (v3)
  {
    v6 = (id *)v3;
    do
    {
      v7 = objc_getProperty(v6, v4, 40, 1);
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (!v10)
            goto LABEL_14;
          v12 = v10;
          v13 = *(_QWORD *)v52;
LABEL_7:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v52 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v14);
            if (v15)
            {
              if (objc_getProperty(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v14), v11, 40, 1))
                break;
            }
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
              if (!v12)
              {
LABEL_14:

                goto LABEL_18;
              }
              goto LABEL_7;
            }
          }
          v18 = v15;

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_28;
        v16 = v7;
        if (objc_getProperty(v16, v17, 40, 1))
        {
          v18 = (id *)v16;
LABEL_21:

          if (v6 != v18[4])
          {
            v22 = *__error();
            _sa_logt();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v6, "debugDescription");
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v25 = objc_msgSend(v24, "UTF8String");
              objc_msgSend(v18, "debugDescription");
              v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v27 = objc_msgSend(v26, "UTF8String");
              v28 = v18[4];
              objc_msgSend(v28, "debugDescription");
              v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v30 = objc_msgSend(v29, "UTF8String");
              *(_DWORD *)buf = 136315650;
              v56 = v25;
              v57 = 2080;
              v58 = v27;
              v59 = 2080;
              v60 = v30;
              _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "Frame %s child %s has different parent %s", buf, 0x20u);

            }
            *__error() = v22;
            objc_msgSend(v6, "debugDescription");
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v7 = (id)objc_msgSend(v31, "UTF8String");
            objc_msgSend(v18, "debugDescription");
            v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v32, "UTF8String");
            v33 = v18[4];
            objc_msgSend(v33, "debugDescription");
            v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v34, "UTF8String");
            _SASetCrashLogMessage(249, "Frame %s child %s has different parent %s", v35, v36, v37, v38, v39, v40, (char)v7);

            _os_crash();
            __break(1u);
LABEL_28:
            v41 = *__error();
            _sa_logt();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              ClassName = object_getClassName(v7);
              *(_DWORD *)buf = 136315138;
              v56 = (uint64_t)ClassName;
              _os_log_error_impl(&dword_1B9BE0000, v42, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
            }

            *__error() = v41;
            v44 = object_getClassName(v7);
            _SASetCrashLogMessage(240, "child is %s", v45, v46, v47, v48, v49, v50, v44);
            _os_crash();
            __break(1u);
          }
          v21 = v18;
          v20 = v21;
          goto LABEL_23;
        }
LABEL_18:

        objc_setProperty_atomic(v6, v19, 0, 40);
      }
      v20 = (id *)v6[4];
      v21 = 0;
      v6[4] = 0;
LABEL_23:

      v6 = v20;
    }
    while (v20);
  }

}

+ (uint64_t)fixupLoadInfosInFrameTree:(void *)a3 binaryLoadInfos:(void *)a4 libraryCache:(void *)a5 uuidsWithNewInstructions:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_self();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__SAFrame_fixupLoadInfosInFrameTree_binaryLoadInfos_libraryCache_uuidsWithNewInstructions___block_invoke;
  v17[3] = &unk_1E71469C0;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v21 = &v22;
  v14 = v11;
  v20 = v14;
  +[SAFrame enumerateFrameTree:block:]((uint64_t)SAFrame, v8, v17);
  v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __91__SAFrame_fixupLoadInfosInFrameTree_binaryLoadInfos_libraryCache_uuidsWithNewInstructions___block_invoke(_QWORD *a1, void *a2)
{
  char v3;
  id *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;

  v18 = a2;
  v3 = objc_msgSend(v18, "isFakeFrame");
  v4 = v18;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(v18, "address");
    if (v18)
      WeakRetained = objc_loadWeakRetained(v18 + 3);
    else
      WeakRetained = 0;
    +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:", v5, a1[4], a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v18)
    {
      objc_storeWeak(v18 + 3, v7);
      v8 = v18;
    }
    objc_msgSend(v8, "instruction");

    if (v7)
    {
      if (a1[6])
      {
        if (!WeakRetained)
          goto LABEL_11;
        v9 = objc_msgSend(v7, "loadAddress");
        if (v9 != objc_msgSend(WeakRetained, "loadAddress"))
          goto LABEL_11;
        objc_msgSend(v7, "binary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "binary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqual:", v13);

        if ((v14 & 1) == 0)
        {
LABEL_11:
          v15 = (void *)a1[6];
          objc_msgSend(v7, "binary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v17);

        }
      }
    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    }

    v4 = v18;
  }

}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  unint64_t address;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  int v13;
  int v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SAFrame instruction](self, "instruction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  v7 = -[SAFrame isSwiftAsync](self, "isSwiftAsync");
  v8 = -[SAFrame isKernel](self, "isKernel");
  v9 = -[SAFrame isExclave](self, "isExclave");
  v24 = v4;
  v23 = v8;
  if (v9)
  {
    -[SAFrame exclave](self, "exclave");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v7;
    if (v10)
    {
      v21 = (void *)v10;
      -[SAFrame exclave](self, "exclave");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = 0;
        v14 = 1;
        v20 = (void *)v12;
        v15 = (__CFString *)v12;
      }
      else
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SAFrame exclave](self, "exclave");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (__CFString *)objc_msgSend(v16, "initWithFormat:", CFSTR("0x%llx"), objc_msgSend(v19, "identifier"));
        v20 = 0;
        v14 = 1;
        v13 = 1;
      }
    }
    else
    {
      v21 = 0;
      v14 = 0;
      v13 = 0;
      v15 = CFSTR("yes");
    }
  }
  else
  {
    v11 = v7;
    v14 = 0;
    v13 = 0;
    v15 = CFSTR("no");
  }
  v17 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ [0x%llx] (swift:%d kernel:%d exclave:%@ offByOne:%d trunc:%d anotherCallTree:%d)"), v5, address, v11, v23, v15, self->_BOOLs.bits & 1, -[SAFrame isTruncatedBacktraceFrame](self, "isTruncatedBacktraceFrame"), -[SAFrame isLeafyCallstackIsInAnotherCallTreeFrame](self, "isLeafyCallstackIsInAnotherCallTreeFrame"));
  if (v13)
  {

  }
  if (v14)
  {

  }
  if (v9)

  return (NSString *)v17;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  unint64_t address;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  SAFrame *v36;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_address);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("address"), v5);

  -[SAFrame instruction](self, "instruction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);

  if (!WeakRetained)
    goto LABEL_24;
  address = self->_address;
  v9 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  v10 = address - objc_msgSend(v9, "loadAddress");

  v11 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  objc_msgSend(v11, "binary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  objc_msgSend(v13, "segment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v4, CFSTR("binary"), v16);

  if (v14)
  {
    if (!objc_msgSend(v14, "hasOffsetIntoBinary"))
      goto LABEL_7;
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = objc_msgSend(v14, "offsetIntoBinary");
  }
  else
  {
    v18 = 0;
    v17 = (void *)MEMORY[0x1E0CB37E8];
  }
  objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 + v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v4, CFSTR("offsetIntoBinary"), v19);

LABEL_7:
  objc_msgSend(v12, "path");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v12, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[SABinary haveMultipleBinariesWithUUID:]((uint64_t)SABinary, v22);

    if (v23)
    {
      objc_msgSend(v12, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v4, CFSTR("binaryPath"), v24);

    }
  }
  if (v14)
  {
    objc_msgSend(v14, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v4, CFSTR("segment"), v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v4, CFSTR("offsetIntoSegment"), v26);

  }
  if (-[SAFrame isSwiftAsync](self, "isSwiftAsync"))
    SAJSONWriteDictionaryEntry(v4, CFSTR("isSwiftAsync"), MEMORY[0x1E0C9AAB0]);
  if (-[SAFrame isKernel](self, "isKernel"))
    SAJSONWriteDictionaryEntry(v4, CFSTR("isKernelFrame"), MEMORY[0x1E0C9AAB0]);
  if (-[SAFrame isExclave](self, "isExclave"))
  {
    -[SAFrame exclave](self, "exclave");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      SAJSONWriteDictionaryEntry(v4, CFSTR("exclave"), v28);
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB37E8];
      -[SAFrame exclave](self, "exclave");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v30, "identifier"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v4, CFSTR("exclave"), v31);

    }
  }
  if (objc_msgSend(v6, "numSymbols"))
  {
    objc_msgSend(v4, "appendString:", CFSTR(",\"symbols\":["));
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __65__SAFrame_JSONSerialization__writeJSONDictionaryEntriesToStream___block_invoke;
    v33[3] = &unk_1E71469E8;
    v32 = v4;
    v34 = v32;
    v35 = v6;
    v36 = self;
    objc_msgSend(v35, "enumerateSymbols:", v33);
    objc_msgSend(v32, "appendString:", CFSTR("]"));

  }
LABEL_24:

}

void __65__SAFrame_JSONSerialization__writeJSONDictionaryEntriesToStream___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  if (a4)
    objc_msgSend(a1[4], "appendString:", CFSTR(","));
  objc_msgSend(a1[4], "appendString:", CFSTR("{"));
  v8 = a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1[5], "offsetIntoSegment")- objc_msgSend(v17, "offsetIntoSegment")+ objc_msgSend(a1[6], "isSymbolicationOffByOne"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v8, (uint64_t)CFSTR("offsetIntoSymbol"), v9);

  objc_msgSend(v17, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    SAJSONWriteDictionaryEntry(a1[4], CFSTR("symbolName"), v10);
  if (v7)
  {
    v11 = a1[4];
    objc_msgSend(v7, "filePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v11, CFSTR("sourceFilepath"), v12);

    v13 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "lineNum"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v13, CFSTR("sourceLineNum"), v14);

    if (objc_msgSend(v7, "columnNum"))
    {
      v15 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "columnNum"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SAJSONWriteDictionaryEntry(v15, CFSTR("sourceColumnNum"), v16);

    }
  }
  objc_msgSend(a1[4], "appendString:", CFSTR("}"));

}

+ (id)classDictionaryKey
{
  return CFSTR("SAFrame");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  if (!self->_childFrameOrFrames)
    return 39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 8 * objc_msgSend(self->_childFrameOrFrames, "count") + 39;
  else
    return 47;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  id v13;
  unsigned int v14;
  id childFrameOrFrames;
  uint64_t *v16;
  void *v17;
  int v19;
  NSObject *v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
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
  const char *ClassName;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  _BYTE v67[24];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v19 = *__error();
    _sa_logt();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[SAFrame debugDescription](self, "debugDescription");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v65 = objc_msgSend(v21, "UTF8String");
      v66 = 2048;
      *(_QWORD *)v67 = -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v67[8] = 2048;
      *(_QWORD *)&v67[10] = a4;
      _os_log_error_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v19;
    -[SAFrame debugDescription](self, "debugDescription");
    a3 = ($165022A6B82873954AF8662177CFB640 *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = -[$165022A6B82873954AF8662177CFB640 UTF8String](a3, "UTF8String");
    -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(1276, "%s: size %lu != buffer length %lu", v23, v24, v25, v26, v27, v28, v22);

    _os_crash();
    __break(1u);
    goto LABEL_21;
  }
  *(_WORD *)&a3->var0 = 1025;
  *(_QWORD *)(&a3->var1 + 1) = self->_address;
  *((_BYTE *)&a3->var4 + 6) = *((_BYTE *)&a3->var4 + 6) & 0xFE | -[SAFrame isKernel](self, "isKernel");
  if (-[SAFrame isSwiftAsync](self, "isSwiftAsync"))
    v9 = 2;
  else
    v9 = 0;
  v10 = *((_BYTE *)&a3->var4 + 6) & 0xFD | v9;
  *((_BYTE *)&a3->var4 + 6) = v10;
  *((_BYTE *)&a3->var4 + 6) = (4 * (self->_BOOLs.bits & 1)) | v10 & 0xFB;
  if (-[SAFrame isExclave](self, "isExclave"))
    v11 = 8;
  else
    v11 = 0;
  *((_BYTE *)&a3->var4 + 6) = *((_BYTE *)&a3->var4 + 6) & 0xF7 | v11;
  -[SAFrame instruction](self, "instruction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);

  *(unint64_t *)((char *)&a3->var3 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_parentFrame, v8);
  a4 = (unint64_t)&a3->var4 + 7;
  if (self->_childFrameOrFrames)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = self->_childFrameOrFrames;
      if ((unint64_t)objc_msgSend(v13, "count") >= 0xFFFFFFFF)
      {
LABEL_24:
        v42 = *__error();
        _sa_logt();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          -[SAFrame debugDescription](self, "debugDescription");
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v45 = objc_msgSend(v44, "UTF8String");
          v46 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 136315394;
          v65 = v45;
          v66 = 2048;
          *(_QWORD *)v67 = v46;
          _os_log_error_impl(&dword_1B9BE0000, v43, OS_LOG_TYPE_ERROR, "%s has %lu children", buf, 0x16u);

        }
        *__error() = v42;
        -[SAFrame debugDescription](self, "debugDescription");
        self = (SAFrame *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v47 = -[SAFrame UTF8String](self, "UTF8String");
        objc_msgSend(v13, "count");
        _SASetCrashLogMessage(1294, "%s has %lu children", v48, v49, v50, v51, v52, v53, v47);

        _os_crash();
        __break(1u);
LABEL_27:
        v54 = *__error();
        _sa_logt();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(self->_childFrameOrFrames);
          *(_DWORD *)buf = 136315138;
          v65 = (uint64_t)ClassName;
          _os_log_error_impl(&dword_1B9BE0000, v55, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
        }

        *__error() = v54;
        v57 = object_getClassName(self->_childFrameOrFrames);
        _SASetCrashLogMessage(1298, "child is %s", v58, v59, v60, v61, v62, v63, v57);
        _os_crash();
        __break(1u);
      }
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)((char *)&a3->var3 + 2) = v14;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 7, v14, v13, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
      childFrameOrFrames = self->_childFrameOrFrames;
      *(_DWORD *)((char *)&a3->var3 + 2) = 1;
      v13 = childFrameOrFrames;
      *(_QWORD *)((char *)&a3->var4 + 7) = SASerializableIndexForPointerFromSerializationDictionary(v13, v8);
    }

  }
  else
  {
    *(_DWORD *)((char *)&a3->var3 + 2) = 0;
  }
  v16 = (uint64_t *)(a4 + 8 * *(unsigned int *)((char *)&a3->var3 + 2));
  -[SAFrame exclave](self, "exclave");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *v16 = SASerializableIndexForPointerFromSerializationDictionary(v17, v8);

  if ((char *)v16 - (char *)a3 + 8 != -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
  {
LABEL_21:
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      -[SAFrame debugDescription](self, "debugDescription");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v31, "UTF8String");
      v33 = *(unsigned int *)((char *)&a3->var3 + 2);
      v34 = -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      v65 = v32;
      v66 = 1024;
      *(_DWORD *)v67 = v33;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = a4 + 8 * v33 - (_QWORD)a3;
      *(_WORD *)&v67[14] = 2048;
      *(_QWORD *)&v67[16] = v34;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u children), ended with length %ld, should be %lu", buf, 0x26u);

    }
    *__error() = v29;
    -[SAFrame debugDescription](self, "debugDescription");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (id)objc_msgSend(v35, "UTF8String");
    -[SAFrame sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(1311, "%s: after serializing (with %u children), ended with length %ld, should be %lu", v36, v37, v38, v39, v40, v41, (char)v13);

    _os_crash();
    __break(1u);
    goto LABEL_24;
  }

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  const char *ClassName;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", self, 0);
  while (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1BCCCC288]();
    objc_msgSend(v4, "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeLastObject");
    objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v27, (void *)v6, v7);

    if (v8)
    {
      objc_msgSend((id)v6, "instruction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSelfToSerializationDictionary:", v27);

      if (v6)
      {
        v10 = *(void **)(v6 + 32);
        v11 = v10;
        if (v10)
          objc_msgSend(v4, "addObject:", v11);
        WeakRetained = objc_loadWeakRetained((id *)(v6 + 24));
      }
      else
      {
        v11 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "addSelfToSerializationDictionary:", v27);

      objc_msgSend((id)v6, "exclave");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSelfToSerializationDictionary:", v27);

      if (v6)
      {
        v15 = objc_getProperty((id)v6, v14, 40, 1);
        if (v15)
        {
          v16 = v15;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "allObjects");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObjectsFromArray:", v17);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v18 = *__error();
              _sa_logt();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                ClassName = object_getClassName(v16);
                _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
              }

              *__error() = v18;
              v20 = object_getClassName(v16);
              _SASetCrashLogMessage(1343, "child is %s", v21, v22, v23, v24, v25, v26, v20);
              _os_crash();
              __break(1u);
            }
            objc_msgSend(v4, "addObject:", v16);
          }

        }
      }

    }
    objc_autoreleasePoolPop(v5);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  SAFrame *v6;
  int v7;
  unint64_t v8;
  char v9;
  unsigned int v10;
  char v11;
  $4746FB1C26EC70AD3261FC4837C5284A *p_BOOLs;
  unsigned __int8 bits;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  _WORD v36[17];

  *(_QWORD *)&v36[13] = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 5u)
    goto LABEL_32;
  if (a4 <= 0x1E)
  {
    v15 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v34 = a4;
      v35 = 2048;
      *(_QWORD *)v36 = 31;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct %lu", buf, 0x16u);
    }

    *__error() = v15;
    _SASetCrashLogMessage(1358, "bufferLength %lu < serialized SAFrame struct %lu", v16, v17, v18, v19, v20, v21, a4);
    _os_crash();
    __break(1u);
    goto LABEL_29;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 18) + 31 > a4)
  {
LABEL_29:
    v22 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(unsigned int *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      v34 = a4;
      v35 = 1024;
      *(_DWORD *)v36 = v24;
      v36[2] = 2048;
      *(_QWORD *)&v36[3] = 8 * v24 + 31;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v22;
    _SASetCrashLogMessage(1359, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
LABEL_32:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAFrame version"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  if (*((unsigned __int8 *)a3 + 1) >= 4u && (*((_BYTE *)a3 + 30) & 8) != 0)
  {
    v6 = (SAFrame *)-[SAExclaveFrame initWithExclave:]([SAExclaveFrame alloc], 0);
    v7 = 1;
  }
  else
  {
    v6 = objc_alloc_init(SAFrame);
    v7 = 0;
  }
  v8 = *(_QWORD *)(v5 + 2);
  if (v6)
  {
    v6->_address = v8;
    v6->_BOOLs.bits = v6->_BOOLs.bits & 0xFB | (4 * (*(_BYTE *)(v5 + 30) & 1));
    v8 = *(_QWORD *)(v5 + 2);
  }
  if (v8)
  {
    v9 = 0;
    if (!v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (*(_QWORD *)(v5 + 22) == -1)
    v7 = 1;
  if (v7)
    v9 = 8;
  else
    v9 = 0;
  if (v6)
LABEL_12:
    v6->_BOOLs.bits = v6->_BOOLs.bits & 0xF7 | v9;
LABEL_13:
  v10 = *(unsigned __int8 *)(v5 + 1);
  if (v10 < 2)
    v11 = 0;
  else
    v11 = *(_BYTE *)(v5 + 30) & 2;
  if (v6)
  {
    p_BOOLs = &v6->_BOOLs;
    bits = v6->_BOOLs.bits & 0xFD | v11;
    v6->_BOOLs.bits = bits;
    if (*(unsigned __int8 *)(v5 + 1) >= 3u)
    {
      v14 = (*(unsigned __int8 *)(v5 + 30) >> 2) & 1;
LABEL_39:
      p_BOOLs->bits = bits & 0xFE | v14;
      return v6;
    }
  }
  else if (v10 > 2)
  {
    return v6;
  }
  LOBYTE(v14) = !-[SAFrame isSwiftAsync](v6, "isSwiftAsync") && *(_DWORD *)(v5 + 18) != 0;
  if (v6)
  {
    p_BOOLs = &v6->_BOOLs;
    bits = v6->_BOOLs.bits;
    goto LABEL_39;
  }
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char *v16;
  unint64_t v17;
  BOOL v18;
  id v19;
  void *v20;
  SAFrame *v21;
  _BYTE *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  SAFrameDeserializationHelper *v30;
  SAFrameSiblingsDeserializationHelper *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  const void *v40;
  void *v41;
  id v42;
  unint64_t *v43;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  void *v47;
  const char *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  void *v58;
  SAFrame *v59;
  SAFrameSiblingsDeserializationHelper *v60;
  int v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  NSObject *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  NSObject *v129;
  SAFrame *v130;
  int v131;
  id v132;
  uint64_t v133;
  const char *ClassName;
  int v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  char v144;
  void *v145;
  SAFrameDeserializationHelper *v146;
  void *v147;
  SAFrame *v148;
  _BYTE *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  SAFrame *selfa;
  SAFrameDeserializationHelper *v156;
  uint8_t buf[4];
  _BYTE v158[24];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (unint64_t)a6;
  v12 = (_BYTE *)gFrameTreeBeingDecoded();
  if (*v12)
    goto LABEL_51;
  v149 = v12;
  *v12 = 1;
  if (*(unsigned __int8 *)a3 > 4u)
  {
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAFrame version"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v13 = -1;
  while (1)
  {
    if (a4 <= 0x1E)
      goto LABEL_55;
    if (a4 < 8 * (unint64_t)*(unsigned int *)((char *)a3 + 18) + 31)
    {
LABEL_58:
      v77 = *__error();
      _sa_logt();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        v79 = *(unsigned int *)((char *)a3 + 18);
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v158 = a4;
        *(_WORD *)&v158[8] = 1024;
        *(_DWORD *)&v158[10] = v79;
        *(_WORD *)&v158[14] = 2048;
        *(_QWORD *)&v158[16] = 8 * v79 + 31;
        _os_log_error_impl(&dword_1B9BE0000, v78, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", buf, 0x1Cu);
      }

      *__error() = v77;
      _SASetCrashLogMessage(1415, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", v80, v81, v82, v83, v84, v85, a4);
      _os_crash();
      __break(1u);
LABEL_61:
      v86 = *__error();
      _sa_logt();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B9BE0000, v87, OS_LOG_TYPE_ERROR, "bad parent frame buffer", buf, 2u);
      }

      *__error() = v86;
      _SASetCrashLogMessage(1423, "bad parent frame buffer", v88, v89, v90, v91, v92, v93, v143);
      _os_crash();
      __break(1u);
LABEL_64:
      v94 = *__error();
      _sa_logt();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v158 = a3;
        *(_WORD *)&v158[8] = 2048;
        *(_QWORD *)&v158[10] = 31;
        _os_log_error_impl(&dword_1B9BE0000, v95, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct %lu", buf, 0x16u);
      }

      *__error() = v94;
      _SASetCrashLogMessage(1468, "bufferLength %lu < serialized SAFrame struct %lu", v96, v97, v98, v99, v100, v101, (char)a3);
      _os_crash();
      __break(1u);
LABEL_67:
      v102 = *__error();
      _sa_logt();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        v104 = *(unsigned int *)(a4 + 18);
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v158 = a3;
        *(_WORD *)&v158[8] = 1024;
        *(_DWORD *)&v158[10] = v104;
        *(_WORD *)&v158[14] = 2048;
        *(_QWORD *)&v158[16] = 8 * v104 + 31;
        _os_log_error_impl(&dword_1B9BE0000, v103, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", buf, 0x1Cu);
      }

      *__error() = v102;
      _SASetCrashLogMessage(1469, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", v105, v106, v107, v108, v109, v110, (char)a3);
      _os_crash();
      __break(1u);
      goto LABEL_70;
    }
    v14 = *(_QWORD *)((char *)a3 + 22);
    if (v14 == -1)
      break;
    v15 = (void *)objc_opt_class();
    v16 = SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v10, (void *)v11, v15);
    if (v16)
      v18 = v17 > 0x1E;
    else
      v18 = 0;
    if (!v18)
      goto LABEL_61;
    a4 = v17;
    v13 = *(_QWORD *)((char *)a3 + 22);
    a3 = v16;
    if (*v16 > 4u)
      goto LABEL_13;
  }
  if (v13 == -1)
    goto LABEL_19;
  v20 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v10, (void *)v11, v20, 0);
  v21 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  v22 = v149;
  if (!v21)
  {
    v11 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "can't decode root frame", buf, 2u);
    }

    *__error() = v11;
    _SASetCrashLogMessage(1437, "can't decode root frame", v24, v25, v26, v27, v28, v29, v143);
    _os_crash();
    __break(1u);
LABEL_19:
    v21 = self;
    v22 = v149;
  }
  v30 = -[SAFrameDeserializationHelper initWithFrame:buffer:bufferLength:]([SAFrameDeserializationHelper alloc], "initWithFrame:buffer:bufferLength:", v21, a3, a4);
  v31 = [SAFrameSiblingsDeserializationHelper alloc];
  v146 = v30;
  v156 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v156, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SAFrameSiblingsDeserializationHelper initWithFrameHelpers:](v31, "initWithFrameHelpers:", v32);

  v144 = 0;
  v145 = (void *)v33;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v33);
  if (objc_msgSend(v34, "count"))
  {
    v147 = v34;
    v148 = v21;
    v153 = (void *)v11;
    v154 = v10;
    do
    {
      v35 = (void *)MEMORY[0x1BCCCC288]();
      objc_msgSend(v34, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frameHelpers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "index");
      if (v38 >= objc_msgSend(v37, "count"))
      {
        objc_msgSend(v34, "removeLastObject");
      }
      else
      {
        v152 = v36;
        objc_msgSend(v37, "objectAtIndexedSubscript:", objc_msgSend(v36, "index"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "frame");
        self = (SAFrame *)objc_claimAutoreleasedReturnValue();
        a4 = objc_msgSend(v39, "buffer");
        v151 = v39;
        v40 = (const void *)objc_msgSend(v39, "bufferLength");
        if (*(unsigned __int8 *)a4 >= 5u)
          goto LABEL_13;
        a3 = v40;
        if ((unint64_t)v40 <= 0x1E)
          goto LABEL_64;
        if ((unint64_t)v40 < 8 * (unint64_t)*(unsigned int *)(a4 + 18) + 31)
          goto LABEL_67;
        v150 = v37;
        selfa = self;
        self = *(SAFrame **)(a4 + 10);
        v41 = (void *)objc_opt_class();
        v42 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass((unint64_t)self, v10, (void *)v11, v41, 0);
        v43 = (unint64_t *)(a4 + 31);
        v44 = *(unsigned int *)(a4 + 18);
        if (*(unsigned __int8 *)(a4 + 1) >= 4u)
        {
          v45 = &v43[v44];
          if ((char *)a3 + a4 < (char *)(v45 + 1))
            goto LABEL_73;
          v46 = *v45;
          v47 = (void *)objc_opt_class();
          _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v46, v154, v153, v47, 0);
          a3 = (const void *)objc_claimAutoreleasedReturnValue();
          if (a3)
          {
            objc_opt_class();
            self = selfa;
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_76;
            if (selfa)
              objc_storeWeak((id *)&selfa[1].super.isa, (id)a3);
          }

        }
        v36 = v152;
        objc_msgSend(v152, "setIndex:", objc_msgSend(v152, "index") + 1);
        if ((_DWORD)v44)
        {
          a3 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v44);
          a4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v44);
          while (1)
          {
            v49 = *v43++;
            v50 = (void *)objc_opt_class();
            self = (SAFrame *)SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v49, v154, v153, v50);
            v52 = v51;
            v53 = (void *)objc_opt_class();
            _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v49, v154, v153, v53, 0);
            v54 = objc_claimAutoreleasedReturnValue();
            if (!v54)
              break;
            v55 = (void *)v54;
            *(_QWORD *)(v54 + 32) = selfa;
            self = -[SAFrameDeserializationHelper initWithFrame:buffer:bufferLength:]([SAFrameDeserializationHelper alloc], "initWithFrame:buffer:bufferLength:", v54, self, v52);
            objc_msgSend((id)a3, "addObject:", v55);
            objc_msgSend((id)a4, "addObject:", self);

            if (!--v44)
            {
              if (objc_msgSend((id)a3, "count"))
              {
                if (objc_msgSend((id)a3, "count") == 1)
                {
                  objc_msgSend((id)a3, "anyObject");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = v148;
                  v22 = v149;
                  v34 = v147;
                  v59 = selfa;
                  v11 = (unint64_t)v153;
                  v37 = v150;
                  if (selfa)
                    objc_setProperty_atomic(selfa, v57, v58, 40);

                }
                else
                {
                  v21 = v148;
                  v22 = v149;
                  v34 = v147;
                  v59 = selfa;
                  v11 = (unint64_t)v153;
                  v37 = v150;
                  if (selfa)
                    objc_setProperty_atomic(selfa, v56, (id)a3, 40);
                }
                v60 = -[SAFrameSiblingsDeserializationHelper initWithFrameHelpers:]([SAFrameSiblingsDeserializationHelper alloc], "initWithFrameHelpers:", a4);
                objc_msgSend(v34, "addObject:", v60);

                v36 = v152;
                goto LABEL_48;
              }
LABEL_70:
              v111 = *__error();
              _sa_logt();
              v112 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1B9BE0000, v112, OS_LOG_TYPE_ERROR, "empty child frames array", buf, 2u);
              }

              *__error() = v111;
              _SASetCrashLogMessage(1516, "empty child frames array", v113, v114, v115, v116, v117, v118, v144);
              _os_crash();
              __break(1u);
LABEL_73:
              v119 = *__error();
              _sa_logt();
              v120 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                v121 = *(_DWORD *)(a4 + 18);
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v158 = a3;
                *(_WORD *)&v158[8] = 1024;
                *(_DWORD *)&v158[10] = v121;
                _os_log_error_impl(&dword_1B9BE0000, v120, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct v4 with %u children", buf, 0x12u);
              }

              *__error() = v119;
              _SASetCrashLogMessage(1483, "bufferLength %lu < serialized SAFrame struct v4 with %u children", v122, v123, v124, v125, v126, v127, (char)a3);
              _os_crash();
              __break(1u);
LABEL_76:
              v128 = *__error();
              _sa_logt();
              v129 = objc_claimAutoreleasedReturnValue();
              v130 = self;
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              {
                v131 = (*(unsigned __int8 *)(a4 + 30) >> 3) & 1;
                objc_msgSend((id)a3, "debugDescription");
                v132 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v133 = objc_msgSend(v132, "UTF8String");
                ClassName = object_getClassName(v130);
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v158 = v131;
                *(_WORD *)&v158[4] = 2080;
                *(_QWORD *)&v158[6] = v133;
                *(_WORD *)&v158[14] = 2080;
                *(_QWORD *)&v158[16] = ClassName;
                _os_log_error_impl(&dword_1B9BE0000, v129, OS_LOG_TYPE_ERROR, "Frame exclave:%d has exclave %s, is class %s, not SAExclaveFrame", buf, 0x1Cu);

              }
              *__error() = v128;
              v135 = (*(unsigned __int8 *)(a4 + 30) >> 3) & 1;
              objc_msgSend((id)a3, "debugDescription");
              v136 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v136, "UTF8String");
              object_getClassName(v130);
              _SASetCrashLogMessage(1487, "Frame exclave:%d has exclave %s, is class %s, not SAExclaveFrame", v137, v138, v139, v140, v141, v142, v135);

              _os_crash();
              __break(1u);
            }
          }
          v61 = *__error();
          _sa_logt();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1B9BE0000, v62, OS_LOG_TYPE_ERROR, "can't decode child", buf, 2u);
          }

          *__error() = v61;
          _SASetCrashLogMessage(1508, "can't decode child", v63, v64, v65, v66, v67, v68, 0);
          _os_crash();
          __break(1u);
LABEL_55:
          v69 = *__error();
          _sa_logt();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v158 = a4;
            *(_WORD *)&v158[8] = 2048;
            *(_QWORD *)&v158[10] = 31;
            _os_log_error_impl(&dword_1B9BE0000, v70, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct %lu", buf, 0x16u);
          }

          *__error() = v69;
          _SASetCrashLogMessage(1414, "bufferLength %lu < serialized SAFrame struct %lu", v71, v72, v73, v74, v75, v76, a4);
          _os_crash();
          __break(1u);
          goto LABEL_58;
        }
        v59 = selfa;
        v11 = (unint64_t)v153;
        v37 = v150;
        if (selfa)
          objc_setProperty_atomic(selfa, v48, 0, 40);
LABEL_48:

        v10 = v154;
      }

      objc_autoreleasePoolPop(v35);
    }
    while (objc_msgSend(v34, "count"));
  }
  *v22 = 0;

LABEL_51:
}

+ (SAFrame)frameWithPAStyleSerializedFrame:(uint64_t)a1
{
  SAFrame *v3;
  unint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  objc_opt_self();
  v3 = objc_alloc_init(SAFrame);
  v4 = *(_QWORD *)(a2 + 8);
  if (v3)
  {
    v3->_address = v4;
    v3->_BOOLs.bits = v3->_BOOLs.bits & 0xFB | (4 * (*(_BYTE *)(a2 + 17) != 0));
    v4 = *(_QWORD *)(a2 + 8);
  }
  if (!v4)
  {
    v5 = (8 * (*(_QWORD *)(a2 + 26) == -1));
    if (!v3)
      return v3;
    goto LABEL_5;
  }
  LOBYTE(v5) = 0;
  if (v3)
  {
LABEL_5:
    v6 = v3->_BOOLs.bits & 0xF7 | v5;
    v3->_BOOLs.bits = v6;
    v3->_BOOLs.bits = v6 & 0xFE | (*(_QWORD *)(a2 + 18) != 0);
  }
  return v3;
}

- (void)populateReferencesUsingPAStyleSerializedFrame:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *Property;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = *(_QWORD *)(a2 + 26);
    v10 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v7, v8, v10, 0);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v13 = Property;
    if (Property)
      Property = objc_getProperty(Property, v12, 8, 1);
    *(_QWORD *)(a1 + 32) = Property;
    v14 = a2 + 34;
    v15 = *(_QWORD *)(a2 + 18);
    v16 = (void *)objc_opt_class();
    SASerializableNewMutableSetFromIndexList(v14, v15, v7, v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "anyObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      if (v18)
        v21 = objc_getProperty(v18, v19, 8, 1);
      else
        v21 = 0;
      objc_storeStrong((id *)(a1 + 40), v21);

    }
    else if ((unint64_t)objc_msgSend(v17, "count") < 2)
    {
      v33 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    else
    {
      v34 = v7;
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v17, "count"));
      v23 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v22;

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v24 = v17;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v25)
      {
        v27 = v25;
        v28 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v36 != v28)
              objc_enumerationMutation(v24);
            v30 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v31 = *(void **)(a1 + 40);
            if (v30)
              v30 = objc_getProperty(v30, v26, 8, 1);
            v32 = v30;
            objc_msgSend(v31, "addObject:", v32);

          }
          v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v27);
      }

      v7 = v34;
    }

  }
}

@end
