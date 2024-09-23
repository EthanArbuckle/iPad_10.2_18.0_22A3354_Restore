@implementation SAStackIterator

- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((a3 & 0x1C) != 0)
  {
    v15 = *__error();
    _sa_logt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a3;
      _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "SAStackIterator doesn't support backtrace style 0x%llx", buf, 0xCu);
    }

    *__error() = v15;
    _SASetCrashLogMessage(1082, "SAStackIterator doesn't support backtrace style 0x%llx", v17, v18, v19, v20, v21, v22, a3);
    _os_crash();
    __break(1u);
  }
  v7 = (void (**)(_QWORD, _QWORD))v6;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_stack;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (!objc_msgSend(v13, "isKernel"))
        {
          if ((a3 & 2) != 0)
            continue;
LABEL_13:
          ((void (**)(_QWORD, void *))v7)[2](v7, v13);
          continue;
        }
        if ((a3 & 1) != 0)
          goto LABEL_16;
        v14 = objc_msgSend(v13, "isExclave");
        if ((a3 & 0x20) == 0 || (v14 & 1) == 0)
          goto LABEL_13;
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }
LABEL_16:

}

- (BOOL)hasStack
{
  return -[NSArray count](self->_stack, "count") != 0;
}

- (BOOL)hasUserStack
{
  void *v3;
  int v4;

  if (-[NSArray count](self->_stack, "count"))
  {
    -[NSArray firstObject](self->_stack, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isKernel") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)hasSwiftAsyncStack
{
  void *v2;
  char v3;

  -[NSArray firstObject](self->_stack, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSwiftAsync");

  return v3;
}

- (BOOL)hasKernelStack
{
  NSUInteger v3;
  void *v4;
  char v5;

  v3 = -[NSArray count](self->_stack, "count");
  if (v3)
  {
    -[NSArray lastObject](self->_stack, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isKernel");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
}

@end
