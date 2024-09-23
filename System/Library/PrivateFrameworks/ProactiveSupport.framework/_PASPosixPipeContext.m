@implementation _PASPosixPipeContext

- (int)setupWithSubprocessFd:(int)a3 fileActions:(void *)a4 queue:(id)a5 group:(id)a6 readErrno:(int *)a7
{
  NSObject *v13;
  NSObject *v14;
  int v15;
  dispatch_fd_t v16;
  uint64_t v17;
  NSFileHandle *v18;
  NSFileHandle *writeHandle;
  OS_dispatch_io *v20;
  OS_dispatch_io *readChannel;
  int *v23;
  char *v24;
  int v25;
  _QWORD cleanup_handler[4];
  NSObject *v27;
  int *v28;
  dispatch_fd_t v29;
  uint8_t buf[4];
  char *v31;
  __int16 v32;
  int v33;
  int v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  if (pipe(v34))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      v25 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v24;
      v32 = 1024;
      v33 = v25;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "runCommandWithPath failed to create pipe: %s (%d)", buf, 0x12u);
    }
    v15 = -1;
  }
  else
  {
    v16 = v34[0];
    v17 = v34[1];
    posix_spawn_file_actions_addclose(a4, v34[0]);
    posix_spawn_file_actions_adddup2(a4, v17, a3);
    posix_spawn_file_actions_addclose(a4, v17);
    v18 = (NSFileHandle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v17, 1);
    writeHandle = self->_writeHandle;
    self->_writeHandle = v18;

    dispatch_group_enter(v14);
    cleanup_handler[0] = MEMORY[0x1E0C809B0];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __80___PASPosixPipeContext_setupWithSubprocessFd_fileActions_queue_group_readErrno___block_invoke;
    cleanup_handler[3] = &unk_1E44303A0;
    v29 = v16;
    v28 = a7;
    v27 = v14;
    v20 = (OS_dispatch_io *)dispatch_io_create(0, v16, v13, cleanup_handler);
    readChannel = self->_readChannel;
    self->_readChannel = v20;

    dispatch_io_set_high_water((dispatch_io_t)self->_readChannel, 0x8000uLL);
    objc_storeStrong((id *)&self->_queue, a5);

    v15 = 0;
  }

  return v15;
}

- (void)startReadWithHandler:(id)a3
{
  id v4;
  NSObject *readChannel;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[NSFileHandle closeFile](self->_writeHandle, "closeFile");
  queue = self->_queue;
  readChannel = self->_readChannel;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45___PASPosixPipeContext_startReadWithHandler___block_invoke;
  v8[3] = &unk_1E44303C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_io_read(readChannel, 0, 0xFFFFFFFFFFFFFFFFLL, queue, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeHandle, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
